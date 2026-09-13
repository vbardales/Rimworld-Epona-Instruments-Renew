---
mod: Epona Instruments Renew (unofficial)
packageId: nelim.eponainstrumentsrenew
licence: silent
visibility: public
detached: yes
local_path: C:\Users\nelim\Documents\rimworld\EponaInstrumentsRenew
publication_intent: public_unofficial
stage: preOptions
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: complete
showcase: complete
tested_on:
updated: 2026-09-13
remaining:
  - unverified: configuration checks on effective patched definitions; existing checker reads zero definitions
  - defect: functional scenarios do not specify carried-instrument crafting and playing prerequisites/actions
  - unverified: final game scenarios, logs, EN/FR interface, provider music setting interaction and old-save reload
---

# Epona Instruments Renew - status

Current stage: preOptions. The autonomous repository, public GitHub remote and first pushed commit are verified. Earlier sections preserve historical findings; the final transition record supersedes resolved findings.

Scope: Three carried instruments: great highland bagpipes, uilleann pipes and accordion.

Source classification is inherited from the reviewed collection, not a new grant of rights.
Tests and ownership checks will be recorded after the prepared split is validated.
## Source-rights separation validation - 2026-09-13

Scope: existing recreation content only; original source mods were not expanded into full
ports. Prepared from Joy Preservation eafda413babde8984007380e3435e19b872ea001.
The user requested source-specific Renew folders for non-forbidden/non-alive sources.
New projects are local and unpublished; no remote or new publication has been created.

Settings audit: not_applicable. This content exposes no mod configuration, Verse.Mod
settings page, ModSettings, MainButtonDef or shortcut. Its source balance constants are
not user settings. Native building controls and provider behavior remain native. No
useful separate option was identified; no RIMMSQOL test is applicable or claimed.

Localization audit: 6 owned text fields have English source/overrides and matching
French resources. All entries are nonempty; duplicates, parameters/markup and actual
DefInjected paths were checked. No own code-generated UI string is introduced.
Results/Reorganization text evidence does not certify in-game rendering.

Tests/Reorganization-2026-09-13/run.txt and Results/ hold the successful six diagnostics:
XML fields, configuration rules, type guards, injection paths, XML classes, def references
and parents. A separate split test passed 555 checks: all 45 original typed definitions
and 49 language entries have exactly one package owner, and copied texture bytes match.
The optional WA menu patch passed Royalty on/off x Japanese Homestead on/off cases.

Initial candidates lived under .build, which the shared type-guard checker intentionally
excludes. That initial run read zero XML and was not counted as a pass. Candidates were
moved outside the exclusion and all six diagnostics rerun successfully.

These are offline tests only. New-game play, copied existing saves, active/queued jobs,
tolerance persistence, logs and actual EN/FR rendering remain unverified. Definition
identity is preserved, but enabling the new packages is required before old-save testing.
New images and initial remote/push gates remain pending for the four Renew projects.

### Installed local project

The project has its own local Git repository on codex/source-split and a local RimWorld
Mods junction pointing at Mod/. No remote repository exists and no push or publication
was performed. The active ModsConfig was not edited. Select this package manually when
testing the split, with its declared provider when applicable.

## User-requested location — 2026-09-13

Moved alongside the other mods under Documents/rimworld. The nested local Git repository
was preserved; no remote or push was created. The game junction now targets this location.
Stage remains dansMonoRepo; independent remote/detachment gates remain pending.

## Ordered workflow audit - 2026-09-13

Audited revision: d16973d10f5027a569330036b3ffdf91f40c1746, branch codex/source-split.
Repository: C:/Users/nelim/Documents/rimworld/EponaInstrumentsRenew; delivered root: Mod/.
Before this audit only STATUS.md was locally modified (detached flag, relocated path,
and location history). Those changes and all historical results were preserved.
This audit changes status metadata and adds Tests/Audit-2026-09-13 evidence only;
no delivered file, feature, image, remote, commit or publication was created or changed.
The stage uses literal workflow names, not numeric codes. Retained: dansMonoRepo.
The generated-image states are exactly `ModIcon générée` and `Preview générée`.
Private scope follows AGENTS.md; visibility: public describes the absent established
remote, not public authorization. The public_unofficial intent is retained as a future intent, not authorization to publish.
The mod field continues to record the actual, currently nonconforming delivered title.

