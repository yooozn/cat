extends Particles


# Declare member variables here. Examples:
# var a = 2
var time = 0


# Called when the node enters the scene tree for the first time.
func _process(delta):
	time += delta
	if time >= .3:
		set_emitting(false)
	if time >= 1.5:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
