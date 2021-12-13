extends Spatial



func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		pStats.duck = true
		pStats.hat = 5
		Animations.hat = true
		queue_free()