| Transition target | Audit result and evidence |
| --- | --- |
| horsMonoRepo | Blocked. git rev-parse --show-toplevel establishes an autonomous local repository and HEAD exists. git remote -v is empty: missing configured remote is a defect; GitHub existence, private visibility and first push remain unverified. STATUS and English README/ATTRIBUTION/LICENSE/CHANGELOG exist. packageId and folder naming are coherent; no remote name can be checked. Private scope conflicts with (unofficial) and the public opening in About/README; required (prohibited) and PERSONAL USE ONLY wording are absent. |
| ModIcon générée | Not established: Mod/About/ModIcon.png is absent. Build is not applicable: this package delivers XML and textures, no own assembly or C# implementation. No claim that all development is finished based on a nonexistent build. |
| Preview générée | Not established: Mod/About/Preview.png is absent. Dimensions, size, camera and image content cannot be inspected. No visual defect is inferred from an unperformed inspection. |
| preOptions | Not established. Description is English, but the final Source code on GitHub link and url element are absent. Private title/description conventions fail as above. Accent/secondary palette cannot be verified without the image. |
| options | Independently validated as settings_audit: not_applicable for this package; see settings scope below. |
| l10n | Independently validated for six owned fields, English native Def fallback and six French injections. See translation scope below. |
| preTest | Dependency declarations independently validated against installed Musical Instruments (Continued) 1.6.5: Mlie.MusicalInstruments is required and ordered before this mod; its own Harmony dependency is declared by the provider. Parents, sound/research references and component types resolve. Root patches are loaded without needing LoadFolders; provider selects root, 1.6 and Assets. The parent guard is defensive, not an optional-dependency declaration. |
| done | Not established independently. Six diagnostic commands finish successfully, but ConfigErrors reads 0 of 0 defs and explicitly excludes patch effects; effective configuration validation remains unverified. TEST_SCENARIOS.md has prerequisites/actions/expectations but generic recreation-menu/build instructions do not specify crafting at the sculptor bench, required research, a capable pawn/music spot and playing each carried instrument. Power/fuel cases are not applicable to these items. |
| tested | Unverified: no game launched, no scenarios executed, no runtime logs or EN/FR layouts checked. New colony and copied existing save, playing/sound/jobs and save/reload must be exercised by the user at the final gate. |

### Settings audit

Direct inventory: one patch adds three carried ThingDefs, costs, stats, material categories,
research and provider comps. No own settings storage, Verse.Mod implementation, empty page,
MainButtonDef or shortcut exists. These balance and rendering fields are content definitions,
not a demonstrated need for an Epona-specific settings page.
Provider-owned settings were also inspected: MusicalInstrumentsMod exposes PlayMusic through
its existing Musical Instruments settings page (decompiled evidence: provider-settings.cs).
This package reuses that provider behavior without overriding or duplicating configuration.
No new Epona page or shortcut is justified. Provider option effects/persistence and integration
with these instruments are not claimed tested; the sound toggle belongs in final game checks.
No RIMMSQOL or other customization integration was tested or claimed supported here.

### Translation audit

All owned label/description fields in the complete patch were read and compared semantically:
three labels and three descriptions, six nonempty French entries, native English source values.
There are no owned UI strings in code, nested translatable fields, parameters or markup to add.
Check-DefInjected resolves all six keys with zero errors using the installed provider target;
the unrelated skipped conditional patches in target indexing do not leave these keys unresolved.
The existing automated inventory confirms no duplicate/empty entries and parameter parity.
Inherited provider/vanilla UI remains dependency-owned; its runtime rendering is unverified.
localization, translation_en and translation_fr remain complete for preTest resource readiness,
not certification of in-game display.

### Commands, artifacts and limits

Replayed the existing Validate-Package.ps1 using a copy with only its results directory changed:
`./Tests/Audit-2026-09-13/Validate-Package.ps1 -Root .`.
Results: XmlFields, ConfigErrors, TypeRefs, DefInjected, XmlClasses and DefRefs reported PASS;
see run.txt and Results/. Interpret the zero-definition ConfigErrors result as no coverage,
not a successful functional configuration test. XML fields/classes, all three def references
and parents, and six injection paths were actually checked. No artificial tests were added.

