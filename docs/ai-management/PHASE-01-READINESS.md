# Phase 01 readiness gate

## Current state

Phase 01 has not started. This document defines the checks that must pass before either Claude begins substantive design work.

## Repository baseline

- Coordination baseline checkpoint: `2bc62923f6f265ecab314fe412389d18905e0e90`
- Claude 2 lead branch: `phase-01-design-ready` (synchronized through `58679fdff3bc6ad97c20c4f67cfc8c141d33887e`)
- Claude 1 research branch: `phase-01-research-claude1` (identical to the coordination baseline checkpoint)
- Both work branches were synchronized to this coordination baseline before this readiness note was updated.
- No game implementation is in scope for Phase 01.

## Start conditions

| Check | Required evidence | State |
|---|---|---|
| Repository and baseline | Main commit and both task branches verified on GitHub | PASS |
| Task separation | Claude 1 and Claude 2 have separate branches and non-overlapping write scopes | PASS |
| Claude 1 read access | Claude 1 confirms it can read the assigned branch and project documents | NOT VERIFIED |
| Claude 1 write access | A successful commit by Claude 1 is visible on `phase-01-research-claude1` | NOT VERIFIED — the earlier HTTP 403 is not reliably attributable to a specific Claude session |
| Claude 2 read access | Claude 2 confirms it can read the assigned branch and project documents | NOT VERIFIED |
| Claude 2 write access | A successful commit by Claude 2 is visible on `phase-01-design-ready` | NOT VERIFIED — the earlier HTTP 403 is not reliably attributable to a specific Claude session |
| Prior-session handoff | Claude 2 confirms whether any recoverable Claude 1 Phase 01 notes exist outside GitHub; otherwise records none found | NOT VERIFIED |
| No concurrent writer | Each Claude confirms no other session is writing to its assigned branch | NOT VERIFIED |
| Scope understood | Both AIs acknowledge Phase 01 is research/design only; no game code | NOT VERIFIED |

## Access-check procedure

Each Claude must work only on its own branch.

1. Read `README.md`, `PROJECT_OVERVIEW.md`, `ASSIGNMENTS.md`, this readiness file, and the relevant task brief.
2. Confirm the assigned branch name and its current head SHA.
3. Create one small access-check Markdown file under `docs/ai-management/access-checks/` on that branch. The file must identify the AI label, branch, UTC date, and commit SHA after the commit is visible.
4. Verify the commit by fetching it from GitHub. A successful read does not prove write access. The exact test file is evidence of access only and must not contain credentials.
5. If the write returns 403 or another permission error, stop. Do not retry with alternate credentials or tools. Report the exact error and provide the intended file content in the chat.

The access-check commit is evidence only. It does not mean substantive Phase 01 work has started.

## Task sequence after the gate passes

1. Claude 1 completes task 1.1: source-based analysis of the three reference games on its own branch.
2. The AI Coordinator reviews the analysis for source quality, factual accuracy, completeness, and relevance. Unsupported claims are returned for correction.
3. Claude 2 takes the accepted 1.1 findings as input and completes tasks 1.2–1.4 on the lead branch.
4. The AI Coordinator reviews the complete Phase 01 design package and opens/updates the review PR.
5. Phase 01 is not complete until all acceptance criteria in the approved task brief are met and the changes are merged or explicitly accepted under the recorded delegation.

## Stop conditions

- Either Claude cannot confirm its branch or current head SHA.
- Either Claude receives a write-permission error.
- A different AI is already writing to the same branch.
- The work requires a material decision not covered by the approved scope.
- A reference game cannot be identified reliably.

Do not mark the phase `IN_PROGRESS` until the required access and handoff checks pass.
