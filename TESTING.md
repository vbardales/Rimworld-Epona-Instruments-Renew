# Epona Instruments Renew (unofficial) - testing

Not shipped: it lives beside `Mod/`, never inside it. This mod ships no assembly and no Defs folder: three
`ThingDef`s are added by `Mod/Patches/EponaInstruments.xml` on top of Musical Instruments (Continued), and six
textures. See `STATUS.md` for what is verified and what is not.

## Layers, cheapest first

| Layer | Where | Runs | What it proves |
| --- | --- | --- | --- |
| Shared XML diagnostics | `Tests/Audit-2026-09-21/Validate-Package.ps1 -Root .` | seconds, no game | fields, type references, DefInjected paths, XML classes, def references and parents, EN/FR inventory. `Check-ConfigErrors` reads 0 defs here (no Defs folder): its PASS is no coverage |
| Effective defs | `Tests/Test-EffectiveDefs.ps1` | seconds, no game | the three defs **as the game sees them**: the patch guard is evaluated with and without the provider, `ParentName` inheritance is replayed the way `XmlInheritance` does it (list items append), then ~30 assertions per def |
| Pickle (Gherkin) | `Tests/Pickle/Mod/Pickle/Features/` | about ten minutes per pass, **takes the machine** | what only a running game can say: 22 scenarios, none set aside (see below) |
| By hand | `TEST_SCENARIOS.md`, `PLAY_AND_LISTEN.md` | in your own game | what a headless run cannot: hearing the sound, and loading a real pre-split save |

Everything provable outside the game is proved outside the game.

## The Pickle suite: 8 features, 22 scenarios, no `@wip`

| Feature | Scenarios | What it does |
| --- | --- | --- |
| `01-alone` | 5 | the mod loads after Musical Instruments and says nothing; the three defs exist after the real patch pipeline; the loaded `tickerType` is `Normal`, like the provider's own; `techLevel` and `category`; the costs the game holds |
| `02-review-captures` | 3 | the three items on the ground of the test colony: side by side, next to the provider's own instruments, default zoom (`@review`) |
| `05-text-screens` | 3 | each item's name in the hover label on screen (`@review`, language-agnostic: the same file gives one set of captures per language) |
| `10-texts-in-this-language` | 1 | label and description of the three items, loaded, equal what the mod wrote for the language this pass runs |
| `15-research-gates-the-recipes` | 1 | each recipe is unavailable before its research and available after (`RecipeDef.AvailableNow`, the question the bench's bill menu asks) |
| `20-craft-and-film` | 3 | research finished, bench built, a colonist starts each bill, the unfinished item is completed through the game's own flag, the product exists and is captured (`@film`, `@review`) |
| `30-play-and-listen` | 4 | a colonist performs each instrument alone on the map and the provider holds a live sound for it; with the provider's checkbox unticked, silence |
| `40-save-reload` | 2 | the three items, and a bill in progress at the bench, survive a save and a reload with no error |

Nothing is tagged `@wip` and no scenario is conditional (`@requires`): the mod declares no optional mod or DLC
dependency, so there is no scenario a missing condition could skip. A scenario that cannot be repaired is deleted
with its justification, not set aside.

The suite has one step assembly of its own, `Tests/Pickle/Source/InstrumentSteps.cs` (six steps, all starting with
the mod's name), built into `Tests/Pickle/Mod/Pickle/Assemblies/`. It is catalogued in
`PickleTools/Elsewhere/EponaInstrumentsRenew.md`.

## Passes: two, one per language

`AUDIT.md` asks for a pass without the optional mods and one with them, plus one per declared incompatibility, and a
translated interface checked in both languages. For this mod:

| Pass | Command | Staged | Needed |
| --- | --- | --- | --- |
| **English, sans-facultatifs** | `Run-PickleWsl.ps1 -Mod EponaInstrumentsRenew` | Core, DLCs, Harmony, RimLogging, Pickle, Musical Instruments (Continued), this mod | **yes** |
| **French, sans-facultatifs** | `Run-PickleWsl.ps1 -Mod EponaInstrumentsRenew -Language French` | the same, game in French | **yes**: the language is chosen at launch, never switched mid-run, so the same 22 scenarios are played a second time |
| avec facultatifs | - | - | **not applicable.** `About.xml` declares no optional mod: `loadAfter` names Core and the hard dependency only, the patch touches nothing else, and there is no `LoadFolders.xml` or conditional branch on another mod. A second pass would stage the same set |
| per incompatibility | - | - | **none declared** (`incompatibleWith` is absent from `About.xml`, and neither README nor ATTRIBUTION claims a conflict) |

Musical Instruments (Continued) is a **hard** dependency, so it is present in every pass by construction; the
staging places it from `About.xml` and finds its Workshop id in `Tests/Pickle/wsl-ids.map`. The provider-absent case
cannot run under Pickle (the staging always places the hard dependencies): the patch guard is asserted offline by
`Test-EffectiveDefs.ps1`, and the game's own handling of a missing dependency is not this mod's.

## Running the suite

From the workspace root (`Documents/rimworld`), only through the one entry point, which queues, takes the machine
lock, refuses when a game is running and releases the lock itself. Never start the Windows RimWorld, never a second
instance, never close someone else's game. Waiting for the queue is done by a watcher, not by staying in front of it
(`AUDIT.md`, "File synchrone, surveillance asynchrone").

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/Pickle-Status.ps1
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod EponaInstrumentsRenew
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod EponaInstrumentsRenew -Language French
```

Read `exitReason` in the report before any count, check that the scenarios played equal the 22 written, and check
the report's dates against the run's: the report folder is shared by the whole machine. After a change to
`Tests/Pickle/Source/`, rebuild first (`dotnet build Tests/Pickle/Source/EponaInstrumentsRenew.PickleSteps.csproj -c Release`):
the step assemblies are read when the game starts.

## Shared Pickle tools

Common Pickle steps live in the separate `PickleTools` repository (`PickleTools/README.md` at the workspace root),
and the headless WSL guide in `PickleTools/Headless/README.md`. This suite stages no tool. `FilmTicks` (one picture
every N game ticks) could replace the two waits of 1,800 ticks in `20-craft-and-film`; it is not needed today.
