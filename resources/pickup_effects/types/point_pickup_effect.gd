class_name PointPickupEffect
extends PickupEffect

@export var points : int

func apply_effect():
	print("Added %s points" % str(points))
