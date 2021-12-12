extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var save_path = "user://save.dat"
onready var buttonHover = preload("res://ButtonHover.tscn")
onready var buttonPress = preload("res://ButtonPress.tscn")
var hover = false
var hover1 = false
var hover2 = false
var Zoom = false
# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	if file.file_exists(save_path):
		$CenterContainer/VBoxContainer/Continue.visible = true
	else:
		$CenterContainer/VBoxContainer/Continue.visible = false


func _process(delta):
	if $CenterContainer/VBoxContainer/NewGame.is_hovered() and hover == false:
		hover = true
		var b = buttonHover.instance()
		get_parent().add_child(b)
	if !$CenterContainer/VBoxContainer/NewGame.is_hovered():
		hover = false
	if $CenterContainer/VBoxContainer/Save.is_hovered() and hover1 == false:
		hover1 = true
		var b = buttonHover.instance()
		get_parent().add_child(b)
	if !$CenterContainer/VBoxContainer/Save.is_hovered():
		hover1 = false
	if $CenterContainer/VBoxContainer/Continue.is_hovered() and hover2 == false:
		hover2 = true
		var b = buttonHover.instance()
		get_parent().add_child(b)
	if !$CenterContainer/VBoxContainer/Continue.is_hovered():
		hover2 = false
	if Zoom == true:
		yield(get_tree().create_timer(.13),"timeout")
		$Spatial/Camera.fov = lerp($Spatial/Camera.fov, 0, .03)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NewGame_pressed():
	var b = buttonPress.instance()
	get_parent().add_child(b)
	var file = File.new()
	pStats.dubJumpUnlock = false
	pStats.shootUnlock = false
	pStats.dashUnlock = false
	Times.level1 = 0
	Times.level2 = 0
	Times.level3 = 0
	Times.level4 = 0
	Times.world1_1Time = 0
	Times.world1_2Time = 0
	Times.world1_3Time = 0
	Times.world1_4Time = 0
	Times.world1_5Time = 0
	Times.world1_6Time = 0
	Times.world1_7Time = 0
	Times.world1_8Time = 0
	Times.world1_9Time = 0
	Times.world1_10Time = 0
	Times.world2_1Time = 0
	Times.world2_2Time = 0
	Times.world2_3Time = 0
	Times.world2_4Time = 0
	Times.world2_5Time = 0
	Times.world2_6Time = 0
	Times.world2_7Time = 0
	Times.world2_8Time = 0
	Times.world2_9Time = 0
	Times.world3_1Time = 0
	Times.world3_2Time = 0
	Times.world3_3Time = 0
	Times.world3_4Time = 0
	Times.world3_5Time = 0
	Times.world3_6Time = 0
	Times.world3_7Time = 0
	Times.world3_8Time = 0
	Times.world3_9Time = 0
	Times.world3_10Time = 0
	if file.file_exists(save_path):
		var error = file.open(save_path, File.WRITE)
		var data = {
		"dashUnlock" : pStats.dashUnlock,
		"dubJumpUnlock" : pStats.dubJumpUnlock,
		"shootUnlock" : pStats.shootUnlock,
		"Sens" : pStats.sens,
		"fullscreen" : GlobalWorld.fullscreen,
		"level1Time" : Times.level1,
		"level2Time" : Times.level2,
		"level3Time" : Times.level3,
		"level4Time" : Times.level4,
		"tutorialTime" : Times.tutorial,
		"world1_1Time" : Times.world1_1Time,
		"world1_2Time" : Times.world1_2Time,
		"world1_3Time" : Times.world1_3Time,
		"world1_4Time" : Times.world1_4Time,
		"world1_5Time" : Times.world1_5Time,
		"world1_6Time" : Times.world1_6Time,
		"world1_7Time" : Times.world1_7Time,
		"world1_8Time" : Times.world1_8Time,
		"world1_9Time" : Times.world1_9Time,
		"world1_10Time" : Times.world1_10Time,
		"world2_1Time" : Times.world2_1Time,
		"world2_2Time" : Times.world2_2Time,
		"world2_3Time" : Times.world2_3Time,
		"world2_4Time" : Times.world2_4Time,
		"world2_5Time" : Times.world2_5Time,
		"world2_6Time" : Times.world2_6Time,
		"world2_7Time" : Times.world2_7Time,
		"world2_8Time" : Times.world2_8Time,
		"world2_9Time" : Times.world2_9Time,
		"world2_10Time" : Times.world2_10Time,
		"world3_1Time" : Times.world3_1Time,
		"world3_2Time" : Times.world3_2Time,
		"world3_3Time" : Times.world3_3Time,
		"world3_4Time" : Times.world3_4Time,
		"world3_5Time" : Times.world3_5Time,
		"world3_6Time" : Times.world3_6Time,
		"world3_7Time" : Times.world3_7Time,
		"world3_8Time" : Times.world3_8Time,
		"world3_9Time" : Times.world3_9Time,
		"world3_10Time" : Times.world3_10Time,
		}
		if error == OK:
			file.store_var(data)
			file.close()
	Zoom = true
	Animations.transition = true
	yield(get_tree().create_timer(.5),"timeout")
	get_tree().change_scene("res://levels/TutorialNew.tscn")
	


