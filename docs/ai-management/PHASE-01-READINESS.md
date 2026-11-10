# Phase 01 readiness gate

## Current state

Phase 01 is assigned to AIT1404 and AITtor. Coordination and access verification have started; substantive research/design work remains blocked until the identity and branch-write checks pass.

## Repository baseline

- Current accepted main baseline at assignment: `146aa588d66a7d5a2998e8cbcbda10359eb32620`
- AITtor lead branch: `phase-01-design-ready`
- AIT1404 research branch: `phase-01-research-claude1`
- The legacy branch `phase-01-design` is not assigned and must not be used.
- No game implementation is in scope for Phase 01.

## Start conditions

| Check | Required evidence | State |
|---|---|---|
| Repository and baseline | Main commit and both task branches verified on GitHub | PASS |
| Task separation | AIT1404 and AITtor have separate branches and non-overlapping write scopes | PASS |
| AIT1404 identity | Authenticated GitHub login is `quockhanh-eng` | PENDING — must be confirmed in AIT1404 session |
| AIT1404 read access | AIT1404 confirms it can read the assigned branch and project documents | PENDING |
| AIT1404 write access | A successful branch-specific commit by AIT1404 is visible on `phase-01-research-claude1` | PENDING |
| AITtor identity | Authenticated GitHub login is `HistoryandGeegraphyEducation` | PENDING — must be confirmed in AITtor session |
| AITtor read access | AITtor confirms it can read the assigned branch and project documents | PENDING |
| AITtor write access | A successful branch-specific commit by AITtor is visible on `phase-01-design-ready` | PENDING |
| Takeover audit | AITtor reports recoverable prior work, current branch head, and blockers | PENDING |
| No concurrent writer | Each AI confirms no other session is writing to its assigned branch | PENDING |
| Scope understood | Both AIs acknowledge Phase 01 is research/design only; no game code | PENDING |

## Access-check procedure

Each AI must work only on its assigned branch.

1. Read `README.md`, `PROJECT_OVERVIEW.md`, `ASSIGNMENTS.md`, this readiness file, and its task brief.
2. Confirm the authenticated GitHub login matches the account specified in the assignment.
3. Confirm the assigned branch name and its current head SHA.
4. Create one small access-check Markdown file under `docs/ai-management/access-checks/` on that branch. The file must identify the AI label, authenticated GitHub login, branch, UTC date, and commit SHA after the commit is visible. It must contain no credentials.
5. Verify the commit by fetching it from GitHub. A successful read does not prove write access.
6. If the write returns 403 or another permission error, stop. Do not retry with alternate credentials or tools. Report the exact error and provide the intended file content in the chat.

The access-check commit is evidence only. It does not mean substantive Phase 01 work has started.

## Task sequence after the gate passes

1. AIT1404 completes task 1.1: source-based analysis of the three reference games on its own branch.
2. AIT0405 reviews the analysis for source quality, factual accuracy, completeness, and relevance. Unsupported claims are returned for correction.
3. AITtor completes the takeover audit and then uses the accepted 1.1 findings to complete tasks 1.2–1.4 on the lead branch.
4. AIT0405 reviews the complete Phase 01 design package and opens/updates the review PR.
5. Phase 01 is not complete until all acceptance criteria in the approved task brief are met and the changes are merged or explicitly accepted under the recorded delegation.

## Stop conditions

- Either AI cannot confirm its GitHub identity, assigned branch, or current head SHA.
- Either AI receives a write-permission error.
- A different AI is already writing to the same branch.
- The work requires a material decision not covered by the approved scope.
- A reference game cannot be identified reliably.

Do not mark the phase `IN_PROGRESS` until the required identity/access and takeover checks pass.
