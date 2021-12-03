extends Area
var material
var material2
func _ready():
	material = $MeshInstance.get_surface_material(0)
	material = material.duplicate()
	material.albedo_color = Color(.7,.7,.7)
	material2 = $MeshInstance.get_surface_material(0)
	material2.albedo_color = Color(1,1,0)
func _process(delta):
	if global_transform.origin == GlobalWorld.player.CheckPos:
		$MeshInstance.set_surface_material(0,material2)
	else:
		$MeshInstance.set_surface_material(0,material)
func _on_Checkpoint_body_entered(body):
	if body.is_in_group("Player"):
		GlobalWorld.player.CheckPos = translation
