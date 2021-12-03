extends Area

onready var key = preload("res://Key.tscn")

func _on_KeyRespawn_body_entered(body):
	if body.is_in_group("Player"):
		if Times.key1 == true:
			Times.key1 = false
			GlobalWorld.player.key = false
			var keyNew = key.instance()
			get_parent().add_child(keyNew)
			keyNew.global_transform = Times.keyPos
