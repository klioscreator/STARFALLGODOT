# Godot Technical Feasibility Review

**Author:** AIT0405 (Phase Lead fallback review)  
**Attribution:** This is a fallback review written by AIT0405. It is not an AIT1404-authored deliverable.  
**Scope:** Approved desktop PC and mobile target; Godot 4 family under consideration; no engine version selected.  
**Evidence checked:** Official Godot documentation, 2026-11-10.

## 1. Finding

Godot 4 is a technically plausible candidate for a 3D game targeting desktop PC and mobile. Its renderer options include Forward+, Mobile and Compatibility. The Mobile renderer is intended for mobile and desktop; Compatibility provides broader support for older hardware with fewer rendering features. This supports continued evaluation, but does not establish a final renderer, minimum device tier, performance target or exact Godot release.

The architecture should retain one gameplay/domain implementation and use platform-specific input mappings, UI layouts, quality profiles and export configurations. The same visual settings must not be assumed to perform acceptably on PC and mobile.

## 2. Engine version and compatibility

**Verified facts**
- Godot 4 offers multiple rendering methods with different feature and hardware requirements.
- Forward+ is positioned for higher-end desktop hardware.
- Mobile is designed for newer mobile devices and can also target desktop.
- Compatibility targets a wider range of older desktop/mobile hardware with a more limited feature set.
- Godot's published system requirements are baselines for simple projects. Actual requirements vary with project scope, renderer, resolution and graphics settings.

**Recommendation**
- Keep the exact Godot version OPEN until a stable release has been checked against export templates, platform support, renderer behavior and required plugins.
- Do not select an engine version solely because it is the newest release.
- Record the selected version and renderer with a reproducible test project and export matrix.

**Not established:** exact engine/patch version, scripting language, plugin dependencies and update policy.

## 3. Rendering and 3D performance

The game combines a humanoid character, first-/third-person cameras, 3D environments, tactical target readability, enemy actors and visual effects. GPU and CPU budgets are therefore important on mobile.

- Forward+: strongest feature set; intended primarily for capable desktop hardware.
- Mobile: reduced feature set and lower overhead for simpler scenes; intended for newer mobile and desktop hardware.
- Compatibility: wider hardware reach, with fewer advanced rendering features.

**Recommendation**
- Prototype the same representative encounter under Mobile and Compatibility before committing to a renderer.
- Include both camera modes, expected enemy count, representative materials, shadows, particles, transparent effects and target-selection overlays.
- Use quality tiers for shadow quality, resolution scale, post-processing, particles and visual density.
- Avoid renderer-specific effects until the baseline is confirmed.
- Treat sustained thermal behavior and frame-time consistency on phones as acceptance criteria, not just peak FPS in a short run.

A single renderer choice for all supported devices is not yet justified. Per-platform overrides or quality profiles may be considered after testing; visual equivalence must be verified.

## 4. Input and platform interaction

Godot's InputMap maps named actions to multiple input events. Its input event system includes keyboard, mouse, gamepad and touchscreen events.

**Architecture recommendation**
- Define gameplay intents such as confirm, cancel, select target, inspect, move camera, choose action and end turn.
- Map keyboard/mouse and touch controls to those intents through separate input/presentation adapters.
- Keep command requests independent of the device that produced them.
- Design touch target selection and tactical UI for fingers, safe areas and varied aspect ratios; do not simply shrink the desktop HUD.
- Controller support remains OPEN. Engine support does not itself approve the product feature.

**Validation:** complete the same mission actions using keyboard/mouse and touch; verify target selection, camera control, menus and action confirmation without hover or precision mouse gestures; test on real devices.

## 5. First-/third-person camera

The camera modes should be presentation configurations around shared player/combatant state. Switching camera must not modify action legality, actor position, turn ownership or mission state.

Risks include third-person obstruction, first-person near-plane clipping, inconsistent target readability and touch gestures conflicting with action selection.

Validation must cover narrow corridors, cover, moving actors, interaction, range/target/cover parity and mobile camera gestures. No camera implementation or final control scheme is selected in this phase.

## 6. Multiplayer and separate server project

