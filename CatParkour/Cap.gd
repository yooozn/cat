extends Spatial



func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		pStats.cap = true
		pStats.hat = 4
		Animations.hat = true
		queue_free()
