# Play and listen - scenarios 4 and 5, on the Windows game

Not shipped. This is the one check that needs your ears: the three instruments must make a **sound** when a
colonist plays them. It is run in your own Windows RimWorld; no session ever starts that game.

## What it does

`Tests/Pickle/Mod/Pickle/Features/30-play-and-listen.feature` loads Pickle's test colony, then, for each
instrument **alone on the map**, sets the scene (colonist Jet, Artistic 12, work type Art on top priority, the
provider's music spot, the instrument on the ground), waits for Jet to start performing, takes a screenshot and
lets the game run about 30 more seconds while you listen. It asserts no sound - it cannot - only that the
performance started and was still going.

## One-time setup (the companion mod's folder is already linked into `Mods`)

In the game's mod list, activate, in this order: Harmony, Musical Instruments (Continued), **Epona Instruments
Renew (unofficial)**, Pickle, **EponaInstrumentsRenew - Pickle tests**. Royalty must be active too: the provider
plays the instrument sound only when it is (see scenario 5). Restart when the game asks.

## Run it

1. Start the game and reach the main menu (do not load a save: the scenario loads the test colony itself).
2. Open the debug actions menu (dev mode) and open the **Pickle runner**.
3. Tick **Include @wip** and set the pace to **Watch** (not Fast), then check only the three scenarios of
   `hear the carried instruments played`, and press **Run selected**.
4. Turn the sound up and listen while the camera stays on the music spot.

## What to validate, for each of the three

| You see | You hear | Verdict |
| --- | --- | --- |
| Jet walks to the music spot and plays (the instrument in hand) | a continuous tone for as long as she plays: an ocarina-like tone for both pipes, an organ-like tone for the accordion (these are stand-in samples from the provider) | **pass** |
| Jet plays | **nothing** | **fail**: this is the regression `tickerType Normal` was meant to fix; note which instrument |
| Jet never starts (the runner waits, then times out) | - | not a verdict on the sound: the scene did not start; tell me the runner's message |
| any red error in the log window | - | note the first line |

Also note: is the instrument drawn in her hands at a sensible place (not floating away from her)? A tone that
starts late or stops early is worth a line, not a failure.

## Scenario 5, in plain words: the provider's sound checkbox

Musical Instruments (Continued) has one setting, in Options > Mod options > Musical Instruments, labelled
"Instruments play actual music (require Royalty)". Reading the provider's code (2026-09-21), the checkbox is what
**switches the instrument sound on**: when it is ticked (the default) **and** Royalty is active, a performing
colonist starts the instrument's sound; when it is unticked, nothing is played, by design. It is not a choice
between two kinds of music.

So scenario 5 is only: run the three scenarios above once with the box **ticked** (expect sound) and once with it
**unticked** (expect silence, and no error in the log). If you get sound with the box unticked, or silence with it
ticked, tell me which instrument. It needs no other setup.
