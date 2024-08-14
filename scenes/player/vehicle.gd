class_name Vehicle
extends VehicleBody3D

@export var car_stats : CarStats
var steer_target : float = 0
var acceleration_target : float = 0
var forward_velocity

func _physics_process(delta):
	forward_velocity = global_transform.basis.z.dot(linear_velocity)
	
	var adaptive_steer_limit = remap(
		clamp(linear_velocity.length(), car_stats.min_steer_velocity, car_stats.max_steer_velocity),
		car_stats.min_steer_velocity,
		car_stats.max_steer_velocity,
		car_stats.max_steer_limit,
		car_stats.min_steer_limit)
		
	steer_target *= adaptive_steer_limit
	
	if acceleration_target > 0:
		engine_force = car_stats.forwards_engine_force_value
	else:
		engine_force = 0
	if acceleration_target < 0:
		if forward_velocity >= 0.1:
			brake = car_stats.brake_force_value
		else:
			engine_force = -car_stats.backwards_engine_force_value
	else:
		brake = 0.0
	steering = move_toward(steering, steer_target, car_stats.steer_speed * delta)
