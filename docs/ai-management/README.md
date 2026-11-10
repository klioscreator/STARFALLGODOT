# STARFALLGODOT — AI Collaboration

## Repository rules

- `main` is the accepted project baseline. Do not commit directly to it.
- Each active phase has one assigned AI, one working branch, and one task owner.
- A phase branch must be based on the latest accepted `main` unless the coordinator specifies another base.
- Do not let two AI agents write to the same phase branch at the same time.
- All changes are submitted through a Pull Request. The project owner approves and merges.
- Do not start a dependent phase until its required inputs and interface contracts are available.
- Never claim work is saved unless the commit is visible on GitHub.

## Branch naming

- `phase-01-design`
- `phase-02-architecture`
- `phase-03-prototype`
- `phase-04-combat`
- `phase-05-creatures`
- `phase-06-world-base`
- `phase-07-integration`

Use additional branches only for isolated maintenance or coordination work.

## Required handoff

Before pausing, reaching a usage limit, or finishing a task, update the phase status and handoff record. Include the latest commit SHA and exact next action. If no commit was created, state that explicitly.

## Takeover

A replacement AI must first inspect the assigned branch, latest commit, status, handoff, and open PR. It must identify uncommitted or missing work before continuing. Only one AI may hold the active write assignment for a phase at a time.
