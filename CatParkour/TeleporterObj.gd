extends RigidBody

var pick = false
export(String) var portalfrom
export(String) var portalto
var portalCD = false
var interact = false
var gravPick = false
var pickUP = false


var portalDestination
onready var PortalLocation = $Position3D.global_transform.origin

func _ready():
	portalDestination = get_parent().get_node(portalto)

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

#func _on_Area_body_entered(body):
#	pick = true
#	print(pick)
#	yield(get_tree().create_timer(1),"timeout")
#	pick = false


func _on_PortalArea_body_entered(body):
	if portalDestination and !body.is_in_group("TP") and portalCD == false and body.is_in_group("TPable"):
		body.global_transform.origin = portalDestination.PortalLocation
		portalDestination.portalCD = true
