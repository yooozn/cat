extends Area

export(String) var scene
export(PackedScene) var scene1
export(String) var level_text
export(String) var extra
export(String) var DistanceTxt
onready var particles = preload("res://PortalParticles.tscn")

func _ready():
	$Spatial/Viewport/Label.text = DistanceTxt
#	$Spatial/Viewport.size.x = $Spatial/Viewport/Label.rect_size.x
#	$Spatial/Viewport.size.y = $Spatial/Viewport/Label.rect_size.y


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
		elif extra == "w1_1":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_1Time) + "s"
		elif extra == "w1_2":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_2Time) + "s"
		elif extra == "w1_3":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_3Time) + "s"
		elif extra == "w1_4":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_4Time) + "s"
		elif extra == "w1_5":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_5Time) + "s"
		elif extra == "w1_6":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_6Time) + "s"
		elif extra == "w1_7":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_7Time) + "s"
		elif extra == "w1_8":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_8Time) + "s"
		elif extra == "w1_9":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_9Time) + "s"
		elif extra == "w1_10":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world1_10Time) + "s"
		elif extra == "w1":
			$CenterContainer2/Label2.text = "Total Time: " + str(Times.world1Time) + "s"
		elif extra == "w2_1":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_1Time) + "s"
		elif extra == "w2_2":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_2Time) + "s"
		elif extra == "w2_3":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_3Time) + "s"
		elif extra == "w2_4":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_4Time) + "s"
		elif extra == "w2_5":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_5Time) + "s"
		elif extra == "w2_6":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_6Time) + "s"
		elif extra == "w2_7":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_7Time) + "s"
		elif extra == "w2_8":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_8Time) + "s"
		elif extra == "w2_9":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_9Time) + "s"
		elif extra == "w2_10":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world2_9Time) + "s"
		elif extra == "w3_1":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_1Time) + "s"
		elif extra == "w3_2":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_2Time) + "s"
		elif extra == "w3_3":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_3Time) + "s"
		elif extra == "w3_4":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_4Time) + "s"
		elif extra == "w3_5":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_5Time) + "s"
		elif extra == "w3_6":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_6Time) + "s"
		elif extra == "w3_7":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_7Time) + "s"
		elif extra == "w3_8":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_8Time) + "s"
		elif extra == "w3_9":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_9Time) + "s"
		elif extra == "w3_10":
			$CenterContainer2/Label2.text = "Record: " + str(Times.world3_10Time) + "s"
		elif extra == "t":
			$CenterContainer2/Label2.text = "Record: " + str(Times.tutorial) + "s"

func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		$CenterContainer.visible = false
		$CenterContainer/Label.visible = false
		$CenterContainer2/Label2.visible = false
		$CenterContainer2.visible = false
		$Particles.set_emitting(false)
