class_name Effect
extends Node

signal effect_start(Effect)
signal effect_end(Effect)
signal effect_update(Effect)

var target : Node
var origin : Node

func init(start : Callable, end : Callable, update : Callable, target : Node, origin : Node):
	effect_start.connect(start)
	effect_end.connect(end)
	effect_update.connect(update)
	self.target = target
	_start_effect()

func _process(delta: float) -> void:
	_update_effect(delta)

func deinit():
	pass

func _start_effect():
	pass

func _end_effect():
	pass

func _update_effect(delta : float):
	pass
