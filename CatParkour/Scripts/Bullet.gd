extends RigidBody

var speed = 2
var shoot = false
var time = 0
onready var hit_particles_scene = preload("res://Particles/BulletHitParticles.tscn")
onready var hit_particles_enemy = preload("res://Particles/BulletHitEnemy.tscn")
onready var popMiss = preload("res://popMiss.tscn")

func _ready():
	$bullet.play("bullet")

func _physics_process(delta):
	if shoot == true:
		apply_impulse(transform.basis.z, -transform.basis.z / 50)
		shoot = false
	time += delta
	if time >= 8:
		queue_free()

func _on_Bullet_body_entered(body):
	var hit = hit_particles_scene.instance()
	get_parent().add_child(hit)
	hit.global_transform.origin = global_transform.origin
	if body.is_in_group("Enemy"):
		var hit_enemy = hit_particles_enemy.instance()
		get_parent().add_child(hit_enemy)
		hit_enemy.transform = transform
		hit_enemy.look_at(transform.basis.x, Vector3.UP)
	else:
		var popMiss1 = popMiss.instance()
		get_parent().add_child(popMiss1)
		popMiss1.translation = translation
		popMiss1.play()
	queue_free()

