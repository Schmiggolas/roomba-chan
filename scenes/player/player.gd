extends VehicleBody3D

const STEER_SPEED = 1.5
const STEER_LIMIT = 0.6
var steer_target = 0
@export var engine_force_value = 40

func _physics_process(delta):
	var local_velocity = global_transform.basis.inverse().z
	var fwd_mps = local_velocity.z
	steer_target = Input.get_action_strength("steer_left") - Input.get_action_strength("steer_right")
	steer_target *= STEER_LIMIT
	if Input.is_action_pressed("forwards"):
		var speed = linear_velocity.length()
		if speed < 5 and speed != 0:
			engine_force = clamp(engine_force_value * 5 / speed, 0, 100)
		else:
			engine_force = engine_force_value
	else:
		engine_force = 0
	if Input.is_action_pressed("backwards"):
		if fwd_mps >= -1:
			var speed = linear_velocity.length()
			if speed < 5 and speed != 0:
				engine_force = -clamp(engine_force_value * 5 / speed, 0, 100)
			else:
				engine_force = -engine_force_value
		else:
			brake = 1
	else:
		brake = 0.0
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
