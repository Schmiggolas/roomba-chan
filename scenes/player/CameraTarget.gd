extends Node3D

@export var player : Node3D
@onready var original_offset : Vector3 = position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position = player.global_position + original_offset
