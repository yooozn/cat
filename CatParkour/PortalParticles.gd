extends Particles

func _process(delta):
	look_at(GlobalWorld.player.translation,Vector3.UP)
