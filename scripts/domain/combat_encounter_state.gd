class_name CombatEncounterState
extends RefCounted

enum Phase {
	INACTIVE,
	ACTIVE,
	VICTORY,
	DEFEAT
}

var phase: Phase = Phase.INACTIVE

func begin() -> bool:
	if phase != Phase.INACTIVE:
		return false
	phase = Phase.ACTIVE
	return true

func complete(victory: bool) -> bool:
	if phase != Phase.ACTIVE:
		return false
	phase = Phase.VICTORY if victory else Phase.DEFEAT
	return true

func reset() -> void:
	phase = Phase.INACTIVE

func is_active() -> bool:
	return phase == Phase.ACTIVE

func is_terminal() -> bool:
	return phase == Phase.VICTORY or phase == Phase.DEFEAT

func result_name() -> String:
	match phase:
		Phase.VICTORY:
			return "VICTORY"
		Phase.DEFEAT:
			return "DEFEAT"
		_:
			return "NONE"
