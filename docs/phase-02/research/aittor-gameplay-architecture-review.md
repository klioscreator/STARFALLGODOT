# Tactical Gameplay Architecture Review

**Author:** AIT0405 (Phase Lead fallback review)  
**Attribution:** This is a fallback review written by AIT0405. It is not an AITtor-authored deliverable.  
**Inputs:** Accepted Phase 01 GDD/MVP and Phase 02 architecture baseline.  
**Scope:** Turn-based tactical gameplay contracts; no numerical rules approved.

## 1. Constraints

The game is a 3D humanoid science-fiction survival-action title with first-/third-person camera switching and tactical turn-based combat. The MVP is solo-first and must work offline. A future group mode may use a separate server project.

The 3D camera and character presentation do not determine the combat simulation. Combat rules must remain discrete, testable and independent from animation timing.

## 2. Combatant state model

A combatant should have stable identity and definition references, with runtime state held separately.

**Identity/classification:** combatant ID, definition ID, team/faction, role, player-controlled or AI-controlled designation.

**Mutable encounter state:** current/max health; approved shield/armour layers; status effects and durations; position/facing/spatial occupancy; equipped weapon and loadout references; turn resources; alive/defeated/disabled state; encounter-local flags and objective interactions.

**Immutable definition data:** base attributes, weapon/skill definitions, enemy archetype, resistance rules and presentation references.

Persistent progression (unlocks, inventory ownership, long-term upgrades) must not be stored in the encounter-local combatant object.

## 3. Turn lifecycle and initiative alternatives

The Turn Scheduler is the sole owner of current actor, round index, phase and transition order.

| Model | Description | Advantages | Risks / questions |
|---|---|---|---|
| Individual initiative | Every combatant receives a score and acts in sorted order | Flexible interleaving | Long waits; speed balance and tie-break |
| Team phases | Player team acts, then enemy team | Easy to understand and coordinate | Alpha-strike advantage; predictable response |
| Alternating activation | One eligible actor from each side alternates | Maintains tactical tempo | Unequal team sizes and skipped actors |
| Fixed authored sequence | Encounter defines order | Useful for tutorials/narrative | Less reusable; exceptions need explicit rules |

**Recommendation for prototyping:** compare team phases and alternating activation in a small encounter. Retain individual initiative as an alternative if speed/surprise mechanics become central. No formula or tie-break is approved.

Proposed transition:
1. Verify active actor's action resolution is complete.
2. Apply end-of-turn effects and duration changes.
3. Mark actor's turn complete.
4. Select next eligible actor.
5. If no eligible actor remains, resolve round-end effects.
6. Evaluate encounter terminal conditions.
7. Start next round or return encounter result to mission layer.

## 4. Action economy alternatives

The system must represent movement, weapon attack, skill, item, defence/reaction and interaction. Costs must not be embedded in UI or animation scripts.

| Model | Strength | Trade-off |
|---|---|---|
| Action points | Flexible combinations | More complex to communicate and balance |
| Major/minor actions | Readable slots per turn | Can constrain combinations |
| Primary action plus movement | Simple tactical baseline | Harder to differentiate skills/items/defence |
| Cooldowns/resource-only | Flexible action chains | May create unpredictable turns |

**Recommendation for first playable test:** compare a small explicit per-turn budget with a major-action-plus-movement model. Measure clarity, tactical choice and UI burden in the same encounter. Do not set numeric costs before testing.

Questions to resolve: move-and-attack combination; skill/weapon combinations; item action cost; defence/reaction cost; unused-action carryover; cancellation/refund rules. Default proposal is no carry-over unless a defined mechanic requires it.

## 5. Command validation and resolution

All player and enemy actions use the same pipeline:
1. Receive action request with actor ID, action ID, target/destination and encounter/turn sequence.
2. Verify encounter state and turn ownership.
3. Verify actor eligibility and action availability.
4. Validate costs, target, range, line of sight, movement path and terrain.
5. Resolve effects atomically.
6. Emit domain events and accepted/rejected result with reason.
7. Advance turn only under scheduler policy.

