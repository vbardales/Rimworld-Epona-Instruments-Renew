# Play and listen - MANUAL M1, on the Windows game

Not shipped. This is the one check that needs your ears: the three instruments must make a **sound** when a colonist
plays them. It is run in your own Windows RimWorld; no session ever starts that game.

The headless run is written to assert that the game *starts* the sound (the provider holds a live sound for the performer,
`30-play-and-listen.feature`); **it has not run in that state yet**, and without an audio device the game may not create
the sound at all, in which case those scenarios would fail for that reason (the failure message says whether the
performer is in the provider's notebook but has no sound). What it cannot say in any case is that a loudspeaker
renders it, which is what you check here.

## What it does

`Tests/Pickle/Mod/Pickle/Features/30-play-and-listen.feature` loads Pickle's test colony, then, for each instrument
**alone on the map**, sets the scene (colonist Jet, Artistic 12, the provider's music spot, the instrument on the ground), hands Jet the
provider's own music joy (its giver picks the spot and the instrument), waits for the performance to start, asserts the
sound is live, takes a screenshot
and lets the game run about 30 more seconds while you listen. A fourth scenario unticks the provider's sound checkbox
and expects silence, then puts the checkbox back.

## One-time setup (the companion mod's folder is already linked into `Mods`)

In the game's mod list, activate, in this order: Harmony, Musical Instruments (Continued), **Epona Instruments Renew
(unofficial)**, Pickle, **EponaInstrumentsRenew - Pickle tests**. Royalty must be active too: the provider plays the
instrument sound only when it is. Restart when the game asks.

## Run it

1. Start the game and reach the main menu (do not load a save: the scenario loads the test colony itself).
2. Open the debug actions menu (dev mode) and open the **Pickle runner**.
3. Set the pace to **Watch** (not Fast), check only the four scenarios of `hear the carried instruments played`, and
   press **Run selected**. No `@wip` tag is involved any more: nothing in the suite is set aside.
4. Turn the sound up and listen while the camera stays on the music spot.

## What to validate

| Scenario | You see | You hear | Verdict |
| --- | --- | --- | --- |
| great highland bagpipes | Jet walks to the music spot and plays | a continuous ocarina-like tone (the provider's stand-in sample) while she plays | pass |
| uilleann pipes | the same | the same tone | pass |
| accordion | the same | a continuous organ-like tone | pass |
| checkbox unticked | Jet plays | **nothing**, by design | pass |
| any of the first three | Jet plays | **nothing** | **fail**: tell me which instrument (the headless run says whether the game started the sound) |
| any | the runner waits and times out, or a red error appears | - | tell me the runner's message or the first log line; it is not a verdict on the sound |

Also note whether the instrument is drawn in her hands at a sensible place. A tone that starts late or stops early
is worth a line, not a failure.

## The provider's checkbox, in plain words

Musical Instruments (Continued) has one setting, in Options > Mod options > Musical Instruments, labelled
"Instruments play actual music (require Royalty)". Reading the provider's code (2026-09-21), the checkbox is what
**switches the instrument sound on**: ticked (the default) **and** Royalty active, a performing colonist starts the
instrument's sound; unticked, nothing is played, by design. It is not a choice between two kinds of music. The
fourth scenario covers it; you need do nothing more than listen to it.
