# STARFALLGODOT — Game Design Document (GDD)

**Document status:** Provisional design package; Project Owner approval required  
**Version:** 0.1  
**Prepared:** 2026-11-10  
**Phase:** 01 — Research and Design

## 1. Product summary

**PROPOSAL.** STARFALLGODOT is a single-player, top-down science-fiction action roguelite focused on survival combat and run-based build construction. The player enters a hostile zone, defeats escalating enemy groups, collects temporary run resources, selects upgrades and attempts to complete an encounter objective.

This is a working proposal only. The repository currently contains no approved product brief defining the genre, player identity, platform, camera, art direction or core mechanic. The Project Owner must accept or revise these choices before Phase 02 architecture is treated as authoritative.

## 2. Product goals

Proposed goals:
- Deliver a combat loop that can be understood quickly and tested repeatedly.
- Make movement and threat reading as important as damage output.
- Give upgrades visible tactical consequences.
- Keep the first playable scope small enough to balance.
- Establish a content and system structure that can expand without requiring a large initial roster.

Non-goals for the first MVP:
- Online multiplayer or PvP.
- Live-service events and seasonal content.
- Large-scale creature/character collection.
- Breeding, habitat construction or base-building.
- Monetization or paid progression.
- A narrative campaign with extensive cinematics.

## 3. Target player and platform

**OPEN — target audience:** not documented by the Project Owner.  
**OPEN — target platform:** not documented.  
**OPEN — input devices:** not documented.  
**OPEN — rating/content boundary:** not documented.

The design currently assumes an audience familiar with action games, but this assumption must not be treated as a market decision. Platform selection must precede final input and UI design.

## 4. Genre, camera and presentation

**PROPOSAL — genre:** top-down action roguelite / survival shooter.  
**PROPOSAL — camera:** top-down or near-top-down arena view.  
**OPEN — rendering:** 2D, 2.5D or 3D.  
**OPEN — art direction:** science-fiction visual language is proposed from the project name and working concept, but no approved art reference exists.

The player, enemies, projectiles, hazards, pickups and attack telegraphs must remain distinguishable at the intended display size.

## 5. Core player experience

The player should:
1. Understand where threats are coming from.
2. Move to maintain a safe position and create attack opportunities.
3. Choose when to use an active ability or defensive action.
4. Make upgrade choices that shape the current run.
5. Recognize how the build is performing against changing enemy patterns.
6. Learn from defeat and try a different tactical approach.

## 6. Core gameplay loop

See [gameplay-loop-and-systems.md](gameplay-loop-and-systems.md). The proposed loop is:

Preparation → Combat Zone → Movement/Attack/Evasion → Enemy Defeat → Run Resource → Upgrade Choice → Escalating Encounter → Elite/Boss → Victory/Defeat → Run Summary → Persistent Unlock → Next Run.

## 7. Player system

Proposed player attributes:
- Health and current health.
- Movement speed.
- Primary attack configuration.
- Active ability and cooldown/charge state.
- Defensive/evasion action.
- Current run upgrades and synergies.

No numerical values are fixed. The first balance pass should measure time-to-defeat, time-to-kill, movement coverage, attack range and the frequency of forced repositioning.

## 8. Weapons, abilities and upgrades

**PROPOSAL.** Keep weapon behaviours distinct rather than producing many cosmetic variants. Candidate behaviour families for later evaluation include:
- Single-target precision.
- Short-range spread.
- Piercing line/projectile.
- Area burst.
- Persistent area denial.

Candidate active ability roles:
- Emergency reposition.
- Temporary shield or damage mitigation.
- Area control.
- Burst damage.

These are design categories, not a final weapon list. A weapon or ability should have a readable purpose, a counterbalance and a meaningful interaction with at least one enemy role.

## 9. Enemy and boss design

The initial enemy roster should cover distinct combat responses:
- Chaser — reposition.
- Ranged attacker — dodge/line-of-sight management.
- Swarm — area damage or crowd control.
- Heavy — sustained damage and spacing.
- Support/controller — prioritize or disrupt.

