# STARFALLGODOT — Project Overview

STARFALLGODOT is a 3D science-fiction survival-action game developed in seven sequential phases: research/design, architecture, prototype, combat, creatures/enemies, world base and integration.

The Project Owner directs the product and approves phase scope. AI assistants carry out assigned work under the AI Coordinator. Repository collaboration and merge authority are defined in [README.md](README.md).

## Current project state

- Phase 01 — Research and Design: COMPLETE.
- Phase 02 — Architecture: COMPLETE.
- Phase 03 — Prototype: COMPLETE by explicit Project Owner acceptance on 2026-11-11. Implementation and closeout PRs #45, #47, #48, #49, #50 and #51 are merged. This acceptance record does not claim physical-device validation. See [Phase 03 status](docs/phase-03/phase-03-status.md).
- Phase 04 — Combat: IN_PROGRESS under AIT0405. See [Phase 04 status](docs/phase-04/phase-04-status.md) and [Issue #54](https://github.com/klioscreator/STARFALLGODOT/issues/54).
- Phase 05–07: NOT_STARTED.
- ART-01 — Independent visual-design workstream: assigned to AIT1404 through [Issue #52](https://github.com/klioscreator/STARFALLGODOT/issues/52), but DEFERRED by the Project Owner until Phase 04 is complete. No design work is to begin during Phase 04.

The current accepted `main` baseline at Phase 04 synchronization is `5faf3d154f761c92d049d04e3b03a1755aba1463`. Phase 03 main workflow #43036866188 completed successfully. Phase 04 implementation is isolated on `phase-04-combat-ait0405`.

## Approved product direction

- 3D science-fiction survival-action.
- Humanoid player character.
- Switchable first-person and third-person camera.
- Tactical turn-based combat.
- Solo mode and future tactical group play.
- Target platforms: desktop PC and mobile.
- Online group play belongs to a separate supplementary server project.

## Current production boundary

Phase 04 develops the tactical combat foundation using the existing prototype and placeholder geometry. Production character/enemy art, concept art, textures, animation, VFX, audio and final UI styling are deferred until Phase 04 is complete.

## Documentation

- [AI collaboration rules](README.md)
- [Phase assignments](ASSIGNMENTS.md)
- [Phase 01 GDD](docs/phase-01/game-design-document.md)
- [Phase 01 MVP scope](docs/phase-01/mvp-scope.md)
- [Phase 02 architecture](docs/phase-02/architecture-overview.md)
- [Phase 02 gameplay contracts](docs/phase-02/gameplay-system-contracts.md)
- [Phase 03 prototype scope](docs/phase-03/prototype-scope.md)
- [Phase 03 run and test](docs/phase-03/run-and-test.md)
- [Phase 04 combat scope](docs/phase-04/combat-scope.md)