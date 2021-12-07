extends Spatial
onready var cloud1 = preload("res://art/Clouds/Cloud1.tscn")
onready var cloud2 = preload("res://art/Clouds/Cloud2.tscn")
onready var cloud3 = preload("res://art/Clouds/Cloud3.tscn")
onready var cloud4 = preload("res://art/Clouds/Cloud4.tscn")
var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()

func _process(delta):
	pass

func _on_Timer_timeout():
	var cloudNum = randi() % 18
	var locationX = rng.randi_range(-5,5)
	var locationY = rng.randi_range(-5,5)
	var scaleNum = rng.randf_range(.7, 1.1)
	if cloudNum == 1:
		var c = cloud1.instance()
		get_parent().add_child(c)
		c.translation = translation - Vector3(locationX, locationY, 0)
		c.scale = scale * scaleNum
		c.rotation = rotation
	elif cloudNum == 2:
		var c = cloud2.instance()
		get_parent().add_child(c)
		c.translation = translation - Vector3(locationX, locationY, 0)
		c.scale = scale * scaleNum
		c.rotation = rotation
	elif cloudNum == 3:
		var c = cloud3.instance()
		get_parent().add_child(c)
		c.translation = translation - Vector3(locationX, locationY, 0)
		c.scale = scale * scaleNum
		c.rotation = rotation
	elif cloudNum == 4:
		var c = cloud4.instance()
		get_parent().add_child(c)
		c.translation = translation - Vector3(locationX, locationY, 0)
		c.scale = scale * scaleNum
		c.rotation = rotation
	else:
		pass
