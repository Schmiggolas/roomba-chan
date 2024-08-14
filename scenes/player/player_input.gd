class_name PlayerInput
extends Node

@export var vehicle : Vehicle

func _process(delta):
	vehicle.steer_target = Input.get_action_strength("steer_left") - Input.get_action_strength("steer_right")
	vehicle.acceleration_target = Input.get_axis("backwards","forwards")
