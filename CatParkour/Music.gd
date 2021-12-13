extends Node2D

var musicNum = 0
var musicVol = 1

# Called when the node enters the scene tree for the first time.

func _process(delta):
	$Title.volume_db = musicVol
	$Tutorial.volume_db = musicVol
	$Hub.volume_db = musicVol
	$Level.volume_db = musicVol
	$LevelComp.volume_db = musicVol
	$FinalLevel.volume_db = musicVol
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
