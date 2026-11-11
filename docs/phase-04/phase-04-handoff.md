# Phase 04 — Combat Handoff

**Status:** PENDING_REVIEW  
**Lead:** AIT0405  
**Branch:** `phase-04-combat-ait0405`  
**Pull Request:** [#55](https://github.com/klioscreator/STARFALLGODOT/pull/55)  
**Tracking issue:** [#54](https://github.com/klioscreator/STARFALLGODOT/issues/54)  
**Verified code commit:** `9bacc2c9dee65abdcafe19c177b58319f7be610e`  
**CI:** [#43042807937 — SUCCESS](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43042807937)

## Delivered

- Combat action Resource definition and prototype action catalog.
- Central action validation/resolution pipeline.
- Explicit encounter lifecycle state.
- Hardened turn scheduler and AP ownership.
- Read-only enemy action proposal policy.
- Range, line-of-sight and blocked-movement checks.
- Player/enemy integration with the same action pipeline.
- Domain tests and scene integration tests.
- Godot headless CI coverage.
- Phase scope, status and test report.

## Architecture

- Domain state and turn scheduling remain independent from scene presentation.
- Action definitions provide the cost, target, range, line-of-sight and effect contract.
- The pipeline validates before spending AP and resolving effects.
- Player and enemy commands use the same pipeline.
- Enemy AI returns a proposal from a read-only snapshot; it does not directly mutate combatant state.
- The controller owns scene movement and physics checks, then submits accepted movement commands through the pipeline.
- Encounter lifecycle is explicit and separate from camera state.
- Solo combat remains offline. No server dependency was introduced.

## Deferred and open

- Production graphic design and art production are deferred by Project Owner direction until after Phase 04.
- Final AP economy, initiative formula, movement model, cover rules, status effects, resource economy, group size, enemy roster and combat balance remain OPEN.
- New creature types, bosses and enemy production belong to Phase 05.
- World production belongs to Phase 06.
- Online server and multiplayer transport remain separate future work.

## Verification

Workflow #43042807937 passed all steps on the verified code commit: Godot setup/version, project import/parse, domain tests, integration tests and headless main-scene launch.

No local interactive PC playtest, physical mobile-device test, export/install check or target-device performance measurement is claimed.

## Required next action

Project Owner reviews and merges PR #55, or returns it with requested changes. AIT0405 does not merge the PR. After the merge or explicit acceptance, update Phase 04 status and handoff with the final main SHA and post-merge CI evidence. Do not start Phase 05 or ART-01 before a separate start instruction; ART-01 is deferred until Phase 04 completion.