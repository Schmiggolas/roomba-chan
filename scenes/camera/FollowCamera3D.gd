class_name FollowCamera3D extends Camera3D

@export var node_to_follow : Node
var camera_follow_target : Node
@export var node_to_look_at : Node


func _ready():
	if(node_to_follow == null):
		push_error("Object to follow is null!")
	camera_follow_target = node_to_follow.get_node("CameraTarget")



func _physics_process(delta):
	var target_position = camera_follow_target.position
	position = target_position
	look_at(node_to_look_at.position,Vector3.UP)
	
