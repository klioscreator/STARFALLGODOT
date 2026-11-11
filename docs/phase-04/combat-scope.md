# Phase 04 — Tactical Combat Foundation

**Phase lead:** AIT0405  
**Project Owner authorization:** 2026-11-11  
**Tracking issue:** [#54](https://github.com/klioscreator/STARFALLGODOT/issues/54)  
**Implementation branch:** `phase-04-combat-ait0405`  
**Baseline:** `a68108e4e15130e084787f4ab6c19092a193b5df`

## Objective

Replace the Phase 03 encounter's prototype-only direct action handling with a reusable, deterministic tactical combat foundation for the offline solo game. Preserve the existing humanoid placeholder, 3D arena, dual-camera rig, PC controls and touch controls.

## Work packages

1. **Combat domain:** define reusable action definitions and a single request/validation/resolution pipeline.
2. **Turn lifecycle:** make actor ownership, action-point consumption, dead-actor skipping, round transitions and encounter stop conditions deterministic.
3. **Tactical constraints:** validate actor eligibility, target validity, team relationship, action cost, range and line of sight. Blocked movement must not spend action points.
4. **Enemy decision boundary:** enemy logic reads a tactical snapshot and proposes an action. It does not mutate combat state directly. Its action is submitted to the same pipeline as player actions.
5. **Prototype integration:** route player movement, weapon attacks, skills and enemy actions through the combat foundation. Keep the HUD functional and use only the existing procedural placeholder geometry.
6. **Verification and handoff:** add domain and scene-lifecycle integration tests, run Godot headless CI, record evidence and document limitations.

## Included

- Offline solo encounter logic.
- Existing player and two placeholder enemies.
- Movement-step, weapon-attack, skill and enemy-strike action definitions.
- Action validation and atomic state resolution.
- Turn/round scheduling and victory/defeat/restart.
- Basic range and environment line-of-sight checks.
- Automated tests and CI coverage.

## Excluded

- Production character/enemy art, concept art, textures, animation, VFX, audio and final UI styling. The Project Owner directed that graphic design take place only after Phase 04 completion; ART-01 Issue #52 is deferred.
- New enemy types, creature roster, elite/boss content (Phase 05).
- World/map production and level dressing (Phase 06).
- Online multiplayer transport, matchmaking or server implementation.
- Campaign, mission progression, persistent save, inventory economy or production rewards.
- Final numerical combat balance, final status-effect roster or approved initiative formula.
- Changes to approved first-/third-person camera direction or PC/mobile target platforms.

## Rules and decision boundaries

The Phase 03 AP, health, damage, movement-step and range values are temporary repeatable-test fixtures. Phase 04 may use explicit fixture values to exercise the combat pipeline, but must not represent them as approved game balance.

The implementation must not silently approve initiative, team-versus-individual turn sequencing, a final action economy, a grid/node/free-movement model, cover modifiers, status effects, resource economy, group size or enemy roster. The current prototype's deterministic actor order and fixed movement step remain implementation fixtures.

Camera and input are presentation concerns. Switching camera mode must not consume combat actions or mutate combat state. Keyboard/mouse and touch inputs must continue to issue the same local gameplay commands.

The solo combat loop remains offline. No server, matchmaking or network dependency is introduced.

## Acceptance criteria

- Godot project imports and launches in headless CI.
- Combat action definitions are reusable and not duplicated as scattered damage/cost constants in the scene controller.
- Player and enemy actions use the same validation and resolution pipeline.
- Invalid actions leave combat state and action points unchanged.
- Range and line-of-sight checks reject invalid attacks.
- Blocked tactical movement does not consume action points.
- Turn manager skips defeated actors, handles wraparound and stops when no eligible actors remain.
- Integration tests cover player action, enemy action, victory, defeat and restart.
- Existing camera toggle and input paths remain intact.
- No production art assets or unrelated systems are introduced.
- Test report, status and handoff record include verified commit and CI evidence.
- The Project Owner merges or explicitly accepts the Phase 04 PR before the phase is marked COMPLETE.

## Known limitations at phase start

The Phase 03 implementation environment did not have a local Godot binary or physical target devices. Verification therefore relies on the repository's Godot CI. Owner-side PC/mobile testing remains a separate product validation activity and is not inferred from headless CI.