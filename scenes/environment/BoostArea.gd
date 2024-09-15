class_name BoostArea
extends Area3D

@export var boostEffect : PackedScene

var _effect_lookup : Dictionary 

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		var effect = boostEffect.instantiate()
		var effect_applicator : EffectApplicator = body.find_child("%EffectApplicator")
		_effect_lookup.get_or_add(body,effect)
		effect_applicator.add_effect(effect,self)


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		var effect_applicator : EffectApplicator = body.find_child("%EffectApplicator")
		effect_applicator.remove_effect(_effect_lookup[body])
