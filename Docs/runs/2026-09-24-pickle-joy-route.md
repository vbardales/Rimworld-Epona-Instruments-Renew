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

## French pass of 09:29 (ticket 51264), stopped at 14 of 22

`exitReason` was not written: the game froze at 09:37 and the launcher's stall watchdog ended it (exit 3). 13 scenarios passed (features 01, 02, 05,
10, 15) and `the accordion is made` failed: `3600 ticks pass` overran its 150 seconds, the machine doing under 24 ticks a second while the
film is recorded. The freeze came right after that failure (Player.log stops at 09:37:09, dashboard requests failing); not reproduced yet.
Kept: summary, junit, Player.log in `Tests/Pickle/Evidence/2026-09-24-french-full2/` (local, ignored).
Fix: the three craft scenarios now wait with `an unfinished instrument appears on the bench` (ends as soon as the item exists, 8,000 ticks or 300 s at most).
Queued: an audio trial (listening feature, the WSLg sink recorded by ffmpeg), then a full French and a full English pass on the new step.

## English pass of 14:09 (ticket 46100), stopped at 13 of 22

`exitReason: watchdog-timeout`, exit 2. 13 scenarios passed (features 01, 02, 05, 10, 15); the game was then ended during `the accordion is made`:
`pickle: watchdog tripped after 120s in scenario 'the accordion is made', last step: 'an unfinished instrument appears on the bench'`.
Pickle's watchdog ends the run when one step lasts about 120 real seconds, whatever `TimeoutSeconds` the step declares (the same as the
2026-09-21 `I wait for bill` case). The machine did under 25 ticks a second in that scenario. The freeze of the French pass at 09:37 (above) is the
same case. Fix: the wait step never lasts more than 90 real seconds, and each craft scenario writes it three times.
Kept: summary, junit, Player.log in `Tests/Pickle/Evidence/2026-09-24-english-full3/` (local, ignored).
The first audio trial (13:38, ticket 34712) never reached a scenario: the game did not finish starting (no log line for 5 minutes, ended by the launcher); it says nothing about sound.

## Two small tickets of 16:43 (direct launchers 12944 and 28416), neither played a scenario

- `-Filter 'making the carried instruments'` (a feature title) matched no scenario: `infrastructure-error`, exit 2. A feature is selected by its file name (`20-craft-and-film.feature`), a scenario by `'::<name>'`.
- `-Filter '::the accordion is played, and heard'` started the scenario and reached `1800 ticks pass`, where Pickle's watchdog (about 120 real seconds a step) ended the game:
  `exitReason: watchdog-timeout`, 0 scenarios written. The same limit as the craft wait: the tick wait now stops after 90 real seconds and says how many ticks passed.
  Nothing was measured on sound: the sink recorder had lost its state (WSL restarts clear `/tmp`).

## 2026-09-25, from the dispatcher's RUN_DONE messages

- **Sound trial** (request 68d4, `-Filter '::the accordion is played, and heard'`): `exitReason: passed`, 1 of 1, 112 s. The step that reads the provider's live
  sound for the performer passed twice (right after the performance starts, and after the tick wait, which took 65 s for 1,800 ticks, under the 90-second bound), so
  the headless game does start the accordion's sound. Not measured on the sink: the recorder's state in WSL `/tmp` was gone again (WSL restarts clear it). Kept: summary, junit, Player.log in `Evidence/2026-09-24-audio-trial2/`.
- **Craft check** (request 235d, `-Filter '20-craft-and-film.feature'`): exit 3, no report. The game stopped writing at 00:44:31, seconds after
  `'the accordion is made' passed 60s, so its film stops there`. Same picture as the French pass of 09:37 and the English pass of 14:16 (and the first craft film of 2026-09-21):
  four runs of four, the game freezes right after the 60-second film cap of this feature; the unfilmed listening feature never froze.
  Hypothesis under test: the film cap is the trigger. The craft feature is no longer `@film` (commit 10cf359); one scenario is requested (17c3).

## Correction, 2026-09-25 (after reading `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` and `PickleTools/Authoring/README.md`, section 4)

Two statements above are wrong and are superseded by this one:

