# Phase 04 status — Tactical Combat Foundation

- Overall status: **PENDING_REVIEW**
- Phase lead / coordinator: AIT0405 (@klioscreator)
- Branch: `phase-04-combat-ait0405`
- Synchronized main baseline: `5faf3d154f761c92d049d04e3b03a1755aba1463`
- Verified implementation/test head: `9bacc2c9dee65abdcafe19c177b58319f7be610e`
- Tracking issue: #54
- Pull Request: #55
- Project Owner authorization: 2026-11-11
- Phase 03 prerequisite: explicitly accepted by Project Owner on 2026-11-11
- Graphic design: deferred until Phase 04 completion (ART-01 Issue #52 is on hold)

## Scope

Build the offline solo tactical-combat foundation on the accepted Godot prototype. Centralize action definitions, validation and resolution; harden turn/round lifecycle; validate targeting and tactical movement; route enemy proposals through the shared action pipeline; add automated domain/integration tests and CI.

Production art, new enemy/creature content, world production, online server, progression/save and final combat balance are excluded.

## Work packages

| ID | Work package | Owner | Status |
|---|---|---|---|
| 4.1 | Combat domain contracts | AIT0405 | COMPLETE |
| 4.2 | Turn and encounter lifecycle | AIT0405 | COMPLETE |
| 4.3 | Shared action pipeline | AIT0405 | COMPLETE |
| 4.4 | Tactical constraints and enemy decision boundary | AIT0405 | COMPLETE |
| 4.5 | Integration, tests, CI and closeout | AIT0405 | COMPLETE — PR #55 awaiting owner review |

## Implemented

- Reusable combat action resource definition and prototype action catalog.
- Central action pipeline with actor, AP, target, team, range and line-of-sight validation.
- Resolver supports damage, healing and no-effect movement actions; rejected actions do not consume AP.
- Explicit encounter lifecycle with inactive, active, victory and defeat states.
- Deterministic turn manager with duplicate actor filtering, defeated-actor skipping, round wraparound and explicit stop.
- Enemy AI proposes actions from a read-only snapshot; accepted proposals pass through the same pipeline as player actions.
- Godot scene controller routes player movement, attacks, skills and enemy turns through the combat pipeline.
- Domain and scene integration tests cover rejection invariants, turn order, player/enemy actions, blocked movement, healing, victory, defeat and restart.
- CI workflow runs on the Phase 04 branch and PRs targeting main.

## Verification

GitHub Actions run #43042807937 passed all steps on commit `9bacc2c9dee65abdcafe19c177b58319f7be610e`: Godot 4.7.2 setup/version, import and parse, domain tests, integration tests and headless main-scene launch.

No local Godot desktop playtest or physical-device validation is claimed.

## Governance and exclusions

- Project Owner accepted Phase 03 and authorized Phase 04.
- All numerical combat parameters remain fixtures; unresolved game-design decisions remain OPEN.
- No production graphic design or art asset production during Phase 04.
- No server or online transport implementation.
- PR #55 is open and awaits Project Owner review/merge. Do not merge or close it as AIT0405; Project Owner retains merge authority.