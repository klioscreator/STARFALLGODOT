# Phase 04 status — Tactical Combat Foundation

- Overall status: **IN_PROGRESS**
- Phase lead / coordinator: AIT0405 (@klioscreator)
- Branch: `phase-04-combat-ait0405`
- Base main SHA: `a68108e4e15130e084787f4ab6c19092a193b5df`
- Tracking issue: #54
- Project Owner authorization: 2026-11-11
- Phase 03 prerequisite: explicitly accepted by Project Owner on 2026-11-11
- Graphic design: deferred until Phase 04 completion (ART-01 Issue #52 is on hold)
- No Phase 04 implementation commit exists at status creation.

## Scope

Build the offline solo tactical-combat foundation on the accepted Godot prototype. Centralize action definitions, validation and resolution; harden turn/round lifecycle; validate targeting and tactical movement; route enemy proposals through the shared action pipeline; add automated domain/integration tests and CI.

Production art, new enemy/creature content, world production, online server, progression/save and final combat balance are excluded.

## Work packages

| ID | Work package | Owner | Status |
|---|---|---|---|
| 4.1 | Combat domain contracts | AIT0405 | NOT_STARTED |
| 4.2 | Turn and encounter lifecycle | AIT0405 | NOT_STARTED |
| 4.3 | Shared action pipeline | AIT0405 | NOT_STARTED |
| 4.4 | Tactical constraints and enemy decision boundary | AIT0405 | NOT_STARTED |
| 4.5 | Integration, tests, CI and closeout | AIT0405 | NOT_STARTED |

## Governance

- Work only on the assigned Phase 04 branch.
- Keep Project Owner's open design decisions open; numerical values used in tests are fixtures only.
- No production graphic design during Phase 04.
- No server or online transport implementation.
- Do not merge or close a PR; Project Owner retains merge authority.
- Record exact commit SHAs and CI run IDs after verification.