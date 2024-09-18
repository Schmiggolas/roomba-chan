class_name Pickup
extends Node3D

@export var effect : PickupEffect

func _on_pickup_zone_body_entered(body : Node3D):
	if body.is_in_group("Player"):
		effect.pickup(body)
		queue_free()
