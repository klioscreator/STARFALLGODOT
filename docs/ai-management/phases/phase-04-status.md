# Phase 04 status — Tactical Combat Foundation

- Overall status: **IN_PROGRESS**
- Phase lead / coordinator: AIT0405 (@klioscreator)
- Branch: `phase-04-combat-ait0405`
- Main baseline after synchronization: `5faf3d154f761c92d049d04e3b03a1755aba1463`
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
| 4.5 | Integration, tests, CI and closeout | AIT0405 | IN_PROGRESS |

## Implemented

- Reusable combat action resource definition and prototype action catalog.
- Central action pipeline with actor, AP, target, team, range and line-of-sight validation.
- Resolver supports damage, healing and no-effect movement actions; rejected actions do not consume AP.
- Deterministic turn manager with duplicate actor filtering, dead-actor skipping, round wraparound and explicit stop.
- Enemy AI proposes actions from a read-only snapshot; accepted proposals pass through the same pipeline as player actions.
- Godot scene controller routes player movement, attacks, skills and enemy turns through the combat pipeline.
- Domain and scene integration tests cover rejection invariants, turn order, player/enemy actions, victory, defeat and restart.
- CI workflow runs on the Phase 04 branch and PRs targeting main.

## Verification

GitHub Actions run #43042099610 on commit `653d739839d5ace03939cf26591a38875beabac6` passed engine setup, import/parse, domain tests and integration tests. The final headless main-scene launch was still running when this record was updated; do not report the workflow as fully successful until its final conclusion is confirmed.

## Governance and exclusions

- Work only on the assigned Phase 04 branch.
- Keep Project Owner's open design decisions open; numerical values are fixtures only.
- No production graphic design during Phase 04.
- No server or online transport implementation.
- Do not merge or close a PR; Project Owner retains merge authority.