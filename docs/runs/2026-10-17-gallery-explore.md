# 2026-10-15 to 2026-10-17: the 8.f exploration of `14-publication-shots` (images 1 and 2)

Read from each report's `summary.json`, `exitReason` first. Evidence on disk under `Tests/Pickle/Evidence/`, not in git. Pass `gallery` (`wsl-deps.gallery.map`), English, `-Filter` on the first two scenarios.

| Request | Tree | What | exitReason | Result |
|---|---|---|---|---|
| 20261015-233515-994-48dc | before 962ded7 | images 1 and 2, `2026-10-15-gallery-explore` | failed | 0 of 2. Image 1 stopped at `the "Apparel_Pants" worn by "Nelim" is dyed`: Nelim wore only a shirt and a jacket (fixed in 962ded7: Nelim wears the pants, she did not have them) |
| 2026-10-16 run (`2026-10-16-gallery-explore`) | 962ded7 | the same two scenarios | failed | 0 of 2, 26 s and 18 s. Both stop at `the provider's music joy gives no job` after 20 tries: `no MusicSpot on the map`; instruments forbidden False, reachable True, pawn awake with Artistic enabled. The scene never built a spot, which `30-play-and-listen` does in its Background |

Cause and fix (2026-10-17): the provider's music joy needs a `MusicSpot`. Each scenario of `14-publication-shots` now builds one under each performer's cell, `(x, 117)`, so it sits under the pawn and stays out of the picture. Not played yet: a new exploration ticket on this tree decides.

What this does not show: that any image sells the mod. A green run proves the route ran; the captures are read at `@review`.
