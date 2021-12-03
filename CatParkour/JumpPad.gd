extends RigidBody
var pick = false
export(float) var jumpheight
var gravPick = false
var interact = false
var pickUP = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if GlobalWorld.player.y_velocity > -.01:
		pick = true
	elif GlobalWorld.player.y_velocity == -.01:
		pick = false
	if gravPick == true:
		gravity_scale = 0
		collision_layer = 2
		yield(get_tree().create_timer(.1),"timeout")
		interact = true
#		print(collision_layer)
	elif gravPick == false:
		gravity_scale = 1
		collision_layer = 1
		interact = false
	if GlobalWorld.player.carrying == false:
		gravPick = false

func _on_JumpArea_body_entered(body):
	if body.is_in_group("Player"):
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
