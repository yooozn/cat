extends RigidBody

var pick = false
export(String) var portalfrom
export(String) var portalto
var portalCD = false
var interact = false
var gravPick = false
var pickUP = false
var hovered = false
var portalDestination
onready var PortalLocation = $Position3D.global_transform.origin
onready var shader = $MeshInstance.get_surface_material(0)
var shader2
var shadernew
func _ready():
	portalDestination = get_parent().get_node(portalto)
	shader2 = shader.duplicate()
	shadernew = shader2.next_pass

#func _on_RigidBody_body_entered(body):
#	pick = true
#	print(pick)
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false
#
#
#func _on_RigidBody_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
#	pick = true
#	print(pick)
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false


#func _on_Area_area_entered(area):
#	pick = true
#	print(pick)
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false
func _process(delta):
	if portalCD == true:
		yield(get_tree().create_timer(1),"timeout")
		portalCD = false
	PortalLocation = $Position3D.global_transform.origin
	if gravPick == true:
		gravity_scale = 0
		collision_layer = 2
		yield(get_tree().create_timer(.1),"timeout")
		interact = true
	elif gravPick == false:
		gravity_scale = 1
		collision_layer = 1
		interact = false
	if GlobalWorld.player.carrying == false:
		gravPick = false
	if shader:
		if hovered == true and GlobalWorld.hovered == true:
			shadernew.set_shader_param("strength", 0.1)
		else:
			shadernew.set_shader_param("strength", 0.0)
	if GlobalWorld.hovered == false:
		hovered = false
#func _on_Area_body_entered(body):
#	pick = true
#	print(pick)
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false


func _on_PortalArea_body_entered(body):
	if portalDestination and !body.is_in_group("TP") and portalCD == false and body.is_in_group("TPable"):
		if body.is_in_group("Player"):
			if body.carrying == false:
				body.global_transform.origin = portalDestination.PortalLocation
				portalDestination.portalCD = true
			else:
				if not body.pickObject.is_in_group("TP"):
					body.global_transform.origin = portalDestination.PortalLocation
					portalDestination.portalCD = true
		else:
			body.global_transform.origin = portalDestination.PortalLocation
			portalDestination.portalCD = true


func _on_Area2_body_entered(body):
	if body.is_in_group("Player"):
		$Particles.set_emitting(true)


func _on_Area2_body_exited(body):
	if body.is_in_group("Player"):
		$Particles.set_emitting(false)
