# Phase 03 — Automated Test Report

**Latest run:** [Godot Prototype Checks #42845612067](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42845612067)  
**Tested commit:** `4a0158d1aac60720a252f29b740a8af03829e027`  
**PR #48 merge commit:** `8d0e681d4453763f9925f7034cc016d79e6773d7`  
**PR #50 merge commit:** `6c2a9ce6dba772fd4b1fb45b915fa25bf705e3c1`  
**Current main:** `ac2b57632040e22bfe436d41d04874de55951669`  
**Result:** SUCCESS  
**Engine:** Godot 4.7.2 stable, standard build  
**Merged through:** [PR #48](https://github.com/klioscreator/STARFALLGODOT/pull/48) and [PR #50](https://github.com/klioscreator/STARFALLGODOT/pull/50)

## Automated checks

| Check | Result | Evidence |
|---|---|---|
| Install Godot 4.7.2 | PASS | GitHub Actions step completed |
| Engine version verification | PASS | GitHub Actions step completed |
| Project import and script parsing | PASS | `godot --headless --editor --path . --quit` completed |
| Combatant state tests | PASS | `tests/run_tests.gd` |
| Turn scheduler tests | PASS | `tests/run_tests.gd` |
| Action validation tests | PASS | `tests/run_tests.gd` |
| Damage resolution tests | PASS | `tests/run_tests.gd` |
| Main scene launch | PASS | `godot --headless --path . --quit-after 5` completed |

## Test coverage

Combatant tests cover initial health, damage clamping, healing, defeated state and reset.

Turn-manager tests cover actor ownership, rejection of a non-active actor's action, action-point consumption, turn advancement, skipping an actor removed from the living list and round reset.

Action-pipeline tests cover rejection of non-active actors, insufficient action points, out-of-range targets, valid range, damage application, defeat and rejection of actions against defeated targets.

The main-scene smoke test confirms that Godot can load and run the main scene for five headless frames. It is not a substitute for interactive playtesting.

## Not tested

- Interactive desktop input and camera feel.
- Touch input on a physical Android/iOS device.
- Android/iOS export and installation.
- Frame time, memory, thermal behavior, battery impact or input latency on owner hardware.
- Full encounter balance and player-experience acceptance.

These tests require devices/toolchains not available in the implementation environment. No claim of mobile certification or full gameplay acceptance is made.

## Scene-lifecycle integration checks

**Pull request:** [#50](https://github.com/klioscreator/STARFALLGODOT/pull/50) — MERGED  
**Run:** [Godot Prototype Checks #43004438956](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43004438956)  
**Proposed commit tested:** `b09baa1ab720d31296746a120995e2a558a3d51a`  
**Result:** SUCCESS

The added headless integration test instantiates the main scene and verifies:
- Initial exploration state and camera perspective toggle.
- Encounter start and player turn ownership.
- Victory state when all enemy combatant states are defeated.
- Defeat state when player health reaches zero.
- Restart after victory/defeat, including restoration of player/enemy health and enemy visibility.

The test exposed a real runtime type mismatch: encounter initialization passed an untyped array to `TurnManager.start(Array[String], ...)`. PR #50 adds an explicitly typed actor-order array. The corrected integration suite and all previous workflow steps passed on the tested PR head.

This is controller/scene lifecycle coverage, not a complete interactive playthrough. It does not verify physical keyboard/touch input, real-time camera feel, tactical movement collision behavior, full player attack sequences or device performance. Those remain on the Project Owner checklist.


## Post-merge verification

**Main workflow:** [#43036866188](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43036866188)  
**Commit:** `ac2b57632040e22bfe436d41d04874de55951669`  
**Result:** SUCCESS (build, deploy and build-status reporting jobs completed successfully).

This confirms the merged repository workflow completed. It does not establish interactive desktop/mobile acceptance.
