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
| **English, sans-facultatifs** | a request, no `-DepMap`, no `-Filter` (see "Running the suite") | Core, DLCs, Harmony, RimLogging, Pickle, Musical Instruments (Continued), this mod | **yes** |
| **French, sans-facultatifs** | the same request with `-Language French` | the same, game in French | **yes**: the language is chosen at launch, never switched mid-run, so the same 22 scenarios are played a second time |
| **pre-split (two launches)** | a request with `-DepMap wsl-deps.pre-split.map -Filter 50-pre-split-write -Then 51-pre-split-read` | the same set plus the second companion `nelim.eponainstrumentsrenew.presplit` (`Tests/Pickle/PreSplit/`) | **yes**, once: it replaces MANUAL M2 (a save made with the former Joy Preservation). Launch 1 saves the three instruments in the states an old save holds (qualities, one carried, a bill at the bench) and hands the save to the companion; launch 2, a fresh process, loads it and checks them. Faithful because the old and the current definitions differ only by `tickerType Normal`, which is not saved data. Two scenarios, in the companion, so the plain suite still counts 22 |
| avec facultatifs | - | - | **not applicable.** `About.xml` declares no optional mod: `loadAfter` names Core and the hard dependency only, the patch touches nothing else, and there is no `LoadFolders.xml` or conditional branch on another mod. A second pass would stage the same set |
| per incompatibility | - | - | **none declared** (`incompatibleWith` is absent from `About.xml`, and neither README nor ATTRIBUTION claims a conflict) |

Musical Instruments (Continued) is a **hard** dependency, so it is present in every pass by construction; the
staging places it from `About.xml` and finds its Workshop id in `Tests/Pickle/wsl-ids.map`. The provider-absent case
cannot run under Pickle (the staging always places the hard dependencies): the patch guard is asserted offline by
`Test-EffectiveDefs.ps1`, and the game's own handling of a missing dependency is not this mod's.

## Running the suite

A session **files a request** and stays idle (`AUDIT.md`, "Déposer un run au lieu de le lancer"; `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` for every option).
It does not call `Run-PickleWsl.ps1`, arms no watcher or `Monitor`, and never starts the Windows RimWorld, a second
instance, or closes someone else's game. A worker plays the requests one at a time under the machine lock; TicketDispatcher
wakes the owner at `START`, `END` and `RUN_DONE`. One pass is one request; a fix or an exploration plays as few scenarios as
possible (`-Filter '::<scenario>'` or a feature file), an initial or final pass plays all 22.

```powershell
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher/scripts/Submit-PickleRun.ps1 -Mod EponaInstrumentsRenew `
  -Owner local_<session id> -Label "<what is tested> <sha>" [-Language French] [-Filter '<feature file or ::scenario>'] `
  -Extra '-pickle-scenario-timeout=300 -pickle-max-film-seconds=20' `
  -EvidenceDir EponaInstrumentsRenew/Tests/Pickle/Evidence/<run>
powershell.exe -ExecutionPolicy Bypass -File scripts/Pickle-Status.ps1     # read-only look at the machine
```

**Always pass `-Extra '-pickle-scenario-timeout=300 -pickle-max-film-seconds=20'`.** Pickle's watchdog kills the whole run when one
scenario lasts 120 real seconds (its default; `@timeout:N` does not stretch a scenario past it, and the launcher does not set it),
and the craft and listening scenarios wait for game time on a machine that can do under 25 ticks a second: the craft scenario
ended four runs out of four on 2026-09-24/25 (`exitReason: watchdog-timeout`, or the stall guard, exit 3, no report). The film
limit keeps the `@film` evidence of the craft feature small. A request carries **no SHA**: the mod is staged when it is played, from
the working tree of that instant, so leave `Mod/` and `Tests/Pickle/` untouched until `RUN_DONE` and write the commit in `-Label`.

The report is copied into `-EvidenceDir` before the lock is released (with `-Then`, one `seqN` per launch). `Tests/Pickle/Evidence/`
is on disk and ignored by git; the versioned trace is a short text summary in `docs/runs/`. Read `exitReason` in the report before
any count, check that the scenarios played equal the 22 written (or the number your filter selects), and check the report's dates
against the run's: the game logs in UTC, two hours behind the machine in summer, and the report folder is shared by the whole
machine. After a change to `Tests/Pickle/Source/`, rebuild first (`dotnet build Tests/Pickle/Source/EponaInstrumentsRenew.PickleSteps.csproj -c Release`):
the step assemblies are read when the game starts. Sound: the headless run asserts that the provider holds a live sound for the
performer (`30-play-and-listen`, played and passed 2026-09-25 for the accordion); it says nothing about what a loudspeaker renders,
which stays MANUAL M1 (`PLAY_AND_LISTEN.md`). `PickleTools/SoundCapture` records the game's audio output but is played by hand,
on the Windows install, only on Virginie's request (`AUDIT.md`).

## Shared Pickle tools

Common Pickle steps live in the separate `PickleTools` repository (`PickleTools/README.md` at the workspace root),
and the headless WSL guide in `PickleTools/Headless/README.md`. This suite stages no tool. `FilmTicks` (one picture
every N game ticks) could replace the two waits of 1,800 ticks in `20-craft-and-film`; it is not needed today.

## Evidence: what to keep

Root rule (`AGENTS.md`, "Test evidence"): keep only the reports that still prove something. Evidence is **on disk,
never in git** (`Tests/Pickle/Evidence/`, and `Results/` / `run*.txt` of the offline test folders, all in `.gitignore`);
git keeps only the scripts and one text line per run in `docs/runs/`.

**What a kept run folder holds** (start each Pickle run with `-EvidenceDir EponaInstrumentsRenew/Tests/Pickle/Evidence/<run>`
so the launcher copies the report there under the lock, then trim it):
- keep `summary.json` and `summary.md` (`exitReason`, counts, scenario names), and `junit.xml` (the failure messages);
- keep the `@review` images a person has to read, shrunk (screenshots about 1280 px wide, films about 800 px wide, mp4):
  `02-review-captures`, `05-text-screens` (one set per language), the `20-craft-and-film` films, and a failure capture;
- delete `report.html`, `messages.ndjson`, and `Player.log` unless it explains a failure (then keep the few lines that do,
  in the text line of `docs/runs/`, not the log).

**What to keep over time, per scenario:**
- the **latest** report for the revision now in the repository, in each language pass (English and French);
- an older report **only** if it is the sole proof of a check the latest run did not repeat (today: none is from the
  current revision, so the three folders of 2026-09-21 stay until the 22-scenario passes replace them; the offline
  split test of `Tests/Reorganization-2026-09-13/` is the sole proof of the 555 ownership checks);
- a report that proves nothing about the current build (superseded feature, failed attempt replaced by a passing one,
  a pass whose scenarios are contained in a later one) is **deleted as soon as its replacement is read**.

**Rules of the trade:**
- one line per run in `docs/runs/` (date, pass and language, `exitReason`, played of written, what it showed and what it
  did not), written **before** any folder is deleted;
- never delete a folder a `STATUS.md` field still points to: repoint it to `docs/runs/` first;
- a report is dated against its run before it is read (the report folder is shared by the whole machine), and
  `exitReason` is read before any count;
- what `done -> tested` needs on disk at the end: the English and the French report of the current revision (22 scenarios
  played of 22 written, `exitReason: passed`), the `@review` images of both passes, and the two manual results (M1, M2)
  written in `docs/runs/`.
