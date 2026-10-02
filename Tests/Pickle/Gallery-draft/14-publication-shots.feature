# Images for the Workshop page (PUBLICATION.md, "Gallery"). The state photographed is asserted before every capture;
# composition stays a visual review. Not played yet: written 2026-10-02, to be moved into Mod/Pickle/Features/ once the
# queued M1 sound requests have run (the staged tree must not move under them), then played once to find the first
# step or cell that refuses.
#
# THE SCENE IS THE OWNER'S SHOWCASE COLONY, not the test fixture: "nelim-zen-meadow-studio" of PickleTools/ScreenshotStudio,
# staged only by wsl-deps.studio.map. Every other pass skips this feature. Play it in English.
#
# The instruments sit on the "display" stage (an empty indoor demonstration stage, cell 125,96). No colonist is named
# here: the studio has Ambre, Flore, Soleil and Miel, and the player sees names a player would use.
@review @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.screenshotstudio
Feature: images for the Workshop page

  Background:
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: I frame the studio "display"

  # First image of the gallery after the Preview: the three items that the mod adds, side by side, nothing else.
  Scenario: the three instruments on the display stage
    When I spawn a "JP_GreatHighlandBagpipes" at (124, 96)
    And I spawn a "JP_UilleannPipes" at (125, 96)
    And I spawn a "JP_Accordion" at (126, 96)
    And I wait 30 ticks
    Then Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "Workshop page, the three instruments"

  # The same stage with the provider's own instruments next to them: the size reference a subscriber compares against.
  Scenario: next to the ocarina and the frame drum
    When I spawn a "Ocarina" at (123, 96)
    And I spawn a "JP_GreatHighlandBagpipes" at (124, 96)
    And I spawn a "JP_UilleannPipes" at (125, 96)
    And I spawn a "JP_Accordion" at (126, 96)
    And I spawn a "FrameDrum" at (127, 96)
    And I wait 30 ticks
    Then Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "Workshop page, with the provider's instruments"
