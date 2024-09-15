class_name Vehicle
extends VehicleBody3D

@export var base_vehicle_stats : VehicleStats
@export var bonus_vehicle_stats : VehicleStats

var steer_target : float = 0
var acceleration_target : float = 0
var forward_velocity : float


func _physics_process(delta):
	forward_velocity = global_transform.basis.z.dot(linear_velocity)
	
	var adaptive_steer_limit = _calc_adaptive_steer_limit()
		
	steer_target *= adaptive_steer_limit
	
	if acceleration_target > 0:
		engine_force = _calc_forwards_engine_force()
	else:
		engine_force = 0
	if acceleration_target < 0:
		if forward_velocity >= 0.1:
			brake = _calc_brake_force()
		else:
			engine_force = -_calc_backwards_engine_force()
	else:
		brake = 0.0
	steering = move_toward(steering, steer_target, _calc_steer_speed() * delta)
	
func _calc_adaptive_steer_limit() -> float:
	return remap(
	clamp(linear_velocity.length(), 
		base_vehicle_stats.min_steer_velocity + bonus_vehicle_stats.min_steer_velocity, 
		base_vehicle_stats.max_steer_velocity + bonus_vehicle_stats.max_steer_velocity
	),
	base_vehicle_stats.min_steer_velocity + bonus_vehicle_stats.min_steer_velocity,
	base_vehicle_stats.max_steer_velocity + bonus_vehicle_stats.max_steer_velocity,
	base_vehicle_stats.max_steer_limit + bonus_vehicle_stats.max_steer_limit,
	base_vehicle_stats.min_steer_limit + bonus_vehicle_stats.min_steer_limit
	)
	
func _calc_forwards_engine_force() -> float:
	return (base_vehicle_stats.forwards_engine_force_value 
	+ bonus_vehicle_stats.forwards_engine_force_value)

func _calc_backwards_engine_force() -> float:
	return (base_vehicle_stats.backwards_engine_force_value 
	+ bonus_vehicle_stats.backwards_engine_force_value)
	
func _calc_brake_force() -> float:
	return (base_vehicle_stats.brake_force_value 
	+ bonus_vehicle_stats.brake_force_value)
	
func _calc_steer_speed() -> float:
	return (base_vehicle_stats.steer_speed 
	+ bonus_vehicle_stats.steer_speed)
