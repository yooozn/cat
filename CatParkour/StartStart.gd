extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("start")
	Music.musicNum = 1
	print(Music.musicNum)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$AnimationPlayer.play("end")
	yield(get_tree().create_timer(1.5),"timeout")
	Animations.transition = true
	yield(get_tree().create_timer(.5),"timeout")
	get_tree().change_scene("res://SaveAndLoad.tscn")
