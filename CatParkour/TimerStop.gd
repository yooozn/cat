extends Area

var firstEnter = false
onready var Part = preload("res://levels/TimerStopParticles.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TimerStop_body_entered(body):
	if body.is_in_group("Player") and firstEnter == false:
		Times.stop = true
		firstEnter = true
		$AudioStreamPlayer3D.play()
		var e = Part.instance()
		get_parent().add_child(e)
		e.translation = translation
		
