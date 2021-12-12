extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var health = 3
onready var shader = get_surface_material(0).next_pass
# Called when the node enters the scene tree for the first time.
func _ready():
	$Spatial/Viewport/ProgressBar.max_value = health


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
		shader.set_shader_param("strength", .7)
		yield(get_tree().create_timer(.1),"timeout")
		shader.set_shader_param("strength", 0.0)
