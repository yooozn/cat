extends Area



func _on_DoubleJumpRefresh_body_entered(body):
	if body.is_in_group("Player"):
		GlobalWorld.player.dubJump = GlobalWorld.player.maxJumps
