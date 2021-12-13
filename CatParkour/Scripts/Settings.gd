extends Node2D

var time = 0
var timer = false
var scene
var hover = false
var hover1 = false
var hover2 = false
onready var buttonHover = preload("res://ButtonHover.tscn")
onready var buttonPress = preload("res://ButtonPress.tscn")

func _ready():
	$Transition2.play("TransitionReverse")
	$Sensitivity/HSlider.value = pStats.sens * 200
	$Music/HSlider.value = (Music.musicVol + 20)

func _process(delta):
	pStats.sens = $Sensitivity/HSlider.value / 200
	$Sensitivity.text = "Sensitivity: " + str(pStats.sens * 200)
	Music.musicVol = $Music/HSlider.value - 20
	$Music.text = "Music Volume: " + str(Music.musicVol + 20)
	if timer == true:
		time += delta
		if time >= 1:
			get_tree().change_scene(scene)
	$Fullscreen/CheckBox.pressed = GlobalWorld.fullscreen
	$SpeedRunText/Speedrun.pressed = GlobalWorld.Speedrun
	if $Fullscreen/CheckBox.is_hovered() and hover == false:
		hover = true
		var bHover = buttonHover.instance()
		get_parent().add_child(bHover)
	if !$Fullscreen/CheckBox.is_hovered():
		hover = false
	if $Back.is_hovered() and hover1 == false:
		hover1 = true
		var bHover = buttonHover.instance()
		get_parent().add_child(bHover)
	if !$Back.is_hovered():
		hover1 = false

func _on_Back_pressed():
	Animations.transition = true
	var bPress = buttonPress.instance()
	get_parent().add_child(bPress)
	if GlobalWorld.pauseSettings == true:
		yield(get_tree().create_timer(.5),"timeout")
		visible = false
		GlobalWorld.pauseSettings = false
	else:
		yield(get_tree().create_timer(.5),"timeout")
		get_tree().change_scene("res://StartScreen.tscn")


func _on_CheckBox_toggled(button_pressed):
#	var bPress = buttonPress.instance()
#	get_parent().add_child(bPress)
	if button_pressed == true:
#		print("true")
		OS.window_fullscreen = true
		GlobalWorld.fullscreen = true
	elif button_pressed == false:
		GlobalWorld.fullscreen = false
		OS.window_fullscreen = false
#		print("false")


func _on_CheckBox_pressed():
	var bPress = buttonPress.instance()
	get_parent().add_child(bPress)


func _on_Speedrun_toggled(button_pressed):
	if button_pressed == true:
		GlobalWorld.Speedrun = true
	elif button_pressed == false:
		GlobalWorld.Speedrun = false
