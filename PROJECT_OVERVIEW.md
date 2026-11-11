# STARFALLGODOT — Project Overview

STARFALLGODOT is a 3D science-fiction survival-action game developed in seven sequential phases: research/design, architecture, prototype, combat, creatures/enemies, world base and integration.

The Project Owner directs the product and approves phase scope. AI assistants carry out assigned work under the AI Coordinator. Repository collaboration and merge authority are defined in [README.md](README.md).

## Current project state

- Phase 01 — Research and Design: COMPLETE.
- Phase 02 — Architecture: COMPLETE.
- Phase 03 — Prototype: PENDING_OWNER_VALIDATION. Implementation PRs #45, #47, #48 and #50 and closeout documentation PR #49 are merged; merge-record PR #51 is also merged. Integration and post-merge CI pass. Interactive owner-device validation and explicit acceptance remain. See [Phase 03 status](docs/phase-03/phase-03-status.md).
- Phase 04–07: NOT_STARTED; each requires separate Project Owner authorization.
- ART-01 — Independent visual-design workstream: ASSIGNED to AIT1404 (`quockhanh-eng`) through [Issue #52](https://github.com/klioscreator/STARFALLGODOT/issues/52). Status: awaiting AIT1404 execution. This workstream does not renumber or replace Phases 01–07 and does not authorize Phase 04–07.

The merged `main` branch contains the Phase 03 Godot project and procedural 3D prototype. Current main commit at the ART-01 coordination baseline: `a68108e4e15130e084787f4ab6c19092a193b5df`. Phase 03 main workflow #43036866188 completed successfully.

## Approved product direction

- 3D science-fiction survival-action.
- Humanoid player character.
- Switchable first-person and third-person camera.
- Tactical turn-based combat.
- Solo mode and future tactical group play.
- Target platforms: desktop PC and mobile.
- Online group play belongs to a separate supplementary server project.

## ART-01 documentation

- [ART-01 workstream brief](docs/art/README.md)
- [Visual direction and deliverables](docs/art/visual-direction-brief.md)
- [Asset pipeline and Gemini usage](docs/art/asset-pipeline.md)
- [ART-01 status](docs/art/art-status.md)

## Documentation

- [AI collaboration rules](README.md)
- [Phase assignments](ASSIGNMENTS.md)
- [Phase 01 GDD](docs/phase-01/game-design-document.md)
- [Phase 01 MVP scope](docs/phase-01/mvp-scope.md)
- [Phase 02 architecture](docs/phase-02/architecture-overview.md)
- [Phase 02 gameplay contracts](docs/phase-02/gameplay-system-contracts.md)
- [Phase 03 prototype scope](docs/phase-03/prototype-scope.md)
- [Phase 03 run and test](docs/phase-03/run-and-test.md)
