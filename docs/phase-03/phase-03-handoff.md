# Phase 03 — Prototype Handoff

**Status:** IN_PROGRESS — awaiting engine/runtime and owner-device validation  
**Phase lead:** AIT0405  
**Branch:** phase-03-prototype-ait0405

## Deliverables

- `project.godot`
- `scenes/main.tscn`
- `scripts/application/game_controller.gd`
- `scripts/domain/combatant_state.gd`
- `scripts/domain/turn_manager.gd`
- `scripts/presentation/player_controller.gd`
- `scripts/presentation/camera_rig.gd`
- `tests/run_tests.gd`
- `docs/phase-03/prototype-scope.md`
- `docs/phase-03/run-and-test.md`

## Architecture boundaries

- Combatant state and turn scheduling are separate from scene presentation.
- Camera switching does not own combat rules.
- Solo encounter is local/offline and has no server dependency.
- Enemy turns use the turn manager and action-point accounting.
- Procedural meshes avoid unreviewed third-party assets.

## Prototype-only rules

Action-point budget, actor order, damage, health, movement distance and ranges are temporary values for a repeatable test encounter. They are not final balance decisions and must not be carried into later phases as approved rules without Project Owner review.

## Validation limitations

No Godot executable or Android SDK was installed in the implementation environment; outbound download was unavailable. The repository contains a headless test script, but it has not been executed here. Editor import, scene runtime, Android export, physical-device input and performance remain unverified.

## Required next checks

1. Execute `godot --headless --path . -s res://tests/run_tests.gd`.
2. Open and run the project in Godot 4.7.2 stable.
3. Inspect errors and camera/character collision behavior.
4. Test Android touch UI and export on an actual device.
5. Review prototype-only combat parameters before Phase 04.

Phase 03 is not marked COMPLETED until engine/runtime validation is available and the Project Owner accepts/merges the PR under repository governance.