artifacts.txt records identical root/distributed LICENSE, ATTRIBUTION.md and SOURCES.json,
and all seven provenance hashes matching the patch and six textures. package-hashes.json
identifies every delivered file in this audit. Historical reorganization and split evidence
was preserved, not relabelled as a newly executed 555-check split test.
The third-party notice grants no licence; silent is the inherited local source classification
(1.3 source recorded in ATTRIBUTION/SOURCES), not a newly verified permission grant.
Current upstream permissions/version claims were not rechecked online and remain unverified.
No GitHub URL is configured to test; absence of a checked URL is not a finding of a broken link.

Next transition only: establish a private GitHub repository, configured remote and first pushed
commit, and align the title/private-use wording with the private project scope. These actions
were not performed during this audit. Images and subsequent checks belong to later transitions.
Optional recommendation: make the test runner distinguish zero-coverage diagnostics from PASS.
This recommendation does not itself add another mandatory gate.

## Licence impact review - 2026-09-13

Correction to the audit: `silent` does not require a private repository or a prohibited
suffix by itself. PUBLISHING.md explicitly provides a public silent/unofficial path when
no prohibition is recorded. The private scope in the preceding audit came from AGENTS.md,
not from the licence classification. An instruction to obtain approval before publication
also does not, by itself, establish a permanent private-publication intent.

Restore the previously recorded publication_intent: public_unofficial; the audit should
not have replaced that user/project intent. The present local private scope in AGENTS.md
and this future public intent are distinct. The wording finding concerns the present private
scope only: (prohibited) is the private-build convention, not a claim that Outremer forbade
reuse. If the project is explicitly designated for the public silent route, (unofficial)
is the corresponding convention; silent itself requires no reclassification to alive or forbidden.

LICENSE is a third-party content notice, not MIT or another grant. This package copies
three definitions and six textures according to ATTRIBUTION/SOURCES, so the permission
status of that material cannot be treated like merely depending on an external mod.
No new upstream permission or prohibition was established by this review. Preserve the
silent record and attribution; do not invent licensing rights or infer prohibition from silence.

Stage remains dansMonoRepo: the missing configured GitHub remote and unverified first push
still block horsMonoRepo independently of this clarification. No publication or private/public
remote change is authorized or performed by this licence review.

## Authorized public GitHub preparation - 2026-09-13

The user explicitly confirmed creating the public GitHub repository and pushing the first
commit. This supersedes the earlier private project scope and its private-only wording
finding. Keep the existing (unofficial) title, disclaimer, attribution and silent classification.
AGENTS.md now records that authorization; Steam Workshop publication remains outside scope.
Repository destination: https://github.com/vbardales/Rimworld-Epona-Instruments-Renew.
About.xml now declares this URL and ends its English description with the matching
Source code on GitHub link. Root/distributed attribution copies were synchronized.
Stage remains dansMonoRepo until repository creation and the first push are verified.

Local artwork appeared after the audit: Mod/About/ModIcon.png and Assets/Variants/.
These ongoing files are preserved but excluded from this initial audited-content push;
no image validation or generated-image gate is claimed in this operation.
Tests/Audit-2026-09-13/provider-settings.cs is local decompilation evidence only and is
not included in the public repository. The conclusions and diagnostic outputs are retained.

## horsMonoRepo verified - 2026-09-13

Public repository: https://github.com/vbardales/Rimworld-Epona-Instruments-Renew.
Remote origin: https://github.com/vbardales/Rimworld-Epona-Instruments-Renew.git.
First push completed to main: e6e5453 (with initial extraction parent d16973d).
GitHub reports PUBLIC, nonempty and default branch main; git ls-remote confirms the
same commit as local HEAD. Local codex/source-split tracks origin/main.
Stage advanced from dansMonoRepo to horsMonoRepo after these checks.

The public silent/unofficial route was explicitly authorized by the user. The existing
title/disclaimer is now consistent with that scope; no prohibited suffix is required.
LICENSE remains a third-party notice and no upstream grant is invented. English metadata,
README, attribution copies, changelog and source links are present and coherent with origin.
About.xml parses successfully; its final source link matches its url and the verified repo.
The initial automated approval refusal was resolved by enumerating the exact two-commit,
34-file payload and checking it for common secret patterns; the subsequent push succeeded.
No untracked local artwork or audit decompilation was transmitted.

