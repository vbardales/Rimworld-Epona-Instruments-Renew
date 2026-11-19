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
  - Gallery: ticket 12a4 (images 1-5, tree f1c477d) filed 2026-11-19; read it, score-gallery, REDO or candidate, then rate-gallery (subtitles). Open work and defects: BACKLOG.md
social_preview_sha256: c148dd428c7ff6c6a9cea82abe7b7a0e2b1c0a095fb10e3c6c4210f49bbfce4c
code_review_sha: 915cb7db501415ba59322065faafab0ede420c45
protocols_read_sha: 649cfe7207b76e149ce5d64d3f97e53f89a0b972
---
# Epona Instruments Renew - status

Journal up to 2026-10-03 (audits of 2026-09-13/21/10-02, Pickle runs, 0.1.0 prepublication, Preview migration): `docs/runs/status-journal-to-2026-10-03.md`.

## Ecosystem - 2026-11-13 (PiI, 8.0; `docs/inventory/ecosystem-steam/EponaInstrumentsRenew.md`, d9c98a1)

Source of every line: Steam search by Chrome (PiI), plus local scan `same-pattern` of the whole Workshop folder. Nothing subscribed.

| Workshop id | Title | Versions | Type |
|---|---|---|---|
| 2627618308 | Epona Instruments Standalone (original, defNames `Epona_Instrument_*`, no collision with `eponair_*`) | 1.3 | original, dead for 1.6 |
| 2624033197 | Epona race Renaissance | not in registry | same author family, carries the instruments |
| 3250668195 | Epona race Renaissance (Unofficial) (`Epona.EponaRenaissanceUno`) | 1.5, installed | CHECKED 2026-11-14: carries the same three instruments (`Epona_Instrument_GreatHighlandPipes`, `_UilleannPipes`, `_Accordion`, via a Musical Instruments patch in `1.5/Patches/ModPatches/Music.xml`, own research); no collision with our `eponair_*`; `LoadFolders.xml` has only a `<v1.5>` block, so nothing loads in 1.6 (read from files, not played) |
| 2483902695 | Epona Race (Total Medieval) | 1.2 | race mod, same author |
| 3514746737 | Epona Dynastic Rise | 1.5 to 1.7 | newer Epona race line |
| 3134829573 | Musical Instruments (Continued) Patch | 1.4 to 1.7 | patch for our dependency; READ 2026-11-18 (`RunningBugs.MusicPatch`, 1.4 to 1.7): adds its own `MusicPatch.CompProp_PlayingMusic` and sounds `MIC_*_Play` to the Musical Instruments (Continued) defNames only (FrameDrum, Ocarina, Marimba, Balalaika, Banjo, Cello, Guitar...), none of ours (`JP_*`), no pipes or accordion; nothing to reuse, no conflict |

Verdict: no duplicate for 1.6; no other mod ships bagpipes or an accordion for Musical Instruments. No mod patches or retextures ours.

## NSB - 2026-11-15 (sync-nsb-npt, nothing rewritten yet: write-shotlist does it)

Places read: 2026-11-15
Tribe read: 2026-11-18
Steps read: 2026-11-19 (NPT since 11-18: only its own docs migration, no step or catalogue changed; NSB unchanged since 20:00)

Changed in NSB since the 2026-10-15 plan: `hearth-hall` and `fire-pit` validated by Virginie (2026-11-08, NPT photos lot 5h, ticket 1140); `fire-pit` is still (181, 115), free cells at z 117 are 172-173, 176, 178-185, 187-190 (draft cells 176, 178, 181, 183, 187 all free, but a TorchLamp is already at (181, 110) and (172, 114)). The draft header says Nelim is the only colonist: false, NSB has 17 humans. Owner rules (2026-11-05) said back: everything in NSB free; a colonist or domestic animal outside NSB needs her express validation; any property of a colonist (body, hair, face, skin, genes) too; every outfit free; every animal the mod includes must be shot (this mod adds none: rule 5 not applicable, three instruments only).

Decision: Flore and Soleil (invented guests, with body, hair and face set by the draft) are NOT in NSB and no validation exists: replaced in the plan by NSB pawns played as the roster says, outfits only. Uilleann pipes: Miel (roster entry exists, looks still `D` in AVANCEMENT.md: usable, flagged). Accordion: Soren (looks `V`). The two VHE braids and the hair, body and face steps of the draft fall away (rule 3); VHE leaves the pass map unless an NSB pawn already wears it. Kilt `IrnBruMod_KiltApparel`: outfit, free, kept or dropped at write-shotlist. NPT: all steps used by the draft still exist in `PickleTools/docs/steps.md` (wears dyed, face kit, place decor, stands at, animal stands at, temperature); StageDecor/ColonistRace changed since 2026-11-11 (decor burns, filth, floor) without breaking any of them.

| Place | Shots | Changes for the gallery | Last read |
| --- | --- | --- | --- |
| `fire-pit` (hearth-hall) | 1 to 5 | two TorchLamp placed (draft cells 176 and 187, z 117) | 2026-11-15 |

