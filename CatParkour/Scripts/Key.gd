extends Area

onready var key_part = preload("res://Particles/KeyExplode.tscn")

var text = false

func _ready():
	$AnimationPlayer.play("idle")
	$Label.visible = false

func _on_Key_body_entered(body):
	if body.is_in_group("Player"):
		GlobalWorld.player.key_pickup_range = true
		text = true


func _process(delta):
	if GlobalWorld.player.key_pickup == true:
		GlobalWorld.player.key = true
		var particles = key_part.instance()
		get_parent().add_child(particles)
		particles.translation = translation
		queue_free()
	if text == true and GlobalWorld.player.key_pickup_range == true:
		text = false
		$Text.play("pickup")
		yield(get_tree().create_timer(2),"timeout")
		text = true
	Times.keyPos = global_transform


func _on_Key_body_exited(body):
	if body.is_in_group("Player"):
		GlobalWorld.player.key_pickup_range = false
		text = false
		$Label.visible = false
		$Text.stop()
