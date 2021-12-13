extends Node2D

var time = 0
var boole = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > 5 and boole == false:
		boole = true
		$AnimationPlayer2.play("start")
	if Input.is_action_just_pressed("interact") and boole == true:
		Animations.transition = true
		yield(get_tree().create_timer(.5),"timeout")
		get_tree().change_scene("res://levels/TutorialNew.tscn")
