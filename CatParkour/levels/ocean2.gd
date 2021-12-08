extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var in_water = false
var water_timer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.visible = false

func _process(delta):
	if in_water == true:
		$ColorRect.visible = true
		GlobalWorld.in_water = true
	else:
		$ColorRect.visible = false
		GlobalWorld.in_water = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		in_water = true


func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		in_water = false
