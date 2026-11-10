# STARFALLGODOT — Architecture Test and Validation Plan

**Status:** Phase 02 architecture plan; executable tests are future implementation work  
**Owner:** AIT0405

## 1. Test layers

### Unit tests
- Turn scheduler transitions and actor eligibility.
- Action validation and cost calculation.
- Damage and status resolution.
- Range/line-of-sight/cover queries after spatial model selection.
- Mission objective evaluation.
- Resource reset and reward calculation.
- Save-data serialization, schema version and migration handling.

### Integration tests
- Player command → validation → resolver → domain events.
- Enemy proposal → same validation/resolution pipeline.
- Turn end → round-end effects → next eligible actor.
- Encounter result → mission objective update.
- Mission result → rewards and persistence boundary.
- Camera switching while mission/combat state remains unchanged.
- Mission restart resets temporary state and preserves approved persistent data.
- Duplicate and stale action requests are rejected without state mutation.

### Presentation and input tests
- First-/third-person switching and camera collision/occlusion.
- HUD reflects authoritative actor, costs and status.
- VFX/animation do not obscure tactical information.
- Input remapping does not change domain action semantics.
- Keyboard/mouse and touch issue equivalent gameplay commands.
- Touch target sizes, safe areas, aspect ratios and camera gestures are usable on real devices.
- Controller testing is conditional on Project Owner approval.

## 2. Platform validation matrix

| Area | Desktop PC | Mobile |
|---|---|---|
| Build/export | Selected desktop OS and export template | Selected Android/iOS targets and export template |
| Rendering | Compare Forward+, Mobile and Compatibility as hardware permits | Compare Mobile and Compatibility on representative devices |
| Input | Keyboard/mouse; controller if approved | Touch |
| Camera | Both modes, mouse sensitivity and obstruction | Both modes, touch gestures and obstruction |
| UI | Windowed/fullscreen, resize and aspect ratios | Safe areas, notches, orientation policy, aspect ratios and touch hit targets |
| Performance | Frame-time, CPU/GPU, memory, scene load | Sustained frame-time, thermal behavior, memory and battery impact |
| Lifecycle | Pause/resume, focus loss, save/load | App suspend/resume, interruption, low-memory and save/load |
| Solo offline | Mission flow with network disabled | Mission flow with network disabled |

Exact device models, operating-system floors, target FPS, resolution and memory budgets must be approved before pass/fail thresholds are assigned.

## 3. Required invariants

1. No action mutates state before validation succeeds.
2. Turn ownership comes only from the scheduler.
3. Player and enemy actions share the resolver.
4. Defeated/disabled actors cannot act unless explicitly allowed.
5. Rejected commands do not partially consume resources.
6. Camera changes do not alter combatant state, turn order or costs.
7. Mission completion is separate from encounter completion.
8. Solo mission flow works without network/server availability.
9. Mission restart clears temporary state according to approved rules.
10. Persistent progression changes only after an accepted mission result.
11. Platform-specific input adapters cannot bypass domain validation.
12. Different camera/input profiles cannot change the authoritative combat result for an equivalent command.

## 4. MVP proving scenario

One compact solo mission should contain one humanoid player, a small environment with a navigational obstacle and a meaningful visibility/cover condition if cover is retained, an encounter with at least two enemy roles, one weapon action, one skill action, a clear objective, failure path, results and restart path.

The same gameplay scenario should be exercised on a desktop PC and a representative mobile device. This is a validation scenario, not a final narrative or art specification.

## 5. Performance validation

Targets cannot be set until minimum hardware is selected. Record target resolution/frame rate, baseline device, scene load and transition times, frame-time budget under expected enemy/VFX load, memory use and worst-case camera/combat conditions. For mobile, include sustained thermal and battery behavior. Do not report performance passed without measured results on agreed hardware.

## 6. Future network tests (not Phase 02 implementation)

- Server rejects stale, duplicate, unauthorised or invalid action requests.
- Server owns turn order and action outcomes.
- Reconnect restores a valid session snapshot.
- Out-of-order messages do not corrupt encounter state.
- Disconnected players cannot retain turn ownership indefinitely.
- Client-submitted damage/rewards/turn advancement are never trusted as authoritative outcomes.

## 7. Phase 02 completion criteria

- Architecture and state ownership documented.
- Gameplay contracts defined without unapproved balance assumptions.
- Technical decision register current and aligned with the PC/mobile decision.
- Godot/platform feasibility reviewed with official references.
- Gameplay architecture alternatives and unresolved rules documented.
- Data, persistence and server boundaries documented.
- Test plan covers core invariants and both target platform classes.
- Blocking Project Owner decisions listed without silently resolving them.
- Deliverables committed, reviewed and merged through repository workflow.
- No gameplay implementation included in Phase 02.
