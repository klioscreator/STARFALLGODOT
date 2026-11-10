# STARFALLGODOT — AI Collaboration

Related documents: [ASSIGNMENTS.md](ASSIGNMENTS.md) · [HANDOFF_TEMPLATE.md](HANDOFF_TEMPLATE.md) · [PHASE_STATUS_TEMPLATE.md](PHASE_STATUS_TEMPLATE.md)

## Roles and responsibilities

### Project Owner

Responsibilities:

- Owns the project and makes the final decisions.
- Approves the objective, scope, and assignment of each phase.
- Reviews and approves Pull Requests.
- Is the only person permitted to merge into `main`.

Limits: decisions that affect scope, dependencies, or assignments must be recorded in this repository (status files or `ASSIGNMENTS.md`) so that other AIs can rely on them.

### AI Coordinator

Responsibilities:

- Role held by ChatGPT in the current workflow.
- Tracks the progress of the 7 phases.
- Defines the inputs, outputs, and working branch of each phase for the Project Owner's approval.
- Checks outputs and consistency between phases.
- Assigns and coordinates work, and receives reports from the AIs.
- Supports handoff when an AI reaches a usage limit or cannot continue.

Limits:

- Does not change decisions already approved by the Project Owner.
- Does not merge into `main`.
- Does not declare a phase `COMPLETED`; that follows the Project Owner's merge or explicit acceptance.

### Phase AI (AI Developer)

Responsibilities:

- The AI that directly performs one assigned phase.
- Works only on its assigned branch.
- Keeps the phase status, commits, and handoff record up to date.
- Reports progress, defects, and blockers to the AI Coordinator.

Limits:

- Must not merge or close a PR, and must not write directly to `main`.
- Must not change the scope of its phase on its own.
- Must not write to the branch of another phase.
- Must not start work on a phase that is `UNASSIGNED` in [ASSIGNMENTS.md](ASSIGNMENTS.md).

## Workflow overview

Project Owner assigns a task → AI Coordinator defines scope, inputs, outputs, and branch → Phase AI works on the assigned branch → Phase AI updates status and handoff → commit → Pull Request → AI Coordinator reviews → Project Owner approves and merges.

## Task assignment

- The Project Owner approves each task.
- The AI Coordinator defines the inputs, outputs, and working branch for the phase.
- Each phase has exactly one AI with primary responsibility at any time. Current assignments are recorded in [ASSIGNMENTS.md](ASSIGNMENTS.md).
- Assignments, dependencies, and `Assigned AI` values are changed only by the Project Owner or the AI Coordinator. Phase AIs do not edit `ASSIGNMENTS.md`.
- A different AI may take over only after a handoff record exists and it is confirmed that no other AI is still writing to the branch.
- Do not assign work that depends on outputs that have not been approved.
- Dependencies between phases are not defined until the Project Owner approves them. Until then they are recorded as `TBD – Pending Project Owner approval`.

## Repository rules

- `main` is the accepted project baseline. Do not commit directly to it.
- Each active phase has one assigned AI, one working branch, and one task owner.
- A phase branch must be based on the latest accepted `main` unless the coordinator specifies another base.
- Do not let two AI agents write to the same phase branch at the same time.
- All changes are submitted through a Pull Request. The project owner approves and merges.
- Do not start a dependent phase until its required inputs and interface contracts are available.
- Never claim work is saved unless the commit is visible on GitHub.

## Working procedure for a Phase AI

1. Confirm the repository, the assigned branch, and that the phase is assigned to you in [ASSIGNMENTS.md](ASSIGNMENTS.md).
2. Read the phase status file, the latest handoff file (if any), and any open PR for the phase.
3. Confirm that you can read the repository. Write access is confirmed only by a successful commit (see Security and access).
4. Work only within the approved scope, on the assigned branch.
5. Keep `phase-XX-status.md` current as work progresses.
6. Commit, then verify the commit SHA on GitHub before reporting it.
7. Open a Pull Request when the work is ready for review, and report to the AI Coordinator.

## Branch naming

- `phase-01-design`
- `phase-02-architecture`
- `phase-03-prototype`
- `phase-04-combat`
- `phase-05-creatures`
- `phase-06-world-base`
- `phase-07-integration`

Use additional branches only for isolated maintenance or coordination work.

## GitHub workflow

- Every change goes through a Pull Request.
- An AI commits and pushes only to the branch assigned to it.
- An AI must not merge or close a PR.
- Do not push directly to `main`.
- When `main` changes, check the phase branch and synchronize it as directed by the AI Coordinator. Do not force-push or rewrite history of a shared branch.
- Do not overwrite the work of another AI.

## Status and handoff records

- Phase status: `docs/ai-management/phases/phase-XX-status.md` (from [PHASE_STATUS_TEMPLATE.md](PHASE_STATUS_TEMPLATE.md))
- Handoff record: `docs/ai-management/phases/phase-XX-handoff.md` (from [HANDOFF_TEMPLATE.md](HANDOFF_TEMPLATE.md))

