extends Node2D


var Time = 0

func _ready():
	$Label.visible = true
	$Timer.start()
	Times.stop = false


func _process(delta):
	$Label.text = str(Time)
	if Times.stop == true:
		$Timer.stop()
		if Times.lvl1 == true:
			Times.lvl1 = false
			if Time <= Times.level1 or Times.level1 == 0:
				Times.level1 = Time
		elif Times.lvl2 == true:
			Times.lvl2 = false
			if Time <= Times.level2 or Times.level2 == 0:
				Times.level2 = Time
		elif Times.lvl3 == true:
			Times.lvl3 = false
			if Time <= Times.level3 or Times.level3 == 0:
				Times.level3 = Time
		elif Times.lvl4 == true:
			Times.lvl4 = false
			if Time <= Times.level4 or Times.level4 == 0:
				Times.level4 = Time
		elif Times.tut == true:
			Times.tut = true
			if Time <= Times.tutorial or Times.tutorial == 0:
				Times.tutorial = Time


func _on_Timer_timeout():
	Time += 1
