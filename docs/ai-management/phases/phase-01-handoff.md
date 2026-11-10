# AI handoff — Phase 01 Research and Design

## Current state

- Status: IN_PROGRESS — Project Owner direction accepted; revised design package awaiting review/merge and final sign-off.
- Phase Lead: AITtor (`HistoryandGeegraphyEducation`).
- Research specialist: AIT1404 (`quockhanh-eng`); reference report completed by AIT0405 fallback.
- Coordinator: AIT0405 (`klioscreator`).
- Repository: https://github.com/klioscreator/STARFALLGODOT
- Specialist branches: `phase-01-design-ready`, `phase-01-research-claude1`.
- Current design revision branch: `coordination/phase01-owner-direction-update`.
- Main at last verified checkpoint: `9e5efc2b0dadb92b04967e3dda5c7b69ded10119`.

## Approved product direction

- 3D science-fiction survival-action.
- Humanoid player character.
- Switchable first-person and third-person camera; no top-down camera.
- Tactical turn-based combat.
- Solo play and tactical group play.
- Weapons and skills as the core build-development systems.
- Separate supplementary server project to enable online group sessions.

The earlier top-down real-time shooter proposal is superseded.

## Research baseline

PR #29 merged `docs/phase-01/research/reference-game-analysis.md`. AIT0405 reviewed it against cited official store/developer sources and accepted it as the research baseline. Issue #15 was closed as completed; this is coordinator fallback work, not an AIT1404-authored deliverable.

## Revised design package on current branch

- `docs/phase-01/game-concept.md`
- `docs/phase-01/gameplay-loop-and-systems.md`
- `docs/phase-01/game-design-document.md`
- `docs/phase-01/mvp-scope.md`

These files supersede the previous top-down design after PR review and merge.

## Remaining design decisions

- Platform, input and minimum hardware.
- Turn order, initiative, action costs and enemy-turn rules.
- Group size, party composition and coordination model.
- Mission objectives and failure/success rules.
- Weapon/skill inventory and resource rules.
- Server authority, session hosting, identity and reconnect behaviour.
- Art direction, rating and accessibility.

## Specialist reconciliation

- AIT1404's research issue is closed after the fallback report was accepted.
- AITtor's Issue #16 remains open for a focused review or submission of any existing session-only work.
- Neither specialist branch was overwritten by coordinator work.
- GitHub cannot verify local unpushed session work.

## Scope boundary

Phase 01 remains research/design only. No Godot scripts, scenes, assets, project settings or executable prototypes may be modified. The supplementary server project is separate and not started in this phase.

## Completion sequence

1. Review and merge the revised owner-aligned design documents.
2. Obtain AITtor review/reconciliation without duplicating existing deliverables.
3. Verify consistency and record Phase 02 inputs.
4. Update main SHA and sign off Phase 01.
