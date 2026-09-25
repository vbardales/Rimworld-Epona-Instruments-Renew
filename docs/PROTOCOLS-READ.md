# Protocols read, and which version

What the session of this mod read, on which version, and whether it helped, so that a document that did not help is not
read again unless it moves. **Version** is the last commit that touched the file (`git log -1 --format='%h %ad' -- <file>`
in its own repository); `modified, not committed` when `git status --short` shows an `M` (that file was read as it stood on disk).
Reread a document when its version differs from the one written here, and after every compaction of the session's context
(`Rimworld-Ticket-Dispatcher/docs/WELCOME.md`, point 5). Last full pass: **2026-09-25**.

## Read, and useful

| Document | Version read | What it changed here |
| --- | --- | --- |
| `AGENTS.md` (collection) | `90d51374` 2026-09-25 15:25 | Evidence rule: keep only reports that still prove something, one text line per run in `docs/runs/`, never a folder; never delete a report a STATUS field points to; the Steam publication rules (dry-run of the exact SHA, full SHA, only Virginie approves `steam-production`). |
| `AGENTS.md` (this mod) | `e6e5453` 2026-09-13 15:37 | Ordered gates and "missing checks stay unverified"; the public silent/unofficial route was authorised on 2026-09-13; a Workshop upload was not (the `0.1.0` prepublication was the maintainer's own act). |
| `AUDIT.md` | `90d51374` 2026-09-25 15:25 | **Runs go through `Submit-PickleRun.ps1`, never a direct launcher, never a watcher, `Monitor` or heartbeat** (TicketDispatcher wakes the owner); one request per pass, few scenarios for a fix, all for an initial or final pass; the request carries no SHA, so the mod tree stays put until `RUN_DONE`; the `local_<id>` goes in the label; `SoundCapture` runs only alone, on Windows, on Virginie's request; `done -> tested` criteria (no `@wip`, conditional scenarios run, no manual test left, `@review` images opened, `exitReason` before counts); the `0.1.0` prepublication is an act, not a stage; fail-fast publication policy. |
| `TRANSLATIONS.md` | `90d51374` 2026-09-25 15:25 | The translation gate is met (`localization`, `translation_en`, `translation_fr` complete); a run must be played once per language (`-Language French`), never a language switch mid-run. |
| `PUBLISHING.md` | `90d51374` 2026-09-25 15:25 | Needed later, at `tested -> prepublished`: `PUBLICATION.md` (missing here), description sent once at creation, `Source code on GitHub` last line, `THANKS`/AI/PickleTools credits, gallery folder `01-`, `02-`..., thank-you comments registry, CI publication and rollback. For now: git pathspec on `commit`, no `--amend` on a shared HEAD. |
| `PickleTools/README.md` | `d20db95` 2026-09-25 15:55 | Tool catalogue (`SoundCapture`: optional, records the game's audio output, not in the bundle; `FilmTicks`, `ClearScreen`, ...). This suite stages none. |
| `PickleTools/Headless/README.md` | `b2712fc` 2026-09-25 15:03 | Launcher options and exit codes, filter terms (`file.feature`, `::scenario`, `!term`), passes and `-DepMap` (none needed here), evidence copy under the lock, `I wait N ticks` and `I wait for bill` limits, `I select` is an exact match, films are encoded to webm by Pickle. |
| `PickleTools/Authoring/README.md` | `b1f1abd` 2026-09-25 14:58 | **Section 4, "three timeouts": Pickle's watchdog kills the run when one scenario lasts `-pickle-scenario-timeout` seconds (120 by default), and `@timeout:N` cannot stretch it.** It corrected this suite's diagnosis of four frozen runs (see `docs/runs/2026-09-24-pickle-joy-route.md`, the correction of 2026-09-25). Also: fast mode vs `@watch`, what stops a run on failure, evidence to keep. |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `4130d70` 2026-09-25 15:29, modified, not committed | Which test for which task, the `-Filter` terms, `-DepMap`, one request per pass, no queue watching, the request carries no SHA, how to delete evidence on long paths (`robocopy /MIR`), and to note the version of each doc read (this file). |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | not tracked (untracked file) | Every option of `Submit-PickleRun.ps1`, `-Extra` flags (`-pickle-scenario-timeout`, `-pickle-max-film-seconds`), launcher exit codes (3 = stall guard or scenario watchdog, 7 = queue wait exceeded, 8 = Pickle's own exit 2), and the worked example that matches this mod's craft scenario. |
| `STATUS.md` (this mod) | `59461c7` 2026-09-23 20:10 | Read to the end. Its `remaining` list is behind the runs of 2026-09-24/25 and is to be brought up to date when the passes are read. |
| `TESTING.md` (this mod) | `39aad97` 2026-09-23 20:22, modified, not committed | Rewritten on 2026-09-25 for requests, the mandatory `-Extra` watchdog flags, sound limits. |
| `docs/runs/` (this mod) | this session's own notes | Read for consistency; corrected on 2026-09-25 where a diagnosis was wrong. |

## Read, and not useful to this mod now (reread only if the version moves)

| Document | Version read | Why it did not help |
| --- | --- | --- |
| `STYLE_RIMWORLD.md` | `90d51374` 2026-09-25 15:25 | Preview and ModIcon rules; both images exist and were validated on 2026-09-13/21, and only the maintainer generates a ModIcon. Useful again only if the preview is regenerated. |
| `scripts/SEARCHING.md` | `90d51374` 2026-09-25 15:25 | Searching the whole Workshop corpus for a defName or a class; nothing to search for in this three-def mod. |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `2ce34a3` 2026-09-25 13:28 | The CI publication runbook (dry-run, SHA, secrets, the Skill Icons update, first publications). Needed at `tested -> prepublished` and `published`, not at `done`; the `0.1.0` item was created by the maintainer, not by this runbook. |

## Not available

| Document | Situation |
| --- | --- |
| `Docs/steps.md` (Pickle's step catalogue) | Not present in this checkout: no Pickle repository is cloned beside the mods (`Docs/` at the collection root does not exist, nor `~/pickle/Docs` in WSL). The suite's steps were checked against `PickleTools` documentation and against runs that already played them; a step spelling remains the likeliest thing a first run could reject. |
| `PUBLICATION.md`, `BACKLOG.md`, `NOTES.md`, `BUGS.md` (this mod) | Do not exist. `PUBLICATION.md` is required before `prepublished` (`AUDIT.md`, step 10): missing, not yet due. The others were never needed. The monorepo's `BACKLOG.md` is not this mod's. |
| `MOD_SETTINGS.md` | Not in the list of this pass; `settings_audit` is `not_applicable` and was justified on 2026-09-13 and 2026-09-21. |

## Things seen while reading, to settle later (nothing here blocks `done`)

- `README.md` and the `About.xml` description say "No Steam Workshop release has been made": stale since the `0.1.0` prepublication (item `3806766938`). The description is sent only at item creation, so editing `About.xml` will not change the page; the page text is corrected by hand at `prepublished`.
- `STATUS.md` `remaining` is out of date (see above).
