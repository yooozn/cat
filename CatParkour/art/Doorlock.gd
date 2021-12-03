extends Spatial

export(String) var doorNum
var door

func _ready():
	door = get_parent().get_node(doorNum)

func _on_Area_body_entered(body):
	if body.is_in_group("Key"):
		yield(get_tree().create_timer(.5),"timeout")
		door.lock = false
		queue_free()
