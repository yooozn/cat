extends Particles

var time = 0

func _ready():
	set_emitting(true)

func _process(delta):
	time += delta
	if time >= .3:
		set_emitting(false)
	if time >= 3:
		queue_free()
