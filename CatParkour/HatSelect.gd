extends Spatial

func _ready():
	$AnimationPlayer.play("Camera")
	$AnimationPlayer2.play("rotate")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Label.visible = false
	if pStats.dubJumpUnlock == true:
		$hat2.visible = true
		$question1.visible = false
	else:
		$hat2.visible = false
		$question1.visible = true
	if pStats.shootUnlock == true:
		$hat1.visible = true
		$question3.visible = false
	else:
		$hat1.visible = false
		$question3.visible = true
	if pStats.dashUnlock == true:
		$hat3.visible = true
		$question2.visible = false
	else:
		$hat3.visible = false
		$question2.visible = true
	if pStats.duck == true:
		$Hat5.visible = true
		$question5.visible = false
	else:
		$Hat5.visible = false
		$question5.visible = true
	if pStats.cap == true:
		$Hat4.visible = true
		$question4.visible = false
	else:
		$Hat4.visible = false
		$question4.visible = true


func _on_Timer_timeout():
	pass # Replace with function body.


func _on_Button_pressed():
	Animations.transition = true
	yield(get_tree().create_timer(.5),"timeout")
	get_tree().change_scene("res://levels/testmap2.tscn")


func _on_None_pressed():
	pStats.hat = 0


func _on_TextureButton2_pressed():
	if pStats.dubJumpUnlock == true:
		pStats.hat = 1
	else:
		$AnimationPlayer3.play("label")


func _on_TextureButton3_pressed():
	if pStats.shootUnlock == true:
		pStats.hat = 2
	else:
		$AnimationPlayer3.play("label")


func _on_TextureButton4_pressed():
	if pStats.dashUnlock == true:
		pStats.hat = 3
	else:
		$AnimationPlayer3.play("label")


func _on_cap_pressed():
	if pStats.cap == true:
		pStats.hat = 4


func _on_TextureButton5_pressed():
	if pStats.duck == true:
		pStats.hat = 5
