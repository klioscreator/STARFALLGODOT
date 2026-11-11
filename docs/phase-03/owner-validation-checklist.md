# Phase 03 — Project Owner Validation Checklist

**Target:** merged `main` branch  
**Main commit at handoff:** `8d0e681d4453763f9925f7034cc016d79e6773d7`  
**Engine baseline:** Godot 4.7.2 stable  
**Issue:** #46

Record each item as PASS, FAIL or BLOCKED. Add a short note for every FAIL or BLOCKED item. Do not mark a device or platform as tested unless the build was actually run on it.

## 1. Desktop playtest

Environment:
- OS and version:
- CPU / GPU:
- Display resolution:
- Godot version:

| Check | Expected result | Result / notes |
|---|---|---|
| Import and launch | Project imports and main scene starts without parser/runtime errors | |
| Exploration movement | W/A/S/D moves the operative; collision prevents walking through arena obstacles | |
| Mouse look | Holding right mouse button captures the mouse and changes view; releasing restores cursor | |
| Camera toggle in exploration | V and the UI button switch between first- and third-person views | |
| First-person visibility | Player body visual is hidden from the first-person camera | |
| Third-person visibility | Player body visual is visible in third-person | |
| Encounter start | Start encounter changes HUD to tactical mode and gives the player the first turn | |
| Target selection | Next target cycles through living enemies | |
| Tactical movement | Directional input repositions the player during the player turn and consumes prototype AP only on a successful move | |
| Weapon / skill actions | Actions validate turn ownership, action points and range; valid actions affect the selected target | |
| Enemy turn | Ending the player turn advances living enemies and updates player health or enemy positions | |
| Victory | Defeating all enemies ends the encounter and displays VICTORY | |
| Defeat | Reducing player health to zero ends the encounter and displays DEFEAT | |
| Restart | Restart restores player/enemy health, enemy visibility and a new player turn | |
| Runtime stability | No blocking errors, soft-locks or unrecoverable input state during the test | |

## 2. Mobile playtest

Record the actual device and operating environment before testing:
- Device model:
- OS and version:
- Screen resolution / orientation:
- Export template and SDK versions, if applicable:
- Export/install method:

| Check | Expected result | Result / notes |
|---|---|---|
| Project export and installation | Export completes and the build installs/opens on the selected device | |
| Layout | HUD, action buttons and directional pad remain visible and usable at the tested resolution | |
| Touch movement | Directional pad moves the operative in exploration | |
| Touch camera look | Dragging in the gameplay area changes camera view without unintended UI activation | |
| Camera toggle | On-screen camera control switches perspective | |
| Encounter actions | Start, target, attack, skill, end turn and restart controls respond to touch | |
| Tactical movement | Directional pad repositions the player during the player's turn | |
| Stability | No crash, persistent freeze or unusable control state during the test | |

Test Android and iOS separately if both are intended release targets. A test on one mobile OS does not establish validation on the other.

## 3. Performance observations

Record measured values; do not infer them from the desktop editor.

- Approximate frame rate during exploration:
- Approximate frame rate during encounter:
- Memory use, if available:
- Device temperature / thermal throttling after sustained play:
- Input latency or missed touch observations:
- Test duration:

No numerical performance acceptance threshold has been approved for this prototype. Record measurements for review rather than inventing a pass threshold.

## 4. Acceptance record

- Desktop result: PASS / FAIL / BLOCKED
- Mobile result: PASS / FAIL / BLOCKED
- Outstanding defects:
- Evidence links (screenshots, recordings, logs):
- Project Owner decision: ACCEPT / RETURN FOR FIXES
- Decision date:

Phase 03 may be marked COMPLETED only after the required target-platform checks are recorded and the Project Owner explicitly accepts the prototype. If a target OS or device is not yet selected or available, record it as BLOCKED; do not treat it as passed.

## 5. Defect handling

For each failure, record:
1. Device/OS and exact environment.
2. Steps to reproduce.
3. Expected result and actual result.
4. Screenshot, recording or Godot log where available.
5. Whether the issue blocks Phase 03 acceptance.

Keep fixes within Phase 03 prototype scope. New production features, final balance decisions, online multiplayer or campaign systems require separate scope approval.