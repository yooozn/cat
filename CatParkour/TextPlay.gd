extends Area

export(String) var text
var playable = true 

func _on_TextPlay_body_entered(body):
	if body.is_in_group("Player"):
		$CenterContainer.visible = true
		$CenterContainer/Label.text = text



func _on_TextPlay_body_exited(body):
	if body.is_in_group("Player"):
		$CenterContainer.visible = false
