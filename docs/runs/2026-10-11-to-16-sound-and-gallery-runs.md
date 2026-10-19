# 2026-10-11 to 2026-10-16: sound films, first gallery try, French bill replay

Read from each report's `summary.json`, `exitReason` first. The folders under `Tests/Pickle/Evidence/` hold nothing more than this table says (read 2026-10-18). Dates are folder names.

| Folder | Set | exitReason | Result |
|---|---|---|---|
| 2026-09-25-replay-bill-french | `sans-facultatifs` | passed | 1 of 1: `a bill in progress at the bench`, French, 148 s (the replay named in STATUS.md) |
| 2026-10-11-bagpipes-sound-film | `sound` | passed | 1 of 1: bagpipes filmed with their sound, 122 s (own bagpipes sound, validated by Virginie 2026-10-12) |
| 2026-10-12-gallery | `studio` | failed | 0 of 4, under 400 ms each: `Fixture 'nelim-zen-meadow-studio' not found` (known: Nelims-tribe, test-colony). The old studio gallery, replaced on 2026-10-15 by the Sanctuary story |
| 2026-10-12-pipes-accordion-film | `sound` | passed | 2 of 2: uilleann pipes 92 s, accordion 89 s, filmed with their own sounds |
| 2026-10-12-sounds-film | `sound` | failed | 1 of 2: uilleann pipes passed (100 s); accordion failed, recorded peak -91.0 dB (above -60 asked): the recorder heard nothing the game played |
| 2026-10-14-sound-film | `sound` | failed | 0 of 3: `ffmpeg stopped at once (exit 253)`, `Error opening input file RDPSink.monitor: No such process` (the f839 retry, pending in 2026-10-13 line) |
| 2026-10-16-sound-film | `sound` | failed | 0 of 2 (uilleann pipes, accordion): the same `RDPSink.monitor` error |

Reading: no sound pass has been green since 2026-10-12 (2 of 2 on the pipes and the accordion, tree before the 10-13 changes). The red ones since are an environment failure (WSLg audio sink), not the mod. One film of the accordion on 2026-10-12 recorded silence once and passed in the replay.

## 2026-09-25-pre-split (verdict, report deleted 2026-10-18)

Pass `pre-split`, request 20e6, tree 66472e0, green on the first try. Launch 1 wrote the three instruments in the states an old save holds; launch 2 loaded the save in a fresh process and found the places, the qualities (Legendary, Masterwork, Excellent), the carried pipes and the bill, then saved and reloaded. No later run repeated it: it is the sole proof of the save-compatibility check. It predates the 10-11 to 10-13 changes (own sounds, patch line), which touch sound defs only, not saved data, so no replay is judged needed; a real old save file is still not covered.
