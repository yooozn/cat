extends Area

onready var cloudPart = preload("res://Particles/DubJumpUnlock.tscn")

func _on_DoubleJumpUnlock_body_entered(body):
	if body.is_in_group("Player"):
		pStats.dubJumpUnlock = true
		pStats.hat = 1
		Animations.hat = true
		Times.orb1 = true
		Times.orbPos = global_transform
		var cloud = cloudPart.instance()
		get_parent().add_child(cloud)
		cloud.translation = translation
		queue_free()
		
