# STARFALLGODOT — Architecture Test and Validation Plan

**Status:** Draft for Phase 02 review  
**Owner:** AIT0405

## 1. Test layers

### Unit tests
- Turn scheduler transitions and actor eligibility.
- Action validation and cost calculation.
- Damage and status resolution.
- Range/line-of-sight/cover queries after spatial model selection.
- Mission objective evaluation.
- Resource reset and reward calculation.
- Save-data serialization and version handling.

### Integration tests
- Player command → validation → resolver → domain events.
- Enemy proposal → same validation/resolution pipeline.
- Turn end → round-end effects → next eligible actor.
- Encounter result → mission objective update.
- Mission result → rewards and persistence boundary.
- Camera switching while mission/combat state remains unchanged.
- Mission restart resets temporary state and preserves approved persistent data.

### Presentation tests
- First-/third-person switching.
- Camera collision/occlusion.
- HUD reflects authoritative actor, costs and status.
- VFX/animation do not obscure tactical information.
- Input remapping does not change domain action semantics.

### Future network tests (not Phase 02 implementation)
- Server rejects stale, duplicate, unauthorised or invalid action requests.
- Server owns turn order and action outcomes.
- Reconnect restores a valid session snapshot.
- Out-of-order messages do not corrupt encounter state.
- Disconnected players cannot retain turn ownership indefinitely.

## 2. Required invariants

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

## 3. MVP proving scenario

One compact solo mission should contain one humanoid player, a small environment with a navigational obstacle and a meaningful visibility/cover condition if cover is retained, an encounter with at least two enemy roles, one weapon action, one skill action, a clear objective, failure path, results and restart path.

This is a validation scenario, not a final narrative or art specification.

## 4. Performance validation

Targets cannot be set until platform and minimum hardware are selected. Record target resolution/frame rate, baseline device, scene load and transition times, frame-time budget under expected enemy/VFX load, memory use and worst-case camera/combat conditions. Do not report performance passed without measured results on agreed hardware.

## 5. Phase 02 completion criteria

- Architecture and state ownership reviewed.
- Gameplay contracts defined without unapproved balance assumptions.
- Technical decision register current.
- Godot/platform feasibility reviewed.
- Data, persistence and server boundaries documented.
- Test plan covers core invariants and MVP proving scenario.
- Blocking Project Owner decisions listed.
- Deliverables committed, reviewed and accepted through repository workflow.
- No gameplay implementation included in Phase 02.
