# Phase 03 — Prototype Handoff

**Status:** PENDING_OWNER_VALIDATION  
**Phase lead:** AIT0405  
**Implementation branch:** phase-03-prototype-ait0405  
**Closeout documentation branch:** phase-03-closeout-ait0405
**Merge-record branch:** phase-03-merge-record-ait0405  
**Issue:** #46  
**Merged implementation PRs:** [#45](https://github.com/klioscreator/STARFALLGODOT/pull/45), [#47](https://github.com/klioscreator/STARFALLGODOT/pull/47), [#48](https://github.com/klioscreator/STARFALLGODOT/pull/48), [#50](https://github.com/klioscreator/STARFALLGODOT/pull/50)  
**Merged closeout documentation PR:** [#49](https://github.com/klioscreator/STARFALLGODOT/pull/49)  
**Latest tested implementation commit:** `4a0158d1aac60720a252f29b740a8af03829e027`  
**Baseline Godot CI:** [#42845612067](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42845612067) — SUCCESS  
**Integration Godot CI:** [#43004438956](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43004438956) — SUCCESS on PR #50 head  
**Post-merge main CI:** [#43036866188](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43036866188) — SUCCESS  
**PR #50 merge commit:** `6c2a9ce6dba772fd4b1fb45b915fa25bf705e3c1`  
**PR #49 merge commit / current main:** `ac2b57632040e22bfe436d41d04874de55951669`

## Deliverables

- `project.godot`
- `scenes/main.tscn`
- `scripts/application/game_controller.gd`
- `scripts/domain/combatant_state.gd`
- `scripts/domain/turn_manager.gd`
- `scripts/domain/action_validator.gd`
- `scripts/domain/action_resolver.gd`
- `scripts/presentation/player_controller.gd`
- `scripts/presentation/camera_rig.gd`
- `tests/run_tests.gd`
- `.github/workflows/godot-prototype-checks.yml`
- `docs/phase-03/prototype-scope.md`
- `docs/phase-03/run-and-test.md`
- `docs/phase-03/test-report.md`

## Architecture boundaries

- Combatant state and turn scheduling are separate from scene presentation.
- Player and enemy actions use the shared validator/resolver path.
- Camera switching does not own combat rules.
- Solo encounter is local/offline and has no server dependency.
- Procedural meshes avoid unreviewed third-party assets.
- Touch input and keyboard/mouse feed the same local game controller; no online session is involved.

## Automated validation

Godot Prototype Checks run [#42845612067](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42845612067) completed successfully on the final implementation commit before merge:
- Godot 4.7.2 installed and version verified.
- Project import and script parsing passed.
- Combatant-state, turn-manager and action-pipeline tests passed.
- Main scene launched headlessly for five frames.

See [docs/phase-03/test-report.md](test-report.md). PR #50 merged scene-lifecycle integration coverage and corrected the typed actor-order argument used when starting an encounter. The merged main workflow also completed successfully. The [Project Owner Validation Checklist](owner-validation-checklist.md) provides the device playtest steps and acceptance record.

## Prototype-only rules

Action-point budget, actor order, damage, health, movement distance and ranges are temporary values for a repeatable test encounter. They are not final balance decisions and must not be carried into later phases as approved rules without Project Owner review.

## Owner-side checks required

1. Open the merged `main` project in Godot and play it interactively on desktop.
2. Check first-/third-person visibility, camera obstruction and movement.
3. Test touch controls and narrow-screen layout on a real mobile device.
4. Confirm intended mobile OS/export requirements before preparing a device build.
5. Review prototype-only combat parameters before Phase 04.
6. Record acceptance or defects against Issue #46.

## Governance

Implementation PRs #45, #47, #48 and #50 and documentation PR #49 are merged. This handoff does not claim physical-device validation or production readiness. The Project Owner retains authority over acceptance and core product decisions. Phase 03 remains PENDING_OWNER_VALIDATION until owner-side checks and explicit acceptance are recorded. Phase 04–07 remain NOT_STARTED.