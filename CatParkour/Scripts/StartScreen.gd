extends Node2D

var timer = false
var time = 0
var scene
var hover = false
var hover1 = false
var hover2 = false
var hover3 = false
var hover4 = false
onready var buttonHover = preload("res://ButtonHover.tscn")
onready var buttonPress = preload("res://ButtonPress.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if GlobalWorld.start == true:
		pass
		GlobalWorld.start = false
	if GlobalWorld.fullscreen == true:
		OS.window_fullscreen = true
#	else:
#		$Transition2.play("TransitionReverse")

func _process(delta):
	if timer == true:
		time += delta
		if time >= .5:
			get_tree().change_scene(scene)
#			print(scene)
	if $Start.is_hovered() and hover == false:
		hover = true
		var b = buttonHover.instance()
		get_parent().add_child(b)
	if !$Start.is_hovered():
		hover = false
	if $Settings.is_hovered() and hover1 == false:
		hover1 = true
		var b = buttonHover.instance()
		get_parent().add_child(b)
	if !$Settings.is_hovered():
		hover1 = false
	if $Quit.is_hovered() and hover2 == false:
		hover2 = true
		var b = buttonHover.instance()
		get_parent().add_child(b)
	if !$Quit.is_hovered():
		hover2 = false
	if $Save.is_hovered() and hover3 == false:
		hover3 = true
		var b = buttonHover.instance()
		get_parent().add_child(b)
	if !$Save.is_hovered():
		hover3 = false

func _on_Start_pressed():
#	$Transition.play("Transition")
	Animations.transition = true
	timer = true
	scene = "res://levels/testmap2.tscn"
	var b = buttonPress.instance()
	get_parent().add_child(b)


func _on_Settings_pressed():
#	$Transition.play("Transition")
	Animations.transition = true
	timer = true
	scene = "res://Settings.tscn"
	var b = buttonPress.instance()
	get_parent().add_child(b)


func _on_Quit_pressed():
	var b = buttonPress.instance()
	get_parent().add_child(b)
	yield(get_tree().create_timer(.5),"timeout")
	get_tree().quit()


func _on_Save_pressed():
	var b = buttonPress.instance()
	get_parent().add_child(b)
	get_tree().change_scene("res://SaveAndLoad.tscn")
