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
		}
		if error == OK:
			file.store_var(data)
			file.close()
	Zoom = true
	Animations.transition = true
	yield(get_tree().create_timer(.5),"timeout")
	get_tree().change_scene("res://levels/Tutorial1.tscn")
	


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
	
	
	
