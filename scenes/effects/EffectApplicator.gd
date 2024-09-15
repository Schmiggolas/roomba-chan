class_name EffectApplicator
extends Node

func add_effect(effect : Effect, origin : Node):
	effect.reparent(self)
	effect.init(_on_effect_start,_on_effect_end,_on_effect_update,get_parent(),origin)
	
func remove_effect(effect : Effect):
	if effect != null:
		effect.deinit()

func _on_effect_start(effect: Effect):
	print("Effect %s started" % effect.name)

func _on_effect_end(effect : Effect):
	print("Effect %s ended" % effect.name)

func _on_effect_update(effect : Effect):
	print("Effect %s updated" % effect.name)
