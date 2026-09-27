# 2026-09-27, M1 by film: the bagpipes (request 410e)

`Submit-PickleRun.ps1 ... -DepMap wsl-deps.sound.map -Filter '35-hear-the-instruments.feature::bagpipes are filmed' -Extra '-pickle-scenario-timeout=300 -pickle-max-film-seconds=20'`, tree `d492b9c` (English, one instrument only: a first check before filming the other two).

`exitReason: passed`, **1 of 1 played, 1 passed**, 61 s, 1 attempt. The scenario spawned the great highland bagpipes, had
"Jet" start the music joy, filmed with sound for 10 real seconds, then asserted the provider's live sound
(`MIC_Ocarina_Play`) and that the recording is not silent (> -60 dB). Both held.

Kept in `Tests/Pickle/Evidence/2026-09-27-m1-bagpipes-sound/`: `summary.json`, `summary.md`, `junit.xml`, one JPEG frame,
and the film itself (`screenshots/film/pickletools-sound--highland-bagpipes/film-sound.mp4`, `sound.wav`, `film.webm`).
Deleted: `report.html`, `messages.ndjson` (Player.log kept; nothing failed to explain).

**Not shown by this green:** whether the sound is the right one and in sync with the picture, and whether it starts
late or stops early. That is still MANUAL M1 - only Virginie listening to `film-sound.mp4` settles it. Two instruments
(uilleann pipes, accordion) remain to film, on her word.
