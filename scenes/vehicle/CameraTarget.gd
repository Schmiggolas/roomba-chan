extends Node3D

@onready var original_offset : Vector3 = position
@export var max_offset : Vector3
@export var player : VehicleBody3D

func _physics_process(delta):
	var forward_velocity = global_transform.basis.z.dot(player.linear_velocity)
	if(forward_velocity > 0.2):
		position = original_offset + max_offset * -forward_velocity / 10
	elif(forward_velocity < -0.2):
		position = original_offset + max_offset * forward_velocity / 10
	else:
		position = original_offset
