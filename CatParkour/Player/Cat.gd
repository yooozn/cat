extends KinematicBody

#Primary force variables
var speed = pStats.movement
var acceleration = pStats.accel
var air_acceleration = pStats.air_accel
var gravity = pStats.gravity
var max_terminal_velocity = 54
var jump_power = pStats.jump_power

#More Stats
var health = pStats.health
var maxhealth = pStats.health
#Mouse sensitivity and limits
var mouse_sensitivity = pStats.sens
var min_pitch = -90
var max_pitch = 90

#DeathZoom condition
var deathZoom = false
var CheckZoom = false
#CheckPosCooldown
var CheckPosCD = false

# Portal Transition condition
var portalZoom = false

#Pickup Object variable
onready var pickUP = $camerapivot/SpringArm/Camera/PickUP
onready var pickLoc = $camerapivot/SpringArm/Camera/PickLoc
onready var eyes = $camerapivot/SpringArm/Camera/eyes.get_global_transform()
var pickObject
var pickObjectLocation
var carrying = false
#Movement variables
var velocity : Vector3
var y_velocity : float

#Audio Dash sound(was plaaying multiple times before)
var dSoundPlay = false

#Jump Pad conditional
var jumpAd = false

#PickUP 
var pickObj

var pickTrue = false

#Onready/preloads
onready var camera_pivot = $camerapivot
onready var camera = $camerapivot/SpringArm/Camera
onready var DashLength = $camerapivot/SpringArm/Camera/DashSprite
onready var springArm = $camerapivot/SpringArm
onready var Bullet_Scene = preload("res://Bullet.tscn")
onready var landParticles = preload("res://Particles/LandingParticles.tscn")
onready var DubJumpPart = preload("res://Particles/DoubleJumpCloud.tscn")
onready var CrossHead = $camerapivot/SpringArm/Camera/CrosshairHead
onready var CrossBody = $camerapivot/SpringArm/Camera/CrosshairBody
onready var crossPICK = $camerapivot/SpringArm/Camera/CrosshairCantPICK
onready var InteractPop = preload("res://InteractPop.tscn")
onready var jumpSound = preload("res://JumpSound.tscn")
onready var dashSound = preload("res://Dash.tscn")
onready var fallSound = preload("res://FallImpact.tscn")
onready var pickUPsprite = $camerapivot/SpringArm/Camera/PickLoc/Sprite3D

#Dash variables
var dash_speed = 2
var dash
var dashtime = 0
var dashCD = .9
var dashable = true
var dashUnlock = pStats.dashUnlock

#Target in front of player
var DistanceSprite
var SpriteLocation

#Conditionals
var sprintable = true
var sprinting = false

var shootable = true
var shootUnlock = pStats.shootUnlock
#Time variables
var shoot_time = 0
var bodyHit = false
var headHit = false
var bodyTime = 0
var headTime = 0
var headColour = false
var crossPICKbool = false


#Water state
var water = false

#jump from air variables
var in_air = false

#Camera variables
var firstpersonview = false
var thirdpersonview = true
var firstpersonLen = 0
var thirdpersonLen = 2
var cameraSwapTime = 0
var viewTick = 0

#DoubleJump variables
var dubJump = 0
var maxJumps = 2
var dubJumpUnlock = pStats.dubJumpUnlock

#Key variables
var key = false
var key_interact = false
var in_key_area = false

var key_pickup_range = false
var key_pickup = false

#Position variables

var pickUPspriteSPAWNLOC

#Checkpoint position variable
var CheckPos

func _CameraZoom():
		if pStats.third_person == true:
			$camerapivot/SpringArm.spring_length = 2
			$camerapivot/SpringArm/Camera.fov = 70
		else:
			$camerapivot/SpringArm.spring_length = 0
			$camerapivot/SpringArm/Camera.fov = 46
		CheckZoom = false


func _ready():
	GlobalWorld.player = self
	$Transition.play("Transition")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	CheckPos = translation
	if pStats.third_person == true:
		$camerapivot/SpringArm.spring_length = 2
		$camerapivot/SpringArm/Camera.fov = 70
	else:
		$camerapivot/SpringArm.spring_length = 0
		$camerapivot/SpringArm/Camera.fov = 46

