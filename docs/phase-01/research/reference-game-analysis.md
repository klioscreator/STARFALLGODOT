# Phase 01.1 — Reference-game analysis

**Prepared by:** AIT0405 (coordinator fallback workstream)  
**Repository:** `klioscreator/STARFALLGODOT`  
**Observation date:** 2026-11-10  
**Platforms reviewed:** Public Android store listings and official publisher/developer web pages. This is a desk-research report, not a claim of hands-on playtesting.

## 1. Scope and evidence method

This report compares the public, verifiable product descriptions and update information for Soul Knight, Magic Survival, and City of Dragon: Epic Battle. The analysis is restricted to features stated by the developers/publishers or shown in official store metadata. It does not infer undocumented combat formulas, drop rates, enemy AI, session duration, level structure, or exact progression costs.

Evidence labels:

- **VERIFIED FACT** — stated in an official store listing, official developer/publisher website, or official update/tutorial material.
- **OBSERVATION** — a cautious description of how verified features fit together; not a claim about hidden implementation.
- **INTERPRETATION** — a design implication inferred from the verified facts.
- **DESIGN OPTION** — a possible adaptation for STARFALLGODOT; not an approved project decision.

Sources were accessed on 2026-11-10. Store metadata and live versions can vary by region and device. Where the listing did not expose a version number, that limitation is stated.

## 2. Product identity and source register

### 2.1 Soul Knight

**VERIFIED FACT.** The Google Play listing identifies the game as *Soul Knight*, developer ChillyRoom, Android distribution, and describes it as a top-down shooter with RPG and roguelike elements. It lists more than 20 heroes, more than 400 weapons, procedurally varied pixel dungeons, NPC encounters, auto-aim, and multiple modes. The listing page reported an update on 2026-10-16; the official Soul Knight site displayed version 8.7.0 on the observation date.

**VERIFIED FACT.** ChillyRoom's official online multiplayer tutorial states that online co-op supports up to four players. It documents room creation/joining, difficulty selection, Level Mode, Matrix of the Lord of Evil, Boss Rush and Pure Multiplayer Mode, plus challenge conditions.

**Sources**
- Google Play, *Soul Knight*: https://play.google.com/store/apps/details?id=com.ChillyRoom.DungeonShooter
- Official Soul Knight website, version notice: https://soulknight.chillyroom.com/et
- ChillyRoom, *Online Multiplayer Tutorial* (2024-01-18): https://soulknight.chillyroom.com/et/article/base/7
- ChillyRoom developer website: https://www.chillyroom.com/en

### 2.2 Magic Survival

**VERIFIED FACT.** The Google Play listing identifies *Magic Survival* by developer name “leme” and identifies the developer in the listing as 김성근. The listing describes a single-player, offline, one-hand-control hack-and-slash game in which the player uses different kinds of magic to eliminate infected spirits. It lists Android and Windows availability. The listing showed the v0.994 update dated 2026-09-26 on the observation date.

**VERIFIED FACT.** The v0.994 update note says magic performance was improved. The preceding v0.993 note lists new Ultimate Magics, artifacts and monsters; changes to enemy distribution; improvements to artifacts and synergies; increased appearance frequency of already learned magic among choices; and quality-of-life improvements.

**EVIDENCE LIMITATION.** The public store listing does not provide a complete current description of the in-run level-up algorithm, exact stage timing, enemy roster, boss schedule, resource economy, or persistent progression costs. This report does not invent those details. A deeper mechanics audit would require controlled gameplay observation and version-specific capture.

**Sources**
- Google Play, *Magic Survival*: https://play.google.com/store/apps/details?id=com.vkslrzm.Zombie
- Developer website linked from Google Play: https://vkslrzm.blogspot.com/

### 2.3 City of Dragon: Epic Battle

**VERIFIED FACT.** The Google Play listing identifies *City of Dragon: Epic Battle*, developer Moonlight Game Studio .,JSC, package `com.moonlight.dragoncity`, Android distribution, and a last update date of 2026-09-18. It describes collecting and hatching more than 200 dragons, evolving and breeding them, assembling teams around elemental properties, constructing habitats on floating islands, managing resources, and fighting wild monsters or other players.

**VERIFIED FACT.** The official Vietnamese website uses the same game title and describes dragon collection/eggs, incubation, breeding/evolution, elemental team strategy, floating-island habitats and resource management. It identifies Moonlight Game Studio as the rights holder.

**IDENTITY CAUTION.** An Apple App Store listing with a near-identical English title and similar game description identifies a different developer name (“Thinh Nguyen Dyc”). The available public evidence does not establish whether this is the same publisher-controlled build, a separately distributed listing, or a metadata inconsistency. This report therefore treats the Google Play package and the official Vietnamese website as the verified reference identity. iOS publisher identity should not be assumed from the Apple listing without confirmation from the publisher.

