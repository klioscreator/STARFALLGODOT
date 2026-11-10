# STARFALLGODOT — Game concept and direction

**Document status:** Project Owner direction accepted; detailed systems remain subject to design validation  
**Version:** 0.2  
**Phase:** 01 — Research and Design  
**Updated:** 2026-11-10

## 1. Approved direction

The Project Owner has specified the following product direction:

- **Genre:** science-fiction survival action.
- **Combat model:** tactical turn-based combat.
- **Presentation:** 3D, non-top-down.
- **Camera:** first-person and third-person perspectives, with switching between them.
- **Player character:** humanoid combatant.
- **Play modes:** solo play and tactical group play.
- **Character/build progression:** weapons, skills and upgrades shape the player's combat build.
- **Online expansion:** a separate supplementary server project is planned to enable hosted/group play. The core game and server project are separate workstreams.

These decisions supersede the previous top-down survival-shooter proposal. Top-down camera, continuous real-time shooting and a solo-only product are no longer the target direction.

The target platform, group size, server technology, exact turn-order rules, mission structure and numerical balance remain open for later design.

## 2. Product concept

STARFALLGODOT is a 3D science-fiction survival-action game in which a humanoid player character enters hostile environments, survives encounters and develops a specialised combat build from weapons, skills and upgrades. Encounters are resolved through tactical turn-based combat. Players must assess threats, select actions and coordinate their resources rather than relying on continuous real-time firing.

The game is designed to support a solo experience. Tactical group play is also part of the intended product direction and is expected to be enabled through a separate server-side expansion project. The solo game must remain a coherent experience and must not require a live server merely to start or complete its core mode.

## 3. Player experience

The player should:
1. Explore or navigate a hostile science-fiction environment from a first-person or third-person perspective.
2. Read the situation before committing to a combat action.
3. Choose tactical actions during their turn, using available movement, weapons, skills and resources.
4. Survive encounters through positioning, threat prioritisation, defensive choices and team coordination where applicable.
5. Earn weapons, skills and upgrades that shape a distinct build.
6. Adapt that build to stronger threats and later encounters.
7. Complete objectives, extract or be defeated according to the selected mission rules.
8. Review the outcome and continue progression.

Exploration pacing and whether encounters are initiated seamlessly or through explicit combat transitions remain to be specified.

## 4. Design pillars

1. **Tactical decision-making.** Each combat turn should create meaningful choices involving threat, positioning, action economy and resource use.
2. **Readable 3D presentation.** First-person and third-person views must communicate the same tactical state without hiding important threats or interaction cues.
3. **Survival through preparation and adaptation.** Equipment, skills, consumables and build choices should affect the player's ability to handle later encounters.
4. **Distinct builds.** Weapons and skills should provide different tactical functions rather than only cosmetic variation or unnoticeable stat increases.
5. **Solo and coordinated group play.** Core combat rules should support a solo player and provide a foundation for coordinated group encounters.
6. **Separated online infrastructure.** Server hosting and online session services belong to a separately scoped supplementary project, with a defined interface to the core game.

## 5. Camera and player representation

The approved presentation direction is 3D with first-person and third-person camera options. Camera switching is a player-facing feature, not a change to the underlying combat rules.

The player character is humanoid. Character animation, weapon handling, hitboxes, interaction distance and camera collision must be designed consistently across both perspectives. The exact camera offset, field of view, switching input and whether both perspectives are available in every activity remain design details.

## 6. Combat direction

Combat is turn-based and tactical. The game must not be designed as a conventional continuous-fire top-down survival shooter.

The detailed turn model is still open. It must define:
- What constitutes a turn and a round.
- Whether player and enemy actions resolve sequentially or in phases.
- How movement, weapon use, skills, defence and item use consume actions.
- How initiative, enemy intent and status effects are resolved.
- How group members coordinate and how disconnected/defeated players are handled in group sessions.

These rules must be consistent in solo and group modes. Any difference between modes must be explicit and testable.

## 7. Build and progression direction

Weapons and skills are the primary stated build components. The design should allow players to specialise in different tactical roles, such as damage, control, defence, support or mobility, without fixing the final role list prematurely.

Progression should distinguish:
- **Encounter/run progression:** temporary choices and resources used during the current mission or expedition.
- **Persistent progression:** equipment, skills or unlocks retained between missions.

The exact inventory, rarity, crafting, upgrade currency and unlock economy remain open. Avoid introducing multiple currencies or randomised paid rewards without a clear design requirement.

## 8. Game modes and server expansion

### Core game
- Solo mode is a required mode.
- Tactical group play is part of the intended game direction.
- The game rules should not assume that a server is required for local solo play.

### Supplementary server project
A separate project is planned to provide server hosting/session infrastructure for group play. It is not part of the core game's first implementation scope by default.

Before implementation, the server project must define:
- Session creation, joining, leaving and reconnecting.
- Authority over turn order, action validation and encounter state.
- Player identity and save/progression ownership.
- Synchronisation and handling of latency or interrupted connections.
- Security boundaries and prevention of invalid client-submitted actions.
- Version compatibility between game client and server.

The number of players per group, hosting model and deployment environment remain open.

## 9. Reference-game transfer

- **Soul Knight:** use only as a reference for readable weapon identities, enemy patterns, encounter rewards and build variety. Its top-down camera and real-time action model are not the target camera/combat model for STARFALLGODOT.
- **Magic Survival:** use as a reference for survival pressure, upgrade choices and skill interactions. Its continuous real-time survival combat is not to be copied as the turn system.
- **City of Dragon: Epic Battle:** use selectively as a reference for persistent progression and collection identity. Creature breeding and habitat systems are not approved features.

## 10. Initial scope boundaries

The first playable scope should validate the 3D humanoid character, camera switching, one complete tactical turn cycle, a small enemy roster, a compact weapon/skill build pool and a complete solo mission loop.

The following are not assumed to be part of the first MVP:
- Public matchmaking, dedicated server fleet or large-scale persistent worlds.
- Clans, ranked PvP, global leaderboards or live-service events.
- Large weapon/skill catalogues or extensive procedural campaigns.
- Monetisation, paid currency, loot boxes or gacha.
- Large-scale crafting/economy systems.
- A full narrative cinematic campaign.

## 11. Open design decisions

| Decision | State |
|---|---|
| Target platform(s) and minimum hardware | OPEN |
| Group size and party composition | OPEN |
| Exact turn/round and action-point model | OPEN |
| Initiative and enemy-intent presentation | OPEN |
| Exploration-to-combat transition | OPEN |
| Mission objective and expected session duration | OPEN |
| Inventory, equipment slots and consumables | OPEN |
| Persistent progression and save ownership | OPEN |
| Server hosting/deployment model | OPEN — separate project |
| Art direction, rating and accessibility requirements | OPEN |

## 12. Acceptance condition

The Project Owner's direction is accepted as the Phase 01 product baseline. The GDD and MVP must now be internally aligned with this direction. Detailed turn rules, group size, platform and server deployment remain explicit design decisions for the next design/architecture gate; they must not be silently invented or treated as approved.
