# Publication

What the Workshop page needs and this repository does not record anywhere else. Written 2026-10-02, for the first
envoi (`1.0.0`) and for whoever takes the mod over. Item: **3806766938**, created private by the `0.1.0` prepublication
(2026-09-23). Nothing here has been posted, uploaded or sent; every state below is a local state.

## Where it stands

- Stage `done`; `tested` is not reached (M1 for the uilleann pipes and the accordion; see `STATUS.md`). The fail-fast
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

[b]About the sound.[/b] There is no bagpipe or accordion sample in Musical Instruments (Continued), so the bagpipes and the pipes play its ocarina sound and the accordion its electronic organ sound. It is a stand-in, not a recording of the instrument.

[b]Requires[/b] Musical Instruments (Continued). No settings, no custom button. Nothing is patched. Use it if you ran the former Joy Preservation collection: the definition names are kept, so it can replace the three instruments of that collection. Saves made with it have not been validated in a game.

[b]Languages:[/b] English and French.

[b]IF I GO QUIET[/b]
If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

[b]AI-GENERATED[/b]
The mod icon and the preview artwork were generated with OpenAI image_gen; layout, delivery and testing were prepared by Nelim with AI assistance (Claude Code, Codex). The six in-game textures are Outremer's, unchanged.

[b]THANKS[/b]
Outremer, for the original Epona Instruments Standalone (definitions and textures). Mlie, for Musical Instruments (Continued), on whose bases and sounds this mod stands. The Pickle test framework and the PickleTools of this collection, for the in-game checks.

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
First public version. Adds the great highland bagpipes, the uilleann pipes and the accordion, crafted and played like the other instruments of Musical Instruments (Continued). English and French text. Their sounds borrow the ocarina and electronic organ of that mod until real recordings exist.
```

## Dependencies and DLC

- **Hard:** `Mlie.MusicalInstruments`, Musical Instruments (Continued), Workshop 2274558815. Technically required: the
  three defs inherit its `PrimitiveInstrumentBase` and `HeldMusicalInstrumentBase`, and borrow its sounds. In
  `About.xml` as `modDependencies` and `loadAfter`.
- **Nothing else.** No DLC, no optional mod, no `LoadFolders.xml` branch. `supportedVersions`: 1.6 only.
- Re-checked in the sources on 2026-10-02 against `Mod/About/About.xml`; the dependency is declared with its Workshop id.

## Gallery

Folder `Art/Gallery/`, uploaded as it is (`PUBLISHING.md`): only the images, numbered on one digit, `0-` a byte-for-byte
copy of `Mod/About/Preview.png`. Steam shows the first one large.

| File | Shows | State |
| --- | --- | --- |
| `0-preview.png` | The Preview itself | present; **compare its hash with `Mod/About/Preview.png` after every regeneration** |
| `1-the-piper.png` | A broad piper with copper hair, green jacket over an ochre shirt, playing the great highland bagpipes | scenario written, **not playable**: needs one missing step, see below |
| `2-the-sitting-piper.png` | A slight dark-haired pawn in a wool-red jacket, playing the uilleann pipes | same |
| `3-the-accordionist.png` | A round, white-haired pawn in an ochre jacket over a green shirt, with the accordion | same |
| `4-the-instruments-side-by-side.png` | The three items next to the provider's ocarina and frame drum: the size a subscriber compares against | scenario written, playable once the pass map is accepted; no pawn |

**Story, palette and the four portraits validated by the owner 2026-10-02.**

**The rule (owner, 2026-10-02): a gallery shot is a staged photograph, never a default setting.** Menus and interface
windows are the only plain screenshots; this mod has none. So the series has a story and one set: a ceilidh at dusk on
the studio's "display" stage, with a standing lamp and a shelf, placed before each shot and removed after it
(`StageDecor`). Palette: deep green, ochre and wool red. Each pawn has a chosen body (Hulk, Female, Fat), a chosen hair
colour (copper, near black, and white for the third, whose hairstyle shows its own colours) and dyed apparel; no
random silhouette. No tattoo: they need Ideology and mean nothing for this story. The story, the palette and the
choices are in the header of `Tests/Pickle/Mod/Pickle/Features/14-publication-shots.feature`.

**Open points.**
- **Step now written by Pickle Tools, not played (2026-10-02, `PickleTools/docs/STAGING.md`): `"X" stands at (x, z) facing South`. Originally asked as: put a colonist on a given cell facing the
  camera (`"Ambre" is placed at (x, z)` in the draft). Nothing in `PickleTools/docs/steps.md` moves a pawn to a cell.
  The studio's pawns also stand at their own stations, so the draft assumes the step.
- Unconfirmed until played: the defNames of the decor and the apparel (`StandingLamp`, `Shelf`, `Apparel_CollarShirt`,
  `Apparel_Jacket`), the free cells (122..128, 95..97), and that a pawn in the `MusicPlayJoy` job shows the instrument in
  hand once the game is paused.
- Order: the Preview, then the piper (the most recognisable instrument), the sitting piper, the accordionist, then the
  size reference last. A film with its sound exists (`Tests/Pickle/Evidence/`) but the pipes and the accordion film
  is not yet judged; do not upload one before it has been listened to.

Rules that apply (`PUBLISHING.md`, the owner's): the scene is the showcase colony `nelim-zen-meadow-studio`, never the
fixture (pass `wsl-deps.studio.map`, English); each upload under 2 MB; **every image is opened and looked at** before
it is called ready; a capture showing developer tools, another mod's overlay or the Pickle panel is disqualified.
`Art/Gallery/` holds only `0-preview.png`, checked 2026-10-02 byte-identical to `Mod/About/Preview.png` (sha256 a5b94a5ea629...); the old `00-preview.png` is gone.

## Adult content boxes

Answer: **no adult content** (no nudity, violence or sexual content in the mod; it adds three musical instruments).
Unconfirmed until the images above exist and have been opened: the boxes engage the page.

## Thank-you comments

None posted. The global register (`WORKSHOP_COMMENTS.md`) has **no row** for either page, so both need one. Post only
after the item is public; one comment per page, ever; at most three a day; voice of the owner, 150-350 characters,
under 1,000. Drafts, to be rewritten in her voice before posting (states: `drafted`):

**Musical Instruments (Continued)** (2274558815, Mlie; original author to verify on the page and credit too):

```text
Thanks for keeping Musical Instruments alive, Mlie :) Nine carried instruments and no bagpipe, so I borrowed your ocarina sound for a bagpipe-shaped one and your organ for an accordion. They're stand-ins until real samples exist. [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806766938]Epona Instruments Renew (unofficial)[/url]
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
