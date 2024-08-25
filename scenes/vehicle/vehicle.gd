class_name Vehicle
extends VehicleBody3D

@export var vehicle_stats : VehicleStats

var steer_target : float = 0
var acceleration_target : float = 0
var forward_velocity : float


func _physics_process(delta):
	forward_velocity = global_transform.basis.z.dot(linear_velocity)
	
	var adaptive_steer_limit = remap(
		clamp(linear_velocity.length(), vehicle_stats.min_steer_velocity, vehicle_stats.max_steer_velocity),
		vehicle_stats.min_steer_velocity,
		vehicle_stats.max_steer_velocity,
		vehicle_stats.max_steer_limit,
		vehicle_stats.min_steer_limit)
		
	steer_target *= adaptive_steer_limit
	
	if acceleration_target > 0:
		engine_force = vehicle_stats.forwards_engine_force_value
	else:
		engine_force = 0
	if acceleration_target < 0:
		if forward_velocity >= 0.1:
			brake = vehicle_stats.brake_force_value
		else:
			engine_force = -vehicle_stats.backwards_engine_force_value
	else:
		brake = 0.0
	steering = move_toward(steering, steer_target, vehicle_stats.steer_speed * delta)
