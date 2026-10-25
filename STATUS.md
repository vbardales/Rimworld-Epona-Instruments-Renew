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
workflow_stage: playTests[1.0.0]
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: complete
showcase: complete
tested_on:
updated: 2026-10-13
workshop_id: 3806766938
prepublished_version: 0.1.0 (private Workshop item created 2026-09-23; not a stage, see AUDIT.md)
remaining:
  - ticket 20261025-152546-701-54ae waits (2026-10-25, tree 026441a): pass `sound` retry (uilleann pipes and accordion, 30 s each, volume 80 percent set by the feature) after the launcher fix 459f037 (WSLg PulseServer mounted in the container, NPT). At RUN_DONE: read summary.json and junit.xml in `Tests/Pickle/Inbox/sound-film-uilleann-accordion-2`; green: keep the 2 films in Inbox/ with a RELEASE.md (delete after Virginie heard them) and tell her the paths; red: send NPT the ticket id and the ffmpeg line
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
  - local state (2026-10-02): committed and pushed up to the French review and the gallery story; untracked and left alone on purpose: Tests/Audit-2026-09-13/ (decompilation evidence), Assets/, the desktop.ini files. Art/ was trimmed on 2026-10-02 (c6a83ca): the Preview working files (preview.html, render-preview.cjs, preview-qa.json, Preview-268.png, preview-render/background, ModIcon-32/badge/cutout) are gone from the tree; the older sections of this file that name them describe what existed on their date. Art/ now holds ModIcon-source.png, ModIcon.ico, Preview.png, echo.png, preview-copy.json, preview-palette.json, preview-generation.txt and Gallery/0-preview.png (byte-identical to Mod/About/Preview.png)
  - French review by Virginie: validated 2026-10-02 (three corrections applied, 26fa6b3); read again and validated 2026-10-17 at 1d43b2a (ChatGPT review: no French correction, one PUBLICATION.md wording fixed); FRENCH_REVIEW.md regenerated. A French Pickle pass on the current Mod/ is still to replay before `tested`
social_preview_sha256: c148dd428c7ff6c6a9cea82abe7b7a0e2b1c0a095fb10e3c6c4210f49bbfce4c
protocols_read_sha: 606806be38a0d19c902380038fda34c6f8feeaf4
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
- 4.f: not animal mod, not applicable. No `incompatibleWith` needed (none known).
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