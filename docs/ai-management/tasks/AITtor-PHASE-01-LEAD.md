# AITtor — Phase 01 lead assignment

## Assignment

- Repository: https://github.com/klioscreator/STARFALLGODOT
- GitHub account required: `HistoryandGeegraphyEducation`
- Assigned branch: `phase-01-design-ready`
- Role: Phase 01 lead
- Tasks: takeover audit, then 1.2, 1.3, and 1.4
- Status: BLOCKED — verify the connected account and branch write access first

## First action: takeover audit

Before substantive design work:

1. Read `README.md`, `PROJECT_OVERVIEW.md`, `ASSIGNMENTS.md`, `docs/ai-management/PHASE-01-READINESS.md`, this task brief, and the Phase 01 handoff/status records on the lead branch.
2. Inspect the repository and all Phase 01-related branches and open/closed PRs.
3. Confirm whether any work from earlier AI sessions is recoverable outside GitHub. Do not claim access to another ChatGPT conversation unless the Project Owner provides it.
4. Report the verified repository state, current branch head SHA, missing inputs, and blockers.
5. Complete the branch write-access check before substantive work.

## Work after task 1.1 is accepted

AITtor must wait for AIT0405 to review and accept AIT1404's research report before relying on it.

### Task 1.2 — Game concept and direction

Define the game's concept and design direction using verified project information and accepted research. Identify unresolved product decisions rather than filling gaps with assumptions. State the intended player experience, genre/subgenre, target platform, audience, session model, and distinguishing mechanics only where supported by project decisions or explicitly marked as proposals.

### Task 1.3 — Gameplay loop and core systems

Specify the core loop and supporting loops. Define player actions, combat cadence, progression, resources, rewards, failure/retry, difficulty, enemies/bosses, equipment/skills, and meta-progression to the level required for a GDD. Include state transitions and system dependencies where useful. Do not implement code.

### Task 1.4 — GDD and MVP scope

Produce a coherent GDD that incorporates accepted research and approved decisions. Define MVP features, exclusions, assumptions, dependencies, content requirements, measurable acceptance criteria, and open risks. Keep the MVP feasible for the later architecture/prototype phases.

## Expected deliverables

Store the Phase 01 design package under `docs/phase-01/` on this branch. At minimum:

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

## Completion criteria

Tasks 1.2–1.4 are complete only when the concept is traceable to accepted evidence/decisions, the gameplay loops and system boundaries are internally consistent, the GDD and MVP scope are complete enough to guide Phase 02, and all deliverables are committed and verifiable on GitHub.
