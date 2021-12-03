extends Area

export(String) var scene
export(PackedScene) var scene1
export(String) var level_text
export(String) var extra
onready var particles = preload("res://PortalParticles.tscn")


func _on_PortalLVL1_body_entered(body):
	if body.is_in_group("Player"):
		Animations.transition = true
		GlobalWorld.player.portalZoom = true
#		yield(get_tree().create_timer(.1),"timeout")
#		GlobalWorld.player.get_tree().paused = true
		yield(get_tree().create_timer(.8),"timeout")
#		GlobalWorld.player.get_tree().paused = false
		get_tree().change_scene(str(scene))


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		$CenterContainer/Label.text = level_text
		$CenterContainer/Label.visible = true
		$CenterContainer.visible = true
		$CenterContainer2/Label2.visible = true
		$CenterContainer2.visible = true
		$Particles.set_emitting(true)
		if extra == "1":
			$CenterContainer2/Label2.text = "Record: " + str(Times.level1) + "s"
		elif extra == "2":
			$CenterContainer2/Label2.text = "Record: " + str(Times.level2) + "s"
		elif extra == "3":
			$CenterContainer2/Label2.text = "Record: " + str(Times.level3) + "s"
		elif extra == "4":
			$CenterContainer2/Label2.text = "Record: " + str(Times.level4) + "s"
		elif extra == "t":
			$CenterContainer2/Label2.text = "Record: " + str(Times.tutorial) + "s"

func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		$CenterContainer.visible = false
		$CenterContainer/Label.visible = false
		$CenterContainer2/Label2.visible = false
		$CenterContainer2.visible = false
		$Particles.set_emitting(false)
