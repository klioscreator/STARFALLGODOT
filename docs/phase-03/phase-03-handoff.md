# Phase 03 — Prototype Handoff

**Status:** PENDING_REVIEW  
**Phase lead:** AIT0405  
**Branch:** phase-03-prototype-ait0405  
**Issue:** #46  
**Automated validation run:** [GitHub Actions #42837265937](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42837265937)

## Deliverables

- `project.godot`
- `scenes/main.tscn`
- `scripts/application/game_controller.gd`
- `scripts/domain/combatant_state.gd`
- `scripts/domain/turn_manager.gd`
- `scripts/presentation/player_controller.gd`
- `scripts/presentation/camera_rig.gd`
- `tests/run_tests.gd`
- `.github/workflows/godot-prototype-checks.yml`
- `docs/phase-03/prototype-scope.md`
- `docs/phase-03/run-and-test.md`
- `docs/phase-03/test-report.md`

## Architecture boundaries

- Combatant state and turn scheduling are separate from scene presentation.
- Camera switching does not own combat rules.
- Solo encounter is local/offline and has no server dependency.
- Enemy turns use the turn manager and action-point accounting.
- Procedural meshes avoid unreviewed third-party assets.
- Touch input and keyboard/mouse feed the same local game controller; no online session is involved.

## Automated validation

GitHub Actions run 42837265937 completed successfully:
- Godot 4.7.2 installed and version verified.
- Project import and script parsing passed.
- Combatant-state and turn-manager tests passed.
- Main scene launched headlessly for five frames.

See docs/phase-03/test-report.md.

## Prototype-only rules

Action-point budget, actor order, damage, health, movement distance and ranges are temporary values for a repeatable test encounter. They are not final balance decisions and must not be carried into later phases as approved rules without Project Owner review.

## Owner-side checks required

1. Open the branch project in Godot 4.7.2 and play it interactively on desktop.
2. Check first-/third-person visibility, camera obstruction and movement.
3. Test touch controls and narrow-screen layout on a real mobile device.
4. Confirm intended mobile OS/export requirements before preparing a device build.
5. Review prototype-only combat parameters before Phase 04.

## Governance

The Phase 03 implementation is ready for review, but this handoff does not claim physical-device validation or production readiness. The Project Owner retains PR merge authority. Phase 03 remains PENDING_REVIEW until the owner-side checks and merge/acceptance requirements are met. Phase 04–07 remain NOT_STARTED.
