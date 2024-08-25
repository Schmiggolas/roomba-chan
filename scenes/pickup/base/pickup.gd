class_name Pickup
extends Node3D

func _on_pickup_zone_body_entered(body : Node3D):
	if body.is_in_group("Player"):
		pass
