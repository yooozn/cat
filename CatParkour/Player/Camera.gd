extends Camera

var camera1pos
func _process(delta):
	var camera1pos = get_parent().get_parent().get_parent().get_node("camerapivot").get_node("SpringArm").get_node("Camera").global_transform
	if camera1pos != null:
		global_transform = camera1pos
