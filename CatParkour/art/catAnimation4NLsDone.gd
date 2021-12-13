extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if pStats.dubJumpUnlock == true and pStats.dashUnlock == false and pStats.shootUnlock == false:
		$Hat1.visible = true
		$Hat2.visible = false
		$Hat3.visible = false
	elif pStats.shootUnlock == true and pStats.dashUnlock == false:
		$Hat2.visible = true
		$Hat3.visible = false
		$Hat1.visible = false
	elif pStats.dashUnlock == true:
		$Hat3.visible = true
		$Hat2.visible = false
		$Hat1.visible = false
	else:
		$Hat3.visible = false
		$Hat2.visible = false
		$Hat1.visible = false
