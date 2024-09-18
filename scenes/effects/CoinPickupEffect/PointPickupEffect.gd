class_name PointPickupEffect
extends PickupEffect

@export var points : int

func pickup(body: Node):
	print("Scored {points} points".format({"points" : str(points)}))
