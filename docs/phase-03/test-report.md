# Phase 03 — Automated Test Report

**Latest run:** [Godot Prototype Checks #42845612067](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42845612067)  
**Tested commit:** `4a0158d1aac60720a252f29b740a8af03829e027`  
**Merge commit:** `8d0e681d4453763f9925f7034cc016d79e6773d7`  
**Result:** SUCCESS  
**Engine:** Godot 4.7.2 stable, standard build  
**Merged through:** [PR #48](https://github.com/klioscreator/STARFALLGODOT/pull/48)

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