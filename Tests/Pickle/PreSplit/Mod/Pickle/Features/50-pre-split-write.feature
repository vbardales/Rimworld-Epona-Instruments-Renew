# TEST_SCENARIOS.md scenario 6b (MANUAL M2, made automatic on 2026-09-25 at Virginie's suggestion: "launch RimWorld twice in a row
# in one session"). First launch of two: the three instruments are put in the states an old save would hold, and the game is saved and
# handed to this companion, which the second launch (51-pre-split-read.feature) loads in a fresh process.
#
# Why this is the same load as a save made with the former Joy Preservation collection: that collection's definitions and this
# mod's differ only by `tickerType Normal` (git diff d16973d HEAD -- Mod/Patches/EponaInstruments.xml), which is not saved data;
# the defNames are the same, and the save carries them. What it does not cover: a save that holds something else from the old
# collection (nothing of ours), and a real old file with the old collection's texts, which nothing here reads.
#
# The states: one instrument on the ground with a Legendary quality, one Masterwork on the ground, one Excellent carried in a
# colonist's inventory, and a bill for the accordion at the instrument bench (a job that used them, the M2 text says).
#
# Played by: -Filter 50-pre-split-write -Then 51-pre-split-read -DepMap wsl-deps.pre-split.map (TESTING.md).
Feature: a game saved by one launch, for the next launch to load

  Scenario: the three instruments in the states an old save holds, saved and handed over
    Given the save "test-colony" is loaded
    And research "PrimitiveInstruments" is finished
    And research "StringedInstruments" is finished
    And a colonist "Bard" exists
    And a "TableMusicalInstruments" is built at (148, 155)
    And I spawn a "JP_GreatHighlandBagpipes" at (145, 155)
    And I spawn a "JP_Accordion" at (147, 155)
    When Epona Instruments Renew pre-split: the "JP_GreatHighlandBagpipes" on the ground is given the quality Legendary
    And Epona Instruments Renew pre-split: the "JP_Accordion" on the ground is given the quality Masterwork
    And Epona Instruments Renew pre-split: "Bard" carries a new "JP_UilleannPipes" of quality Excellent
    And I add bill "Make_JP_Accordion" to the "TableMusicalInstruments"
    Then the "TableMusicalInstruments" has 1 bills
    When Epona Instruments Renew pre-split: the game is saved as "epona-pre-split"
    And Epona Instruments Renew pre-split: the saved game "epona-pre-split" is handed to the mod "nelim.eponainstrumentsrenew.presplit"
    Then no errors were logged
