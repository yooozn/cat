extends Area

#onready var shader = $target.get_node("Cube").surface_get_material(0).next_pass


func _on_Target_body_entered(body):
	if body.is_in_group("PlayerBullet"):
		GlobalWorld.target = true
#		shader.set_shader_param("strength",1)
		$target.get_node("AnimationPlayer").play("idle")
