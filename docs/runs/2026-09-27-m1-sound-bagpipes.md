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

**Likely cause, found 2026-09-27 (with PickleTools):** `MIC_Ocarina_Play` (Musical Instruments Continued,
`1.6/Defs/MusicDefs/MusicDef.xml`) is a positional `SoundDef` (`distRange 5~25`, no `onCamera`, so `false`) - every
instrument sound of the provider is defined the same way. PickleTools' own reading of the decompiled sound classes
says a positional sound's real-time volume depends on Unity's `AudioListener` position, normally on `Camera.main`; a
headless dev-teleport should move that camera, but there is no runtime evidence yet that it does under WSLg. This
points at SoundCapture/the headless camera, not at this mod: the ambient sound heard instead is presumably a
non-positional or on-camera sound that does not depend on listener placement. Awaiting PickleTools' conclusion before
filming the other two instruments.

**PickleTools' follow-up, 2026-09-27:** the simple "listener too far" read does not hold either - the Background
camera sits on the exact cell (distance under 1 of the 5-25 range, should be loud if the listener tracks it), and
`CameraDriver.JumpToCurrentMapLoc` does move the real Unity camera transform every frame. So this is not a
mispositioned listener; it points at something in the WSLg audio path specific to positional/3D sound (every sound
recorded cleanly before, including 2026-09-25's accordion sustainer check, was 2D/on-camera or a game-state check,
never an actually-positional sound heard through the recording). PickleTools documented this as an unconfirmed lead
in `SoundCapture/README.md` (their repo, committed locally) rather than resolving it further on their own initiative,
and left the next step to Epona/Virginie: spend a ticket on the two remaining instruments (likely the same gap), or
treat "SoundCapture cannot yet be trusted for positional/3D game sound" as the working conclusion and fall back to
the original MANUAL M1 (the real Windows game, `PLAY_AND_LISTEN.md`).

## 2026-09-28, request e2ce: uilleann pipes and accordion (tree 9bfad92, packageId nelim.eponainstruments)

`exitReason: passed`, 2 of 2 played and passed (60 s and 52 s). Both films kept in
`Tests/Pickle/Evidence/2026-09-28-m1-pipes-accordion-sound/` (`film-sound.mp4`, `sound.wav`, `film.webm`, one frame).
Same limit as the bagpipes: "not silent" and "heard playing" pass, and neither says the instrument is audible.
Virginie's listening verdict: pending.

## 2026-09-28, request ad03: refilmed 30 s after the sound is live (tree 76a12a3)

`exitReason: passed`, 1 of 1, 110 s. Feature fixed to wait for the live sustainer before filming (the earlier 10 s
window started while Jet was still walking to the instrument). Kept in
`Tests/Pickle/Evidence/2026-09-28-m1-bagpipes-30s/`. Virginie's listening verdict: pending.

## M1 verdict, bagpipes, 2026-09-28 (refilmed 30 s after sound live): PASS

Virginie heard a continuous tone (described as piano/small keyed plastic flute), in sync with the picture, not the
ambient noise of the earlier attempt. This matches the documented substitute sound (ATTRIBUTION.md: no real bagpipe
sample exists, MIC_Ocarina_Play used instead) and PLAY_AND_LISTEN.md's own expectation ("ocarina-like tone"). MANUAL
M1 is settled for the bagpipes: continuous, right sound (the mod's stand-in), in sync.

## 2026-09-29, request 66e7: uilleann pipes and accordion, both failed (infrastructure, not the mod)

`Submit-PickleRun.ps1 ... -Filter '35-hear-the-instruments.feature::uilleann pipes are filmed,::accordion is filmed'
-Extra '-pickle-scenario-timeout=300 -pickle-max-film-seconds=60'`, tree `76a12a3` (same fix as the bagpipes' 30 s
refilm). `exitReason` 0/2 passed, both failed:

- Uilleann pipes: "not silent" failed on its own terms this time - peak -91.0 dB. PickleTools' own assertion message
  names the cause: the WSLg PulseAudio RDP sink stalled mid-recording ("q overrun" in pulseaudio.log), so the file
  holds 4.3 s of real sound out of 41.6 s recorded - not a short/late instrument, a capture gap.
- Accordion: no sound file was produced at all - `ffmpeg` failed to open `RDPSink.monitor` ("Exec format error"),
  i.e. the capture never started.

Both are the WSLg audio path failing under load (two films run back to back, same session as the bagpipes'
successful one two days earlier), not a mod-side problem: nothing in `Tests/Pickle/Source/InstrumentSteps.cs` or the
feature file changed between the passing bagpipes run and this one. No listening verdict possible on this recording
either instrument. Evidence kept in `Tests/Pickle/Evidence/2026-09-29-m1-pipes-accordion-30s/` (junit.xml has the
detailed PickleTools messages; the two `sound.wav`/attempted film folders are the incomplete captures - not sent for
listening, since they don't hold enough of the sound to judge). Next step: re-run, or ask PickleTools whether the RDP
sink needs a delay/retry between back-to-back films - not yet requested, since a straight retry may just work.

2026-10-02 trim: `Tests/Pickle/Evidence/2026-09-27-m1-bagpipes-sound/` deleted (same scenario, superseded by `2026-09-28-m1-bagpipes-30s`); film frames and the 30 s `sound.wav` also deleted, the films kept.
