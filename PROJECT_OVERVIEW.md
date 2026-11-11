# STARFALLGODOT — Project Overview

STARFALLGODOT is a 3D science-fiction survival-action game developed in seven sequential phases: research/design, architecture, prototype, combat, creatures/enemies, world base and integration.

The Project Owner directs the product and approves phase scope. AI assistants carry out assigned work under the AI Coordinator. Repository collaboration and merge authority are defined in [README.md](README.md).

## Current project state

- Phase 01 — Research and Design: COMPLETE.
- Phase 02 — Architecture: COMPLETE.
- Phase 03 — Prototype: PENDING_OWNER_VALIDATION. Implementation PRs #45, #47, #48 and #50 and closeout documentation PR #49 are merged; integration and post-merge CI pass. Interactive owner-device validation and explicit acceptance remain. See [Phase 03 status](docs/phase-03/phase-03-status.md).
- Phase 04–07: NOT_STARTED.

The merged `main` branch contains the Phase 03 Godot project and procedural 3D prototype. Current main commit: `ac2b57632040e22bfe436d41d04874de55951669`. Main workflow #43036866188 completed successfully. PRs #49 and #50 are merged.

## Approved product direction

- 3D science-fiction survival-action.
- Humanoid player character.
- Switchable first-person and third-person camera.
- Tactical turn-based combat.
- Solo mode and future tactical group play.
- Target platforms: desktop PC and mobile.
- Online group play belongs to a separate supplementary server project.

## Documentation

- [AI collaboration rules](README.md)
- [Phase assignments](ASSIGNMENTS.md)
- [Phase 01 GDD](docs/phase-01/game-design-document.md)
- [Phase 01 MVP scope](docs/phase-01/mvp-scope.md)
- [Phase 02 architecture](docs/phase-02/architecture-overview.md)
- [Phase 02 gameplay contracts](docs/phase-02/gameplay-system-contracts.md)
- [Phase 03 prototype scope](docs/phase-03/prototype-scope.md)
- [Phase 03 run and test](docs/phase-03/run-and-test.md)