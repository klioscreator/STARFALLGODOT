# AITtor — Phase 01 lead assignment

## Assignment

- Repository: https://github.com/klioscreator/STARFALLGODOT
- GitHub account: `HistoryandGeegraphyEducation`
- Assigned branch: `phase-01-design-ready`
- Role: Phase 01 lead
- Tasks: takeover audit, then 1.2, 1.3, and 1.4
- Status: RELEASED FOR EXECUTION — identity and branch write access verified
- Tracking issue: https://github.com/klioscreator/STARFALLGODOT/issues/16

## First action: takeover audit

1. Read `README.md`, `PROJECT_OVERVIEW.md`, `ASSIGNMENTS.md`, `docs/ai-management/PHASE-01-READINESS.md`, this task brief, and the Phase 01 handoff/status records on the lead branch.
2. Inspect the repository and Phase 01-related branches and open/closed PRs. Record recoverable work and exact SHAs.
3. Report missing inputs, blockers, current branch head SHA, and confirmation that no other AI session is writing to `phase-01-design-ready`.
4. Confirm Phase 01 remains research/design only; no Godot scripts, scenes, assets, project settings or executable prototype changes.

AITtor may proceed with its own concept and systems work independently. It does not need to wait for AIT1404's research draft. If research findings are not yet accepted, label assumptions and proposals clearly and leave any research-dependent decisions open for reconciliation during AIT0405's integration review.

## Task 1.2 — Game concept and direction

Define the game's concept and design direction using verified project information and the Project Owner's recorded decisions. Identify unresolved product decisions rather than filling gaps with assumptions. State intended player experience, genre/subgenre, target platform, audience, session model, and distinguishing mechanics only where supported by project decisions or explicitly marked as proposals.

## Task 1.3 — Gameplay loop and core systems

Specify the core loop and supporting loops. Define player actions, combat cadence, progression, resources, rewards, failure/retry, difficulty, enemies/bosses, equipment/skills, and meta-progression to the level required for a GDD. Include state transitions and system dependencies where useful. Do not implement code.

## Task 1.4 — GDD and MVP scope

Produce a coherent GDD incorporating verified project information, accepted research where available, and approved decisions. Define MVP features, exclusions, assumptions, dependencies, content requirements, measurable acceptance criteria, and open risks. Keep the MVP feasible for later architecture/prototype phases.

## Expected deliverables

Store the Phase 01 design package under `docs/phase-01/` on this branch:

- `game-concept.md`
- `gameplay-loop-and-systems.md`
- `game-design-document.md`
- `mvp-scope.md`

Use additional files only when they materially improve traceability. Link claims to sources and mark proposals, assumptions, and decisions distinctly.

## Boundaries

- Phase 01 is research and design only. Do not create or modify Godot scenes, scripts, assets, project settings, or executable prototypes.
- Work only on `phase-01-design-ready`.
- Do not modify `main`, AIT1404's research branch, or another phase branch.
- Do not overwrite prior work without inspecting it.
- Do not expand the seven-phase plan or change later-phase scope without coordinator review and Project Owner approval.
- If write access fails, stop immediately and report the exact error; do not retry using another credential or tool.

## Execution protocol

1. Complete and commit the takeover audit; verify the SHA.
2. Confirm branch exclusivity and report any session-only completed work. Do not recreate existing material.
3. Continue Tasks 1.2–1.4 independently of AIT1404. Clearly label proposals, assumptions and open questions.
4. Commit the four deliverables, verify the SHA, and open a PR to `main`.
5. Update Issue #16 with exact files, commit SHA, PR URL, review notes and remaining work.

## Completion criteria

Tasks 1.2–1.4 are complete only when the concept is traceable to accepted evidence/decisions or clearly labelled proposals, gameplay loops and system boundaries are internally consistent, and the GDD/MVP scope are complete enough to guide Phase 02. All deliverables must be committed and verifiable on GitHub.
