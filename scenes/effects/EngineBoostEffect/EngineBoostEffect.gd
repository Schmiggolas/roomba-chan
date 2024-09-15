class_name BoostAreaEffect
extends Effect

@export var forwards_engine_force_bonus : float

func deinit():
	_end_effect()
	queue_free()

func _start_effect():
	(target as Vehicle).bonus_vehicle_stats.forwards_engine_force_value += forwards_engine_force_bonus

func _end_effect():
	(target as Vehicle).bonus_vehicle_stats.forwards_engine_force_value -= forwards_engine_force_bonus

func _update_effect(delta : float):
	pass