These files live on the branch of the corresponding phase, not on `main`. Create them only when the phase actually starts or a handoff occurs; do not pre-create empty files.

Record the commit SHA only after it is visible on GitHub. If no commit was created, write `No commit created`.

### Status values

| Status | Meaning |
|---|---|
| `NOT_STARTED` | No work has begun on the phase. |
| `IN_PROGRESS` | One assigned AI is actively working on the phase. |
| `PAUSED` | Work is intentionally stopped; no AI is writing; a handoff exists. |
| `BLOCKED` | Work cannot continue because of a missing input, decision, or permission. |
| `BLOCKED_LIMIT` | The assigned AI reached a usage limit; a handoff is required. |
| `NEEDS_TAKEOVER` | A replacement AI is needed. |
| `PENDING_REVIEW` | A PR is open and awaiting AI Coordinator review and Project Owner approval. |
| `COMPLETED` | The completion criteria are met and the Project Owner has merged or explicitly accepted the PR. |

A phase is not `COMPLETED` merely because documents were written or commits were made.

## Commit and Pull Request conventions

### Commits

- Format: `[phase-XX] type: short summary`, for example `[phase-01] docs: add design overview`.
- Types: `docs`, `feat`, `fix`, `refactor`, `test`, `chore`, `status`, `handoff`.
- Coordination branches omit the phase prefix, for example `docs: strengthen multi-AI coordination workflow`.
- Keep each commit within one phase and one purpose. No empty commits.

### Pull Requests

- Title: `[Phase XX] Short description`. Coordination PRs use a plain descriptive title.
- Base is `main`; head is the assigned phase branch.
- The description must state:
  - Objective.
  - Scope of changes.
  - List of changed files.
  - Verification results.
  - Known issues.
  - Commit SHA(s).
- The AI Developer opens the PR but never merges or closes it.

## Review and approval

1. The Phase AI sets the status to `PENDING_REVIEW` and reports the PR to the AI Coordinator.
2. The AI Coordinator checks scope, output, dependencies, and consistency with other phases, and reports findings.
3. The Project Owner approves and merges, or requests changes.
4. After merge, the Project Owner or AI Coordinator updates [ASSIGNMENTS.md](ASSIGNMENTS.md).

## Phase completion criteria

A phase may be marked `COMPLETED` only when all of the following hold:

- The work matches the approved scope.
- The deliverables or documents are present in the branch.
- A verified commit SHA exists on GitHub.
- The status file is up to date.
- Defects and open issues have been checked and recorded.
- A PR is open for the Project Owner's review, and the Project Owner has merged or accepted it.
- Nothing outside the assigned scope was changed.

## Required handoff

Before pausing, reaching a usage limit, or finishing a task, update the phase status and handoff record. Include the latest commit SHA and exact next action. If no commit was created, state that explicitly.

## Takeover

A replacement AI must first inspect the assigned branch, latest commit, status, handoff, and open PR. It must identify uncommitted or missing work before continuing. Only one AI may hold the active write assignment for a phase at a time.

## Exception procedures

1. **Normal completion:** update status and handoff, verify the final commit SHA, open the PR, set `PENDING_REVIEW`, and report to the AI Coordinator.
2. **AI reaches a limit mid-task:** commit what is safe to commit, update status (`BLOCKED_LIMIT`) and the handoff with the latest verified SHA, and state clearly what exists only in the session and was not saved.
3. **Takeover from the latest SHA:** the replacement AI follows Takeover, starts from the latest verified commit on the branch, and records its own name in the status file only after the Coordinator or Project Owner confirms the assignment.
4. **Defect outside the assigned scope:** do not fix it. Record it under Risks and blockers and report it to the AI Coordinator, who raises it with the Project Owner.
5. **No write access:** stop writing, record the exact error, do not retry with other tools, do not look for other credentials, and tell the AI Coordinator and Project Owner. Provide the full file content in the chat for manual saving and do not claim it was saved.
6. **PR conflict or failed CI:** fix only within the assigned scope on the phase branch, without force-pushing. If the conflict touches another phase's work or the cause is outside the scope, stop and report to the AI Coordinator.
7. **Two AIs assigned to the same phase:** the AI that detects this stops writing and notifies the AI Coordinator and Project Owner. Neither deletes or overwrites the other's commits. The Project Owner decides which AI continues, and the other AI hands over its findings.

## Security and access

- Never put GitHub tokens, API keys, passwords, or other credentials in the repository.
- Do not write personal data or sensitive information into status or handoff documents.
- An AI without write access must tell the AI Coordinator and the Project Owner immediately.
- Do not assume write access merely because GitHub MCP tools are available.
- Do not declare work complete until the commit has been verified on GitHub.
