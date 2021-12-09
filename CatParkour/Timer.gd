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
		elif Times.w1_1 == true:
			Times.w1_1 = false
			if Time <= Times.world1_1Time or Times.world1_1Time == 0:
				Times.world1_1Time = Time
		elif Times.w1_2 == true:
			Times.w1_2 = false
			if Time <= Times.world1_2Time or Times.world1_2Time == 0:
				Times.world1_2Time = Time
		elif Times.w1_3 == true:
			Times.w1_3 = false
			if Time <= Times.world1_3Time or Times.world1_3Time == 0:
				Times.world1_3Time = Time
		elif Times.w1_4 == true:
			Times.w1_4 = false
			if Time <= Times.world1_4Time or Times.world1_4Time == 0:
				Times.world1_4Time = Time
		elif Times.w1_5 == true:
			Times.w1_5 = false
			if Time <= Times.world1_5Time or Times.world1_5Time == 0:
				Times.world1_5Time = Time
		elif Times.w1_6 == true:
			Times.w1_6 = false
			if Time <= Times.world1_6Time or Times.world1_6Time == 0:
				Times.world1_6Time = Time
		elif Times.w1_7 == true:
			Times.w1_7 = false
			if Time <= Times.world1_7Time or Times.world1_7Time == 0:
				Times.world1_7Time = Time
		elif Times.w1_8 == true:
			Times.w1_8 = false
			if Time <= Times.world1_8Time or Times.world1_8Time == 0:
				Times.world1_8Time = Time
		elif Times.w1_9 == true:
			Times.w1_9 = false
			if Time <= Times.world1_9Time or Times.world1_9Time == 0:
				Times.world1_9Time = Time
		elif Times.w1_10 == true:
			Times.w1_10 = false
			if Time <= Times.world1_10Time or Times.world1_10Time == 0:
				Times.world1_10Time = Time
		elif Times.w2_1 == true:
			Times.w2_1 = false
			if Time <= Times.world2_1Time or Times.world2_1Time == 0:
				Times.world1_1Time = Time
		elif Times.w2_1 == true:
			Times.w2_2 = false
			if Time <= Times.world2_2Time or Times.world2_2Time == 0:
				Times.world2_2Time = Time
		elif Times.w2_3 == true:
			Times.w2_3 = false
			if Time <= Times.world2_3Time or Times.world2_3Time == 0:
				Times.world2_3Time = Time
		elif Times.w2_4 == true:
			Times.w2_4 = false
			if Time <= Times.world2_4Time or Times.world2_4Time == 0:
				Times.world2_4Time = Time
		elif Times.w2_5 == true:
			Times.w2_5 = false
			if Time <= Times.world2_5Time or Times.world2_5Time == 0:
				Times.world2_5Time = Time
		elif Times.w2_6 == true:
			Times.w2_6 = false
			if Time <= Times.world2_6Time or Times.world2_6Time == 0:
				Times.world2_6Time = Time
		elif Times.w2_7 == true:
			Times.w2_7 = false
			if Time <= Times.world2_7Time or Times.world2_7Time == 0:
				Times.world2_7Time = Time
		elif Times.w2_8 == true:
			Times.w2_8 = false
			if Time <= Times.world2_8Time or Times.world2_8Time == 0:
				Times.world2_8Time = Time
		elif Times.w2_9 == true:
			Times.w2_9 = false
			if Time <= Times.world2_9Time or Times.world2_9Time == 0:
				Times.world2_9Time = Time
		elif Times.w2_10 == true:
			Times.w2_10 = false
			if Time <= Times.world2_10Time or Times.world2_10Time == 0:
				Times.world2_10Time = Time
		elif Times.tut == true:
			Times.tut = true
			if Time <= Times.tutorial or Times.tutorial == 0:
				Times.tutorial = Time


func _on_Timer_timeout():
	Time += 1