func _on_Continue_pressed():
	var b = buttonPress.instance()
	get_parent().add_child(b)
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			print(player_data)
			print("continue")
			pStats.dashUnlock = player_data["dashUnlock"]
			pStats.dubJumpUnlock = player_data["dubJumpUnlock"]
			pStats.shootUnlock = player_data["shootUnlock"]
			pStats.sens = player_data["Sens"]
			GlobalWorld.fullscreen = player_data["fullscreen"]
			Times.level1 = player_data["level1Time"]
			Times.level2 = player_data["level2Time"]
			Times.level3 = player_data["level3Time"]
			Times.level4 = player_data["level3Time"]
			Times.world1_1Time = player_data["world1_1Time"]
			Times.world1_2Time = player_data["world1_2Time"]
			Times.world1_3Time = player_data["world1_3Time"]
			Times.world1_4Time = player_data["world1_4Time"]
			Times.world1_5Time = player_data["world1_5Time"]
			Times.world1_6Time = player_data["world1_6Time"]
			Times.world1_6Time = player_data["world1_7Time"]
			Times.world1_6Time = player_data["world1_8Time"]
			Times.world1_6Time = player_data["world1_9Time"]
			Times.world2_1Time = player_data["world2_1Time"]
			Times.world2_2Time = player_data["world2_2Time"]
			Times.world2_3Time = player_data["world2_3Time"]
			Times.world2_4Time = player_data["world2_4Time"]
			Times.world2_5Time = player_data["world2_5Time"]
			Times.world2_6Time = player_data["world2_6Time"]
			Times.world2_7Time = player_data["world2_7Time"]
			Times.world2_8Time = player_data["world2_8Time"]
			Times.world2_9Time = player_data["world2_9Time"]
			Times.world2_10Time = player_data["world2_10Time"]
			Times.world2_10Time = player_data["world3_1Time"]
			Times.world2_10Time = player_data["world3_2Time"]
			Times.world2_10Time = player_data["world3_3Time"]
			Times.world2_10Time = player_data["world3_4Time"]
			Times.world2_10Time = player_data["world3_5Time"]
			Times.world2_10Time = player_data["world3_6Time"]
			Times.world2_10Time = player_data["world3_7Time"]
			Times.world2_10Time = player_data["world3_8Time"]
			Times.world2_10Time = player_data["world3_9Time"]
			Times.world2_10Time = player_data["world3_10Time"]
			Times.tutorial = player_data["tutorialTime"]
			Zoom = true
			Animations.transition = true
			yield(get_tree().create_timer(.5),"timeout")
			get_tree().change_scene("res://StartScreen.tscn")


func _on_Save_pressed():
	var b = buttonPress.instance()
	get_parent().add_child(b)
	var data = {
		"dashUnlock" : pStats.dashUnlock,
		"dubJumpUnlock" : pStats.dubJumpUnlock,
		"shootUnlock" : pStats.shootUnlock,
		"Sens" : pStats.sens,
		"fullscreen" : GlobalWorld.fullscreen,
		"level1Time" : Times.level1,
		"level2Time" : Times.level2,
		"level3Time" : Times.level3,
		"level4Time" : Times.level4,
		"tutorialTime" : Times.tutorial,
	}
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
		print("saved")
	
	
	
