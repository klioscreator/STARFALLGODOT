# Phase 01 — Management, validation and handoff framework

## 1. Purpose and scope

This document defines how Phase 01 work is assigned, tracked, reviewed and handed between AIT1404, AITtor and AIT0405. It is a management artifact; it does not replace specialist research or game-design documents.

Phase 01 is limited to research, design and written planning. No Godot scripts, scenes, assets, project settings or executable prototype are in scope.

## 2. Role ownership

| Role | GitHub identity | Independent responsibility | Working branch |
|---|---|---|---|
| AIT1404 | quockhanh-eng | Evidence-based reference-game analysis | phase-01-research-claude1 |
| AITtor | HistoryandGeegraphyEducation | Game concept, gameplay loop/core systems, GDD and MVP scope | phase-01-design-ready |
| AIT0405 | klioscreator | Project audit, task coordination, acceptance review, integration and phase closure | phase-01-management-ait0405 |

Each role owns its deliverables. Work must not be duplicated merely because another role has not yet reported. If an artifact already exists, locate and review it before requesting new work.

## 3. Deliverable register

| Deliverable | Owner | Expected path | Evidence required |
|---|---|---|---|
| Reference-game analysis | AIT1404 | docs/phase-01/research/reference-game-analysis.md | Sources, verified title identity, explicit separation of facts/observations/interpretations/design options |
| Game concept and direction | AITtor | docs/phase-01/game-concept.md | Target experience, player fantasy, design pillars, scope and rationale |
| Gameplay loop and core systems | AITtor | docs/phase-01/gameplay-loop-and-systems.md | Core loop, player/enemy interactions, progression, combat and system dependencies |
| Game design document | AITtor | docs/phase-01/game-design-document.md | Internally consistent rules and references to supporting design decisions |
| MVP scope | AITtor | docs/phase-01/mvp-scope.md | Included/excluded features, dependencies, risks and testable completion criteria |
| Management and handoff framework | AIT0405 | docs/phase-01/management/validation-and-handoff-framework.md | This document; reviewed and updated as work progresses |

The register records expected outputs, not proof of completion. A row is complete only after the artifact is located, its branch/commit is recorded, and review is passed.

## 4. Branch and change-control rules

1. One accountable owner per task and one designated working branch per owner.
2. Do not commit directly to main.
3. Do not edit another owner's branch or files without an explicit handoff.
4. Open a pull request to main for review. Include a concise summary, changed-file list, validation notes and source/commit references.
5. Preserve unrelated files and existing work. Make the smallest change needed for the assigned task.
6. Before creating a deliverable, search all branches and open/closed pull requests for an existing version. Extend or correct existing work rather than recreating it.
7. If a branch changes unexpectedly, stop and report its current head SHA before writing further changes.

## 5. Stop, resume and handoff protocol

When an AI stops, pauses or finishes a task, it must update its GitHub issue with:

- Status: NOT STARTED, IN PROGRESS, BLOCKED, READY FOR REVIEW or ACCEPTED.
- Completed work, with exact file paths.
- Remaining work and known blockers.
- Working branch and latest commit SHA.
- Pull request URL, if one exists.
- Any decisions or assumptions that the next owner must preserve.

AIT0405 then checks the reported branch and commit against GitHub, inspects the actual changed files and updates the deliverable register. The next AI receives a distinct task and a written handoff. It must first read the prior handoff and must not repeat completed work.

A task being paused is not the same as being accepted. A task is accepted only after AIT0405 records a review decision with evidence.

## 6. Review and acceptance criteria

### Research
- Claims are traceable to cited sources.
- Facts are separated from observations and interpretation.
- Uncertain or ambiguous game titles are explicitly marked, not guessed.
- Comparisons are relevant to the project's actual design questions.

### Concept and gameplay systems
- The intended player experience and target platform are stated.
- Core loop and systems are understandable and mutually consistent.
- Design choices are distinguished from verified facts.
- Dependencies and unresolved decisions are visible.

### GDD
- Terminology is consistent across sections.
- Rules are specific enough to guide implementation.
- No unsupported features are presented as approved requirements.
- Open questions and risks are recorded.

### MVP
- Scope is bounded and testable.
- Included and excluded features are explicit.
- Completion criteria can be checked without subjective interpretation.
- Dependencies and high-risk assumptions are identified.

### Repository quality
- Files are in the agreed paths and use clear names.
- No unrelated code/assets/settings have changed.
- The PR diff matches the task.
- The branch head and review evidence are recorded.

## 7. Integration and Phase 01 closure

AIT0405 is responsible for reviewing specialist PRs, resolving documentation conflicts with the owners, and merging accepted work to main. Do not merge a deliverable solely because its issue is marked complete.

Phase 01 may be reported complete only when:
1. Every required deliverable in the register exists on main.
2. Each deliverable has passed its relevant acceptance checks.
3. Conflicts and blocking open questions are either resolved or explicitly carried into the next phase.
4. The final main-branch commit and accepted PRs are recorded.
5. The phase status is updated to COMPLETE with a concise evidence-based summary.

## 8. Current coordination record

This framework was added on the dedicated management branch. At creation time, the specialist issues are #15 (AIT1404) and #16 (AITtor); management tracking is #22 (AIT0405). Their issue comments define the independent task boundaries and require each owner to report exact files and commit SHA.

The current issue/branch state must be rechecked before declaring any specialist deliverable complete. An access-check file or permission test is not a substantive research/design deliverable.
