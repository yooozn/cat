extends Spatial

func _ready():
	$AnimationPlayer.play("Camera")
	$AnimationPlayer2.play("rotate")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Timer_timeout():
	pass # Replace with function body.


func _on_Button_pressed():
	Animations.transition = true
	yield(get_tree().create_timer(.5),"timeout")
	get_tree().change_scene("res://levels/testmap2.tscn")
