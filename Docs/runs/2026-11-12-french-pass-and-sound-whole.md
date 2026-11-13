# 2026-11-10 to 2026-11-12: French pass, English `30-play-and-listen`, sound map whole

Read from each report's `summary.json`, `exitReason` first. Evidence on disk under `Tests/Pickle/Evidence/`, not in git. `Mod/` unchanged since 03c2101 (except `Preview.png`) for all three runs.

| Request | Tree | What | exitReason | Result |
|---|---|---|---|---|
| 20261110-000202-546-5dda | 03c2101 | French pass, `-Filter '!35-hear-the-instruments,!14-publication-shots'`, `french-pass-10996c0` | failed | 138 scenarios: 130 passed, 4 failed, 4 skipped, peak 3775 MiB. All 22 Epona scenarios passed. The 4 failures are Pickle built-in UI scenarios (`the main menu is clickable`, `a button is clickable at another interface scale`, `a page's bottom buttons drive the stack`, `select, gizmo, inspect, dialog, and evidence steps all work`) that click English labels in a French run: not Epona, to tell NPT. The 4 skips are built-in too. Closes 8.c for French |
| 20261112-140904-917-a711 | 8614d61 | `30-play-and-listen`, English, set `sans-facultatifs`, `english-ui-30` | passed | 4 of 4: bagpipes (159 s), uilleann pipes (154 s), accordion (151 s), checkbox unticked silent (39 s). Closes 8.i for English |
| 20261112-140902-610-ead2 | 8614d61 | `35-hear-the-instruments` whole, pass `sound`, English, `sound-35-whole` | failed | 0 of 3. ffmpeg: `Error opening input file RDPSink.monitor: No such process`, `PULSE_SERVER='(unset)'`, `XDG_RUNTIME_DIR='(unset)'`, WSLg socket missing for the game, no `sound.wav`. Environment, not the mod. Fourth red of the pass `sound` for this reason (2026-10-14, 10-15, 10-23, 11-12). Report deleted; no loop (Audit ruling 2026-11-12) |

What this does not show: a loudspeaker rendering the sound in the whole `35` feature. M1 (heard by Virginie) stands for each instrument: bagpipes 2026-10-12, uilleann pipes 2026-10-30, accordion 2026-11-03. The per-instrument greens of `30-play-and-listen` hold the live provider sound.
