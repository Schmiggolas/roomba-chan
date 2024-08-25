class_name EffectApplicator
extends Node

func _process(delta):
	pass

func add_effect(effect : Effect):
	effect.reparent(self)
	effect.effect_start.connect(_on_effect_start)
	effect.effect_end.connect(_on_effect_end)
	
func _on_effect_start(effect: Effect):
	print("Effect %s started" % effect.name)

func _on_effect_end(effect : Effect):
	print("Effect %s ended" % effect.name)
