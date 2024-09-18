class_name BoostArea
extends Area3D

@export var boostEffect : PackedScene

var _effect_lookup : Dictionary

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") and not _effect_lookup.has(body):
		var effect = boostEffect.instantiate()
		var effect_applicator : EffectApplicator = body.get_node("%EffectApplicator")
		_effect_lookup[body] = effect
		effect_applicator.add_effect(effect,self)


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player") and _effect_lookup.has(body):
		var effect_applicator : EffectApplicator = body.get_node("%EffectApplicator")
		effect_applicator.remove_effect(_effect_lookup[body])
		_effect_lookup.erase(body)
