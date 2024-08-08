extends Node3D

@export var player : Node3D
@onready var original_offset : Vector3 = position

func _physics_process(delta):
	get_global_transform()
	position = player.position + original_offset
	print(position)
