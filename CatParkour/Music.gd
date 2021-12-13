extends Node2D

var musicNum = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if musicNum == 1:
		$Title.play()
		$LevelComp.stop()
		$Level.stop()
		$FinalLevel.stop()
		$Hub.stop()
		$Tutorial.stop()
		musicNum = 0
	elif musicNum == 2:
		$Tutorial.play()
		$Title.stop()
		$LevelComp.stop()
		$Level.stop()
		$FinalLevel.stop()
		$Hub.stop()
		musicNum = 0
	elif musicNum == 3:
		$Hub.play()
		$Title.stop()
		$Tutorial.stop()
		$LevelComp.stop()
		$Level.stop()
		$FinalLevel.stop()
		musicNum = 0
	elif musicNum == 4:
		$Level.play()
		$Title.stop()
		$Tutorial.stop()
		$Hub.stop()
		$FinalLevel.stop()
		$LevelComp.stop()
		musicNum = 0
	elif musicNum == 5:
		$LevelComp.play()
		$Title.stop()
		$Tutorial.stop()
		$Hub.stop()
		$Level.stop()
		$FinalLevel.stop()
		musicNum = 0
	elif musicNum == 6:
		$FinalLevel.play()
		$Title.stop()
		$Tutorial.stop()
		$Hub.stop()
		$Level.stop()
		$LevelComp.stop()
		musicNum = 0