- **The watchdog counts a scenario, not a step.** Pickle's watchdog kills the whole run when one **scenario** has lasted
  `-pickle-scenario-timeout` real seconds (120 by default; `@timeout:N` bounds one step, or a scenario's steps, and cannot stretch a scenario past it).
  The launcher does not set it, so every suite runs under 120 s unless the request passes `-Extra '-pickle-scenario-timeout=N'`. "About 120 real seconds a
  step" (14:09 and 16:43 paragraphs) should read "a scenario". The bounded steps (90 seconds, three repeats) were a workaround for a limit I had misread.
- **The film cap is not the trigger.** Every freeze fell in `the accordion is made`, which lasts longer than 120 s on this machine (under 25 ticks a second while
  loaded); the "passed 60s, so its film stops there" warning is simply what the log shows 60 s into a long scenario, 60 s before the watchdog. The one run without
  film that "did not freeze" (17c3) failed at its fourth Background step, after 17 s, and never got near 120 s: it says nothing about the film. The film is back
  (`@film`, with `-pickle-max-film-seconds=20` to keep the evidence small).

The correct request for the craft feature: `-Filter '20-craft-and-film.feature' -Extra '-pickle-scenario-timeout=300 -pickle-max-film-seconds=20'` (TESTING.md).
The 17c3 failure itself (`Accessing map pawns off main thread` in the step `a colonist "Keeper" exists`, 82 ms, 17 s into the run) is Pickle's own thread check, the
same message as the run of 2026-09-22; not explained, to be replayed once.

## 2026-09-25, request b94c (`-Filter '::the accordion is made' -Extra '-pickle-scenario-timeout=300 -pickle-max-film-seconds=20'`, tree 99be666)

`exitReason: passed`, 1 of 1 played and passed, 161 s (over the 120 s default: it would have been killed without the flag, which confirms the correction above).
The unfinished item appeared after 2,850 ticks of the wait step, was completed through the game's own flag, 300 ticks passed in 14 s, the accordion exists,
the capture was taken. `@review` capture opened: the bench ("Wooden musical instrument bench" in the hover label) with the finished red accordion on the ground just below it.
Film kept (139 KB, webm, first 20 s). Kept in `Evidence/2026-09-25-craft-check/`: summary, junit, the capture as a 1280 px JPEG, the film. The 2 GB launcher archive and four
stalled-run logs of this mod in `pickle-reports-archive` were deleted after this copy was checked. Superseded partial evidence deleted (`2026-09-24-english-full2`, `2026-09-24-french-full`).
Not shown: the pipes' crafts (same code path), sound, a French pass of this feature. Final passes requested: English f817, French f7c1.

## 2026-09-25 18:42, final English pass (request f817, all 22 scenarios, tree 99be666, `-Extra '-pickle-scenario-timeout=300 -pickle-max-film-seconds=20'`)

`exitReason: failed`, **22 played of 22 written, 20 passed, 2 failed**, 0 skipped, 0 flaky, pass `sans-facultatifs`.
Passed: features 01, 02, 05, 10, 15 (13), the three crafts (`20-craft-and-film`: 178 s to 235 s each, well over the 120 s default), three of four listening scenarios (bagpipes, accordion, checkbox unticked: the provider holds a live sound, and none with the box unticked), and `three instruments on the ground` (save and reload).
Failed, both explained and neither a defect of the mod:
- `the uilleann pipes are played, and heard`: the Background step `the save "test-colony" is loaded` timed out after 180 s, before the scenario began (machine load); the same scenario passed in earlier runs. Replay alone.
- `a bill in progress at the bench` (`40-save-reload`): `Epona Instruments Renew 3600 ticks pass` stopped at 1,800 ticks after 92 s (the 90-second bound I put on the tick wait to dodge a limit I had misread), and the unfinished item needs about 2,850 ticks: `expected at least one UnfinishedSculpture on the map; found none`. Fix to apply once the French pass is over: wait for the item with the suite's event-based step instead of a fixed 3,600 ticks, and lift the bound.
`@review` captures opened (11 images, shrunk): the three names in the hover label read right in English ("Steel accordion (normal)", "Cloth great highland bagpipes (normal)", "Steel uilleann pipes (normal)"); the three finished items lie below the bench in the craft captures; the three items side by side and next to the ocarina and frame drum are small in a wide view, the two pipes about two cells wide and overlapping when one cell apart (the visual reserve of 2026-09-21, unchanged). Nothing in the captures contradicts a green.
Kept in `Evidence/2026-09-25-final-english/`: summary, junit, 11 JPEGs and 3 films (1.6 MB). Deleted: `report.html` (58 MB), `messages.ndjson`, `Player.log`, the full-size PNGs, the 13-scenario partial English report, the two one-scenario reports (craft check, sound trial) this pass contains, and my launcher archive (verified equal to this copy).

## 2026-09-25 19:12, final French pass (request f7c1, all 22 scenarios, tree 99be666, same flags)

`exitReason: failed`, **22 played of 22 written, 21 passed, 1 failed**, 0 skipped, 0 flaky, pass `sans-facultatifs`, game in French.
The one red is `a bill in progress at the bench`, the same as in English (`ticks passed -> 2000 of 3600 in 91 s`, then `expected at least one UnfinishedSculpture ... found none`): my 90-second bound on the fixed tick wait, not the mod.
Everything else passed, including the French texts scenario (`10-texts-in-this-language`: the loaded labels and descriptions equal what the mod wrote in French), the three crafts (141 s, 182 s, 202 s), the four listening scenarios (the uilleann pipes one that timed out at load in English passed here: 146 s) and `three instruments on the ground`.
`@review` captures opened (12 images, shrunk): the hover labels read in French, with no accented fallback text (no missing key): "Accordéon en métal (normal)", "Grande cornemuse des Highlands en tissu (normal)", "Cornemuse uilleann en métal (normal)", and the bench "Banc d'instruments de musique en bois"; the three finished items lie below the bench; the visual reserve of the pipes' size is unchanged.
Kept in `Evidence/2026-09-25-final-french/`: summary, junit, 12 JPEGs, 3 films (1.8 MB). Deleted: `report.html`, `messages.ndjson`, `Player.log`, full-size PNGs, the 13-scenario French partial, my launcher archive (verified equal).

Fix committed in `0a247d0` (`40-save-reload.feature` waits for the unfinished item with the suite's step instead of 3,600 ticks). Replays requested on that tree, small tickets: `a bill in progress at the bench` in English (ff21) and in French (063c), and `the uilleann pipes are played, and heard` in English (2f06), the load timeout of the English pass.

## 2026-09-25 21:31 to 21:44, the replays and the pre-split pass (small requests, tree 0a247d0, then 66472e0)

All with `-Extra '-pickle-scenario-timeout=300'`; each `exitReason: passed`, 1 played of 1, 0 flaky.
- `a bill in progress at the bench`, English (ff21, 160 s) and French (063c, 148 s): the unfinished item appeared after 2,650 and 2,550 ticks, the scenario then saved, reloaded and found the bill and the item. Both reds of that scenario in the final passes are lifted: it was the suite's own 90-second tick bound, not the mod.
- `the uilleann pipes are played, and heard`, English (2f06, 127 s): the provider's sound was held for the performer, 1,800 of 1,800 ticks passed in 71 s; the red of the English pass (save load timed out at 180 s) was machine load.
- Pass `pre-split` (20e6, `-DepMap wsl-deps.pre-split.map -Filter 50-pre-split-write -Then 51-pre-split-read`, two launches, two separate game processes seen in the two logs): launch 1 (14 s) wrote the three instruments in the states an old save holds (Legendary and Masterwork on the ground, an Excellent one in a colonist's inventory, a bill for the accordion at the bench), saved and handed the save to the second companion; launch 2 (28 s) loaded it as a fixture, found the places, qualities, the carried pipes and the bill, then saved and reloaded. It replaces MANUAL M2. First try green; a chain written that morning and not played before. Not covered: a real old file from the maintainer's disk.
Kept: summary and junit only (the pipes replay also one 1280 px JPEG), about 0.2 MB. Deleted: reports, logs, full-size PNGs, and the launcher archives of these runs when they were mine.
Standing of `done -> tested` after this: Pickle green in both languages (22 of 22 played in each, every red replayed green), `@review` captures read, no `@wip`, no conditional scenario, M2 automatic. One item left: MANUAL M1 (hear the instruments), waiting for the PickleTools sound work.
