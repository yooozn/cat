extends Area



func _on_Death_body_entered(body):
	if GlobalWorld.Speedrun == false:
		if body.is_in_group("Player"):
			GlobalWorld.player.translation = GlobalWorld.player.CheckPos
			if GlobalWorld.player.carrying == true:
				GlobalWorld.player.carrying = false
				GlobalWorld.player.pickObject.global_transform.origin = \
				GlobalWorld.player.pickObjectLocation
				GlobalWorld.player.crossPICKbool = false
	else:
		if body.is_in_group("Player"):
			get_tree().reload_current_scene()
	