| Colonist | Shots | Outfit per shot | Last read | Exceptions |
| --- | --- | --- | --- | --- |
| Nelim | 1, 2, 5 | ochre shirt, wool-red jacket, deep-green trousers (free; her face and body untouched) | 2026-11-15 (profile lines) | none |
| Miel | 1, 3 | to choose at write-shotlist (free); VALIDE.md 2026-11-17 lists three validated daily outfits (overalls orange + builders jacket green; overalls alone; plaid shirt orange + trousers green) | 2026-11-18 (VALIDE, AVANCEMENT) | none, played as the roster says: Caramel lipstick `VanityCase_LipstickCaramel`, equal orange eyes `Eyes_Orange`, body Thin Female (temporary VTW go) |
| Soren | 1, 4 | to choose at write-shotlist (free) | 2026-11-15 (profile, AVANCEMENT) | none, played as the roster says |
| Flore, Soleil | none now | removed from the plan | | were outside NSB, no validation, dropped |

| Animal | Shots | Outfit | Last read | Exceptions |
| --- | --- | --- | --- | --- |
| Shogun (labrador, linked to Nelim) | 1 | none | 2026-11-15 (roster) | none |
| Yuki (husky, linked to Soren) | 2 | none | 2026-11-15 (roster) | none |

| Included animal (rule 5) | Shots |
| --- | --- |
| none: the mod adds no animal | not applicable |

Sync 2026-11-18: NSB docs since 2026-11-15 changed only for other pawns, plus Miel validated (above) and a plan to rebuild the save `Nelims-tribe-v2` (same site names, centres and free zones kept; nothing built, no effect now). NPT: only `face-parts.md` (vanilla face) changed, no step used here moved. Places, animals and roster docs untouched since 2026-11-15, no change to the plan.

Plan score run 2 (score-gallery, 2026-11-16, no capture yet: rating the plan): after adding in-frame decor to images 1 and 5 (a placed fully grown PlantPot, a DiningChair, a mug; b was `weak` there because the kept props sat outside the frame), every criterion a to g and j reads `ok` and k reads `ok`: 5.0 on each of the five scenes. Not verified in game: the cells, the interaction cell and facing of an instrument, the defNames of the ocarina and the frame drum. Gate 2 done 2026-11-18: PiT answered that no "colonist as in the roster" step exists; option (b) chosen (blocks of MIEL-PROFIL.md 503b567 and SOREN-PROFIL.md pasted with existing steps, rule 3: played as the roster says, no owner question). The five scenarios of `Tests/Pickle/Mod/Pickle/Features/14-publication-shots.feature` (moved out of `Gallery-draft/`) are rewritten for Nelim, Miel and Soren; `Check-ShotlistVsScenario.ps1` exit 0; pass map `wsl-deps.gallery.map` updated (VHE out; Roo HD hair, Tribal Tattoos, Genes Expanded Skin, VanityCase, facial-animation fixes in). Cells moved to free ones of SANCTUAIRE-CASES.md (DiningChair 185,118; Yuki 183,116; Shogun 178,116). Not verified in game: cells, interaction cell of an instrument, smile kit before the face parts, `carries the item` as the mid-carry. Mug: Cat (2026-11-18) found no mug, cup or tankard def in vanilla, DLC or the pass map; a Beer bottle (Core item, `I spawn a "Beer"`) stands in on the Stool at (176, 118) (image 1) and on the stone at (183, 118) (image 5); not verified in game: that the item rests on the Stool. A real tankard would need a decor mod from PiI and a capture from PiT (not asked). Next: first exploration ticket (file-pickle-ticket).

## Gallery state (2026-11-18, end of session)

- Runs: 4490 (images 1 green, 4 red: Artistic disabled), f08b (5 green, 2-4 red: NullReference of the PiT backstory step), a8e8 (2-4 green after PiT fix b1f3da33). Proof kept: `Tests/Pickle/Evidence/gallery-images-1-5-explore` (JPEG, RELEASE.md).
- Fix: Miel and Soren get `has no backstory` right after `a colonist ... exists` (random backstory disabled Artistic; roster properties untouched, rule 3 not in play).
- Staging decision (director, 2026-11-18; owner: "c'est toi la metteuse en scene"): a8e8 showed instruments on the hearth floor and the performers standing idle. Scenarios 1-4 now use `carries the item` for the performer (Nelim, Miel, Soren), no `MusicSpot`, no instrument spawn at (x,116), no music joy job (the job draws nothing and `carries the item` holds only without a job). Image 5 unchanged. Header of `14-publication-shots.feature` updated; `Check-ShotlistVsScenario.ps1` answers "no gallery feature with a shotlist header" (checked nothing, cause not found).
- Open ticket: `7a43` (images 1-4, instruments held, commit after 286d8d8). Not verified in game: held instrument rendering of a performer, accordion in hands.
- Next: read `7a43` (`summary.json`, `junit.xml`, then screenshots), triage the Inbox folder `gallery-explore-4`, run `score-gallery` on the captures, `REDO` or `candidate` per scene, then subtitles (owner types `/mod-workflow:rate-gallery`), `thanks_drafted_line` at `writeReleaseDocs`.

Update 2026-11-19: 7a43 green 5 of 5, held instruments show in all four images (pipes, uilleann pipes, accordion in hands). score-gallery: all four REDO, no dog in any frame (plan: Yuki images 1-3, Shogun image 4). Cause (read in the feature, not yet proven in game): `the animals are kept out of the sanctuary "fire-pit"` sends the staged dogs away again; replaced by `are removed from` in the five scenarios (f1c477d). Also seen: image 1 pipes about 14 percent of the frame height (plan: a third), image 2 wide instead of close. Old captures 1-4 deleted (Inbox and Evidence). Ticket 20261119-213205-618-12a4 (images 1-5, English, wsl-deps.gallery.map) waits; evidence folder `Tests/Pickle/Inbox/gallery-explore-5`.
