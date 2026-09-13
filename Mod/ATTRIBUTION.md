# Epona Instruments Renew - attribution

Source: Epona Instruments Standalone. Authors: Outremer. Source versions: 1.3.

Workflow classification: silent, carried from the reviewed Joy Preservation source record.
No blanket licence or author permission is invented. Source links and historical migration
details follow. Historical personal-use wording is retained as evidence; local separation
is not a public release or proof of new rights. Missing upstream access remains unverified.

On 2026-09-13, the maintainer authorized public GitHub distribution under the workflow's
silent/unofficial classification. This decision is not permission from Outremer and does
not replace the third-party notice in LICENSE. Credits and the removal commitment remain.
The historical personal-use account below describes the earlier extraction context.

Transferred from Joy Preservation revision eafda413babde8984007380e3435e19b872ea001.
Only the listed recreation files and their language/texture closure are included.

## Historical extraction account

## Bagpipes and accordion

- **Source:** "Epona Instruments Standalone" — Steam Workshop [2627618308](https://steamcommunity.com/sharedfiles/filedetails/?id=2627618308)
- **Author:** Outremer
- **Original target version:** 1.3
- **Taken:** the three instrument `ThingDef`s and their six textures (`GreatHighlandPipes`,
  `UilleannPipes`, `Accordion`, plus the `_m` masks)
- **Not taken:** nothing else — the mod contained only these.
- **Licence:** none declared. **Personal use.**

### Why it was invisible

Every def lives in a `1.3/` folder and the mod has **no `LoadFolders.xml`**. RimWorld reads only
the mod root and the folder for the current version, so since 1.4 **nothing in this mod has ever
been read**. It was not broken in the usual sense — it was absent.

It is republished here rather than by dropping a `LoadFolders.xml` into the Steam copy: Steam
rewrites its own files, and the fix would not follow onto the Deck.

### What it fills

Mlie's Musical Instruments (Continued) supplies nine carried instruments — frame drum, ocarina,
guitar, bass guitar, banjo, balalaika, violin, cello, double bass — but **no bagpipe and no
accordion**. These three duplicate nothing.

### Corrections to the original

| Problem | Fix |
| --- | --- |
| No `CompProp_PlayingMusic`: the instruments would have been **silent** | added, with the nearest sounds in Mlie's catalogue — `MIC_Ocarina_Play` for the pipes, `MIC_ElectronicOrgan_Play` for the accordion |
| A home-made `EponaMusicalInstrumentBase`, a field-for-field copy of Mlie's | replaced by Mlie's real bases (`PrimitiveInstrumentBase`, `HeldMusicalInstrumentBase`) |
| Labels tied to the Epona setting ("Great Stalion Bagpipe", "Epones Pipe", "Cavalier Accordion") | made generic; extracted alone, that lore no longer applies |

The sounds are a stopgap and are meant as one: Mlie has neither a bagpipe nor an accordion sample.
One line to change the day real recordings exist.

---