func _process(delta):
	dubJumpUnlock = pStats.dubJumpUnlock
	dashUnlock = pStats.dashUnlock
	shootUnlock = pStats.shootUnlock
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	if Input.is_key_pressed(KEY_Y):
		OS.window_fullscreen = true
	if Input.is_key_pressed(KEY_N):
		if GlobalWorld.Speedrun == false:
			deathZoom = true
			yield(get_tree().create_timer(.5),"timeout")
			get_tree().reload_current_scene()
		else:
			get_tree().reload_current_scene()
	DistanceSprite = $camerapivot/SpringArm/Camera/DashSprite.global_transform.origin - global_transform.origin
	SpriteLocation = $camerapivot/SpringArm/Camera/DashSprite.global_transform.origin
	$HealthText.text = str(health)
	if dubJumpUnlock == true:
		$DoubleJump.visible = true
		$DoubleJump.text = str(dubJump)
	else:
		$DoubleJump.visible = false
	
	if portalZoom == true:
		camera.fov = lerp(camera.fov, 10, .02)
	#key variables
	#if player picked up key, keysprite visible
	if key:
		$Key.visible = true
		Times.key1 = true
	else:
		$Key.visible = false
		Times.key1 = false
	#if player is near a unlockable area, and has key, and presses interact
	if in_key_area == true and key == true:
		if Input.is_action_pressed("interact"):
			key_interact = true
			var popInt = InteractPop.instance()
			get_parent().add_child(popInt)
			popInt.translation = translation
			popInt.play()
			yield(get_tree().create_timer(.5),"timeout")
			key_interact = false
	
	if deathZoom == true:
		camera.fov = lerp(camera.fov, 10, .03)
		Animations.transition = true
	#if player is in key pickup range and presses interact
	if key_pickup_range == true:
		if Input.is_action_pressed("interact"):
			key_pickup = true
			var popInt = InteractPop.instance()
			get_parent().add_child(popInt)
			popInt.translation = translation
			popInt.play()
			yield(get_tree().create_timer(.5),"timeout")
			key_pickup = false
			
	if health <= 0:
		if CheckPos:
			health = pStats.health - 2
			translation = CheckPos
			deathZoom = true
			yield(get_tree().create_timer(.5),"timeout")
			deathZoom = false
	
	if headHit == true:
		headTime += delta
		CrossHead.visible = true
		if headTime >= .4:
			headHit = false
			headTime = 0
			CrossHead.visible = false
	if bodyHit == true:
		bodyTime += delta
		CrossBody.visible = true
		if bodyTime >= .4:
			bodyHit = false
			bodyTime = 0
			CrossBody.visible = false
	
	if crossPICKbool == true:
		crossPICK.visible = true
	elif crossPICKbool == false:
		crossPICK.visible = false
	
	if CheckZoom == true:
		_CameraZoom()
#	print(crossPICKbool)
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		camera_pivot.rotation_degrees.x -= event.relative.y * mouse_sensitivity
		camera_pivot.rotation_degrees.x = clamp(camera_pivot.rotation_degrees.x, min_pitch, max_pitch)

func _physics_process(delta):
	
	
	mouse_sensitivity = pStats.sens
	if portalZoom == false:
		_handle_movement(delta)
	
	
	
	if is_on_floor():
		if in_air == true:
			var groundPart = landParticles.instance()
			get_parent().add_child(groundPart)
			groundPart.global_transform = global_transform
			var fSound = fallSound.instance()
			get_parent().add_child(fSound)
			fSound.translation = translation
			fSound.play()
			in_air = false
			if dubJumpUnlock == true:
				dubJump = maxJumps
	elif !is_on_floor():
		if y_velocity <= -1 and !$RayCast.is_colliding():
			in_air = true
		if dubJumpUnlock == true:
			if Input.is_action_just_pressed("jump") and dubJump >= 1 and y_velocity <= -5:
				var jumpSound1 = jumpSound.instance()
				get_parent().add_child(jumpSound1)
				jumpSound1.translation = translation
				jumpSound1.play()
				var jumpPart = DubJumpPart.instance()
				get_parent().add_child(jumpPart)
				jumpPart.global_transform = global_transform
				if dubJump == 1:
					y_velocity = jump_power * 1.3
					dubJump -= 1
				elif dubJump > 1:
					y_velocity = jump_power
					dubJump -= 1
#
func _handle_movement(delta):
	var direction = Vector3()
	
	#Shooting action
	if shootUnlock == true:
		if Input.is_action_just_pressed("shoot") and shootable == true and carrying == false:
			shootable = false
			$Shoot.play()
			var bullet = Bullet_Scene.instance()
			get_parent().add_child(bullet)
			bullet.global_transform.origin = $gun.global_transform.origin
			bullet.look_at(SpriteLocation, Vector3.UP)
			bullet.shoot = true
			yield(get_tree().create_timer(1),"timeout")
			shootable = true
