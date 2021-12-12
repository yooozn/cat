extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var health = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if health == 3:
		pass
	elif health == 2:
		pass
	elif health == 1:
		pass
	elif health == 0:
		queue_free()
	$Spatial/Viewport/ProgressBar.value = health


func _on_Area_body_entered(body):
	if body.is_in_group("PlayerBullet"):
		health -= 1
