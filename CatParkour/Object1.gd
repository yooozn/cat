extends RigidBody

var pick = false
var gravPick = false
var interact = false
var pickUP = false
var global_pos1
var hovered = false
#var shadermat = $MeshInstance.get_surface_material(0)
onready var shader = $MeshInstance.get_surface_material(0).next_pass
#func _ready():
#	var shader = $MeshInstance.get_surface_material(0).next_pass

func _process(delta):
	if gravPick == true:
		gravity_scale = 0
		collision_layer = 2
#		turn(GlobalWorld.player.SpriteLocation, 2, delta)
		hovered = false
		if GlobalWorld.player.y_velocity > -.01 or GlobalWorld.player.y_velocity < -.01:
			interact = false
			GlobalWorld.player.crossPICKbool = true
		elif GlobalWorld.player.y_velocity == -.01:
			interact = true
			GlobalWorld.player.crossPICKbool = false
	elif gravPick == false:
		gravity_scale = 1
		collision_layer = 1
#		GlobalWorld.player.crossPICKbool = false
		interact = false
	if GlobalWorld.player.carrying == false:
		gravPick = false
	if shader:
		if hovered == true and GlobalWorld.hovered == true:
			shader.set_shader_param("strength", 0.3)
		else:
			shader.set_shader_param("strength", 0.0)
	if GlobalWorld.hovered == false:
		hovered = false
#	print(hovered)
#	if pick == true:
#		yield(get_tree().create_timer(.02),"timeout")
#		pick = false
#	if pickUP == true:
#		if GlobalWorld.player.y_velocity < -.01:
#			pick = true
#			global_transform.origin = GlobalWorld.player.pickObjectLocation
#		elif GlobalWorld.player.y_velocity > -.01:
#			pick = true
#			global_transform.origin = GlobalWorld.player.pickObjectLocation
#		yield(get_tree().create_timer(.5),"timeout")
#		pickUP = false
#		pick = false
#	print(interact)
#func _on_RigidBody_body_entered(body):
#	pick = true
#	yield(get_tree().create_timer(1),"timeout")
##	pick = false
#func turn(target, rotationSpeed, delta):
#	var global_pos = global_transform.origin
#	var global_scale = global_transform.basis.get_scale()
#	var wtransform = global_transform.looking_at(Vector3(target.x, global_pos.y, target.z),Vector3(0,1,0))
#	var wrotation = Quat(global_transform.basis.get_rotation_quat()).slerp(Quat(wtransform.basis.get_rotation_quat()),rotationSpeed*delta)
#
#	global_transform = Transform(Basis(wrotation), global_transform.origin)
#	global_transform = Transform(Basis(wrotation), global_transform.origin)

#func _on_RigidBody_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
#	pick = true
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false
#
#
#func _on_Area_area_entered(area):
#	pick = true
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false
#
#func _on_Area_body_entered(body):
#	pick = true
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false
