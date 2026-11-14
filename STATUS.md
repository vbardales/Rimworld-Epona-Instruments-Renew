---
mod: Epona Instruments Renew (unofficial)
packageId: nelim.eponainstruments
repo: Rimworld-Epona-Instruments-Renew
remote: https://github.com/vbardales/Rimworld-Epona-Instruments-Renew.git
licence: silent
upstream_mod_remotes: N/A
visibility: public
detached: yes
local_path: C:\Users\nelim\Documents\rimworld\EponaInstrumentsRenew
publication_intent: public_unofficial
workflow_stage: shootGallery[1.0.0]
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: complete
showcase: complete
tested_on: 2026-11-12 pickle 8614d61
updated: 2026-11-07
workshop_id: 3806766938
prepublished_version: 0.1.0 (private Workshop item created 2026-09-23; not a stage, see AUDIT.md)
remaining:
  - 2026-11-13: Audit accepted 8.f on the per-instrument greens (a711 4/4, French pass 5dda, M1 heard for the three instruments, Mod/ 03c2101); 8.c, 8.i MET; next: 8.0 ecosystem refresh (8.0 done 2026-11-13, see Ecosystem), then 8.n: Check-Status, Mark-ProtocolsRead, `workflow_stage: shootGallery[1.0.0]`, commit, push, rename. `14-publication-shots` moved to `Tests/Pickle/Gallery-draft/`, rewrite for SanctuaryBacklot at shootGallery (9.a). Also low: Pixabay ids in Mod/ATTRIBUTION.md (only Virginie holds the pages)
  - unverified: whole-run sound scenario `35-hear-the-instruments`: ead2 (2026-11-12, 0 of 3) ran on lane azure (no WSLg audio), lane error. Refiled pinned `-Runner wsl` (never auto for a recording ticket): 20261113-232245-951-3cac RED 2026-11-14 (exit 1, `no-report.txt`: no current Pickle report, launcher exit code 1; no summary.json, no junit.xml). `Player.log` (parked in `Tests/Pickle/Parked/sound-35-wsl-3cac`): the game on the local WSL also finds no audio device (ALSA `Unknown PCM default`, FMOD `failed to initialize the output device`), command line `-pickle-run-timeout=20`, log stops after the Pickle dependency warning, no scenario ran. Cause not proven, not the mod (defs load). Not refiled: told NPT via TM 2026-11-14 with the evidence. 8.f stays accepted on the per-instrument greens
  - 2026-11-07: resume: Preview.png upload to Steam only at publication (Virginie, 2026-11-07), social_preview_sha256 stale until then; ticket e33d (French pass) still queued; at `tested`, `tested_on` must be a date and sha of the last green Pickle run
  - code review 8.m done 2026-11-03 (first commit to 8725ed1, Opus sub-agent): 4 findings, 3 fixed (SOURCES.json hash and ogg entries, patch comment); open, low: Mod/ATTRIBUTION.md lacks the Pixabay content id and URL for the uilleann pipes and accordion sounds (only Virginie holds the pages)
  - 2026-11-03: Preview rendered again (echo.width/height removed; again after renderer default background cover + top left, 70aa492, commit 94d9dfe), echo checked, no clipping or overlap
  - ticket 20261025-152546-701-54ae done (run 2026-10-30 13:03, tree 026441a, 1 of 2): sound capture now works (launcher fix 459f037). `the uilleann pipes are filmed with their sound` PASSED (peak -14.6 dB, 34.6 s film); Virginie heard it 2026-10-30: real bagpipe sound, sound right, M1 done for the uilleann pipes; run folder deleted. `the accordion is filmed with its sound` FAILED: step `"Jet" is heard playing "EponaIR_Accordion_Play"` timed out after 90 s (pawn job HaulToCell at scene start, accordion reachable, not forbidden); cause not studied: no capture; replay ticket 20261030-152752-639-225f waits (accordion scenario alone, tree eb32939, map wsl-deps.sound.map): at RUN_DONE read summary.json and junit.xml in `Tests/Pickle/Inbox/sound-film-accordion-3`; green: keep film for Virginie (RELEASE.md), red: study the step timeout. Blocks `tested` with M1 accordion
  - ticket 20261103-162019-540-e33d RED 2026-11-07 (infra: Hetzner server unreachable, ssh no route to host, partial report of 5 built-in scenarios, exitReason in-progress, no Epona scenario; folder deleted). Replacement ticket 20261107-213339-868-8c9f vanished (not in queue, no result, found 2026-11-10); refiled as 20261110-000202-546-5dda (French pass, `-Filter '!35-hear-the-instruments,!14-publication-shots'`, tree 03c2101): result read 2026-11-12 in `Tests/Pickle/Inbox/french-pass-10996c0` (138 scenarios, 130 passed, 4 failed, 4 skipped, exitReason failed, peak 3775 MiB). All Epona scenarios passed (three instruments, made, played and heard, bill in progress); the 4 failures are Pickle built-ins about UI (`the main menu is clickable`, `a button is clickable at another interface scale`, `a page's bottom buttons drive the stack`, `select, gizmo, inspect, dialog, and evidence steps all work`), none touch Epona: to tell NPT; the 4 skips are built-in too. French pass on current Mod/ MET: closes 8.c and 8.i for French
  - ticket 20261030-152752-639-225f GREEN (run ended 2026-11-03 15:35, 1 of 1, 149 s, `EponaIR_Accordion_Play` live, peak -13.6 dB): Virginie listened 2026-11-03, first judged it an electronic organ, then validated it (she does not know accordions well enough; the clip that plays is `accordion.ogg`, Pixabay freesound_community). M1 DONE for all three instruments; the evidence folder is deleted. Remaining before `tested`: French Pickle pass on current `Mod/`; low: Pixabay ids in ATTRIBUTION.md
  - ticket 20261019-231321-584-9038 RED (run 2026-10-23, tree 4f5d99b, 0 of 2, `35-hear-the-instruments`, uilleann pipes and accordion): ffmpeg could not open `RDPSink.monitor`, `PULSE_SERVER` and `XDG_RUNTIME_DIR` both unset, WSLg socket missing for the game. Environment, not the mod; third red of the pass `sound` for this reason (2026-10-14, 10-15, 10-23). No films made. Report studied and deleted (empty folder `Tests/Pickle/Inbox/sound-film-uilleann-accordion` locked by a process, delete later). To tell NPT (PickleTools): the launcher still hands the game no WSLg PulseServer. M1 stays by ear in the Windows game (PLAY_AND_LISTEN.md). Gallery (14-publication-shots, Soleil without music job) is not played at playTests, owner 2026-10-19
  - M1 films of 2026-10-12 heard on 2026-10-19: the uilleann pipes and the accordion still carried the old borrowed sound (films made before edef521, the own-sound commit, 2026-10-12 18:07); deleted. The sources are right (`Patches/EponaInstruments.xml` names `EponaIR_*_Play`, ogg files present). Needs a new film once the pass `sound` runs, or a listen in the Windows game (PLAY_AND_LISTEN.md)
  - unverified (2026-10-15): M1 for the uilleann pipes and the accordion, now on their own sounds (2026-10-12) and never heard. The pass `sound` (`35-hear-the-instruments`, films with sound) failed 3 of 3 on 2026-10-14 for an environment reason: ffmpeg could not open `RDPSink.monitor` because `Run-PickleWsl.ps1` handed WSL an empty `PULSE_SERVER` (fixed by the Audit session in f1a89fa); retry ticket 20261014-161550-197-f839 pending. Blocks `tested`
  - tested criterion, no @wip: met (8 features, 22 scenarios, none tagged); the 6 steps of Tests/Pickle/Source/InstrumentSteps.cs have all been played (2026-09-24/25)
  - tested criterion 8.f, conditional scenarios: two features carry `@requires`, both on PickleTools companions (no optional mod or DLC): `35-hear-the-instruments` (SoundCapture, pass `sound`, red twice on the environment: ffmpeg could not open `RDPSink.monitor` on 2026-10-14 and again in f839 on 2026-10-15; probable cause low RAM, WSLg PulseServer not answering, not proven; one new ticket waits for >= 4 GB free RAM and a clean `ffmpeg -sources pulse`) and `14-publication-shots` (gallery staging, `wsl-deps.gallery.map`, written for shootGallery; decided 2026-10-15: played in `playTests`, since 8.f asks a pass and a read report for every `@requires`; exploration ticket 20261015-233515-994-48dc red on the pants, run of 2026-10-16 red on the missing MusicSpot, fixed in 6152abb; new exploration ticket 20261017-232705-219-d0b9 waits, images 1 and 2; runs line `docs/runs/2026-10-17-gallery-explore.md`). Not green yet
  - tested criterion, Pickle green in both languages: MET on 2026-09-25, in the form AUDIT.md's "no red without a green replay" describes, not as one clean report: final passes on tree 99be666 with `-pickle-scenario-timeout=300`, 22 played of 22 in each (English 20 passed, French 21 passed; reports deleted 2026-10-18, see docs/runs/2026-09-24-pickle-joy-route.md), and each red replayed green on 0a247d0: `a bill in progress at the bench` in English (ff21, 160 s) and French (063c, 148 s), where a fixed tick wait had stopped short (fixed in 0a247d0), and `the uilleann pipes are played, and heard` in English (2f06, 127 s), whose save load had timed out at 180 s under machine load. No single 22-of-22 green report of the final tree exists; two more full passes would give one, and nothing in AUDIT.md asks for it
  - pass `pre-split` (two launches, replaces MANUAL M2): green on the first try, 2026-09-25 (request 20e6, tree 66472e0): launch 1 wrote the three instruments in the states an old save holds and handed the save over, launch 2 loaded it in a fresh process and found the places, the qualities (Legendary, Masterwork, Excellent), the carried pipes and the bill, then a save and reload (report deleted 2026-10-18, verdict kept in docs/runs/2026-10-11-to-16-sound-and-gallery-runs.md). Faithful because the pre-split and current definitions differ only by tickerType Normal, which is not saved data; a real old file from the maintainer's disk is not covered
  - `@review` captures of both language passes opened 2026-09-25 (English 11, French 12): labels right in both languages, no missing key, finished items below the bench; the pipes' oversize (about two cells wide, overlapping one cell apart) is the only reserve, unchanged
  - known limit: Pickle's watchdog kills the whole run when one scenario lasts 120 s (default), so every request carries -pickle-scenario-timeout=300 (TESTING.md; the craft scenario took 161 s, and the four freezes of 2026-09-24/25 were this)
  - two runs (2026-09-22 8 of 8, 2026-09-25 request 17c3) failed on Pickle's own "Accessing map pawns off main thread" (the second in the built-in step `a colonist "Keeper" exists`, 82 ms into the first scenario); attributed to no mod, not explained; the same scenario has passed in every later run (b94c, f817, f7c1), so it is not reproduced
  - backlog done 2026-10-12: the borrowed ocarina and organ stand-ins are replaced by own sounds for all three instruments (ATTRIBUTION.md)
  - tested criterion, no manual test left: ONE remains, MANUAL M1 (hear the three instruments in the Windows game, PLAY_AND_LISTEN.md), to be done by the maintainer and reported; it waits for the PickleTools sound-capture work, which may make it automatic. MANUAL M2 is now the `pre-split` pass above. The accounting of every scenario is in TEST_SCENARIOS.md. This is the only thing between `done` and `tested`
  - the tickerType Normal correction: the loaded def reports Normal (Pickle 2026-09-21), and the game holds a live provider sound for the performer of each instrument (30-play-and-listen, passed 2026-09-25 in English for the bagpipes and the accordion, in French for all three, and silent with the checkbox unticked); that a loudspeaker renders it is MANUAL M1 (by ear, waits for the PickleTools sound work)
  - local state (2026-10-02): committed and pushed up to the French review and the gallery story; untracked and left alone on purpose: the desktop.ini files (Tests/Audit-2026-09-13/ decompilation evidence deleted 2026-11-12, old, owner's order; Art/Assets/ removed 2026-11-12, kept in history at 2cad8d3). Art/ was trimmed on 2026-10-02 (c6a83ca): the Preview working files (preview.html, render-preview.cjs, preview-qa.json, Preview-268.png, preview-render/background, ModIcon-32/badge/cutout) are gone from the tree; the older sections of this file that name them describe what existed on their date. Art/ now holds ModIcon-source.png, ModIcon.ico, Preview.png, echo.png, preview-copy.json, preview-palette.json, preview-generation.txt and Gallery/0-preview.png (byte-identical to Mod/About/Preview.png)
  - French review by Virginie: validated 2026-10-02 (three corrections applied, 26fa6b3); read again and validated 2026-10-17 at 1d43b2a (ChatGPT review: no French correction, one PUBLICATION.md wording fixed); FRENCH_REVIEW.md regenerated. A French Pickle pass on the current Mod/ is still to replay before `tested`
social_preview_sha256: c148dd428c7ff6c6a9cea82abe7b7a0e2b1c0a095fb10e3c6c4210f49bbfce4c
code_review_sha: 915cb7db501415ba59322065faafab0ede420c45
protocols_read_sha: d9c98a1611603ae262a379480e6ca48923a955a6
---
# Epona Instruments Renew - status

Journal up to 2026-10-03 (audits of 2026-09-13/21/10-02, Pickle runs, 0.1.0 prepublication, Preview migration): `docs/runs/status-journal-to-2026-10-03.md`.

## Audit - 2026-10-11 (tree 64398ef plus local changes)

Old `done` -> `playTests[1.0.0]` (AUDIT.md correspondence table). Not regression: writeTests criteria hold (scenarios, tests, Pickle suite written, French reviewed by Virginie 2026-10-02). Nothing replayed this pass; no game launched.

Remaining for `playTests` -> `shootGallery` (all `unverified`, none defect):
- M1: hear uilleann pipes and accordion (10 s films of 2026-09-28; bagpipes already heard). Virginie only.
- French Pickle pass on current `Mod/` (see `remaining`).
- Code review (8.m): `code_review_sha` absent, defs-only mod, review from `0.1.0`.
- `protocols_read_sha` absent: protocols not fully read nor marked this pass.

Housekeeping 2026-10-11: `.build/` renamed `build/` (`.gitignore`, both `Directory.Build.props`); `_tools/Generate-FrenchReview.ps1` removed for `scripts/Make-FrenchReview.ps1`, `FRENCH_REVIEW.md` regenerated. `preview-generation.txt` (illustration prompt) deleted: source `Art/Preview-source.png` received (AUDIT.md 2.f); prompt stays in git history.

## Back to `code[1.0.0]` - 2026-10-11

New feature: own sound for great highland bagpipes (Virginie supplied Pixabay recording; M1 judged ocarina stand-in not bagpipe-like). `Mod/Defs/SoundDefs/EponaInstruments_Sounds.xml`, `Mod/Sounds/EponaInstruments/Bagpipes/bagpipes.ogg`, patch line, `Tests/Test-EffectiveDefs.ps1` (green), ATTRIBUTION, CHANGELOG. Not yet loaded in game: ogg loading and sustained loop of 52 s clip unverified. Next: `code` -> `declareDependencies` (no new dependency), then back through `playTests` (new Pickle pass, M1 listen).

### 2026-10-12: bagpipes sound validated

Own bagpipes sound loaded in game and heard (two Pickle requests green on 49ce4d1, Virginie validated 30 s film). Left in M1: uilleann pipes and accordion, still borrowed sounds, never heard (see `docs/runs/2026-10-11-m1-listen-verdict.md`). Next: decide their sounds, then declareDependencies (blocked while protocols repository has uncommitted files, `Mark-ProtocolsRead`).

### 2026-10-12: own sounds for the uilleann pipes and the accordion

Virginie supplied two more Pixabay recordings (Brian Cradden; freesound_community). Added as `EponaIR_UilleannPipes_Play` and `EponaIR_Accordion_Play`; patch, effective-defs test (green), two 30/35 features updated. Not yet heard in game. Queued gallery ticket cancelled, resubmitted on this tree.

### 2026-10-13: code[1.0.0] to declareDependencies[1.0.0]

Criteria 3.a to 3.d: no `feature` left in `remaining`; defs-only mod, no build; `CHANGELOG.md` `[Unreleased] (1.0.0)` says what version changes; protocols read (`protocols_read_sha` 5e7c922c). Own sounds of uilleann pipes and accordion not yet heard in game: `unverified`, M1, belongs to `playTests`. Next: verify real dependencies (4.a to 4.g).

### 2026-10-13: dependencies declared (declareDependencies[1.0.0], tree 112e4d1)

- 4.a/4.b: one hard dependency, `Mlie.MusicalInstruments` (Workshop 2274558815), declared with Workshop URL. Used for real: patch parents (`HeldMusicalInstrumentBase`, `PrimitiveInstrumentBase`) and classes `MusicalInstruments.CompProperties_MusicalInstrument`, `CompMusicalInstrument`, `CompProp_PlayingMusic`. No other mod referenced.
- 4.c: no DLC referenced; `supportedVersions` 1.6 only; no `LoadFolders.xml` (none needed, one folder).
- 4.d: `loadAfter` lists `Ludeon.RimWorld` and `Mlie.MusicalInstruments`; no cycle (one dependency).
- 4.e: only patch is `PatchOperationConditional` guarded on `HeldMusicalInstrumentBase`; nothing added or logged without Musical Instruments. No `MayRequire`, no optional mod.
- 4.f: not animal mod, not applicable. `incompatibleWith` Epona.Culture (Epona Instruments Standalone, the original this mod replaces) added 2026-11-14 on Virginie's decision; Epona Renaissance (Unofficial) not listed: it loads nothing in 1.6.
- Not run here: `scripts/sort-load-order.py` and in-game load (`unverified`, belongs to `playTests`).

### 2026-10-13: settings audit, not applicable (settings[1.0.0] to localize[1.0.0])

5.b/5.c/5.d: no settings, no MainButton. Verified in sources: no DLL in `Mod/`, no `MainButtonDef`, no `ModSettings`, `Mod/Defs/` holds only `SoundDefs/`. No empty page, no shortcut exposed. `settings_audit: not_applicable` stands.

### 2026-10-13: localization (localize[1.0.0] to writeTests[1.0.0])

Player-facing texts: three labels and descriptions, patched in English, covered in French by `Languages/French/DefInjected/ThingDef/JoyPreservation.xml`; no Keyed text, no code. No text changed since Virginie validated French on 2026-10-02 (26fa6b3, c073659); sound change adds none. `FRENCH_REVIEW.md` regenerated at edef521 (same French; English columns now filled). `translation_fr` stays `complete`.

### 2026-10-13: tests replayed (writeTests[1.0.0] to playTests[1.0.0], tree 00c8d6b)

Replayed now, offline, all green on 00c8d6b: `Tests/Test-EffectiveDefs.ps1` (all assertions passed), `Tests/Audit-2026-09-21/Validate-Package.ps1 -Root .` (six shared diagnostics PASS), `Check-ModBasics.ps1` (PASS after syncing `Mod/ATTRIBUTION.md` with root copy, which lacked sound credits), `Check-Translations.ps1` (PASS). Scenarios (`TEST_SCENARIOS.md`) and 22-scenario Pickle suite written, not run this pass; translations `complete`. Nothing played in game.

Left for `playTests` (all `unverified`): new Pickle tickets for own sounds of uilleann pipes and accordion, French pass on current `Mod/`; M1 listen (Virginie); code review 8.m (`code_review_sha` absent, review from `0.1.0`).

### 2026-10-13: audit recheck of the earlier states (tree 828ab1e)

- 2.b: shipped ModIcon.png dated 2026-09-13, older than source (2026-10-02): regenerated with Render-Preview.cjs (modIconSource), with Preview.png, 0-preview.png, both .ico (828ab1e). ModIcon.png 31,7 KB, above expected 20-30 KB: tool output, left as is.
- 2.e: Art/Preview-source.png mean value 0.188 (Measure-Palette.sh), below 0.30 asked. Reserve accepted by Virginie 2026-10-13 (confirmed in chat): rendered Preview reads well at 268 px; source not redone.
- Mod/ATTRIBUTION.md synced with root copy (sound credits).
- Not rechecked this pass: PUBLICATION.md line by line; scripts/sort-load-order.py (no Python on this machine).

### 2026-10-15: audit replayed up to playTests (tree 14fde65 plus local docs)

- Fixed: `repo` and `remote` missing from front matter (1.h); documents still saying sounds are borrowed stand-ins (ATTRIBUTION.md and `Mod/` copy, PUBLICATION.md description and notes, PLAY_AND_LISTEN.md, TEST_SCENARIOS.md, comment in `30-play-and-listen.feature`); 8.f line, wrongly saying no `@requires` scenario exists; `docs/runs/` had no line for runs of 2026-10-11 to 2026-10-14 (8.l).
- PUBLICATION.md: Steam description changed (sound paragraph, THANKS credit to two Pixabay authors): Virginie reads it at 11.j.
- Still open, not defects: `tested_on` stays empty until stage left (8.l); code review 8.m; M1; pass `sound` retry (waits for free RAM); 8.f for `14-publication-shots` (decided: played in playTests, exploration ticket 48dc).
- Seen, not mine: `scripts/LOCAL_SCRIPTS.md` holds hash 30956A65 for `Tests/Test-EffectiveDefs.ps1`, file now 0A7560F1 (Audit session to refresh). `scripts/sort-load-order.py` not run: no Python on this machine.

### 2026-10-15: the gallery rewritten for the Sanctuary, with subtitles

First plan (2026-10-02: studio colony, three invented pawns, no Nelim, no hour, expression or hairstyle) did not follow rules set since (AUDIT.md 9.a, GALLERY.md). Replaced: story "a ceilidh at the hermit's hearth", Nelim host and protagonist, two guests, five images at own hours, hairstyles and kilts from two added mods (Vanilla Hair Expanded, Irn Bru And Other Scottish Delights), face kits and Nelim's own face, dogs facing camera. Scenarios: `14-publication-shots.feature` (rewritten, NOT PLAYED), pass map `Tests/Pickle/wsl-deps.gallery.map` (replaces `wsl-deps.studio.map`), seeds `Tests/Pickle/config/gallery/`. Subtitles: `PUBLICATION.md`, "Gallery subtitles". Played and judged at `shootGallery`; several defNames and two dog names unconfirmed (listed in `PUBLICATION.md`, "Gallery"). `scripts/sort-load-order.py` can run with `uv run --no-project python`.
## Ecosystem - 2026-11-13 (PiI, 8.0; `docs/inventory/ecosystem-steam/EponaInstrumentsRenew.md`, d9c98a1)

Source of every line: Steam search by Chrome (PiI), plus local scan `same-pattern` of the whole Workshop folder. Nothing subscribed.

| Workshop id | Title | Versions | Type |
|---|---|---|---|
| 2627618308 | Epona Instruments Standalone (original, defNames `Epona_Instrument_*`, no collision with `eponair_*`) | 1.3 | original, dead for 1.6 |
| 2624033197 | Epona race Renaissance | not in registry | same author family, carries the instruments |
| 3250668195 | Epona race Renaissance (Unofficial) (`Epona.EponaRenaissanceUno`) | 1.5, installed | CHECKED 2026-11-14: carries the same three instruments (`Epona_Instrument_GreatHighlandPipes`, `_UilleannPipes`, `_Accordion`, via a Musical Instruments patch in `1.5/Patches/ModPatches/Music.xml`, own research); no collision with our `eponair_*`; `LoadFolders.xml` has only a `<v1.5>` block, so nothing loads in 1.6 (read from files, not played) |
| 2483902695 | Epona Race (Total Medieval) | 1.2 | race mod, same author |
| 3514746737 | Epona Dynastic Rise | 1.5 to 1.7 | newer Epona race line |
| 3134829573 | Musical Instruments (Continued) Patch | 1.4 to 1.7 | patch for our dependency |

Verdict: no duplicate for 1.6; no other mod ships bagpipes or an accordion for Musical Instruments. No mod patches or retextures ours.
