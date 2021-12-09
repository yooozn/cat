extends Spatial

func _ready():
	$ColorRect.visible = false

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		$ColorRect.visible = true
		$AudioStreamPlayer.play()



func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		$ColorRect.visible = false
