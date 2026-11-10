# STARFALLGODOT — Game concept and direction

**Document status:** Coordinator draft / proposal for Project Owner review  
**Phase:** 01 — Research and Design  
**Prepared:** 2026-11-10  
**Decision authority:** Project Owner

## 1. Evidence boundary

The current repository's `PROJECT_OVERVIEW.md` defines a seven-phase production workflow but does not record an approved genre, player fantasy, platform, camera, art direction, or core mechanic. The reference-game study covers Soul Knight, Magic Survival and City of Dragon: Epic Battle. Those references do not, by themselves, authorize copying their systems or determine STARFALLGODOT's direction.

Accordingly, this document proposes a coherent working direction to make the design package reviewable. Every product-defining choice below remains a **PROPOSAL** until the Project Owner accepts it.

## 2. Working concept proposal

**PROPOSAL — Genre:** science-fiction top-down action roguelite with survival-shooter combat.

**PROPOSAL — Player fantasy:** the player is a lone operative/pilot deployed into hostile starfall zones, facing escalating enemy groups and assembling an improvised combat build from weapons, modules and abilities.

**PROPOSAL — Core experience:** move through an arena, read enemy threats, aim and attack, evade danger, collect run resources, select upgrades and adapt the build to the next threat.

**PROPOSAL — Distinguishing design focus:** build construction should emerge from interactions among a small set of weapon behaviours, passive modules and active abilities. Each choice should change a tactical decision or combat outcome. The first release should prefer a small number of distinct, understandable combinations over a large catalogue.

**PROPOSAL — Initial mode:** single-player, offline-capable run mode. Multiplayer is excluded from the first MVP unless the Project Owner explicitly chooses otherwise.

## 3. Design pillars proposed for evaluation

1. **Readable combat.** Player, enemy, projectile, damage and warning effects must remain visually distinguishable during dense encounters.
2. **Meaningful build choices.** Upgrades should change attack pattern, defence, mobility, area control or resource handling; avoid choices that only add invisible numbers.
3. **Short feedback loop.** Every encounter should provide immediate feedback through hit response, enemy state, rewards and upgrade decisions.
4. **Bounded content production.** The first playable scope should use a small enemy set, a small weapon/module set and one environment before expanding.
5. **Replay through combinations.** Replay value should come first from different upgrade paths and enemy compositions, not from a large quantity of maps or characters.

These pillars are proposals, not verified project-owner decisions.

## 4. Reference-game transfer

- **Soul Knight:** reference for immediate top-down action, simple combat verbs, hero/weapon differentiation and readable encounter spaces. Do not inherit its large weapon catalogue or multiplayer scope by default.
- **Magic Survival:** reference for survival pressure and build choices around abilities, artifacts and synergies. Validate upgrade pacing and choice quality before adopting any specific level-up structure.
- **City of Dragon: Epic Battle:** reference for persistent collection and elemental/team identity. Its roster, breeding and habitat economy are not proposed for the MVP; they create a separate long-term content and balance burden.

## 5. Proposed player journey

1. Enter the game and understand the basic combat controls.
2. Select or receive a starting loadout.
3. Enter a hostile combat zone.
4. Defeat enemies and collect run rewards.
5. Choose an upgrade that changes the current build.
6. Respond to stronger enemy combinations and elite/boss encounters.
7. Complete the objective or be defeated.
8. Review the run and receive a bounded persistent reward.
9. Unlock a new tactical option and begin another run.

The exact mission objective, run duration, persistent reward and unlock economy remain open decisions.

## 6. Scope exclusions proposed for the first release

- Online co-op, PvP, clans, matchmaking and server-side progression.
- Hundreds of weapons, characters or creatures.
- Breeding, habitat construction and a large collection-management layer.
- Procedural campaign generation beyond what is needed for the first test arena.
- Monetization, ads, paid currency, gacha or live-service event infrastructure.
- Narrative campaign, voice acting and cinematic sequences.
- Any implementation during Phase 01.

## 7. Project Owner decisions required

| Decision | Current state | Why it matters |
|---|---|---|
| Accept or reject top-down sci-fi survival roguelite | OPEN | Determines the whole design and architecture |
| Player identity: human operative, starship, creature, or other | OPEN | Changes controls, animation, hitbox and combat verbs |
| Target platform(s) | OPEN | Determines input, UI, performance and distribution |
| 2D, 2.5D or 3D presentation | OPEN | Determines art pipeline and Godot architecture |
| Primary input scheme | OPEN | Determines movement, aiming and controller support |
| Single-player only or future multiplayer | OPEN | Changes simulation, networking and scope |
| Run objective and success condition | OPEN | Determines encounter and reward pacing |
| Persistent progression model | OPEN | Determines economy and save data |
| Visual direction and rating | OPEN | Determines production style and content boundaries |

## 8. Acceptance condition

This concept becomes the approved project direction only after the Project Owner explicitly accepts or edits the open decisions. Until then, downstream documents must retain the PROPOSAL / OPEN labels and must not be treated as authorization to implement.