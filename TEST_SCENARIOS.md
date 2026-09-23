# Functional scenarios

Not shipped. Each scenario below says **how it is covered**: by a Pickle feature (`Tests/Pickle/Mod/Pickle/Features/`), by
an offline test, by a check only the maintainer can do (`MANUAL`), or as not applicable with its reason. What has
actually been run is in `STATUS.md`; this file is the plan and the accounting, not a report.

**Items.** `JP_GreatHighlandBagpipes` (great highland bagpipes), `JP_UilleannPipes` (uilleann pipes), `JP_Accordion`
(accordion), crafted at the instrument bench (`TableMusicalInstruments`) of Musical Instruments (Continued).

| Item | Research | Cost | Work | Sound |
| --- | --- | --- | --- | --- |
| great highland bagpipes | Primitive instruments (500) | 40 wood + 80 fabric or leather | 28,000 | `MIC_Ocarina_Play` |
| uilleann pipes | Primitive instruments (500) | 20 wood + 3 components + 75 metal | 45,000 | `MIC_Ocarina_Play` |
| accordion | Stringed instruments (750) | 30 wood + 5 components + 15 metal | 65,000 | `MIC_ElectronicOrgan_Play` |

Preconditions common to all: RimWorld 1.6, Harmony, Musical Instruments (Continued) and this mod, in that order.
The language is chosen at launch, never switched during a test: every scenario is played once per language.

## Accounting

| # | Scenario | Coverage | Status |
| --- | --- | --- | --- |
| 1 | Loads cleanly | Pickle `01-alone` (loaded, after the provider, no error, no warning from the mod, `tickerType`, costs) | see STATUS.md |
| 2 | Research gates the recipes | Pickle `15-research-gates-the-recipes` (unavailable before, available after); `20-craft-and-film` (a colonist takes the bill once the research is finished) | see STATUS.md |
| 3 | Crafting | Pickle `20-craft-and-film` (each bill started, the unfinished item completed by the game's own flag, the product exists, captured and filmed); costs in `01-alone`; stuff categories in `Test-EffectiveDefs.ps1` | see STATUS.md |
| 3b | Textures and size | Pickle `02-review-captures` (`@review`: the images are read by a person) | see STATUS.md |
| 4 | Playing, and the sound starts | Pickle `30-play-and-listen`: a live provider sustainer for the performer, per instrument | see STATUS.md |
| 4b | The sound is **heard** | `MANUAL M1` (`PLAY_AND_LISTEN.md`): a loudspeaker is not part of a headless run | to do |
| 5 | The provider's sound checkbox | Pickle `30-play-and-listen`, last scenario (unticked: no sound); ticked is scenarios 4 | see STATUS.md |
| 6 | Save and reload | Pickle `40-save-reload` (three items; a bill in progress at the bench; the save round trips with no error) | see STATUS.md |
| 6b | A save made with the former Joy Preservation collection | `MANUAL M2` | to do |
| 7 | Without the provider | **Not applicable in game**, see below; the guard is asserted offline | n/a |
| 8 | English and French | Pickle `10-texts-in-this-language` (the loaded label and description equal what the mod wrote for the language of the pass) and `05-text-screens` (names on screen, `@review`), both played in both languages | see STATUS.md |

### MANUAL M1 - hear the instruments

`PLAY_AND_LISTEN.md`. Run `30-play-and-listen.feature` on the Windows game, sound on, "Watch" pace. Expected: a
continuous tone while the colonist plays (ocarina-like for both pipes, organ-like for the accordion), and silence with
the provider's checkbox unticked. Silence with the checkbox ticked is the failure to report, with the instrument's name.

### MANUAL M2 - a real pre-split save

Only the maintainer has a save made while these items came from the former Joy Preservation collection.
- **Precondition:** a **copy** of such a save; this mod enabled and the old collection's Epona content absent (the
  reduced Joy Preservation and its split packages, per the README).
- **Actions:** enable this mod **before** loading; load the copy; look at the items (on the ground, in inventories) and
  any bill or job that used them; save; reload.
- **Expected:** the items, their quality and their place are kept; no missing-definition error (the defNames are
  unchanged: `Tests/Reorganization-2026-09-13/` proves it offline); no duplicated item; the same after the reload.

### Not applicable, and why

- **7, the provider absent, in game.** The staging (and the game's own mod list) always places the hard dependencies
  declared in `About.xml`; the case is a missing dependency, which RimWorld itself flags and which is not this mod's
  behaviour. The patch guard `Defs/ThingDef[@Name="HeldMusicalInstrumentBase"]` is asserted offline to match nothing
  without the provider (`Tests/Test-EffectiveDefs.ps1`): no def is added, no invalid def is created.
- **Description text in the info card.** The description is the def's own `description`, asserted equal in both
  languages (`10-texts-in-this-language`); the info card is vanilla's rendering of it.
- **Power, flick and refuelling controls:** these are carried items, not buildings.
- **Settings page and MainButtons shortcut:** none exists (`settings_audit: not_applicable`).
- **Recreation menu and split-package ownership:** they belonged to the extraction from Joy Preservation and were
  verified offline (`Tests/Reorganization-2026-09-13/`).
- **Optional mods and DLC:** none declared, so no conditional (`@requires`) scenario exists.
