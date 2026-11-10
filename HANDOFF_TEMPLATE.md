# AI handoff — [PHASE]

## Handoff state

- Reason: COMPLETED | USAGE_LIMIT | INTERRUPTED | BLOCKED | TRANSFER
- Previous AI:
- Receiving AI (if known):
- Date (UTC):
- Repository:
- Working branch:
- Latest commit SHA:
- Pull Request:

## Work completed

[Summarize work that is present in the branch. Reference paths and commits.]

## Files changed

[List the files created, modified, or deleted, with the commit that contains each change.]

## Work not completed

[List unfinished items. Distinguish committed work from work that existed only in the previous session.]

## Project decisions and constraints

[Record decisions that the next AI must preserve. Link to relevant project documents.]

## Must not be changed without approval

[List files, interfaces, or decisions that the next AI must not alter without the Project Owner's approval.]

## Known defects and verification

[Report errors, tests, runtime checks, and unverified assumptions.]

## Exact continuation point

[Give the next AI a concrete first action, including files or functions to inspect.]

## Safety checks for takeover

- [ ] Confirm the repository and branch.
- [ ] Read the latest phase status and this handoff.
- [ ] Inspect commits and open PR.
- [ ] Confirm no other AI is actively writing to this phase branch.
- [ ] Confirm the working tree / remote branch contains the expected work.
- [ ] Do not overwrite or recreate existing work without inspection.
