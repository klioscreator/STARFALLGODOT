class_name CombatantState
extends RefCounted
var id: String
var display_name: String
var team: String
var max_health: int
var health: int
var is_alive: bool:
	get:
		return health > 0
func _init(p_id: String = "", p_display_name: String = "", p_max_health: int = 100, p_team: String = "player") -> void:
	id = p_id
	display_name = p_display_name
	max_health = maxi(1, p_max_health)
	health = max_health
	team = p_team
func apply_damage(amount: int) -> int:
	var applied := mini(maxi(amount, 0), health)
	health = maxi(0, health - applied)
	return applied
func restore_health(amount: int) -> int:
	var restored := mini(maxi(amount, 0), max_health - health)
	health = mini(max_health, health + restored)
	return restored
func reset() -> void:
	health = max_health
