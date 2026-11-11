# Phase 04 — Combat Status

**Status:** IN_PROGRESS  
**Phase lead:** AIT0405 (@klioscreator)  
**Branch:** `phase-04-combat-ait0405`  
**Base:** `main`  
**Base SHA:** `a68108e4e15130e084787f4ab6c19092a193b5df`  
**Issue:** [#54](https://github.com/klioscreator/STARFALLGODOT/issues/54)  
**Project Owner authorization:** 2026-11-11  
**Last updated:** 2026-11-11

## Phase 03 dependency

The Project Owner explicitly accepted Phase 03 on 2026-11-11. Phase 03 is recorded COMPLETE in its status and handoff documents. That acceptance is not evidence of physical-device testing.

## Objective

Deliver a reusable tactical combat foundation for the offline solo prototype, building on the Phase 03 Godot scene and preserving its existing movement, camera and input paths.

## Work packages

- 4.1 Combat domain contracts.
- 4.2 Turn and encounter lifecycle.
- 4.3 Shared action validation/resolution pipeline.
- 4.4 Tactical constraints and enemy decision boundary.
- 4.5 Godot integration, automated tests, CI and handoff.

## Scope exclusions

Production graphic design is deferred until Phase 04 is complete. No production art, new creature roster, world production, online server, progression/save system or final combat balance is included.

## Progress

- [x] Project Owner authorization recorded.
- [x] Phase 03 acceptance recorded.
- [x] Phase 04 issue and isolated branch created.
- [ ] Combat action definitions and pipeline.
- [ ] Turn lifecycle hardening.
- [ ] Enemy proposal integration.
- [ ] Tactical range/line-of-sight/movement validation.
- [ ] Domain and integration test coverage.
- [ ] Godot CI and review.
- [ ] Final handoff and Project Owner acceptance.

## Verification

No Phase 04 code verification has been run yet. Record actual CI run IDs and tested commit SHAs here after they are returned by GitHub Actions. Do not claim local Godot or physical-device tests unless performed.

## Decision register

All combat numbers remain prototype fixtures. Initiative formula, final action economy, movement representation, cover rules, status effects, resource economy and enemy roster remain OPEN.