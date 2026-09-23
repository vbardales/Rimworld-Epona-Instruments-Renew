# 2026-09-22 - 8 of 8 failed on an engine error attributed to no mod

Pass `sans-facultatifs`, English, filter `05-text-screens`, `30-play-and-listen`, `40-save-reload` (the suite as it
stood then), 08:04 to 08:12 Windows time. `exitReason: failed`, **8 written, 8 failed, 0 passed**; the game exited 137
after its report was complete, and the launcher kept the report.

Every failure is the same family, read in the report's `junit.xml`:
- `Log.Error during scenario: Exception while recalculating YoungstersHappy thought state for pawn Morrison: ... Accessing
  map pawns off main thread` (from `ThoughtWorker_YoungstersMoodBase.ChildrenWithMoodInColony`), and the same message as a
  step exception;
- `Log.Error during scenario: Exception ticking Megascarab36480 ... NullReferenceException in Verse.Thing.DoTick`.

No stack names the mod, Musical Instruments or a `JP_` def; the provider's decompiled code has no background thread. The first
scenario took 33 s for 29 ticks against about 11 s in earlier passes. No other suite's archived report on this machine carries
the signature. Not explained, not reproduced (the retry was refused because the maintainer's Windows game was running), and
nothing was concluded about the mod from it. The report was overwritten by the next run; only these messages were read, so
there is no raw report to point to.
