# 2026-09-23 - the reworked suite, first full passes (22 scenarios each)

Suite as at commit `9fcf3b9` (8 features, 22 scenarios, six own steps), passes `sans-facultatifs`, 12 mods staged,
developer mode on, through `scripts/Run-PickleWsl.ps1`. Raw reports **deleted 2026-09-24** (superseded by the passes of that day, see `2026-09-24-pickle-joy-route.md`).

| Pass | `exitReason` | Played of written | Passed | Failed |
|---|---|---|---|---|
| English | `failed` | 22 of 22 | 18 | the four listening scenarios |
| French | `failed` | 22 of 22 | 17 | the four listening scenarios and the texts scenario |

- **Passed in both languages:** the loads and the four defs checks, the costs, the three review captures, the names on
  screen, research gating (each recipe unavailable before its research, available after), the three crafts finished through the
  game's own `debugCompleted` flag (the game reports "Bill complete: Make accordion"), and both save/reload scenarios.
  No error other than the failing scenarios' own is in the log: the engine noise of 2026-09-22 did not come back.
- **The four listening scenarios (both languages):** `Jet` never takes `MusicPlayWork` and keeps hauling
  (`HaulToCell`, around (130,165), far from the spot). Cause not yet known; a diagnostic step (commit `ce692dc`) lists what
  the provider's work giver lacks and has not run yet.
- **French texts scenario:** a defect of the suite's own step, not of the mod: the French language folder is named
  "French (Français)", the step compared it to "French" and so expected English text; the failure message itself shows the
  game holding the right French label. Fixed in the step, not yet replayed.
- **What the French images showed (read):** the hover label reads "Grande cornemuse des Highlands en tissu (normal)",
  "Cornemuse uilleann en métal (normal)", "Accordéon en métal (normal)" in a French interface, with no accented-letter
  marker of a missing key.

Not shown: the sound (nothing started a performance), the texts scenario in French, the diagnostic.
