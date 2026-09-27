# 2026-09-27, M1 by film: the bagpipes (request 410e)

`Submit-PickleRun.ps1 ... -DepMap wsl-deps.sound.map -Filter '35-hear-the-instruments.feature::bagpipes are filmed' -Extra '-pickle-scenario-timeout=300 -pickle-max-film-seconds=20'`, tree `d492b9c` (English, one instrument only: a first check before filming the other two).

`exitReason: passed`, **1 of 1 played, 1 passed**, 61 s, 1 attempt. The scenario spawned the great highland bagpipes, had
"Jet" start the music joy, filmed with sound for 10 real seconds, then asserted the provider's live sound
(`MIC_Ocarina_Play`) and that the recording is not silent (> -60 dB). Both held.

Kept in `Tests/Pickle/Evidence/2026-09-27-m1-bagpipes-sound/`: `summary.json`, `summary.md`, `junit.xml`, one JPEG frame,
and the film itself (`screenshots/film/pickletools-sound--highland-bagpipes/film-sound.mp4`, `sound.wav`, `film.webm`).
Deleted: `report.html`, `messages.ndjson` (Player.log kept; nothing failed to explain).

**Not shown by this green:** whether the sound is the right one and in sync with the picture, and whether it starts
late or stops early. That is still MANUAL M1 - only Virginie listening to `film-sound.mp4` settles it.

## M1 verdict on this recording, 2026-09-27: fail

Virginie listened: she hears an ambient game sound effect (an animal entering the room), never the bagpipes. The
automated checks (provider holds a live sustainer, recording not silent, peak -35.3 dB) both passed, and neither one
is what M1 asks: this is the exact gap `PLAY_AND_LISTEN.md` names - a non-silent recording is not "the right sound".

Not concluded yet:
- whether the instrument's own sound never sounded on this recording (a rendering, channel, or category issue,
  distinct from the master/music/ambient volume steps, which only reached -35.3 dB from something else), or
- whether it did sound and was drowned out or mixed oddly with the ambient effect, or
- whether the 10-second window (started right after the job "MusicPlayJoy" is reached) missed a ramp-up before the
  sustainer becomes audible.

The two other instruments (uilleann pipes, accordion) are not filmed yet, pending this one being understood: filming
them now would likely reproduce the same gap. Next step: investigate before requesting another sound ticket.
