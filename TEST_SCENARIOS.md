# Functional scenarios - written, not executed

Not shipped. Every scenario below is **written**; none has been **run in a game**. `STATUS.md`
tracks that difference: do not read this file as a report of things observed. What can be proved
without a game is already covered by `Tests/Test-EffectiveDefs.ps1` and the shared diagnostics
(see `TESTING.md`); the four Pickle scenarios in `Tests/Pickle/` cover what only a loaded game says
about defs. The scenarios here need a colony, so they are manual.

**Items.** `JP_GreatHighlandBagpipes` (great highland bagpipes), `JP_UilleannPipes` (uilleann pipes),
`JP_Accordion` (accordion), all crafted at the instrument table (`TableMusicalInstruments`) of
Musical Instruments (Continued).

| Item | Research | Cost | Work | Sound |
| --- | --- | --- | --- | --- |
| great highland bagpipes | Primitive instruments (500) | 40 wood + 80 fabric or leather | 28,000 | `MIC_Ocarina_Play` |
| uilleann pipes | Primitive instruments (500) | 20 wood + 3 components + 75 metal | 45,000 | `MIC_Ocarina_Play` |
| accordion | Stringed instruments (750) | 30 wood + 5 components + 15 metal | 65,000 | `MIC_ElectronicOrgan_Play` |

Preconditions common to all scenarios: RimWorld 1.6, Harmony, Musical Instruments (Continued) and
this mod, in that order; a new colony from any scenario; developer mode on when a step says so.
Play the game in the language the step names: **the language is chosen at launch, never switched
during a test.**

## 1. Loads cleanly

- **Precondition:** clean profile, the mods above only.
- **Actions:** start the game, open Mods, reach the main menu, start a colony, open the log.
- **Expected:** no red or yellow line attributed to this mod, no "did not load any content", no
  config error on `JP_*`. Debug spawn (`Spawn thing`) lists the three items.

## 2. Research gates the recipes

- **Precondition:** colony without research, an instrument table built, materials available.
- **Actions:** open the table's bill list; complete Primitive instruments; reopen; complete
  Stringed instruments; reopen.
- **Expected:** no JP recipe before the research; both pipes appear after Primitive instruments and
  not the accordion; the accordion appears only after Stringed instruments.

## 3. Crafting

- **Precondition:** all research done, a pawn with Artistic enabled, the materials of the table above.
- **Actions:** queue one bill per instrument, let the pawn finish each.
- **Expected:** each item appears with a quality, the correct icon (no red/missing texture, mask
  applied), a name and an art tab; the stuff choice offered matches the table (fabric/leather for
  the highland pipes, metal for the other two); the cost paid matches the table. Repeat with a
  stuff outside the list: it must be refused.

## 4. Taking to inventory and playing

- **Precondition:** a finished instrument, a pawn able to play, a music spot or joy-time free.
- **Actions:** use "Take to inventory" on the instrument; let the pawn play for joy; then for work
  if the provider offers it; watch and listen.
- **Expected:** the pawn plays, the instrument is drawn in hand at a sensible offset for each of
  the three (none floating), and a sound plays **for the whole performance and stops when it
  ends**. This is the check that depends on `tickerType Normal`: a silent performance is the
  regression to look for. No exception in the log while playing or stopping.

## 5. Provider music setting

- **Precondition:** Royalty active for the "actual music" case.
- **Actions:** in Options > Mod options > Musical Instruments, toggle "Instruments play actual
  music" both ways; repeat scenario 4 with each of the three instruments.
- **Expected:** no error in either state. Record what the pipes and the accordion do: this mod
  supplies stand-in samples (`MIC_Ocarina_Play`, `MIC_ElectronicOrgan_Play`), and what the provider
  does with them under the actual-music setting is not known.

## 6. Save, reload and pre-split saves

- **Precondition:** a colony with all three items existing, one held in a pawn's inventory.
- **Actions:** save, reload, check again. Then, on a **copy** of a save made with the former Joy
  Preservation collection that held these items: enable this package **before** loading, load.
- **Expected:** items, their quality, ownership and inventory place preserved; active jobs continue;
  no missing-def error (the defNames are unchanged); no duplicate item.

## 7. Without the provider

- **Precondition:** this mod active, Musical Instruments (Continued) forced off in the mod list.
- **Actions:** start the game, read the log.
- **Expected:** the game's own missing-dependency warning; no `JP_*` def created; no error from this
  mod's patch (the guard `Defs/ThingDef[@Name="HeldMusicalInstrumentBase"]` matches nothing).

## 8. English and French

- **Precondition:** two separate launches, one per language, developer mode on.
- **Actions:** in each, read the three labels and descriptions in the spawn menu, the bill list
  and the item inspector.
- **Expected:** English: the Def values. French: `grande cornemuse des Highlands`, `cornemuse
  uilleann`, `accordéon` and the matching descriptions. In developer mode a text that is *accentuated
  letter by letter* is a key missing from the active language; a clean English sentence inside French
  is a string that never went through translation. Neither must appear.

## Not applicable, and why

- Power, flick and refuelling controls: these are carried items, not buildings.
- Settings page and MainButtons shortcut: none exists (`settings_audit: not_applicable`).
- Recreation menu and split-package ownership cases: they belonged to the extraction from Joy
  Preservation and were verified offline (`Tests/Reorganization-2026-09-13/`).
