extends RigidBody
var pick = false
export(float) var jumpheight
var gravPick = false
var interact = false
var pickUP = false
var hovered = false
onready var shader = $MeshInstance.get_surface_material(0).next_pass
onready var shader1 = $jumpPad/Cube.get_surface_material(0).next_pass
onready var shader2 = $jumpPad/Cube001.get_surface_material(0).next_pass
onready var shader3 = $jumpPad/Cube002.get_surface_material(0).next_pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
#	if GlobalWorld.player.y_velocity > -.01:
#		pick = true
#	elif GlobalWorld.player.y_velocity == -.01:
#		pick = false
	if gravPick == true:
		gravity_scale = 0
		collision_layer = 2
		yield(get_tree().create_timer(.1),"timeout")
		interact = true
		if GlobalWorld.player.y_velocity > -.01 or GlobalWorld.player.y_velocity < -.01:
			interact = false
			GlobalWorld.player.crossPICKbool = true
		elif GlobalWorld.player.y_velocity == -.01:
			interact = true
			GlobalWorld.player.crossPICKbool = false
#		print(collision_layer)
	elif gravPick == false:
		gravity_scale = 1
		collision_layer = 1
		interact = false
	if GlobalWorld.player.carrying == false:
		gravPick = false
	if shader:
		if hovered == true and GlobalWorld.hovered == true:
			shader.set_shader_param("strength", 0.2)
			shader1.set_shader_param("strength", 0.2)
			shader2.set_shader_param("strength", 0.2)
			shader3.set_shader_param("strength", 0.2)
		else:
			shader.set_shader_param("strength", 0.0)
			shader1.set_shader_param("strength", 0.0)
			shader2.set_shader_param("strength", 0.0)
			shader3.set_shader_param("strength", 0.0)
	if GlobalWorld.hovered == false:
		hovered = false
func _on_JumpArea_body_entered(body):
	if body.is_in_group("Player"):
		if body.carrying == false:
			GlobalWorld.player.y_velocity = jumpheight
			GlobalWorld.player.jumpAd = true
		else:
#			if not body.pickObject.is_in_group("Jump"):
#				GlobalWorld.player.y_velocity = jumpheight
#				GlobalWorld.player.jumpAd = true
			if not gravPick == true:
				GlobalWorld.player.y_velocity = jumpheight
				GlobalWorld.player.jumpAd = true



#func _on_Area_area_entered(area):
#	pick = true
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false


#func _on_Area_body_entered(body):
#	pick = true
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false



func _on_JumpArea_body_exited(body):
	GlobalWorld.player.jumpAd = false