AI proposes actions; it does not apply damage or mutate combat state directly. Rejected commands do not consume resources or partially mutate state by default.

## 6. Enemy intent and enemy turn

Enemy AI receives a read-only tactical snapshot containing known actors, objective context, available actions and tactical geometry.

Recommended stages: choose strategic intent (attack, reposition, defend, support, interact or permitted retreat); generate candidate actions; score candidates using testable factors; submit selected action through shared validator/resolver; record reason codes for debugging.

Enemy intent visibility remains a design choice: hidden, broad category or specific telegraph. Test tactical readability and information overload. Enemy AI must not bypass action costs, range, line-of-sight or status restrictions.

## 7. Tactical movement and 3D presentation

| Model | Benefit | Cost |
|---|---|---|
| Grid | Precise distance, cover and path rules | Can constrain 3D environments |
| Navigation nodes/waypoints | Supports authored tactical positions | Authoring and pathing complexity |
| Continuous movement with discrete budget | Natural 3D movement | Harder to measure consistently |
| Hybrid reachable zones/cost | Combines natural movement with readable limits | Requires clear UI and spatial rules |

**Recommendation:** test hybrid and grid-like approaches in one encounter with cover, obstacles and verticality. Choose based on readability, touch precision, AI pathfinding and authoring cost. Do not assume the game is grid-based.

A single spatial query contract is required for reachability, movement cost, effective range, line of sight, cover and area effects.

## 8. Mission and encounter separation

Encounter and mission are separate state machines.

**Encounter states:** inactive, initializing, turn order, actor turn, round end, resolving, complete.

**Mission states (proposal):** not started, briefing, active, objective updated, extraction available, success, failure, results.

The mission layer evaluates objectives, extraction and mission-level failure. The encounter layer resolves combat. Winning a battle does not automatically complete the mission unless the objective definition says so.

OPEN questions: mandatory/optional extraction; retreat and partial rewards; failure conditions (player defeat, timer, objective loss); optional objectives; mission continuation after an encounter.

## 9. Solo baseline and future group boundary

The first complete mission slice should be playable offline with one player-controlled combatant and AI enemies. Companion AI is not assumed.

Future group mode should reuse action request/result contracts and add party membership, actor ownership, ready states, disconnect handling and server authority. Group size and turn coordination remain OPEN. Solo simulation must not require login/session services.

## 10. Prototype acceptance criteria

- Turn Scheduler alone owns actor order and turn transitions.
- Combatant runtime state is separate from immutable definitions and persistent progression.
- Player and enemy commands share validation and resolution.
- Invalid commands do not partially mutate state or consume resources.
- Movement, targeting, range and cover use one spatial contract.
- Encounter completion and mission completion are independent.
- Solo mission can start, succeed, fail and restart offline.
- End-of-turn, round-end, defeat and status-duration rules are deterministic and testable.
- Both camera modes present equivalent tactical facts.
- Desktop and touch inputs produce equivalent gameplay commands.
- Unresolved balance/mission rules are explicit decisions.

## 11. Unresolved Project Owner decisions

Initiative and tie-break; action economy and numeric costs; movement representation; cover and line-of-sight rules; enemy intent visibility; reaction/defence; item use; status timing; solo companion scope; mission objectives/extraction/retreat/failure; group size and turn coordination; active-mission saving.

## 12. Conclusion

The architecture baseline supports tactical turn-based design if Turn Scheduler, command validator/resolver, mission state machine and spatial query service remain distinct contracts. The combination of action economy and spatial movement is the highest-risk gameplay decision because it determines encounter pacing, UI complexity, enemy AI and touch interaction. Compare alternatives in a controlled prototype after Phase 02. This review does not authorize implementation or numerical rules.