Godot's high-level multiplayer API provides RPCs and authority modes. The documented default authority is the server, while authority can be changed per node. RPC transfer modes have different delivery and ordering guarantees. These are networking primitives, not a complete backend or proof of secure authority.

**Recommendation for the future separate server project**
- Clients submit intent/commands, not trusted outcomes such as final damage, hit validity, reward grants or turn advancement.
- The authoritative session validates actor identity, turn ownership, action availability, costs, target legality and state version before resolving a command.
- Add command IDs, encounter/turn sequence numbers and duplicate/stale request rejection.
- Keep domain rules transport-independent so local solo and future server authority can use the same contracts.
- Specify reconnect, timeout, session ownership, persistence and security before selecting hosting architecture.

Server runtime/hosting, dedicated versus listen server, transport, authentication, matchmaking, cross-play, cross-save and group size remain OPEN. No network code is in scope for Phase 02.

## 7. Save/load and content data

Godot documents ConfigFile for user configuration and file-based serialization patterns for game state. JSON is human-readable and useful for simple state, but has limited native data types and requires explicit conversion for vectors, colors and custom classes. Binary serialization supports more built-in data types but is less human-readable.

**Recommendation**
- Separate settings, persistent progression and temporary mission state.
- Persist stable identifiers and values rather than making arbitrary scene-tree serialization the long-term game contract.
- Add a save schema version and migration path before save files become user-facing.
- Keep immutable weapon/skill/enemy/mission definitions separate from mutable runtime combatant state.
- Whether active missions can be saved remains OPEN.

## 8. Risk register

| Risk | Impact | Mitigation / evidence required |
|---|---|---|
| Mobile GPU/thermal limits | Frame drops, battery drain, overheating | Representative device matrix; sustained frame-time and thermal tests |
| Renderer feature mismatch | Visual differences or unsupported effects | Compare Mobile and Compatibility; document fallback behavior |
| Touch precision | Mis-selection and poor camera control | Real-device UX tests; scalable controls and remapping |
| Camera obstruction | Loss of tactical information | Camera collision and visibility test cases |
| Engine/version changes | Export/plugin/rendering regressions | Pin version per milestone; regression export matrix |
| Client-trusted multiplayer state | Cheating or divergent sessions | Future server-authoritative validation and replay protection |
| Save schema changes | Corrupt or unreadable saves | Versioned save format and migration tests |

## 9. Feasibility test matrix

| Test area | Desktop PC | Mobile |
|---|---|---|
| Export and launch | OS targets to be selected | Android/iOS targets to be selected |
| Renderer | Forward+ candidate; compare Mobile/Compatibility | Mobile candidate; compare Compatibility |
| Input | Keyboard/mouse; controller only if approved | Touch |
| Camera | First- and third-person | Both modes with touch gestures |
| Combat load | Representative maximum encounter | Same encounter and effects |
| Performance | Frame time, memory, GPU/CPU load | Sustained frame time, memory, thermal behavior, battery impact |
| UI | Windowed/fullscreen and aspect ratios | Safe areas, notches, aspect ratios, touch hit targets |
| Persistence | Settings and progression | Settings/progression; lifecycle interruption |
| Networking | Not required for solo MVP | Not required for solo MVP |

Exact devices, target FPS, resolution, memory budgets and minimum OS versions remain OPEN.

## 10. Conclusion

The Godot 4 family is viable for continued evaluation. The strongest architectural direction is a shared domain/gameplay layer with platform-specific input and presentation profiles. Mobile and Compatibility deserve early comparative testing for the approved PC-plus-mobile target. This review does not select a Godot version, renderer, hardware floor or network hosting model.

## Official references
- Godot, List of features: https://docs.godotengine.org/en/stable/about/list_of_features.html
- Godot, Overview of renderers: https://docs.godotengine.org/en/latest/tutorials/rendering/renderers.html
- Godot, System requirements: https://docs.godotengine.org/en/stable/about/system_requirements.html
- Godot, Input examples: https://docs.godotengine.org/en/latest/tutorials/inputs/input_examples.html
- Godot, High-level multiplayer: https://docs.godotengine.org/en/4.4/tutorials/networking/high_level_multiplayer.html
- Godot, Saving games: https://docs.godotengine.org/en/latest/tutorials/io/saving_games.html
