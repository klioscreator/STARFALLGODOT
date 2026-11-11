# Phase 04 — Test Report

**Verified code commit:** `9bacc2c9dee65abdcafe19c177b58319f7be610e`  
**Godot version:** 4.7.2 Stable (CI environment)  
**Workflow:** [#43042807937](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43042807937)  
**Conclusion:** SUCCESS

## Automated checks

| Check | Result | Evidence |
|---|---|---|
| Install Godot and verify engine version | PASS | Workflow #43042807937 |
| Import project and parse scripts | PASS | Workflow #43042807937 |
| Combat domain tests | PASS | Workflow #43042807937 |
| Combat scene integration tests | PASS | Workflow #43042807937 |
| Launch main scene headlessly | PASS | Workflow #43042807937 |

## Domain test coverage

- Combatant health, damage, healing and reset.
- Encounter lifecycle transitions: inactive → active → victory/defeat → reset.
- Turn ownership and action-point consumption.
- Defeated actor skipping and round wraparound.
- Stop when no living actors are eligible.
- Out-of-range and blocked-line-of-sight rejection.
- Target-team validation.
- Invalid action definition rejection.
- Rejected actions preserve action points and target health.
- Accepted weapon attack, enemy strike, movement/no-effect action and healing.
- Enemy AI proposes an attack when in range and movement when outside attack range; it does not resolve state changes itself.

## Scene integration coverage

- Main scene enters exploration mode and camera perspective can be toggled.
- Encounter starts with player turn ownership.
- Player weapon action changes target health through the shared pipeline.
- Skill action with insufficient AP is rejected without spending AP.
- Tactical movement blocked by arena geometry does not consume AP.
- Enemy strike resolves through the same pipeline.
- Turn ownership returns to the player after the enemy phase.
- Victory, defeat and restart transitions work.

## Verification limits

This report records automated CI results only. It does not claim interactive PC playtesting, physical Android/iOS input testing, export/install validation, or performance measurements on target hardware. Godot headless CI does not assess camera feel, visual quality, frame rate, thermal behaviour, battery use or touch ergonomics.

## Parameters

Health, action-point budgets, damage, attack ranges and movement step are prototype test fixtures. They are not final balance decisions or Project Owner-approved game rules.