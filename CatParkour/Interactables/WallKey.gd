extends Area

onready var particles = preload("res://Particles/WallExplode.tscn")
onready var ParticleNoise = preload("res://EnemyDeath.tscn")
var text = false
var lock = true

func _ready():
	$AnimationPlayer.play("idle")
	

func _process(delta):
	if GlobalWorld.player.key_interact == true:
		GlobalWorld.player.key = false
		$AnimationPlayer.play("Opened")
		yield(get_tree().create_timer(1.5),"timeout")
		var particle = particles.instance()
		get_parent().add_child(particle)
		particle.global_transform = global_transform
		var shrinkSound = ParticleNoise.instance()
		get_parent().add_child(shrinkSound)
		shrinkSound.translation = translation
		shrinkSound.play()
		queue_free()

func _on_WallKey_body_entered(body):
	if body.is_in_group("Player"):
		GlobalWorld.player.in_key_area = true
		if GlobalWorld.player.key == true and text == false:
			$Text.play("2")
			text = true
			yield(get_tree().create_timer(2),"timeout")
			text = false
		elif GlobalWorld.player.key == false and text == false:
			$Text.play("1")
			text = true
			yield(get_tree().create_timer(2),"timeout")
			text = false



func _on_WallKey_body_exited(body):
	GlobalWorld.player.in_key_area = false
	$Text.stop()
	$Label.visible = false
	text = false
