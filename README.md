# STARFALLGODOT — AI Collaboration

Project overview: [PROJECT_OVERVIEW.md](PROJECT_OVERVIEW.md)  
Related documents: [ASSIGNMENTS.md](ASSIGNMENTS.md) · [HANDOFF_TEMPLATE.md](HANDOFF_TEMPLATE.md) · [PHASE_STATUS_TEMPLATE.md](PHASE_STATUS_TEMPLATE.md)

## Roles and responsibilities

### Project Owner

Responsibilities:

- Owns the project and makes the final decisions.
- Approves the objective, scope, and assignment of each phase.
- Reviews and approves project scope and final product decisions.
- May explicitly delegate PR merge authority to the AI Coordinator for a defined scope or period.

Limits: decisions that affect scope, dependencies, or assignments must be recorded in this repository (status files or ASSIGNMENTS.md) so that other AIs can rely on them.

### AI Coordinator

Responsibilities:

- Role held by ChatGPT in the current workflow.
- Tracks the progress of the 7 phases.
- Defines task inputs, outputs, acceptance criteria, and working branches within the Project Owner-approved scope.
- Checks outputs, evidence, and consistency between phases.
- May merge PRs only within the scope of an explicit delegation recorded by the Project Owner.
- Assigns and coordinates work, and receives reports from the AIs.
- Supports handoff when an AI reaches a usage limit or cannot continue.

Limits:

- Does not change decisions already approved by the Project Owner.
- Does not expand or redefine the Project Owner-approved scope.
- Does not merge PRs outside an explicit delegation.
- Does not declare a phase COMPLETED until its acceptance criteria and merge/acceptance requirements are met.

### Phase AI (AI Developer)

Responsibilities:

- The AI that directly performs one assigned phase.
- Works only on its assigned branch.
- Keeps the phase status, commits, and handoff record up to date.
- Reports progress, defects, and blockers to the AI Coordinator.

Limits:

- Must not merge or close a PR, and must not write directly to main.
- Must not change the scope of its phase on its own.
- Must not write to the branch of another phase.
- Must not start work on a phase that is UNASSIGNED in ASSIGNMENTS.md.

## Workflow overview

Project Owner approves scope and may delegate execution/merge authority → AI Coordinator assigns isolated tasks and branches → Phase AIs work only on their assigned branches → status and handoff are updated → Pull Requests are reviewed by the AI Coordinator → merge is performed by the Project Owner or by the Coordinator within the recorded delegation.

## Task assignment

- The Project Owner approves each task.
- The AI Coordinator defines the inputs, outputs, acceptance criteria, and working branch for the phase.
- Each phase has exactly one lead AI. Supporting AIs may receive bounded subtasks only when they use separate branches and do not edit the lead's branch.
- Current lead and supporting assignments are recorded in ASSIGNMENTS.md.
- Assignments, dependencies, and Assigned AI values are changed only by the Project Owner or the AI Coordinator. Phase AIs do not edit ASSIGNMENTS.md.
- A different AI may take over only after a handoff record exists and it is confirmed that no other AI is still writing to the branch.
- Do not assign work that depends on outputs that have not been approved.
- Dependencies between phases are not defined until the Project Owner approves them. Until then they are recorded as TBD – Pending Project Owner approval.

## Repository rules

- main is the accepted project baseline. Do not commit directly to it.
- Each active phase has one lead AI, one lead branch, and one accountable task owner. Supporting AIs may work only on explicitly assigned subtasks using separate branches.
- A phase branch must be based on the latest accepted main unless the coordinator specifies another base.
- Do not let two AI agents write to the same phase branch at the same time.
- All changes are submitted through a Pull Request. The Project Owner merges, or the Coordinator merges only under an explicit recorded delegation.
- Do not start a dependent phase until its required inputs and interface contracts are available.
- Never claim work is saved unless the commit is visible on GitHub.

## Working procedure for a Phase AI

1. Confirm the repository, assigned branch, and that the phase is assigned to you in ASSIGNMENTS.md.
2. Read the phase status file, latest handoff file (if any), and any open PR for the phase.
3. Confirm that you can read the repository. Write access is confirmed only by a successful commit.
4. Work only within the approved scope, on the assigned branch.
5. Keep phase status current as work progresses.
6. Commit, then verify the commit SHA on GitHub before reporting it.
7. Open a Pull Request when ready for review, and report it to the AI Coordinator.

## Branch naming

