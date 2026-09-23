# Runs: what was played, in text

**Evidence lives on disk and is not in git.** A Pickle report is a folder of screenshots, films, a `Player.log`, a
`junit.xml` and a `report.html`. `Tests/Pickle/Evidence/` is in `.gitignore`; what the repository keeps is a text
summary here: the verdict, the counts and the scenario names, read from each report's `summary.json` (`exitReason`
first). Screenshots are described in a sentence where they matter and are not committed.

| File | Covers |
|---|---|
| [`2026-09-21-pickle-first-suite.md`](2026-09-21-pickle-first-suite.md) | The first suite (4 to 10 scenarios): English and French passes, review captures, loaded texts, three attempts at the crafting film |
| [`2026-09-22-pickle-engine-noise.md`](2026-09-22-pickle-engine-noise.md) | One run that failed 8 of 8 on an engine error attributed to no mod |

Rules kept from `PickleTools/docs/runs/README.md`: one verdict per row, said from the report; say what was not shown;
earlier commits still hold what was tracked before (untracking does not rewrite history).
