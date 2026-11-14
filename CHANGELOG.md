# Extreme Paintbrawl DOS changelog

## 1.01 / 1.1 / 1.91 compared with retail 1.0

The update releases share the same DOS `GAME.EXE` (CRC32 `4228EC31`).
Retail 1.0 has CRC32 `D6CC00A8`. This changelog is based on the two
executables and their matching assembly. The comparison covers executable
changes. Maps, CON scripts, catalog data, Windows launchers, and the
separate `NGAME.EXE` are outside its scope.

### Player-facing changes

- **Tagged-player handoff.** An update path draws “YOU HAVE BEEN TAGGED”,
  “SWITCHING TO PLAYER” with a player number, and “PRESS ANY KEY” before
  switching players. The sequence is conditional on an eligible replacement.
  [Handoff code](src/game_world_sprite_updates.asm#L218)
- **Match results.** Added explanations for a win or loss based on team
  tags or flag capture. A loss can report that everyone on your team was
  tagged or that the flag was captured. A win can report tagging all
  enemies or capturing the flag.
  [Results code](src/game_ui_screens.asm#L6914)
- **HUD layout.** Reordered indicator drawing, changed highlight and
  positioning logic, and adjusted the conditions for drawing HUD elements.
  [HUD drawing code](src/game_hud_layout.asm)
- **Version label.** One drawing path displays `VER 191` where retail
  displayed `LOADING...`. A separate loading message is still present.
  [Drawing code](src/game_final_player_updates.asm#L1741),
  [message strings](src/game_strings.asm#L709)
- **Message cleanup.** Removed the retail team-cash label, kill and frag
  format strings, and several informal result strings.
  [Message strings](src/game_strings.asm)

### Game logic and engine

- **World sprite processing.** Replaced a large retail tile-specific
  routine and its dispatch table with a scan of 4,096 sprite slots. The
  update checks sprite state and sector bounds, copies coordinates for
  valid entries, and calls shared handlers. The binary establishes the
  change in control flow. Its effect on AI behavior needs play testing.
  [Version-specific world handler](src/game_world_variant_handlers.asm),
  [retail dispatch table](src/game_world_dispatch_table.asm)
- **Sprite trigger handling.** The retail trigger check accepts sprite
  picture numbers `0xEA0` and `0xEA3` and invokes a sound-dispatch
  routine before returning success. The update removes that special case
  from this check. Other routines still reference those picture numbers.
  [Trigger check](src/game_sprite_trigger.asm),
  [sprite update code](src/game_sound_sprite_update.asm)
- **Sound and sprite state.** Active slot lookup uses 44-byte records in
  the update and 16-byte records in retail. The update also initializes
  three per-sprite tracking arrays and adds three entries to the sprite
  rendering dispatch table.
  [Slot lookup](src/game_sound_sprite_slots.asm),
  [state initialization](src/game_sound_sprite_update.asm),
  [rendering table](src/game_sprite_render_table.asm)
- **Engine and libraries.** Both builds link the same 308 identified OMF
  sections, including the Build Engine, audio, and input sections. The
  update adds one identified OMF code section, Watcom's `getch`. The DOS
  stub is byte-identical, and the 221-byte hardware section differs only
  in relocated operands.
  [OMF layout](tools/inputs/omf/layout.json),
  [hardware source](src/hardware.asm)

### Binary summary

| Measure | Retail 1.0 | Update | Change |
| --- | ---: | ---: | ---: |
| Executable size | 1,008,031 B | 993,855 B | −14,176 B |
| LE code object size | 653,061 B | 641,989 B | −11,072 B |
| LE data object size in memory | 2,987,936 B | 3,583,664 B | +595,728 B |
| LE relocation records | 28,620 | 28,383 | −237 |

The data object has 21 file-backed pages in both versions. Its larger
in-memory size represents additional zero-initialized space.
[Pinned executable layouts](tools/inputs/versions.json)
