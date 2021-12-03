extends Particles

var time = 0

func _ready():
	pass

func _process(delta):
	time += delta
	if time >= .1:
		set_emitting(false)
	if time >= 5:
		queue_free()
