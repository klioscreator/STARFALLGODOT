# Phase 01 status — Research and Design

- Overall status: IN_PROGRESS — final design validation and sign-off pending
- Phase Lead assignment: AITtor (`HistoryandGeegraphyEducation`)
- Research assignment: AIT1404 (`quockhanh-eng`)
- Coordinator and fallback author: AIT0405 (`klioscreator`)
- Lead branch: `phase-01-design-ready`
- Research branch: `phase-01-research-claude1`
- Coordinator fallback branch: `phase-01-ait0405-completion`
- Current design revision branch: `coordination/phase01-owner-direction-update`
- Main at last verified checkpoint: `9e5efc2b0dadb92b04967e3dda5c7b69ded10119`
- Last accepted research report: `docs/phase-01/research/reference-game-analysis.md` (AIT0405 fallback, PR #29)
- Updated design documents: concept, gameplay systems, GDD and MVP revised to Project Owner direction; PR review pending
- Last updated: 2026-11-10

## Project Owner-approved direction

- Science-fiction survival-action.
- Tactical turn-based combat.
- 3D humanoid player character.
- Switchable first-person and third-person camera; no top-down view.
- Solo and tactical group play.
- Weapons and skills form the primary build-development system.
- Separate supplementary server project for online group play.

This supersedes the earlier top-down, continuous real-time shooter proposal.

## Completed

- Collaboration rules, management/validation framework and task briefs merged into main.
- AIT1404 and AITtor identities and branch-specific write access verified.
- AIT0405 completed repository, branch, PR and issue audit.
- PR #29 merged the reference-game report, concept, gameplay systems, GDD, MVP and takeover audit.
- Research report reviewed against cited official store/developer sources and accepted as the reference baseline.
- PR #30 and #31 merged assignment, readiness, status and handoff corrections.
- Project Owner's high-level product direction received and recorded.
- AIT0405 revised the four design documents on a separate branch to match that direction.

## Remaining design decisions

- Target platform, input and performance targets.
- Turn order, initiative, action economy and enemy resolution.
- Group size, party composition and group turn coordination.
- Mission objective, extraction and failure conditions.
- Inventory, resource and persistent progression rules.
- Server hosting, authority, security and reconnect policy.
- Art direction, rating and accessibility.

## Specialist workstreams

- AIT1404's assigned branch remains at its last audited access-check commit; no separate specialist report was found at latest audit. The fallback research report is accepted and Issue #15 is closed.
- AITtor's assigned branch remains at its last audited access-check commit; no separate specialist design files were found at latest audit. Issue #16 remains open for reconciliation/review.
- GitHub cannot establish whether either session has unpushed work or is active.
- Specialist branches have not been modified by the coordinator.

## Scope

- Phase 01 is research and design only.
- No Godot code, scenes, assets, project settings or executable prototype have been changed.
- Phase 02–07 remain unassigned.
- The supplementary server project is a future separate workstream, not an implementation task within Phase 01.

## Next actions

1. Review and merge the owner-aligned design revision.
2. Ask AITtor for a focused review or session-only work reconciliation, not a duplicate rewrite.
3. Perform consistency review across concept, gameplay systems, GDD and MVP.
4. Record open technical decisions for Phase 02.
5. Update the final main SHA and close Phase 01 only after the design package passes acceptance.
