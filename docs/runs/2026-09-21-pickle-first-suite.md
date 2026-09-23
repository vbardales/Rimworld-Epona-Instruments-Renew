# 2026-09-21 - the first Pickle suite, English and French

Every row is a pass `sans-facultatifs` (Core, DLCs, Harmony, RimLogging, Pickle, Musical Instruments (Continued), the
mod and its companion; 12 mods staged; developer mode on), run through `scripts/Run-PickleWsl.ps1` under the machine
lock. Raw reports: `Tests/Pickle/Evidence/<folder>/` (local only, ignored by git).

| Folder | Language | `exitReason` | Played of written | Scenarios |
|---|---|---|---|---|
| `2026-09-21-sans-facultatifs` | English | `passed` | 4 of 4, 4 passed | loads after the provider and says nothing; the three defs exist; `tickerType Normal`; `techLevel` and `category` |
| `2026-09-21-sans-facultatifs-french` | French | `passed` | 4 of 4, 4 passed | the same four |
| `2026-09-21-captures-english` | English | `passed` | 10 of 10, 10 passed | the four above; three review captures; three loaded English texts (features `01`, `02`, `10`) |
| `2026-09-21-texts-french` | French | `passed` | 3 of 3, 3 passed | the loaded French label and description of each item |
| `2026-09-21-craft-film-stalled` | English | `watchdog-timeout` | 0 written | first crafting film: `I wait for bill` allows 120 real seconds, the 65,000-work accordion did not fit; the run was killed and wrote no scenario |
| `2026-09-21-craft-film-wait-timeout` | English | `failed` | 3 of 3, 0 passed | `I wait 3500 ticks` timed out after 5 s (about 2,000 ticks fit in a wait step here) |
| `2026-09-21-craft-film` | English | `passed` | 3 of 3, 3 passed | a colonist starts each bill at the bench; the unfinished item exists; one mp4 per instrument |

## What the images showed (read 2026-09-21, opened, not committed)

- The accordion (red bellows, keys) and the two pipes (tartan bag with drones; bag with chanter) read clearly and their
  masks apply. **The pipes are drawn about two cells wide and overlap when one cell apart**, while the provider's ocarina is
  small and its frame drum about one cell: a visual reserve, nothing was changed.
- `I spawn` works for stuff-made items: the hover label read "Steel uilleann pipes (normal)".
- The crafting film shows the bench built, the recipe on offer once the research is finished, a colonist taking the bill
  and an "Unfinished steel accordion" (and its siblings) on the bench. It does not show a finished item, and no sound.

## Not shown

These runs read defs and the log, took captures and filmed work in progress. They say nothing about the sound, the
performances, save/reload, research gating as a negative case or the costs: those features were written afterwards and
have not run yet (see `STATUS.md`).
