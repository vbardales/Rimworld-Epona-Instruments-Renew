# Changelog

## [0.1.0] - 2026-09-23

- Creation of a publishIdFile: `Mod/About/PublishedFileId.txt` (Workshop item 3806766938), from a first upload
  whose only purpose is to create the item. Steam creates every item private. This entry does not say that
  the mod is public or tested.

What the upload contained: `Mod/` as at commit `41ad1d5`, and nothing else changed since this file.

- Three carried instruments added on top of Musical Instruments (Continued): great highland bagpipes, uilleann
  pipes and accordion, with their six textures and a French translation.
- `tickerType` set to `Normal` on the three instruments, like every Musical Instruments (Continued) instrument:
  the playing sound is started from `CompTick`, which never ran for the inherited `Never`. Not yet observed in a
  game.
- 128 px icon, 896 x 504 preview, English description with the unofficial disclaimer and the source-code link.
- Definition names are preserved from the former Joy Preservation collection; saves made with it are not yet
  validated.

Not part of the upload: the tests, the scenarios and the documentation of the repository (see TESTING.md and
STATUS.md). The upload also generated `.dds` textures next to the PNGs; they are ignored by git (`.gitignore`).
