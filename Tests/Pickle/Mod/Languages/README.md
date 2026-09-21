# Why this folder exists

This folder is not a translation. It exists so that RimWorld stops logging

    Mod EponaInstrumentsRenew - Pickle tests did not load any content.

at every start. `ModContentPack.AnyContentLoaded()` is satisfied by any file under a
`Languages/` folder, and this companion otherwise ships only `About/` and feature files, which
Pickle loads itself and RimWorld does not count.

The file is never opened or parsed: the game enumerates *directories* under `Languages/`.
Do not add a language subfolder here, or its keyed and DefInjected files would be loaded for real.
