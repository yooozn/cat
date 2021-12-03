extends Area

onready var health_particles= preload("res://Particles/HealthExplode.tscn")
onready var InteractPop = preload("res://InteractPop.tscn")

func _ready():
	$AnimationPlayer.play("idle")

func _on_Health_body_entered(body):
	if body.is_in_group("Player"):
		if GlobalWorld.player.health < GlobalWorld.player.maxhealth:
			Animations.heal = true
			var iP = InteractPop.instance()
			get_parent().add_child(iP)
			iP.translation = translation
			iP.play()
			var particles = health_particles.instance()
			get_parent().add_child(particles)
			particles.translation = translation
			GlobalWorld.player.health += 1
			queue_free()