**Sources**
- Google Play, *City of Dragon: Epic Battle*: https://play.google.com/store/apps/details?id=com.moonlight.dragoncity
- Official Vietnamese website: https://daorongdotbien.vn/
- Apple App Store listing with differing developer metadata (identity discrepancy only): https://apps.apple.com/vn/app/city-of-dragons-epic-battle/id6758932017

## 3. Individual game profiles

### 3.1 Soul Knight

**VERIFIED FACT — combat and player control.** The official store description identifies a top-down action shooter, simple controls, auto-aim, dodging, firing and active skills. It describes heroes with distinct skills and a large weapon catalogue. The store listing also advertises controller support.

**VERIFIED FACT — run and encounter structure.** The listing describes randomly generated pixel dungeons, multiple monster environments, treasure and NPC encounters. The official multiplayer guide confirms several named modes and selectable difficulty/challenge conditions. The public evidence supports replay variation through dungeon variation, modes, difficulty and challenge conditions; it does not establish every internal room-generation rule.

**VERIFIED FACT — multiplayer.** Online co-op supports up to four players; rooms can be public or private, and the host selects mode, difficulty and challenge conditions. The official guide also documents LAN multiplayer.

**OBSERVATION.** The product combines a legible immediate combat loop (move, aim/fire, dodge, use skill) with high choice density through heroes, weapons, environments and modes. The breadth of content is a major production commitment; it should not be treated as an MVP baseline.

**INTERPRETATION.** The most transferable design lesson is not the raw number of weapons. It is the separation of combat readability from build variety: basic movement and attack remain easy to understand while character and equipment choices create run-to-run differences.

**DESIGN OPTION.** If STARFALLGODOT is confirmed as a top-down action shooter, consider a small number of strongly differentiated player archetypes and a limited weapon set whose attack patterns are visually distinct. Auto-aim may be evaluated as an accessibility/control option, not assumed as a mandatory system.

### 3.2 Magic Survival

**VERIFIED FACT — combat premise.** The developer's store description presents a single-player, one-hand-control action game in which the player uses multiple kinds of magic against incoming infected spirits. It identifies the game as offline-capable.

**VERIFIED FACT — build choices.** The official update notes identify magic, Ultimate Magic, artifacts, synergies and monsters as active content categories. They also record changes to enemy distribution and to the frequency with which already learned magic appears as a choice.

**OBSERVATION.** The update history indicates that build construction is an ongoing balance problem: the developer adjusts the relative availability and performance of magic, artifacts and synergies, not only adding new content.

**INTERPRETATION.** A survival game with automatic or low-input attack resolution can still create meaningful decisions through movement, spatial positioning and level-up choices. However, the precise attack automation and selection flow should be verified in a controlled play session before being adopted as a model.

**DESIGN OPTION.** Use a compact upgrade-choice system in which each level-up presents a small set of understandable alternatives. Repeatedly offering already owned abilities can support build specialization, but the choice pool needs safeguards against repetitive or non-viable outcomes.

### 3.3 City of Dragon: Epic Battle

**VERIFIED FACT — collection and long-term progression.** The official Google Play description states that players collect and hatch dragon eggs, evolve dragons into stronger forms, breed combinations, assemble elemental teams, construct habitats on floating islands and manage resources.

**VERIFIED FACT — combat and strategic layer.** The listing describes team battles built around elemental strengths/weaknesses and says the game includes battles against wild monsters and other players. It does not expose sufficient detail to establish the exact battle turn structure, manual control model, skill cooldowns or PvP matchmaking rules.

**OBSERVATION.** The game links a collection/management layer to a team-combat layer. The player's long-term roster and resource decisions influence the team brought into encounters.

**INTERPRETATION.** Collection progression can create goals between battles, but it introduces content and balance costs: every creature needs readable identity, stats, roles, acquisition rules and a place in the roster economy.

**DESIGN OPTION.** If STARFALLGODOT includes persistent character/ship collection, keep the roster small in the first playable scope and make each unlock change the player's tactical options. Do not import breeding, habitat construction or large-scale collection unless those systems are central to the approved concept.

## 4. Comparative matrix

| Dimension | Soul Knight | Magic Survival | City of Dragon: Epic Battle |
|---|---|---|---|
| Publicly stated genre/premise | Top-down shooter with RPG/roguelike elements | One-hand hack-and-slash magic survival | Dragon collection, team strategy and battles |
| Primary player input evidenced | Move, dodge, fire, activate skills; auto-aim | One-hand control; magic combat | Assemble and develop dragon teams; exact battle input not established |
| Combat expression | Hero skills + large weapon variety | Multiple magic types, Ultimate Magic | Elemental team composition and dragon abilities |
| Build/run choices | Hero, weapons, mode, difficulty and challenge conditions | Magic, artifacts, synergies and upgrade-choice frequency | Team roster, dragon evolution and elemental matchups |
| Procedural/replay variation | Randomized dungeon environments described by store | Enemy distribution and magic/artifact systems evolve through updates; exact procedural rules not documented | Campaign, events and PvP are not fully documented by primary evidence reviewed |
| Enemy/boss evidence | Monster encounters; named Boss Rush mode | Monsters and enemy distribution changes | Wild-monster battles; named boss structure not verified |
| Persistent progression evidence | Hero unlocks and broad mode/content catalogue; detailed economy not covered here | Learned magic, artifacts and Ultimate Magic; persistent account progression not fully covered | Dragon collection, hatching, evolution, breeding, habitats and resource management |
| Multiplayer | Online co-op up to 4; LAN co-op | Single-player/offline listing | Battles against other players stated; exact mode details unverified |
| Monetization evidence | In-game purchases; current store page does not describe full economy | Ads and in-app purchases | Ads and in-app purchases |
| Main design value for comparison | Readable action plus high weapon/hero variety | Upgrade-choice depth within a focused survival loop | Persistent roster/collection tied to team combat |
| Main production risk if copied | Content volume, weapon balance, enemy readability, multiplayer complexity | Synergy/choice balance and visual-effect readability | Creature roster scale, breeding/evolution economy and persistent content burden |

