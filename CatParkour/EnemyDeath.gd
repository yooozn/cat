extends AudioStreamPlayer3D

func _ready():
	yield(get_tree().create_timer(1.5),"timeout")
	queue_free()