Elite variants should add one readable modifier to an existing archetype. A boss should test multiple player skills and expose clear attack telegraphs and recovery windows. Exact enemy names, models, stats and patterns remain open.

## 10. Progression

### 10.1 In-run progression
Temporary upgrades build the player's current run. Choices should be limited, understandable and compatible with the player's existing build.

### 10.2 Between-run progression
Persistent unlocks may add starting options or content access. Permanent raw-stat upgrades are not recommended for the MVP until the difficulty model is tested.

### 10.3 Collection and synergies
The reference analysis identifies collection and synergy systems in the reference games. STARFALLGODOT should not adopt a broad collection economy by default. Any roster, companion or breeding system requires a separate scope decision.

## 11. Game modes and multiplayer

**PROPOSAL.** One solo run mode for MVP.  
**OUT OF MVP.** Online co-op, PvP, clans, matchmaking and asynchronous competition.

If multiplayer is later approved, it must be treated as an architectural requirement before implementation, not a late content addition.

## 12. User interface and accessibility

Required design behaviours:
- Health and ability state visible during combat.
- Attack telegraphs not obscured by effects.
- Upgrade descriptions explain practical effects.
- Pause and confirmation states prevent accidental run loss.
- Audio and screen-shake controls.
- Adjustable visual-effect intensity where practical.
- Keyboard/controller support only after platform decision; touch controls only if mobile is selected.

## 13. Audio and visual feedback

Proposed minimum feedback:
- Distinct player attack and enemy attack sounds.
- Hit confirmation and damage feedback.
- Clear pickup and upgrade-choice feedback.
- Separate warning cue for elite/boss attacks.
- Audio mix that preserves warning cues during high-density combat.

No soundtrack, sound assets or final art direction is approved in Phase 01.

## 14. Technical and production constraints

- Engine: Godot is implied by the repository name, but exact engine version and renderer are not recorded in the project overview.
- Phase 01 must remain documentation-only.
- Phase 02 should define scene architecture, data ownership, save model, resource lifecycle, input abstraction and performance budget after platform and presentation decisions are approved.
- No network architecture is required for the proposed solo MVP.
- Avoid designing a content system that requires hundreds of unique assets before the first playable test.

## 15. MVP definition

The proposed MVP is described in [mvp-scope.md](mvp-scope.md). It is a testable combat slice, not a full commercial release.

## 16. Acceptance criteria for the design package

The GDD is ready to guide Phase 02 only when:
- The Project Owner accepts the core concept or supplies a replacement.
- Platform, camera, player identity and input model are decided.
- The run objective and success/failure conditions are explicit.
- The core loop and system dependencies are internally consistent.
- MVP scope and exclusions are accepted.
- All remaining assumptions and unresolved decisions are listed.

## 17. Open decision register

| ID | Decision | Current state | Owner |
|---|---|---|---|
| D-01 | Genre and core combat loop | Proposal: top-down sci-fi survival roguelite | Project Owner |
| D-02 | Player identity | Open | Project Owner |
| D-03 | Target platform | Open | Project Owner |
| D-04 | 2D / 2.5D / 3D | Open | Project Owner |
| D-05 | Input and aiming model | Open | Project Owner |
| D-06 | Run objective and duration | Open | Project Owner |
| D-07 | Persistent progression | Proposal: unlocks before stat inflation | Project Owner |
| D-08 | Multiplayer roadmap | Proposal: excluded from MVP | Project Owner |
| D-09 | Art direction and content rating | Open | Project Owner |
| D-10 | Godot version and rendering target | Open | Project Owner |

## 18. Change control

Any change to genre, platform, player identity, camera, multiplayer scope or progression model must be recorded as a Project Owner decision and reflected in this GDD, gameplay systems document and MVP scope before Phase 02 architecture is approved.