Next gate: ModIcon générée. Confirm completion of implementation and inspect/install the
new local icon before advancing. No build is applicable to this XML/texture-only package.
Preview and the later outstanding tests remain separate; no game launch or Steam Workshop
publication was performed. Historical test outputs and ongoing local artwork remain intact.


## ModIcon gate inspection - 2026-09-13

Checked revision: c4093357d41da4f16df8fc8659fb3885bbbdd2ab plus untracked local artwork.
Directly inspected Mod/About/ModIcon.png: orange winking ponytail mascot, accordion and
bagpipes are visible, with a dark background and no title text. No new generation was run.
PNG header: 1254 x 1254 pixels; file size: 1,356,479 bytes. This is the full-resolution
source, byte-identical to Assets/Variants/epona-instruments-queue-v1.png.
SHA256: 89FA656B0DC16D991A1B8E43BA895EE51F91124C8D193B42FC77B65AC3E0BA02.

Result: defect in delivered dimensions; expected ModIcon size is 128 x 128 per
STYLE_RIMWORLD.md. The 1 MB Preview limit is not being applied to ModIcon; its excessive
size is recorded separately. Readability at 32 pixels remains unverified until the
proper delivery rendition exists. No need for a new illustration was established.
Preserve the original, produce the 128 x 128 delivery rendition, inspect it at 32 pixels,
and complete the implementation check before validating ModIcon générée.

Stage remains horsMonoRepo. Mod/About/Preview.png is still absent. In accordance with the
original audit scope, this inspection does not modify or generate artwork. Local artwork
and prior audit files remain preserved and outside the public commit; only STATUS is updated.

## ModIcon générée - 2026-09-13

The user authorized completing the artwork and generating the Preview. Existing XML
implementation contains the three intended carried instruments and their texture closure;
no feature implementation remains identified. Configuration checks and game scenarios remain
tracked at their later test gates. Build: not applicable, no owned compiled code.
Preserved the exact icon original as Art/ModIcon-source.png; installed a deterministic
128 x 128 rendition in Mod/About/ModIcon.png (26,692 bytes). Inspected both 128 and 32 px:
mascot, wink and accordion are recognizable; fine bagpipe details simplify at 32 px.
Art/ModIcon-32.png records the small-size inspection. Stage: ModIcon générée.

## Preview générée - 2026-09-13

Generated the text-free illustration with the built-in image_gen tool; exact prompt:
Art/preview-generation.txt. Preserved original output as Art/Preview.png. Installed the
composed Mod/About/Preview.png: PNG, 896 x 504, 620,492 bytes, below 900 KB and 1 MB.
Directly inspected the source and final images: high overhead oblique room, tiled slate
floor, accordion/bagpipes on the right and a small faceless colonist. No concrete camera
defect identified. No historical generation report or recorded screenshot comparison needed.
Stage: Preview générée. The source and icon originals remain separate from delivered files.

## preOptions - 2026-09-13

Preview palette is recorded only in Art/preview-palette.json and consumed by
Art/render-preview.cjs, which produces Art/preview.html. Slate floor guided the cool veil
and blue secondary ink; lamp and wooden instruments guided the distinct warm amber accent.
Segoe UI was available and document.fonts.ready completed. Renew uses the 65% secondary
suffix treatment; (unofficial) occupies its own tag line; 1.6 matches supportedVersions.
Inspected final 896 x 504 and Art/Preview-268.png: title/version identifiable, rule visible,
no cropped glyphs or overlaps with the instrument subjects. The summary is intended for
full-size viewing. The PNG background was rendered separately without text for contrast checks.
Art/preview-qa.json records conservative minimum contrast across entire text rectangles:
title 6.90, tag 6.65, summary 9.57 and badge 10.35, all above 4.5:1.

About description is English, keeps the authorized unofficial disclaimer, and finishes
with the exact Source code on GitHub link matching url/origin. AI artwork attribution was
added before that final link and to synchronized root/distributed attribution documents.
All metadata XML still parses; no gameplay definitions, translations or settings changed.
Existing independent settings/localization findings remain valid but this artwork operation
stops at preOptions. Later test findings remain in remaining; no game testing is claimed.
