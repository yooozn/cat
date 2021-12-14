extends Area



func _on_Death_body_entered(body):
	if GlobalWorld.Speedrun == false:
		if body.is_in_group("Player"):
			if GlobalWorld.player.carrying == true:
				GlobalWorld.player.carrying = false
				GlobalWorld.player.pickObject.global_transform.origin = \
				GlobalWorld.player.pickObjectLocation
				GlobalWorld.player.crossPICKbool = false
				GlobalWorld.player.deathZoom = true
			yield(get_tree().create_timer(.5),"timeout")
			GlobalWorld.player.CheckZoom = true
			GlobalWorld.player.deathZoom = false
			GlobalWorld.player.translation = GlobalWorld.player.CheckPos
#			Animations.respawn = true
	else:
		if body.is_in_group("Player"):
			GlobalWorld.player.deathZoom = true
#			Animations.respawn = true
			yield(get_tree().create_timer(.5),"timeout")
			get_tree().reload_current_scene()
	
