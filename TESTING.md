# Epona Instruments Renew (unofficial) - testing

Not shipped: it lives beside `Mod/`, never inside it. This mod ships no assembly and no Defs
folder: three `ThingDef`s are added by `Mod/Patches/EponaInstruments.xml` on top of Musical
Instruments (Continued), and six textures. The Pickle suite ran once (2026-09-21, 4 of 4 in English and 4 of 4 in French, `Tests/Pickle/results/`); the manual scenarios have not been run in a game. See
`STATUS.md` for what is verified and what is not.

## Layers, cheapest first

| Layer | Where | Runs | What it proves |
| --- | --- | --- | --- |
| Shared XML diagnostics | `Tests/Audit-2026-09-21/Validate-Package.ps1 -Root .` | seconds, no game | fields, type references, DefInjected paths, XML classes, def references and parents, EN/FR inventory. `Check-ConfigErrors` reads 0 defs here (no Defs folder): its PASS is no coverage |
| Effective defs | `Tests/Test-EffectiveDefs.ps1` | seconds, no game | the three defs **as the game sees them**: the patch guard is evaluated with and without the provider, `ParentName` inheritance is replayed the way `XmlInheritance` does it (list items append), then ~30 assertions per def: parents, comps, sound, research, workbench, textures and masks, stuff and cost defs, EN/FR text |
| Pickle (Gherkin) | `Tests/Pickle/Mod/Pickle/Features/01-alone.feature` | minutes, **takes the machine** | what only a running game can say: the defs exist after the real patch pipeline, the loaded `tickerType`, a silent load |
| Manual scenarios | `TEST_SCENARIOS.md` | by hand, in a game | crafting, taking to inventory, playing, sound, saves, EN/FR rendering |

Everything provable outside the game is proved outside the game. The Pickle suite is four short
scenarios that only read defs and the log; it does not restate what the offline tests already assert.

## Why Pickle is this small

Crafting at the instrument table, taking an instrument to inventory and playing it need a colony with
a pawn, research, materials and a music spot. No test save exists and no Pickle step for these jobs has
been verified for this suite, so writing them would be guessing at step texts: an undefined step costs a
whole run. They stay manual (`TEST_SCENARIOS.md`, scenarios 3 to 6). No screenshot scenario exists for the
same reason: the instruments are never shown without a colony around them.

## How many Pickle passes: one

`AUDIT.md` asks for a pass without the optional mods and one with them, plus one per declared
incompatibility. For this mod:

| Pass | Staged | Needed |
| --- | --- | --- |
| **sans-facultatifs** | Core, DLCs, Harmony, RimLogging, Pickle, Musical Instruments (Continued), this mod | **yes, the only one** |
| avec facultatifs | - | **not applicable.** `About.xml` declares no optional mod: `loadAfter` names Core and the hard dependency only, the patch touches nothing else, and there is no `LoadFolders.xml` or conditional branch on another mod. A second pass would stage the same set |
| per incompatibility | - | **none declared** (`incompatibleWith` is absent from `About.xml`, and neither README nor ATTRIBUTION claims a conflict) |

Musical Instruments (Continued) is a **hard** dependency, so it is present in the one pass by
construction; the staging places it from `About.xml` and finds its Workshop id in
`Tests/Pickle/wsl-ids.map`. The provider-absent case cannot run under Pickle (the game refuses the
mod without it); the patch guard is asserted offline by `Test-EffectiveDefs.ps1`.

## Running the suite

From the workspace root (`Documents/rimworld`), only through the one entry point, which takes the machine lock, refuses when a game is running and
releases the lock itself. Never start the Windows RimWorld, never a second instance, never close
someone else's game:

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/Pickle-Status.ps1
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod EponaInstrumentsRenew
```

`Run-PickleWsl.ps1` looks for the suite under a mod folder named `EponaInstrumentsRenew` in the
workspace root and passes the companion's display name as the filter (`EponaInstrumentsRenew - Pickle
tests`). Read `exitReason` in the report before any count, and check the number of scenarios played
against the four written here (`01-alone.feature`).
