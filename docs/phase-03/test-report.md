# Phase 03 — Automated Test Report

**Run:** [Godot Prototype Checks #42837265937](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42837265937)  
**Commit tested:** `ec3135a99f7ac7b78bd2856010f8c811207b1e54`  
**Result:** SUCCESS  
**Engine:** Godot 4.7.2 stable, standard build

| Check | Result | Evidence |
|---|---|---|
| Install Godot 4.7.2 | PASS | GitHub Actions step completed |
| Engine version verification | PASS | GitHub Actions step completed |
| Project import and script parsing | PASS | `godot --headless --editor --path . --quit` completed |
| Combatant state tests | PASS | Included in `tests/run_tests.gd` |
| Turn manager tests | PASS | Included in `tests/run_tests.gd` |
| Main scene launch | PASS | `godot --headless --path . --quit-after 5` completed |

## Test coverage

Combatant tests cover initial health, damage clamping, healing, defeated state and reset.

Turn-manager tests cover actor ownership, rejection of a non-active actor's action, action-point consumption, turn advancement, skipping an actor removed from the living list and round reset.

The main-scene smoke test confirms that Godot can load and run the main scene for five headless frames. It is not a substitute for interactive playtesting.

## Not tested

- Interactive desktop input and camera feel.
- Touch input on a physical Android/iOS device.
- Android/iOS export and installation.
- Frame time, memory, thermal behavior, battery impact or input latency on owner hardware.
- Full encounter balance and player-experience acceptance.

These tests require devices/toolchains not available in the implementation environment. No claim of mobile certification or full gameplay acceptance is made.
