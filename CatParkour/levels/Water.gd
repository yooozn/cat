extends Area



func _on_Water_body_entered(body):
	GlobalWorld.player.water = true
	print("water")


func _on_Water_body_exited(body):
	if body.is_in_group("Player"):
		GlobalWorld.player.water = false
		print("land")
