extends AudioStreamPlayer3D

func _ready():
	yield(get_tree().create_timer(2),"timeout")
	queue_free()
