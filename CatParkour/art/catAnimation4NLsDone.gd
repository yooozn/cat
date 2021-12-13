extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if pStats.hat == 1:
		$Hat1.visible = true
		$Hat2.visible = false
		$Hat3.visible = false
		$Hat4.visible = false
		$Hat5.visible = false
	elif pStats.hat == 2:
		$Hat2.visible = true
		$Hat3.visible = false
		$Hat1.visible = false
		$Hat4.visible = false
		$Hat5.visible = false
	elif pStats.hat == 3:
		$Hat3.visible = true
		$Hat2.visible = false
		$Hat1.visible = false
		$Hat4.visible = false
		$Hat5.visible = false
	elif pStats.hat == 4:
		$Hat4.visible = true
		$Hat3.visible = false
		$Hat2.visible = false
		$Hat1.visible = false
		$Hat5.visible = false
	elif pStats.hat == 5:
		$Hat4.visible = false
		$Hat3.visible = false
		$Hat2.visible = false
		$Hat1.visible = false
		$Hat5.visible = true
	elif pStats.hat == 0:
		$Hat3.visible = false
		$Hat2.visible = false
		$Hat1.visible = false
		$Hat4.visible = false
		$Hat5.visible = false