## 5. Cross-game patterns and trade-offs

1. **A clear combat verb set matters.** Soul Knight explicitly presents movement, dodging, firing and skill activation. Magic Survival presents one-hand control and magic-based combat. These descriptions support a narrow, teachable control vocabulary. They do not prove that the same control scheme is right for STARFALLGODOT.

2. **Build variety should be layered on top of stable controls.** Soul Knight varies heroes and weapons; Magic Survival varies magic, artifacts and synergies; City of Dragon varies the team roster and elemental matchups. Each uses a different layer for strategic differentiation.

3. **Progression needs a bounded economy.** Magic Survival's update notes show repeated adjustment of artifacts, synergies and choice frequency. City of Dragon's collection/evolution model implies a persistent resource and roster economy. These systems need balancing and content authoring; their apparent breadth is not free.

4. **Replay variation has several sources.** Soul Knight publicly describes randomized dungeons and selectable modes/challenges. Magic Survival's update notes show changes to enemy distribution and upgrade pools. City of Dragon emphasizes roster development and team composition. These are distinct approaches and should not be conflated.

5. **Multiplayer multiplies scope.** Soul Knight's official tutorial demonstrates that online co-op requires room management, matchmaking/privacy options, host behavior and mode-specific rules. City of Dragon's store listing mentions player battles but does not provide enough detail to infer its network architecture. Multiplayer should not be included in an early MVP without an explicit project decision and architecture budget.

## 6. Implications for STARFALLGODOT

The repository's project overview currently identifies only a seven-phase development process; it does not define the game's genre, camera, player fantasy, platform, control scheme, art direction, session duration, or approved core mechanic. Therefore, no reference-game feature can yet be declared a direct fit.

The following are **DESIGN OPTIONS**, not accepted requirements:

- Select one primary combat loop before adding a large roster or meta-game.
- Keep the first playable content set small enough to balance and test.
- Separate moment-to-moment combat upgrades from persistent unlocks.
- Make each upgrade choice change a visible or measurable combat outcome.
- Treat online multiplayer, breeding/collection economies and large content catalogues as explicit scope decisions, not default features.
- Use a small set of enemy archetypes whose movement and attack telegraphs can be distinguished at a glance.

## 7. Research gaps and limitations

- No controlled playthroughs, gameplay recordings or build captures were supplied for this audit.
- Soul Knight's public listing exposes broad feature categories but not the full current progression economy or enemy/boss data.
- Magic Survival's official store page exposes current update notes but not a complete current mechanics manual. Exact run timing, level-up rules, stage structure and persistent progression require direct observation.
- City of Dragon's Google Play listing provides broad collection and battle features but not detailed combat rules. The Apple listing has a developer metadata discrepancy and is not treated as verified evidence of the same publisher build.
- No exact balance values, drop rates, damage formulas, stage durations or monetization prices are asserted.

## 8. Sources

1. ChillyRoom, *Soul Knight* — Google Play listing: https://play.google.com/store/apps/details?id=com.ChillyRoom.DungeonShooter
2. ChillyRoom, *Soul Knight* official website and version notice: https://soulknight.chillyroom.com/et
3. ChillyRoom, *Online Multiplayer Tutorial*, 2024-01-18: https://soulknight.chillyroom.com/et/article/base/7
4. ChillyRoom corporate website: https://www.chillyroom.com/en
5. leme / 김성근, *Magic Survival* — Google Play listing: https://play.google.com/store/apps/details?id=com.vkslrzm.Zombie
6. Magic Survival developer website linked from the store listing: https://vkslrzm.blogspot.com/
7. Moonlight Game Studio .,JSC, *City of Dragon: Epic Battle* — Google Play listing: https://play.google.com/store/apps/details?id=com.moonlight.dragoncity
8. Moonlight Game Studio, official Vietnamese website: https://daorongdotbien.vn/
9. Apple App Store, *City of Dragons: Epic Battle* listing, used only to record the unresolved developer metadata discrepancy: https://apps.apple.com/vn/app/city-of-dragons-epic-battle/id6758932017
