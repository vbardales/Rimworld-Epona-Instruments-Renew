# Runs: what was played, in text

**Evidence lives on disk and is not in git.** A Pickle report is a folder of screenshots, films, a `Player.log`, a
`junit.xml` and a `report.html`. `Tests/Pickle/Evidence/` is in `.gitignore`; what the repository keeps is a text
summary here: the verdict, the counts and the scenario names, read from each report's `summary.json` (`exitReason`
first). Screenshots are described in a sentence where they matter and are not committed.

| File | Covers |
|---|---|
| [`2026-09-21-pickle-first-suite.md`](2026-09-21-pickle-first-suite.md) | The first suite (4 to 10 scenarios): English and French passes, review captures, loaded texts, three attempts at the crafting film |
| [`2026-09-21-offline-diagnostics.md`](2026-09-21-offline-diagnostics.md) | The six shared diagnostics and the effective-defs test, before and after the `tickerType` fix; the 555-check split test of 2026-09-13 |
| [`2026-09-24-pickle-joy-route.md`](2026-09-24-pickle-joy-route.md) | Full passes on the joy route: listening starts a live sound for all three instruments; the unticked checkbox and a stale-notebook false reading |
| [`2026-09-23-pickle-full-passes.md`](2026-09-23-pickle-full-passes.md) | The reworked suite, first English and French passes: 22 of 22 played, 18 and 17 passed |
| [`2026-09-22-pickle-engine-noise.md`](2026-09-22-pickle-engine-noise.md) | One run that failed 8 of 8 on an engine error attributed to no mod |
| [`2026-09-27-m1-sound-bagpipes.md`](2026-09-27-m1-sound-bagpipes.md) | Pass "sound", first film-with-sound scenario (bagpipes): green, not silent; still awaiting a listen for M1 |
| [`2026-10-11-m1-listen-verdict.md`](2026-10-11-m1-listen-verdict.md) | M1 verdict on the bagpipes (heard, not bagpipe-like), the decision to use an own recording, and the two green requests on 49ce4d1 |
| [`2026-10-13-own-sounds-and-sound-pass.md`](2026-10-13-own-sounds-and-sound-pass.md) | Own sounds in English (4 of 4), French texts (1 of 1), the pass "sound" red on the environment and its cause |
| [`2026-10-17-gallery-explore.md`](2026-10-17-gallery-explore.md) | The 8.f exploration of `14-publication-shots` (images 1 and 2): red on the pants, then on the missing `MusicSpot`, and the fix |

Rules kept from `PickleTools/docs/runs/README.md`: one verdict per row, said from the report; say what was not shown;
earlier commits still hold what was tracked before (untracking does not rewrite history).
