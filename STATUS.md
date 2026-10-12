---
mod: Epona Instruments Renew (unofficial)
packageId: nelim.eponainstruments
licence: silent
upstream_mod_remotes: N/A
visibility: public
detached: yes
local_path: C:\Users\nelim\Documents\rimworld\EponaInstrumentsRenew
publication_intent: public_unofficial
workflow_stage: code[1.0.0]
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: complete
showcase: complete
tested_on:
updated: 2026-10-11
workshop_id: 3806766938
prepublished_version: 0.1.0 (private Workshop item created 2026-09-23; not a stage, see AUDIT.md)
remaining:
  - unverified (2026-10-02): M1 for the uilleann pipes and the accordion. Bagpipes: heard by Virginie (2026-09-28). Pipes and accordion: 10 s films passed (2026-09-28, not yet listened to); the 30 s refilm of 2026-09-29 failed on the WSLg audio path (docs/runs/2026-09-27-m1-sound-bagpipes.md). Needs a retry or a listen of the 2026-09-28 films; blocks `tested`
  - tested criterion, no @wip: met (8 features, 22 scenarios, none tagged); the 6 steps of Tests/Pickle/Source/InstrumentSteps.cs have all been played (2026-09-24/25)
  - tested criterion, conditional scenarios: none exists (no optional mod or DLC dependency, no @requires); nothing to run
  - tested criterion, Pickle green in both languages: MET on 2026-09-25, in the form AUDIT.md's "no red without a green replay" describes, not as one clean report: final passes on tree 99be666 with `-pickle-scenario-timeout=300`, 22 played of 22 in each (English 20 passed, French 21 passed; Evidence/2026-09-25-final-english and -final-french), and each red replayed green on 0a247d0: `a bill in progress at the bench` in English (ff21, 160 s) and French (063c, 148 s), where a fixed tick wait had stopped short (fixed in 0a247d0), and `the uilleann pipes are played, and heard` in English (2f06, 127 s), whose save load had timed out at 180 s under machine load. No single 22-of-22 green report of the final tree exists; two more full passes would give one, and nothing in AUDIT.md asks for it
  - pass `pre-split` (two launches, replaces MANUAL M2): green on the first try, 2026-09-25 (request 20e6, tree 66472e0): launch 1 wrote the three instruments in the states an old save holds and handed the save over, launch 2 loaded it in a fresh process and found the places, the qualities (Legendary, Masterwork, Excellent), the carried pipes and the bill, then a save and reload (Evidence/2026-09-25-pre-split/seq1 and seq2). Faithful because the pre-split and current definitions differ only by tickerType Normal, which is not saved data; a real old file from the maintainer's disk is not covered
  - `@review` captures of both language passes opened 2026-09-25 (English 11, French 12): labels right in both languages, no missing key, finished items below the bench; the pipes' oversize (about two cells wide, overlapping one cell apart) is the only reserve, unchanged
  - known limit: Pickle's watchdog kills the whole run when one scenario lasts 120 s (default), so every request carries -pickle-scenario-timeout=300 (TESTING.md; the craft scenario took 161 s, and the four freezes of 2026-09-24/25 were this)
  - two runs (2026-09-22 8 of 8, 2026-09-25 request 17c3) failed on Pickle's own "Accessing map pawns off main thread" (the second in the built-in step `a colonist "Keeper" exists`, 82 ms into the first scenario); attributed to no mod, not explained; the same scenario has passed in every later run (b94c, f817, f7c1), so it is not reproduced
  - backlog: find a royalty-free bagpipes/uilleann-pipes/accordion sample to replace the borrowed `MIC_Ocarina_Play` /
    `MIC_ElectronicOrgan_Play` stand-ins (ATTRIBUTION.md, "The sounds are a stopgap"); M1's 2026-09-28 verdict on the
    bagpipes confirms the tone is heard, continuous and in sync, but it is an ocarina, not a bagpipe
  - tested criterion, no manual test left: ONE remains, MANUAL M1 (hear the three instruments in the Windows game, PLAY_AND_LISTEN.md), to be done by the maintainer and reported; it waits for the PickleTools sound-capture work, which may make it automatic. MANUAL M2 is now the `pre-split` pass above. The accounting of every scenario is in TEST_SCENARIOS.md. This is the only thing between `done` and `tested`
  - the tickerType Normal correction: the loaded def reports Normal (Pickle 2026-09-21), and the game holds a live provider sound for the performer of each instrument (30-play-and-listen, passed 2026-09-25 in English for the bagpipes and the accordion, in French for all three, and silent with the checkbox unticked); that a loudspeaker renders it is MANUAL M1 (by ear, waits for the PickleTools sound work)
  - local state (2026-10-02): committed and pushed up to the French review and the gallery story; untracked and left alone on purpose: Tests/Audit-2026-09-13/ (decompilation evidence), Assets/, the desktop.ini files. Art/ was trimmed on 2026-10-02 (c6a83ca): the Preview working files (preview.html, render-preview.cjs, preview-qa.json, Preview-268.png, preview-render/background, ModIcon-32/badge/cutout) are gone from the tree; the older sections of this file that name them describe what existed on their date. Art/ now holds ModIcon-source.png, ModIcon.ico, Preview.png, echo.png, preview-copy.json, preview-palette.json, preview-generation.txt and Gallery/0-preview.png (byte-identical to Mod/About/Preview.png)
  - French review by Virginie: validated 2026-10-02 (three corrections applied, 26fa6b3); FRENCH_REVIEW.md regenerated. A French Pickle pass on the current Mod/ is still to replay before `tested`
