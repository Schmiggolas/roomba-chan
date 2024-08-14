class_name PointPickupEffect
extends PickupEffect

@export var points : int

func apply_effect(vehicle : Vehicle):
	print("Added %s points to player" % str(points))