#		if shootable == false:
#			shoot_time += delta
#			if shoot_time >= 1:
#				shootable = true
#				shoot_time = 0
	
	if $RayCast.is_colliding() and !Input.is_action_pressed("move_forward") and !Input.is_action_pressed("move_backward") \
	and !Input.is_action_pressed("move_left") and !Input.is_action_pressed("move_right"):
		velocity.x = 0
		velocity.z = 0
	#Camera lerp between first and third person
	
	if Input.is_action_just_pressed("cameraswap") and firstpersonview == false and thirdpersonview == true \
	 and viewTick == 0:
		viewTick = 1
		firstpersonview = true
		thirdpersonview = false
		pStats.third_person = false
	if firstpersonview == true and viewTick == 1:
		springArm.spring_length = lerp(springArm.spring_length, firstpersonLen, .05)
		$camerapivot/SpringArm/Camera.fov = lerp($camerapivot/SpringArm/Camera.fov, 46, .05)
		cameraSwapTime += delta
		if cameraSwapTime >= 2:
			cameraSwapTime = 0
			viewTick = 2
	
	if Input.is_action_just_pressed("cameraswap") and thirdpersonview == false and firstpersonview == true \
	and viewTick == 2:
		firstpersonview = false
		thirdpersonview = true
		pStats.third_person = true
		viewTick = 3
	if thirdpersonview == true and viewTick == 3:
		springArm.spring_length = lerp(springArm.spring_length, thirdpersonLen, .05)
		$camerapivot/SpringArm/Camera.fov = lerp($camerapivot/SpringArm/Camera.fov, 70, .05)
		cameraSwapTime += delta
		if cameraSwapTime >= 2:
			cameraSwapTime = 0
			viewTick = 0
#	print("firstpersonview" + str(firstpersonview))
#	print("thirdpersonview" + str(thirdpersonview))
	#Primary movement controls
	
	if Input.is_action_pressed("move_forward") and Input.is_action_pressed("sprint"):
		sprinting = true
		speed = 15
		$SprintPart.set_emitting(true)
#		$SprintPart.process_material.gravity = Vector3(SpriteLocation.x, 1, SpriteLocation.z)
		
	else:
		sprinting = false
		speed = pStats.movement
		$SprintPart.set_emitting(false)
	
	if Input.is_action_pressed("CheckPos") and CheckPosCD == false:
		if GlobalWorld.Speedrun == false:
			deathZoom = true
			yield(get_tree().create_timer(.5),"timeout")
			deathZoom = false
			if pStats.third_person == true:
				$camerapivot/SpringArm.spring_length = 2
				$camerapivot/SpringArm/Camera.fov = 70
			else:
				$camerapivot/SpringArm.spring_length = 0
				$camerapivot/SpringArm/Camera.fov = 46
			global_transform.origin = CheckPos
			CheckPosCD = true
			if carrying == true:
				carrying = false
				pickObject.global_transform.origin = pickObjectLocation
				crossPICKbool = false
	#			print(crossPICKbool)
			yield(get_tree().create_timer(1.5),"timeout")
			CheckPosCD = false
		else:
			deathZoom = true
			yield(get_tree().create_timer(.5),"timeout")
			deathZoom = false
			get_tree().reload_current_scene()
	
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	
	if Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
		
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	
	if dashUnlock == true:
		if Input.is_action_just_pressed("dash") and dashable == true:
	#		var original = global_transform.origin
	##		direction += (DashLength.global_transform.origin - global_transform.origin).normalized()
	#		global_transform.origin = lerp(global_transform.origin, DashLength.global_transform.origin, .1)
	#		print()
	#		print("original position" + str(original))
	#		print("new position " + str(global_transform.origin))
	#		dash = (DashLength.global_transform.origin - global_transform.origin).normalized() * dash_speed
			if Input.is_action_pressed("move_forward"):
				dash = -global_transform.basis.z * dash_speed
				if dSoundPlay == false:
					dSoundPlay = true
					var dSound = dashSound.instance()
					get_parent().add_child(dSound)
					dSound.translation = translation
					dSound.play()
					yield(get_tree().create_timer(.3),"timeout")
					dSoundPlay = false
			elif Input.is_action_pressed("move_backward"):
				dash = global_transform.basis.z * dash_speed
				if dSoundPlay == false:
					dSoundPlay = true
					var dSound = dashSound.instance()
					get_parent().add_child(dSound)
					dSound.translation = translation
					dSound.play()
					yield(get_tree().create_timer(.3),"timeout")
					dSoundPlay = false
			elif Input.is_action_pressed("move_left"):
				dash = -global_transform.basis.x * dash_speed
				if dSoundPlay == false:
					dSoundPlay = true
					var dSound = dashSound.instance()
					get_parent().add_child(dSound)
					dSound.translation = translation
					dSound.play()
					yield(get_tree().create_timer(.3),"timeout")
					dSoundPlay = false
			elif Input.is_action_pressed("move_right"):
				dash = (global_transform.basis.x) * dash_speed
				if dSoundPlay == false:
					dSoundPlay = true
					var dSound = dashSound.instance()
					get_parent().add_child(dSound)
					dSound.translation = translation
					dSound.play()
					yield(get_tree().create_timer(.3),"timeout")
					dSoundPlay = false
		if dash != null:
			dashtime += delta
			$DashPart.set_emitting(true)
			if DistanceSprite != null:
				$DashPart.process_material.gravity = SpriteLocation * 2
			if dashtime >= .3:
				dashtime = 0
				dash = null
				dashable = false
				$DashPart.process_material.gravity = Vector3.ZERO
		if dashable == false:
			$DashPart.set_emitting(false)
			dashCD -= delta
			if dashCD <= 0:
				dashable = true
				dashCD = .9
	
	#pickup objects
	if pickUP.is_colliding():
		pickUPsprite.global_transform.origin = pickUP.get_collision_point()
		if carrying == false:
			pickObj = pickUP.get_collider()
			if pickObj:
				if pickObj.is_in_group("Objects"):
					pickObject = pickObj
					pickObjectLocation = pickObj.global_transform.origin
					if pickObj.pick == false and pickObj.interact == false:
						Animations.interact = true
						pickObj.hovered = true
						GlobalWorld.hovered = true
						if Input.is_action_just_pressed("interact") and carrying == false:
							pickObj.pickUP = true
							carrying = true
					elif pickObj.pick == true:
						crossPICKbool = true
						pickTrue = true
				else:
					pickTrue = false
