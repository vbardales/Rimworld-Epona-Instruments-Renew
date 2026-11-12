# 2026-10-13 and 2026-10-14: own sounds in English, texts in French, the pass "sound"

Read from each report's `summary.json`, `exitReason` first. Evidence on disk under `Tests/Pickle/Evidence/`, not in git.

| Request | Tree | What | exitReason | Result |
|---|---|---|---|---|
| 20261013-112025-595-c4cb | 00c8d6b | `30-play-and-listen`, English, `2026-10-13-own-sounds-en` | passed | 4 of 4: bagpipes (166 s), uilleann pipes (161 s), accordion (152 s), checkbox unticked silent (35 s). `Player.log`: no error from the mod; the ALSA and FMOD lines are the headless output device |
| 20261013-223834-648-6cbf | 828ab1e | `10-texts-in-this-language`, French, set `sans-facultatifs`, `2026-10-13-texts-fr` | passed | 1 of 1 (53 ms): the label and description of the three items read as written. One scenario, not a French full pass |
| 20261013-223835-290-26ba | 828ab1e | `35-hear-the-instruments`, pass `sound`, `2026-10-13-sound-film` | failed | 0 of 3. ffmpeg: `Error opening input file RDPSink.monitor: No such process`. No film, no sound recorded |
| 20261014-161550-197-f839 | 828ab1e | the same, after the fix | pending | retry ticket |

The first submission of the French and sound tickets (20261013-112025-808-e8a3, 20261013-112126-293-389e) never reached the queue: the pipeline died on a `tail` call before sending. The Ticket Manager had no record of them.

Cause of the red `26ba`: `scripts/Run-PickleWsl.ps1` (commit a65e3b8, 2026-10-13) set `PULSE_SERVER` to an empty string for the 1.6 game and exported it through `WSLENV`. In WSL `PULSE_SERVER= ffmpeg -sources pulse` fails with "Generic error" and `PULSE_SERVER=unix:/mnt/wslg/PulseServer` lists `RDPSink.monitor`. Fixed by the Audit session in f1a89fa (without `-Game`, neither `PULSE_SERVER` nor `SDL_AUDIODRIVER` is defined). An environment defect, not the mod's.

What this does not show: that the uilleann pipes and the accordion sound right. Only a person listening says so (M1).