---

# Epona Instruments Renew - status

Journal up to 2026-10-03 (audits of 2026-09-13/21/10-02, Pickle runs, 0.1.0 prepublication, Preview migration): `docs/runs/status-journal-to-2026-10-03.md`.

## Audit - 2026-10-11 (tree 64398ef plus local changes)

Old `done` -> `playTests[1.0.0]` (AUDIT.md correspondence table). Not a regression: the writeTests criteria hold (scenarios, tests and Pickle suite written, French reviewed by Virginie 2026-10-02). Nothing was replayed in this pass; no game launched.

Remaining for `playTests` -> `shootGallery` (all `unverified`, none a defect):
- M1: hear the uilleann pipes and the accordion (10 s films of 2026-09-28; bagpipes already heard). Virginie only.
- French Pickle pass on the current `Mod/` (see `remaining`).
- Code review (8.m): `code_review_sha` absent; defs-only mod, review from `0.1.0`.
- `protocols_read_sha` absent: protocols not fully read nor marked in this pass.

Housekeeping 2026-10-11: `.build/` renamed `build/` (`.gitignore`, both `Directory.Build.props`); `_tools/Generate-FrenchReview.ps1` removed in favour of `scripts/Make-FrenchReview.ps1`, `FRENCH_REVIEW.md` regenerated. `preview-generation.txt` (the illustration prompt) deleted: the source `Art/Preview-source.png` was received (AUDIT.md 2.f); the prompt stays in git history.

## Back to `code[1.0.0]` - 2026-10-11

New feature: own sound for the great highland bagpipes (Virginie supplied a Pixabay recording; M1 judged the ocarina stand-in not bagpipe-like). `Mod/Defs/SoundDefs/EponaInstruments_Sounds.xml`, `Mod/Sounds/EponaInstruments/Bagpipes/bagpipes.ogg`, patch line, `Tests/Test-EffectiveDefs.ps1` (green), ATTRIBUTION, CHANGELOG. Not yet loaded in a game: ogg loading and the sustained loop of a 52 s clip are unverified. Next: `code` -> `declareDependencies` (no new dependency), then back through `playTests` (new Pickle pass, M1 listen).

### 2026-10-12: bagpipes sound validated

Own bagpipes sound loaded in the game and heard (two Pickle requests green on 49ce4d1, Virginie validated the 30 s film). Left in M1: uilleann pipes and accordion, still on borrowed sounds, never heard (see `docs/runs/2026-10-11-m1-listen-verdict.md`). Next: decide their sounds, then declareDependencies (blocked while the protocols repository has uncommitted files, `Mark-ProtocolsRead`).
