extends KinematicBody

var health = 5
var target = null
var velocity = Vector3()
var speed = .5
var time = 0
var hit = false
onready var particles = preload("res://Particles/EnemyExplode.tscn")
onready var deathSound = preload("res://EnemyDeath.tscn")

#player hit timer/conditionals

func _process(delta):
	if health <= 0:
		var particle = particles.instance()
		get_parent().add_child(particle)
		particle.transform = transform
		queue_free()
	if target and hit == false:
		velocity = (target.global_transform.origin - global_transform.origin) * speed
		velocity = velocity.normalized()
		velocity.y = -1
		look_at(target.transform.origin,Vector3.UP)
		rotation.x = 0
		move_and_slide(velocity,Vector3.UP)
	$Spatial/Viewport/TextureProgress.value = health
	
	
func _on_head_body_entered(body):
	if body.is_in_group("PlayerBullet"):
		GlobalWorld.player.headHit = true
		hit = true
		if health >= 4:
			$hitHead.play()
		else:
			$hitHead.play()
			var death = deathSound.instance()
			get_parent().add_child(death)
			death.transform = transform
			death.play()
		yield(get_tree().create_timer(.2),"timeout")
		health -= 3
		hit = false


func _on_body_body_entered(body):
	if body.is_in_group("PlayerBullet"):
		GlobalWorld.player.bodyHit = true
		hit = true
		if health >= 2:
			$hit.play()
		else:
			$hit.play()
			var death = deathSound.instance()
			get_parent().add_child(death)
			death.transform = transform
			death.play()
		yield(get_tree().create_timer(.2),"timeout")
		health -= 1
		hit = false


func _on_targetArea_body_entered(body):
	if body.is_in_group("Player"):
		target = GlobalWorld.player


func _on_PlayerHit_body_entered(body):
	if body.is_in_group("Player"):
		$PlayerIHRtimer.start()
		if Animations.hitImmune == false:
			GlobalWorld.player.health -= 1
			Animations.hit = true


func _on_PlayerHit_body_exited(body):
	if body.is_in_group("Player"):
		$PlayerIHRtimer.stop()


func _on_PlayerIHRtimer_timeout():
	GlobalWorld.player.health -= 1
	Animations.hit = true
