class_name SmoothedCamera3D extends Camera3D

@export var smoothing_speed: float = 5.0

@export var player: Node3D 
var camera_target : Node3D

func _ready():
	camera_target = player.get_node("%CameraTarget")


func _physics_process(delta):
	var target_position = camera_target.global_position
	
	var new_position = global_position.lerp(target_position, smoothing_speed * delta)
	
	look_at_from_position(new_position,player.position,Vector3.UP)
