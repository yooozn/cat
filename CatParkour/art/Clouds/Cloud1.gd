extends RigidBody

var timer = 0

func _physics_process(delta):
	apply_impulse(transform.basis.z, -transform.basis.z / 50)
	timer += delta
	if timer >= 25:
		queue_free()
