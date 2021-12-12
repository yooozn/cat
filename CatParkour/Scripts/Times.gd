extends Node

#Level Time Conditionals
var level1 = 0
var level2 = 0
var level3 = 0
var level4 = 0
var world1Time = 0
var world1_1Time = 0
var world1_2Time = 0
var world1_3Time = 0
var world1_4Time = 0
var world1_5Time = 0
var world1_6Time = 0
var world1_7Time = 0
var world1_8Time = 0
var world1_9Time = 0
var world1_10Time = 0
var world2_1Time = 0
var world2_2Time = 0
var world2_3Time = 0
var world2_4Time = 0
var world2_5Time = 0
var world2_6Time = 0
var world2_7Time = 0
var world2_8Time = 0
var world2_9Time = 0
var world2_10Time = 0
var world3_1Time = 0
var world3_2Time = 0
var world3_3Time = 0
var world3_4Time = 0
var world3_5Time = 0
var world3_6Time = 0
var world3_7Time = 0
var world3_8Time = 0
var world3_9Time = 0
var world3_10Time = 0
var tutorial = 0
var stop = false
var lvl1 = false
var lvl2 = false
var lvl3 = false
var lvl4 = false
var w1_1 = false
var w1_2 = false
var w1_3 = false
var w1_4 = false
var w1_5 = false
var w1_6 = false
var w1_7 = false
var w1_8 = false
var w1_9 = false
var w1_10 = false
var w2_1 = false
var w2_2 = false
var w2_3 = false
var w2_4 = false
var w2_5 = false
var w2_6 = false
var w2_7 = false
var w2_8 = false
var w2_9 = false
var w2_10 = false
var w3_1 = false
var w3_2 = false
var w3_3 = false
var w3_4 = false
var w3_5 = false
var w3_6 = false
var w3_7 = false
var w3_8 = false
var w3_9 = false
var w3_10 = false
var tut = false


func _process(delta):
	world1Time = world1_10Time + world1_1Time + world1_2Time + world1_3Time + world1_4Time + world1_5Time + world1_6Time \
	+ world1_7Time + world1_8Time + world1_9Time
# Key Conditionals
var key1 = false
var keyPos

var orb1 = false
var orbPos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
