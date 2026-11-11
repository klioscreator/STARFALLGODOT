class_name CombatActionDefinition
extends Resource

@export var action_id: StringName = &""
@export var display_name: String = ""
@export_enum("movement", "weapon", "skill", "enemy") var category: String = "weapon"
@export_range(1, 10, 1) var action_point_cost: int = 1
@export_range(0.0, 1000.0, 0.1) var range_meters: float = 0.0
@export var requires_target: bool = true
@export var requires_line_of_sight: bool = true
@export_enum("none", "damage", "heal") var effect_type: String = "damage"
@export var effect_value: int = 0
@export_enum("enemy", "ally", "any") var target_relation: String = "enemy"

func _init(
	p_action_id: StringName = &"",
	p_display_name: String = "",
	p_category: String = "weapon",
	p_action_point_cost: int = 1,
	p_range_meters: float = 0.0,
	p_requires_target: bool = true,
	p_requires_line_of_sight: bool = true,
	p_effect_type: String = "damage",
	p_effect_value: int = 0,
	p_target_relation: String = "enemy"
) -> void:
	action_id = p_action_id
	display_name = p_display_name
	category = p_category
	action_point_cost = p_action_point_cost
	range_meters = p_range_meters
	requires_target = p_requires_target
	requires_line_of_sight = p_requires_line_of_sight
	effect_type = p_effect_type
	effect_value = p_effect_value
	target_relation = p_target_relation

func is_definition_valid() -> bool:
	if action_id == &"" or display_name.is_empty():
		return false
	if action_point_cost <= 0 or range_meters < 0.0 or effect_value < 0:
		return false
	if not ["movement", "weapon", "skill", "enemy"].has(category):
		return false
	if not ["none", "damage", "heal"].has(effect_type):
		return false
	if not ["enemy", "ally", "any"].has(target_relation):
		return false
	if requires_target and effect_type == "none":
		return false
	if not requires_target and effect_type != "none":
		return false
	return true
