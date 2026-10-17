# Functional scenarios

Not shipped. Each scenario below say **how covered**: by Pickle feature (`Tests/Pickle/Mod/Pickle/Features/`), by
offline test, by check only maintainer can do (`MANUAL`), or not applicable with reason. What actually run is in `STATUS.md`; this file is plan and accounting, not report.

**Items.** `JP_GreatHighlandBagpipes` (great highland bagpipes), `JP_UilleannPipes` (uilleann pipes), `JP_Accordion`
(accordion), crafted at instrument bench (`TableMusicalInstruments`) of Musical Instruments (Continued).

| Item | Research | Cost | Work | Sound |
| --- | --- | --- | --- | --- |
| great highland bagpipes | Primitive instruments (500) | 40 wood + 80 fabric or leather | 28,000 | `EponaIR_GreatHighlandBagpipes_Play` (own) |
| uilleann pipes | Primitive instruments (500) | 20 wood + 3 components + 75 metal | 45,000 | `EponaIR_*_Play` (own) |
| accordion | Stringed instruments (750) | 30 wood + 5 components + 15 metal | 65,000 | `EponaIR_Accordion_Play` (own) |

Common preconditions: RimWorld 1.6, Harmony, Musical Instruments (Continued), this mod, in that order.
Language chosen at launch, never switched during test: every scenario played once per language.

## Accounting

| # | Scenario | Coverage | Status |
| --- | --- | --- | --- |
| 1 | Loads cleanly | Pickle `01-alone` (loaded, after provider, no error, no warning from mod, `tickerType`, costs) | see STATUS.md |
| 2 | Research gates the recipes | Pickle `15-research-gates-the-recipes` (unavailable before, available after); `20-craft-and-film` (colonist takes bill once research finished) | see STATUS.md |
| 3 | Crafting | Pickle `20-craft-and-film` (each bill started, unfinished item completed by game's own flag, product exists, captured and filmed); costs in `01-alone`; stuff categories in `Test-EffectiveDefs.ps1` | see STATUS.md |
| 3b | Textures and size | Pickle `02-review-captures` (`@review`: person reads images) | see STATUS.md |
| 4 | Playing, sound starts | Pickle `30-play-and-listen`: live provider sustainer for performer, per instrument | see STATUS.md |
| 4b | Sound **heard** | `MANUAL M1` (`PLAY_AND_LISTEN.md`): loudspeaker not part of headless run. Pickle `35-hear-the-instruments` (conditional, pass "sound") now films each performance with sound as supporting evidence, but not replace M1: only person listening to film says it right sound, in sync | to do |
| 5 | Provider's sound checkbox | Pickle `30-play-and-listen`, last scenario (unticked: no sound); ticked is scenarios 4 | see STATUS.md |
| 6 | Save and reload | Pickle `40-save-reload` (three items; bill in progress at bench; save round trips with no error) | see STATUS.md |
| 6b | Save made with former Joy Preservation collection | Pickle pass `pre-split` (`Tests/Pickle/PreSplit`, two launches: `50-pre-split-write` then `51-pre-split-read`); replaces `MANUAL M2` (2026-09-25, at maintainer's suggestion: old and current definitions differ only by `tickerType Normal`, not saved data) | passed 2026-09-25 (request 20e6, two launches, both green), see STATUS.md |
| 7 | Without provider | **Not applicable in game**, see below; guard asserted offline | n/a |
| 8 | English and French | Pickle `10-texts-in-this-language` (loaded label and description equal what mod wrote for language of pass) and `05-text-screens` (names on screen, `@review`), both played in both languages | see STATUS.md |

### MANUAL M1 - hear the instruments

`PLAY_AND_LISTEN.md`. Run `30-play-and-listen.feature` on Windows game, sound on, "Watch" pace. Expected: continuous tone while colonist plays (each instrument's own recording), silence with
provider's checkbox unticked. Silence with checkbox ticked is failure to report, with instrument name.

Alternative verify: pass "sound" (`TESTING.md`) plays conditional `35-hear-the-instruments.feature`,
films each performance with own sound (PickleTools' SoundCapture) into `film-sound.mp4`. Headless run
only asserts recording not silent; opening three films and listening still settles M1.

### M2 - a real pre-split save: now automatic (pass `pre-split`)

Since 2026-09-25 Pickle plays this in two launches under one lock (`TESTING.md`, pass table): first launch saves
three instruments in states old save holds (Legendary and Masterwork on ground, Excellent one carried, bill for accordion at bench) and hands save to companion; second launch, fresh process, loads it and
checks place, quality, carried item and bill, then save and reload. Not covered: real old file from
maintainer's disk. Manual procedure below stays as fallback for whoever has one and wants to load it.

Manual version, kept for reference. Only maintainer has save made while these items came from former Joy Preservation collection.
- **Precondition:** **copy** of such save; this mod enabled and old collection's Epona content absent (reduced Joy Preservation and its split packages, per README).
- **Actions:** enable this mod **before** loading; load copy; look at items (on ground, in inventories) and
  any bill or job that used them; save; reload.
- **Expected:** items, quality, place kept; no missing-definition error (defNames unchanged: `Tests/Reorganization-2026-09-13/` proves offline); no duplicated item; same after reload.

### Not applicable, and why

- **7, provider absent, in game.** Staging (and game's own mod list) always places hard dependencies
  declared in `About.xml`; case is missing dependency, which RimWorld itself flags and not this mod's
  behaviour. Patch guard `Defs/ThingDef[@Name="HeldMusicalInstrumentBase"]` asserted offline to match nothing
  without provider (`Tests/Test-EffectiveDefs.ps1`): no def added, no invalid def created.
- **Description text in info card.** Description is def's own `description`, asserted equal in both
  languages (`10-texts-in-this-language`); info card is vanilla's rendering of it.
- **Power, flick, refuelling controls:** carried items, not buildings.
- **Settings page and MainButtons shortcut:** none exists (`settings_audit: not_applicable`).
- **Recreation menu and split-package ownership:** belonged to extraction from Joy Preservation, verified offline (`Tests/Reorganization-2026-09-13/`).
- **Optional mods and DLC:** none declared. Only `@requires` scenarios need PickleTools companions, not mod or DLC the mod depends on: `35-hear-the-instruments` (SoundCapture) and `14-publication-shots` (gallery staging).