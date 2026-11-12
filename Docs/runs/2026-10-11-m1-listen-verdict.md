# 2026-10-11, M1 listening verdict (Virginie)

Films of 2026-09-28 (`Tests/Pickle/Evidence/2026-09-28-m1-*`), copied to `Evidence/M1-listen/` for listening.
- great highland bagpipes (30 s film): heard, but it does not sound like bagpipes (the borrowed `MIC_Ocarina_Play`). ffmpeg: mean -33.4 dB, peak -17.9 dB.
- uilleann pipes and accordion (10 s films): nothing to hear or see. ffmpeg: mean -62.4 / -63.0 dB, peak -34.9 / -35.3 dB, i.e. the same near-silent capture as the failed bagpipes film of 2026-09-27 (peak -35.3 dB). These films do not prove the instruments sound; M1 stays unverified for them.
- Decision: replace the stand-in sounds with a real bagpipes recording (Virginie supplied `bagpipes.mp3`, 52.7 s, 24 kHz stereo); source and licence to be given before it ships.

## Update 2026-10-12: own bagpipes sound validated by Virginie

Tree 49ce4d1. Requests 20261011-213437-914-40ee (30-play-and-listen, bagpipes: 1 of 1 passed) and 20261011-213438-588-a29f (35-hear-the-instruments, bagpipes filmed 30 s: 1 of 1 passed, mean -22.4 dB, peak -8.5 dB). Virginie listened to `film-sound.mp4` of the second: validated (M1 for the great highland bagpipes, with `EponaIR_GreatHighlandBagpipes_Play`). Still unverified: uilleann pipes and accordion (borrowed sounds; their 2026-09-28 films are near silent).