- phase-01-design-ready
- phase-01-research-claude1
- phase-02-architecture-ait0405 (Phase 02 lead)
- phase-02-support-ait1404-engine-feasibility (bounded support)
- phase-02-support-aittor-gameplay-architecture (bounded support)
- phase-03-prototype
- phase-04-combat-ait0405
- phase-05-creatures
- phase-06-world-base
- phase-07-integration

Use additional branches only for isolated maintenance or coordination work.

## GitHub workflow

- Every change goes through a Pull Request.
- An AI commits and pushes only to the branch assigned to it.
- An AI must not merge or close a PR.
- Do not push directly to main.
- When main changes, check the phase branch and synchronize it as directed by the AI Coordinator. Do not force-push or rewrite history of a shared branch.
- Do not overwrite the work of another AI.

## Status and handoff records

- Phase status: docs/ai-management/phases/phase-XX-status.md
- Handoff record: docs/ai-management/phases/phase-XX-handoff.md

These files live on the branch of the corresponding phase, not on main. Create them only when the phase actually starts or a handoff occurs; do not pre-create empty files.

Record the commit SHA only after it is visible on GitHub. If no commit was created, write No commit created.

### Status values

| Status | Meaning |
|---|---|
| NOT_STARTED | No work has begun on the phase. |
| IN_PROGRESS | One assigned AI is actively working on the phase. |
| PAUSED | Work is intentionally stopped; no AI is writing; a handoff exists. |
| BLOCKED | Work cannot continue because of a missing input, decision, or permission. |
| BLOCKED_LIMIT | The assigned AI reached a usage limit; a handoff is required. |
| NEEDS_TAKEOVER | A replacement AI is needed. |
| PENDING_REVIEW | A PR is open and awaiting AI Coordinator review and approval by the Project Owner or delegated Coordinator. |
| COMPLETED | The completion criteria are met and the PR has been merged by the Project Owner or delegated Coordinator, or explicitly accepted by the Project Owner. |

A phase is not COMPLETED merely because documents were written or commits were made.

## Commit and Pull Request conventions

### Commits

- Format: [phase-XX] type: short summary.
- Types: docs, feat, fix, refactor, test, chore, status, handoff.
- Coordination branches omit the phase prefix.
- Keep each commit within one phase and one purpose. No empty commits.

### Pull Requests

Title: [Phase XX] Short description. Coordination PRs use a plain descriptive title.

The description must state objective, scope, changed files, verification results, known issues and commit SHAs.

The AI Developer opens the PR but never merges or closes it.

## Review and approval

1. The Phase AI sets status to PENDING_REVIEW and reports the PR.
2. The AI Coordinator checks scope, output, dependencies, evidence and consistency.
3. The Project Owner merges, or the AI Coordinator merges if an explicit delegation covers that PR; otherwise the Project Owner decides.
4. After merge, the Project Owner or AI Coordinator updates ASSIGNMENTS.md.

## Phase completion criteria

A phase may be marked COMPLETED only when scope is met, deliverables are present, a verified commit SHA exists, status is current, defects are recorded, the PR is merged or explicitly accepted, and nothing outside scope changed.

## Required handoff

Before pausing, reaching a usage limit or finishing a task, update phase status and handoff with latest verified SHA and exact next action. If no commit was created, state that explicitly.

## Takeover

A replacement AI inspects the assigned branch, latest commit, status, handoff and open PR before continuing. Only one AI may hold the active write assignment for a phase at a time.

## Exception procedures

1. Normal completion: update status and handoff, verify final SHA, open PR, set PENDING_REVIEW and report.
2. AI reaches a limit: commit safe work, update status/handoff and identify unsaved session work.
3. Takeover: continue from latest verified SHA only after assignment is confirmed.
4. Out-of-scope defect: do not fix; report to coordinator.
5. No write access: stop, record exact error and do not seek alternate credentials.
6. PR conflict or failed CI: fix only within assigned scope; stop if conflict touches another phase.
7. Duplicate phase assignment: stop writing and let Project Owner decide ownership.

## Current delegation

The Project Owner explicitly accepted Phase 03 and authorised AIT0405 to lead Phase 04 Combat on 2026-11-11. Phase 04 is limited to the offline solo tactical-combat foundation described in Issue #54. Production graphic design is deferred until Phase 04 is complete. This authorisation does not grant merge authority. The Project Owner retains authority over core product decisions, material scope changes and PR merge approval.

## Security and access

- Never put GitHub tokens, API keys, passwords or other credentials in the repository.
- Do not write personal data or sensitive information into status or handoff documents.
- An AI without write access must tell the AI Coordinator and Project Owner immediately.
- Do not assume write access merely because GitHub MCP tools are available.
- Do not declare work complete until the commit has been verified on GitHub.