#						elif Input.is_action_just_pressed("interact") and carrying == true:
#							carrying = false
	else:
		pickUPsprite.global_transform.origin = $camerapivot/SpringArm/Camera/PickLoc2.global_transform.origin
		Animations.interact = false
		pickTrue = false
		GlobalWorld.hovered = false
	if carrying == true:
		shootable = false
		pickObject.gravPick = true
		Animations.interact = false
		pickObject.global_transform.origin = $camerapivot/SpringArm/Camera/PickLoc/Sprite3D.global_transform.origin
		pickTrue = false
		pickObject.hovered = false
	else:
		pickObject = null
#	print(carrying)
	if pickObject:
		if !pickObject.is_in_group("Objects") or pickObject.pick == true or Input.is_action_just_pressed("shoot")\
		and pickObject.interact == true or \
		Input.is_action_just_pressed("interact") and pickObject.interact == true:
			carrying = false
			shootable = true
			Animations.interact = false
			if pickObject.is_in_group("KeyNew"):
				pickObject.global_transform = pickObject.startPos
				print("didit")
			pickObject = null
	elif !pickObject and pickTrue == false:
		crossPICKbool = false
#	print(carrying) 
#			print(pickObj)
#			print(pickLoc)
#		pickObj.transform.origin = lerp(pickObj.transform.origin, pickLoc.transform.origin, .03)
#			pickObj.global_transform.origin = pickLoc.global_transform.origin
#	if pickObject != null:
#		if Input.is_action_pressed("interact"):
#			var pick = pickObject
#			pick.transform.origin = lerp(pick.transform.origin, pickLoc.transform.origin, .005)
	
	
	
	direction = direction.normalized()
	
	var accel = acceleration if is_on_floor() else air_acceleration
	if dash!= null:
		velocity += dash
	velocity = velocity.linear_interpolate(direction * speed, accel * delta)
	
	if is_on_floor() and jumpAd == false:
		y_velocity = -.01
	else:
		y_velocity = clamp(y_velocity - gravity, -max_terminal_velocity, max_terminal_velocity)
	if Input.is_action_just_pressed("jump") and $RayCast2.is_colliding():
		y_velocity = jump_power
		var jumpSound1 = jumpSound.instance()
		get_parent().add_child(jumpSound1)
		jumpSound1.translation = translation
		jumpSound1.play()
	velocity.y = y_velocity
	velocity = move_and_slide(velocity, Vector3.UP)
	
