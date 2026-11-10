# Run and Test — Phase 03 Prototype

## Requirements

- Godot 4.7.2 stable (standard build; no .NET required).
- Desktop: Windows, Linux or macOS.
- Touch controls are included. Android export additionally requires Godot export templates and Android SDK/JDK configuration.

The engine version is pinned for this prototype baseline only, not for final production.

## Open the project

1. Clone or download the repository.
2. Open Godot 4.7.2.
3. Select Import and choose `project.godot`.
4. Open the project and run the main scene (F6) or project (F5).

## Desktop controls

- W/A/S/D: move during exploration.
- Hold right mouse button: capture mouse and look around; release to show cursor.
- V: switch first-/third-person camera.
- Start encounter: begin the local test combat.
- W/A/S/D during the player's turn: tactical reposition; each successful step consumes one prototype action point.
- Weapon attack / Use skill: act on the selected target.
- Next target: cycle living enemies.
- End turn: pass control to enemy actors.

## Touch controls

- On-screen directional pad: move in exploration; reposition during the player's tactical turn.
- Touch-drag outside UI: camera look.
- On-screen buttons: camera mode, encounter start, target selection, attack, skill and end turn.

## Domain tests

Run from a terminal with Godot on PATH:

```sh
godot --headless --path . -s res://tests/run_tests.gd
```

Expected output: `STARFALLGODOT Phase 03 domain tests: PASS`.

## Validation still required on owner hardware

- Run the scene in Godot 4.7.2 editor and inspect runtime errors.
- Test both camera modes and movement with keyboard/mouse.
- Test touch controls on an actual Android device.
- Test project import and Android export with installed templates/SDK.
- Measure frame time, memory and sustained thermal behavior on the agreed minimum target devices.

The implementation environment had no Godot executable or Android SDK, and outbound downloads were unavailable. Engine-runtime and physical-device checks are not reported as passed.
