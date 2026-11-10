# AIT1404 — Phase 01, task 1.1: Reference-game analysis

## Assignment

- Repository: https://github.com/klioscreator/STARFALLGODOT
- GitHub account: `quockhanh-eng`
- Assigned branch: `phase-01-research-claude1`
- Task: Phase 01.1 only
- Status: RELEASED FOR EXECUTION — identity and branch write access verified
- Output: `docs/phase-01/research/reference-game-analysis.md`
- Tracking issue: https://github.com/klioscreator/STARFALLGODOT/issues/15

## Objective

Produce a factual, source-based comparative analysis of Soul Knight, Magic Survival, and City of Dragon: Epic Battle.

The third title has been identified as City of Dragon: Epic Battle through its official game website and Google Play listing. Verify the exact product identity, developer/publisher, platform and observed version/date from primary sources before attributing individual mechanics.

## Required analysis

For each game, document only features that can be verified:

- Developer/publisher and platform; identify version, region and date observed where available.
- Core player role, game mode, session structure, and moment-to-moment gameplay loop.
- Player movement, attack, defense, skills, and control scheme.
- Character/build progression during a run and between runs.
- Enemy, elite, and boss encounter structure.
- Weapons, abilities, upgrades, items, and resource systems.
- Difficulty scaling, run failure, replay loop, and reward structure.
- Meta-progression and any verified monetization model.
- Technical or presentation choices that materially affect gameplay readability.

Compare the three games in a matrix. Identify design patterns that may be relevant to STARFALLGODOT, but separate observed facts from interpretation and recommendations. Do not recommend copying protected characters, art, names, maps, UI, story, or distinctive content.

## Evidence requirements

- Prefer official developer/publisher pages, official store listings, official patch notes, and direct gameplay footage from identifiable sources.
- Cite every material factual claim with a working URL and source title.
- Record access date and, where available, game version/platform/region.
- Distinguish: VERIFIED FACT, OBSERVATION, INTERPRETATION, and DESIGN OPTION.
- If evidence is unavailable or conflicting, say so.
- Do not invent statistics, mechanics, developers, release dates, versions, or monetization details.
- Do not use unsourced review-site claims as facts.

## Deliverable structure

1. Scope and method
2. Identity verification for each title
3. Individual game profiles
4. Comparative mechanics matrix
5. Reusable design patterns and trade-offs
6. Risks of transferring a pattern into STARFALLGODOT
7. Unverified items and research limitations
8. Source list

## Boundaries

- Work only on `phase-01-research-claude1`.
- Do not edit `main`, `ASSIGNMENTS.md`, AITtor's branch, or any other phase branch.
- Do not write code or modify game assets.
- Do not define the final STARFALLGODOT concept or GDD; those belong to AITtor.
- Do not claim task completion until the complete report is committed and its SHA is verified on GitHub.
- If write access fails, stop immediately and provide the exact error and full proposed report in the AIT1404 conversation. Do not retry with another credential or tool.

## Execution protocol

1. Inspect the current branch head and confirm no other AI session is writing to this branch.
2. Report any work already completed in the current session but not yet pushed. Do not recreate existing work.
3. Continue the task independently; AITtor's work is not a dependency.
4. Commit the complete report, verify the SHA on GitHub, and open a PR to `main`.
5. Update Issue #15 with status, exact file path, SHA, PR URL, limitations and remaining work.

## Completion criteria

The report is complete only when all three game identities are checked, the required comparison is present, factual claims are sourced, uncertainty is explicit, and the committed file is readable from GitHub.
