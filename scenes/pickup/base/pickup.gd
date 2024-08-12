class_name Pickup
extends Node3D

@export var pickup_effect : PickupEffect

func _on_pickup_zone_body_entered(body : Node3D):
	if body.is_in_group("Player"):
		pickup_effect.apply_effect()
		queue_free()
