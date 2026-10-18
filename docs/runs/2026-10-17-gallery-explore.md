# 2026-10-15 to 2026-10-17: the 8.f exploration of `14-publication-shots` (images 1 and 2)

Read from each report's `summary.json`, `exitReason` first. Evidence on disk under `Tests/Pickle/Evidence/`, not in git. Pass `gallery` (`wsl-deps.gallery.map`), English, `-Filter` on the first two scenarios.

| Request | Tree | What | exitReason | Result |
|---|---|---|---|---|
| 20261015-233515-994-48dc | before 962ded7 | images 1 and 2, `2026-10-15-gallery-explore` | failed | 0 of 2. Image 1 stopped at `the "Apparel_Pants" worn by "Nelim" is dyed`: Nelim wore only a shirt and a jacket (fixed in 962ded7: Nelim wears the pants, she did not have them) |
| 2026-10-16 run (`2026-10-16-gallery-explore`) | 962ded7 | the same two scenarios | failed | 0 of 2, 26 s and 18 s. Both stop at `the provider's music joy gives no job` after 20 tries: `no MusicSpot on the map`; instruments forbidden False, reachable True, pawn awake with Artistic enabled. The scene never built a spot, which `30-play-and-listen` does in its Background |
| 20261017-232705-219-d0b9 (`2026-10-17-gallery-explore`) | 6152abb | the same two scenarios | failed | 1 of 2. Image 2 passed (85 s). Image 1 failed at `"Soleil" is offered the music joy and starts it` (84 s): no job after 20 tries, though the three MusicSpots exist (Active True) and the three instruments are not forbidden and reachable. Pawn awake, Hearing and Manipulation True, `Artistic tag disabled True`, faction Nelim's tribe |

Cause and fix (2026-10-17): the provider's music joy needs a `MusicSpot`. Each scenario of `14-publication-shots` now builds one under each performer's cell, `(x, 117)`, so it sits under the pawn and stays out of the picture. Played in d0b9: the spots exist now, image 1 still gets no job (last row). Open: why the music joy gives no job to "Soleil" while her Artistic tag is disabled.

Read from the d0b9 captures and `Player.log` (2026-10-18, before the folder was emptied):
- Image 1 at the failing step (step 43): Nelim, Flore and Soleil sit in a row on their spots, each with an instrument drawn (bagpipes, uilleann pipes, accordion). Only Soleil has no music job: she is the Fat, white-haired pawn, and her `Artistic tag disabled True` is the one difference from the others in the failure message. Next step: give Soleil a backstory that does not disable Artistic, or check how Musical Instruments reads that tag. Not tried.
- Image 2 (passed) is a usable frame: Nelim with the bagpipes at the fire, a husky beside the campfire, daylight.
- `Player.log`: nothing from this mod. Errors are the Pickle companions "did not load any content" (normal, they are code-only mods), `Epona ... Pickle tests dependency needs a downloadUrl`, FMOD/ALSA and Steam init in WSL, and two Yorkshire terriers (184778, 184780) whose `JobDriver_Ingest` threw a `NullReferenceException` in `ChewDurationMultiplier` and then lost their job. Not our defs; the dogs hold no instrument.

What this does not show: that any image sells the mod. A green run proves the route ran; the captures are read at `@review`.
