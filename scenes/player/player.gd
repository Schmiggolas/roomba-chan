extends VehicleBody3D

var steer_target = 0
@export var car_stats : CarStats

func _physics_process(delta):
	var forward_velocity = global_transform.basis.z.dot(linear_velocity)
	steer_target = Input.get_action_strength("steer_left") - Input.get_action_strength("steer_right")
	print(forward_velocity)
	
	
	var adaptive_steer_limit = remap(
		clamp(linear_velocity.length(), car_stats.min_steer_velocity, car_stats.max_steer_velocity), 
		car_stats.min_steer_velocity, 
		car_stats.max_steer_velocity, 
		car_stats.max_steer_limit, 
		car_stats.min_steer_limit)
		
	steer_target *= adaptive_steer_limit
	if Input.is_action_pressed("forwards"):
		engine_force = car_stats.forwards_engine_force_value
	else:
		engine_force = 0
	if Input.is_action_pressed("backwards"):
		if forward_velocity >= 0.1:
			brake = car_stats.brake_force_value
		else:
			engine_force = -car_stats.backwards_engine_force_value
	else:
		brake = 0.0
	steering = move_toward(steering, steer_target, car_stats.steer_speed * delta)
