extends Control

#MAKE BUTTON PRESS DELAY LESS

var is_paused = false setget set_is_paused
var save_path = "user://save.dat"
var hover1 = false
var hover2 = false
var hover3 = false
var hover4 = false
onready var resume = $Node2D/Resume
onready var save = $Node2D/Save
onready var settings = $Node2D/Settings
onready var quit = $Node2D/Quit
onready var buttonHover = preload("res://ButtonHover.tscn")
onready var buttonPress = preload("res://ButtonPress.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func _process(delta):
	if is_paused == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


	if resume.is_hovered() and hover1 == false:
		hover1 = true
		var bHover = buttonHover.instance()
		get_parent().get_parent().add_child(bHover)
	if !resume.is_hovered():
		hover1 = false
	if save.is_hovered() and hover2 == false:
		hover2 = true
		var bHover = buttonHover.instance()
		get_parent().get_parent().add_child(bHover)
	if !save.is_hovered():
		hover2 = false
	if settings.is_hovered() and hover3 == false:
		hover3 = true
		var bHover = buttonHover.instance()
		get_parent().get_parent().add_child(bHover)
	if !settings.is_hovered():
		hover3 = false
	if quit.is_hovered() and hover4 == false:
		hover4 = true
		var bHover = buttonHover.instance()
		get_parent().get_parent().add_child(bHover)
	if !quit.is_hovered():
		hover4 = false
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused



func _on_Resume_pressed():
	var bPress = buttonPress.instance()
	get_parent().add_child(bPress)
	self.is_paused = false


func _on_Settings_pressed():
	Animations.transition = true
	var bPress = buttonPress.instance()
	get_parent().add_child(bPress)
	yield(get_tree().create_timer(.5),"timeout")
	GlobalWorld.pauseSettings = true
	$Node2D/Settings2.visible = true

func _on_Quit_pressed():
	self.is_paused = false
	Animations.transition = true
	var bPress = buttonPress.instance()
	get_parent().add_child(bPress)
	yield(get_tree().create_timer(.5),"timeout")
	get_tree().change_scene("res://StartScreen.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	


func _on_Save_pressed():
	var bPress = buttonPress.instance()
	get_parent().add_child(bPress)
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
	}
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
		print("saved")

