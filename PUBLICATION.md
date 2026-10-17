# Publication

What the Workshop page needs and this repository does not record anywhere else. Written 2026-10-02, for the first
envoi (`1.0.0`) and for whoever takes the mod over. Item: **3806766938**, created private by the `0.1.0` prepublication
(2026-09-23). Nothing of `1.0.0` has been posted, uploaded or sent (only the private `0.1.0` item exists); every state below is a local state.

## Where it stands

- Stage `playTests[1.0.0]`; `shootGallery` is not reached (M1 for the uilleann pipes and the accordion; see `STATUS.md`). The fail-fast
  policy of `AUDIT.md` lets `1.0.0` go out once no red is open and the gaps are written down; it is the owner's call.
- Version to publish: **1.0.0**, `unreleased` in `CHANGELOG.md` above the `0.1.0`. Not written yet: the `## [1.0.0]`
  section has to exist and be dated before the dry-run.
- Rollback target: none yet. `0.1.0` has no tag. Choose it before publishing and tag the commit (`v0.1.0` on the
  commit that added `PublishedFileId.txt`, or the commit sent as `1.0.0`).
- Description source: **this file**, the block under `## Steam description`. The CI generates the `<description>` of
  `About.xml` from it and refuses a publish when they differ, so `About.xml` is edited by the CI route, not by hand.
  Its current text still says "No Steam Workshop release has been made": stale, replaced by the block below.

## Steam description

```markdown
UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

Three carried instruments, for pawns who play music to relax: the great highland bagpipes, the uilleann pipes and the accordion. Musical Instruments (Continued) has nine carried instruments and no bagpipe and no accordion; these three fill that gap and duplicate nothing.

They are crafted and played like every other instrument of Musical Instruments (Continued): a pawn picks one up and plays it as a joy activity.

[b]About the sound.[/b] Musical Instruments (Continued) has no bagpipe or accordion sample, so each of the three instruments plays its own recording (Pixabay, credited in ATTRIBUTION.md).

[b]Requires[/b] Musical Instruments (Continued). No settings, no custom button. Nothing is patched. Use it if you ran the former Joy Preservation collection: the definition names are kept, so it can replace the three instruments of that collection. Saves made with it have not been validated in a game.

[b]Languages:[/b] English and French.

[b]IF I GO QUIET[/b]
If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

[b]AI-GENERATED[/b]
The mod icon and the preview artwork were generated with OpenAI image_gen; layout, delivery and testing were prepared by Nelim with AI assistance (Claude Code, Codex). The six in-game textures are Outremer's, unchanged.

[b]THANKS[/b]
Outremer, for the original Epona Instruments Standalone (definitions and textures). Mlie, for Musical Instruments (Continued), on whose bases this mod stands. Brian Cradden and freesound_community, on Pixabay, for the three recordings. The Pickle test framework and the PickleTools of this collection, for the in-game checks.

Credits, source and what was changed: ATTRIBUTION.md in the repository. Licence: see LICENSE.

[url=https://github.com/vbardales/Rimworld-Epona-Instruments-Renew]Source code on GitHub[/url]
```

