# 2026-09-24 - full passes on the joy route (22 scenarios each)

Suite after `f2fae8d` (the listening scenarios ask the provider's music JOY giver for its job) and `e1da060`; passes
`sans-facultatifs`, 12 mods, developer mode on. Raw reports kept, trimmed to summary, junit and shrunk review images: `Tests/Pickle/Evidence/2026-09-24-french-full/` and
`.../2026-09-24-english-full2/` (local, ignored by git; the first English report of the day was deleted, superseded by the second).

| Pass | `exitReason` | Played of written | Passed | Failed |
|---|---|---|---|---|
| French (07:24, before `e1da060`) | `failed` | 22 of 22 | 20 | the accordion craft (a 1,800-tick wait exceeded the 5 s cap), the unticked-checkbox scenario |
| English (07:48, with `e1da060`) | `failed` | 22 of 22 | 21 | the unticked-checkbox scenario (stale notebook entry, below) |
| English (09:14, with `883af48`) | `failed` | 22 of 22 | 21 | the accordion craft only: `I wait 900 ticks` timed out after 5 s (155 ticks per second in the first crafting scenario of a run). **The three listening scenarios and the unticked-checkbox scenario all passed** |

- **Listening, both languages:** all three instruments are played by `Jet` (job `MusicPlayJoy`) and the provider holds a live
  sound for each: `MIC_Ocarina_Play` for both pipes, `MIC_ElectronicOrgan_Play` for the accordion. This shows the game *starts* the
  sound; it does not show that a loudspeaker renders it (M1, by ear).
- **French texts:** pass (label and description equal what the mod wrote for French).
- **Why the earlier listening runs failed (2026-09-23):** the provider's WORK route only serves venues that are themselves
  instruments; a plain music spot never gets it. Carried instruments are played through the joy route.
- **Unticked checkbox, both languages:** a live sound was found although the setting read `False` when set and at the start
  (same settings object). The step read the provider's static notebook, which is keyed by pawn and keeps entries of earlier
  scenarios: the previous scenario's accordion sound was taken for this one. The step now only counts an entry whose current
  player is this very pawn object. The 09:14 English pass, with the corrected step, passes all four listening scenarios: a live sound of the right sample for each
  instrument, silence with the checkbox unticked. The French pass with the corrected step is running.
- No error other than the failing scenarios' own is in the logs.

Not shown: any audible sound; the corrected notebook check; the unticked scenario passing.

- **Waiting:** a wait step is capped at 5 real seconds and the machine does 150 to 700 ticks a second, so long waits now use the
  suite's own `Epona Instruments Renew N ticks pass` step (150 s allowed), in the crafting, listening and save/reload features.
  Not yet replayed.
