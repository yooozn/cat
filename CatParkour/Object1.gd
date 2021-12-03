extends RigidBody

var pick = false
var gravPick = false
var interact = false
var pickUP = false
func _process(delta):
	if gravPick == true:
		gravity_scale = 0
		collision_layer = 2
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
#	pick = false


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
