class_name SpeedupPickupEffect
extends PickupEffect

@export var max_speedup : float
@export var speedup_time : float
@export var speedup_curve : Curve

func apply_effect(vehicle : Vehicle):
	var remaining_time = speedup_time
	while remaining_time > 0:
		
