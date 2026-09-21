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
| Pickle (Gherkin) | `Tests/Pickle/Mod/Pickle/Features/` | minutes, **takes the machine** | `01-alone` (7 scenarios with `02-review-captures`, by default): the defs exist after the real patch pipeline, the loaded `tickerType`, a silent load, three review captures of the items. `@wip`, aimed with `-IncludeWip -Filter`: `10-english-texts`, `11-french-texts` (the loaded strings, one language each) and `20-craft-and-film` (a colonist makes each item at the bench, filmed; best effort, never run before 2026-09-21) |
| Manual scenarios | `TEST_SCENARIOS.md` | by hand, in a game | crafting, taking to inventory, playing, sound, saves, EN/FR rendering |

Everything provable outside the game is proved outside the game. The default Pickle run is four short scenarios that only read defs and the log, plus three capture scenarios; it does not restate what the offline tests already assert.

## Why Pickle stays small

Pickle ships a `test-colony` save, so a colony is available; what Pickle cannot do is judge. Captures and a film
show a person the textures, the sizes and the crafting; they assert nothing about the image, and a green run of
them means the route ran. Playing an instrument needs a music spot, an Artistic pawn and a performance, and its
result is a **sound**, which neither a capture nor a film carries: scenarios 4 and 5 of `TEST_SCENARIOS.md` stay
manual, as do save/reload and the provider-absent start. The crafting film is written without ever having run;
it is `@wip` so that its first failure cannot turn a default run red.

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
against the seven non-`@wip` scenarios written here (`01-alone.feature` 4, `02-review-captures.feature` 3).
