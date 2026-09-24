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

Rules kept from `PickleTools/docs/runs/README.md`: one verdict per row, said from the report; say what was not shown;
earlier commits still hold what was tracked before (untracking does not rewrite history).
