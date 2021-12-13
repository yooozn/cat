extends Particles


# Declare member variables here. Examples:
# var a = 2
var time = 0


# Called when the node enters the scene tree for the first time.


func _process(delta):
	time += delta
	if time >= .3:
		set_emitting(false)
	if time>= 2.3:
		queue_free()