To check before the first envoi: the credit line for the original author of Musical Instruments (verify on the page, as
`AUDIT.md` asks, and credit the original author **and** Mlie); that "can replace the three instruments" is true for a
real old save (the pre-split pass covers the definitions, not a file from the owner's disk); the `AI-GENERATED` tool
names (the owner's wording wins).

## Change note (Steam, first envoi)

Written now so the form does not find it missing. It opens with the version.

```markdown
[b]1.0.0[/b]
First public version. Adds the great highland bagpipes, the uilleann pipes and the accordion, crafted and played like the other instruments of Musical Instruments (Continued). English and French text. Each plays its own recording.
```

## Dependencies and DLC

- **Hard:** `Mlie.MusicalInstruments`, Musical Instruments (Continued), Workshop 2274558815. Technically required: the
  three defs inherit its `PrimitiveInstrumentBase` and `HeldMusicalInstrumentBase`, and use its `MusicalInstruments` component classes. In
  `About.xml` as `modDependencies` and `loadAfter`.
- **Nothing else.** No DLC, no optional mod, no `LoadFolders.xml` branch. `supportedVersions`: 1.6 only.
- Re-checked in the sources on 2026-10-02 against `Mod/About/About.xml`; the dependency is declared with its Workshop id.

## Gallery

Folder `Art/Gallery/`, uploaded as it is (`PUBLISHING.md`): only the images, numbered on one digit, `0-` a byte-for-byte
copy of `Mod/About/Preview.png`. Steam shows the first one large. The accepted captures without their subtitle live in
`Art/Gallery-clean/` under the same names (`GALLERY.md`, "Sous-titres"); `Art/Gallery/` holds the subtitled images.

**Rewritten 2026-10-15, nothing played yet.** The first plan (2026-10-02: three invented pawns in the owner's meadow studio) did not
follow the rules set since: scenes play in the Sanctuary (`AUDIT.md` 9.a), Nelim is the protagonist, the photographer picks an hour
per image, expressions, hairstyles and props are chosen, and every staged image takes a subtitle. The scenarios are in
`Tests/Pickle/Mod/Pickle/Features/14-publication-shots.feature` (header: story, who wears what, shooting plan), pass map
`Tests/Pickle/wsl-deps.gallery.map`, English.

**The story.** A ceilidh at the hermit's hearth. Nelim hosts and plays the great highland bagpipes; two guests bring the other two
instruments, Flore the uilleann pipes and Soleil the accordion. One set, the stone hearth of the hall (named place `fire-pit`),
photographed at its own hour each time. Palette: deep green, ochre, wool red. Image 1 is the whole band at night (the most
demonstrative one goes first); the next ones tell how the evening began; the last is the morning after.

| File | Hour | Shows | State |
| --- | --- | --- | --- |
| `0-preview.png` | | The Preview itself | present; compare its hash with `Mod/About/Preview.png` after every regeneration |
| `1-the-band-by-the-fire.png` | 20 | Nelim, Flore and Soleil in a row north of the lit hearth, facing the camera, all three playing; torches on both sides; Shogun the labrador at the hearth, facing the camera | scenario written, not played |
| `2-nelim-tunes-the-bagpipes.png` | 17 | Nelim alone with the great highland bagpipes, tight on her and the bag; Yuki the husky beside her, facing the camera | scenario written, not played |
| `3-flore-and-the-uilleann-pipes.png` | 18 | Flore alone with the uilleann pipes | scenario written, not played |
| `4-soleil-and-the-accordion.png` | 19 | Soleil alone with the accordion | scenario written, not played |
| `5-the-morning-after.png` | 8 | The three new instruments and the provider's ocarina and frame drum in a row on the hearth floor, Nelim a step behind: the size a subscriber compares against | scenario written, not played |

**Who wears what** (all chosen). Nelim: her own body, hair, face (two brows, a smirk, blink) and brown eyes, which are the fixture's
defaults; an ochre shirt, a wool-red jacket, her trousers dyed deep green. Flore: Female body, dark hair (44, 30, 26) in the braid
`VHE_SideBraid`, an ochre shirt, a green jacket, a wool-red kilt, face kit "calm". Soleil: Fat body, white hair so the braid `VHE_Braid`
shows its own colours, a green shirt, an ochre jacket, a deep-red kilt, face kit "smile". Two mods added to the pass for the props:
Irn Bru And Other Scottish Delights (`geodesicdragon.irnbru`, Workshop 2086949615, the kilt `IrnBruMod_KiltApparel`) and Vanilla Hair
Expanded (`VanillaExpanded.VHE`, Workshop 1888705256, the braids). If these two mods are in the images, they join the THANKS of
the description (`PUBLISHING.md`, "Remerciements": any integration named or exercised). Not done yet; decided when the images are accepted.

**Unconfirmed until a first run:** the defNames `Apparel_CollarShirt`, `Apparel_Jacket`, `TorchLamp`, `VHE_SideBraid`, `VHE_Braid`; the face kits
(the kits are not yet read by `SanctuaryBacklot/docs/GALERIE.md`); that `Shogun` and `Yuki` exist in the save under these names (from the owner,
not checked); the free cells of `fire-pit` (from `SANCTUAIRE-CASES.md`); that a pawn in the `MusicPlayJoy` job shows the instrument in hand
once the game is paused; what Facial Animation draws on each face (job and mood decide too). Every image is opened and judged before it
goes to the owner (`GALLERY.md`, "La session est la metteuse en scène").

Rules that apply (`PUBLISHING.md`, `GALLERY.md`, the owner's): each upload under 2 MB and under 8 MB in all, in both folders; **every image is opened and looked at**
before it is called ready; a capture showing developer tools, another mod's overlay or the Pickle panel is disqualified.
`Art/Gallery/` holds only `0-preview.png` today, byte-identical to `Mod/About/Preview.png` (sha256 recorded 2026-10-02, to compare again after the 2026-10-13 regeneration).

## Gallery subtitles

One line of English written at the bottom of each staged image, like a film subtitle (`GALLERY.md`, "Sous-titres", owner rule 2026-10-15).
No subtitle on `0-` (the Preview) and none on an interface window (this mod has none). Burned in by
`scripts/Add-Subtitle.ps1` from the clean original in `Art/Gallery-clean/`; a changed line is replayed from the clean original.

| Index | File | Subtitle |
| --- | --- | --- |
| 1 | `1-the-band-by-the-fire.png` | By night the hearth hall is a ceilidh: bagpipes, uilleann pipes and an accordion, all new. |
| 2 | `2-nelim-tunes-the-bagpipes.png` | It began at dusk, with Nelim tuning the great highland bagpipes. |
| 3 | `3-flore-and-the-uilleann-pipes.png` | Flore answers on the uilleann pipes, softer and sweeter. |
| 4 | `4-soleil-and-the-accordion.png` | Soleil brings the accordion, loud enough to carry a whole dance. |
| 5 | `5-the-morning-after.png` | Next morning the three newcomers rest beside the ocarina and the frame drum. |

## Adult content boxes

Answer: **no adult content** (no nudity, violence or sexual content in the mod; it adds three musical instruments).
Unconfirmed until the images above exist and have been opened: the boxes engage the page.

## Thank-you comments

None posted. The global register (`WORKSHOP_COMMENTS.md`) has **no row** for either page, so both need one. Post only
after the item is public; one comment per page, ever; at most three a day; voice of the owner, 150-350 characters,
under 1,000. Drafts, to be rewritten in her voice before posting (states: `drafted`):

**Musical Instruments (Continued)** (2274558815, Mlie; original author to verify on the page and credit too):

```text
Thanks for keeping Musical Instruments alive, Mlie :) Nine carried instruments and no bagpipe or accordion, so I added three on top of your framework, each with its own sound. [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806766938]Epona Instruments Renew (unofficial)[/url]
```

**Epona Instruments Standalone** (2627618308, Outremer; the mod is unofficial and carries his definitions and textures):

```text
Hi Outremer, your bagpipes and accordion had been invisible since the 1.4 folder change (no LoadFolders, so nothing read). I put the three back for 1.6 with a sound and a French text, your textures untouched. If you'd rather I take it down, say so and it's gone. [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806766938]Epona Instruments Renew (unofficial)[/url]
```

Both drafts say only what is tested offline or in the game; neither claims a compatibility the author did not declare.
Check the last comments of each page before posting (language, mood, whether the author answers).

## After the envoi

- Commit `About/PublishedFileId.txt` at once (already in git for `0.1.0`; a lost file means a second item).
- Steam creates every item private; RimWorld never calls `SetItemVisibility`. The owner switches it to public by hand,
  after subscribing to her own item.
- `CHANGELOG.md` `## [1.0.0]`, tag `v1.0.0` and the GitHub release come from the CI (`publish-tag.yml`) after a
  successful envoi: dry-run of the exact commit, `publish` with the full 40-character SHA, `steam-production` approved by
  the owner alone. Not by a session, not by hand.
- Then the non-regression passes, as small tickets: the French pass on the final tree and the full English pass.
