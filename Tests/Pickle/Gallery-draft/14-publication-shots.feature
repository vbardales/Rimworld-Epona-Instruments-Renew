# Images for the Workshop page (PUBLICATION.md, "Gallery"). Composition stays a visual review: a passed scenario
# proves the route ran, never that the picture sells the mod.
#
# NOT PLAYED, AND NOT PLAYABLE YET. Written 2026-10-02 in Tests/Pickle/Gallery-draft/, outside the staged companion, because
# two M1 sound requests were queued and the staged tree must not move under them. Steps marked "MISSING" do not exist in
# PickleTools/docs/steps.md; they were asked of NPT through Ticket Manager (see PUBLICATION.md, "Gallery"). Once they exist
# and the M1 requests have run: move this file to Tests/Pickle/Mod/Pickle/Features/ and play it once in the "studio" pass.
#
# THE RULE (owner, 2026-10-02): a gallery shot is a staged photograph, never a default setting. Only menus and interface
# windows are plain screenshots of themselves; this mod has none, so all of its images are staged.
#
# THE STORY. A ceilidh at dusk in the owner's meadow studio, on the "display" stage. One band of three, one portrait each,
# one shared set: a standing lamp, a shelf, potted plants, a brazier-warm floor of carpet. Palette of the whole series:
# deep green, ochre and wool red, so that the brass of the accordion and the black of the pipes stand out. Each portrait
# is taken on the same set: place the decor, photograph, remove it, next subject.
#   1. the piper (great highland bagpipes): tall, broad, copper hair, a green jacket over an ochre shirt;
#   2. the sitting piper (uilleann pipes): slight, dark hair, a wool-red jacket;
#   3. the accordionist: round, white hair, an ochre jacket over a green shirt.
# Hair colours are chosen, never rolled. Bodies are chosen (Hulk, Female, Fat), never a random silhouette. Face tattoos
# need Ideology and carry no meaning for this story, so none is set.
#
# THE SCENE IS THE OWNER'S SHOWCASE COLONY: "nelim-zen-meadow-studio" of PickleTools/ScreenshotStudio, staged only by
# wsl-deps.studio.map (screenshotmode, screenshotstudio, stagedecor). Every other pass skips this feature. Play it in
# English: the page is English.
@review @requires:nelim.pickletools.screenshotmode @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor
Feature: images for the Workshop page

  Background:
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: I frame the studio "display"

  Scenario: the piper
    Given I place the decor "StandingLamp" at (122, 95)
    And I place the decor "Shelf" at (128, 95)
    And Nelim's Pickle Tools: "Ambre" body type is Hulk
    And Nelim's Pickle Tools: "Ambre" hair colour is rgb (176, 88, 40)
    And Nelim's Pickle Tools: "Ambre" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Ambre" wears "Apparel_Jacket" dyed rgb (40, 88, 56)
    # MISSING: a step that puts a colonist on a cell and turns it to face the camera.
    And Nelim's Pickle Tools: "Ambre" is placed at (125, 96)
    And I spawn a "JP_GreatHighlandBagpipes" at (125, 97)
    When Epona Instruments Renew "Ambre" is offered the music joy and starts it
    And I wait for "Ambre" to have job "MusicPlayJoy"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "Workshop page, the piper"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: the sitting piper
    Given I place the decor "StandingLamp" at (122, 95)
    And I place the decor "Shelf" at (128, 95)
    And Nelim's Pickle Tools: "Flore" body type is Female
    And Nelim's Pickle Tools: "Flore" hair colour is rgb (44, 30, 26)
    And Nelim's Pickle Tools: "Flore" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Flore" wears "Apparel_Jacket" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Flore" is placed at (125, 96)
    And I spawn a "JP_UilleannPipes" at (125, 97)
    When Epona Instruments Renew "Flore" is offered the music joy and starts it
    And I wait for "Flore" to have job "MusicPlayJoy"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "Workshop page, the sitting piper"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: the accordionist
    Given I place the decor "StandingLamp" at (122, 95)
    And I place the decor "Shelf" at (128, 95)
    And Nelim's Pickle Tools: "Soleil" body type is Fat
    And Nelim's Pickle Tools: I let the hairstyle of "Soleil" show its own colours
    And Nelim's Pickle Tools: "Soleil" wears "Apparel_CollarShirt" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Soleil" wears "Apparel_Jacket" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Soleil" is placed at (125, 96)
    And I spawn a "JP_Accordion" at (125, 97)
    When Epona Instruments Renew "Soleil" is offered the music joy and starts it
    And I wait for "Soleil" to have job "MusicPlayJoy"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "Workshop page, the accordionist"
    And Nelim's Pickle Tools: the decor is removed

  # The size reference, not a portrait: the three items on the bare stage beside the provider's own, for a subscriber who
  # wants to compare. Still a photograph of the set, no pawn.
  Scenario: the instruments side by side
    Given I place the decor "StandingLamp" at (122, 95)
    And I place the decor "Shelf" at (128, 95)
    When I spawn a "Ocarina" at (123, 96)
    And I spawn a "JP_GreatHighlandBagpipes" at (124, 96)
    And I spawn a "JP_UilleannPipes" at (125, 96)
    And I spawn a "JP_Accordion" at (126, 96)
    And I spawn a "FrameDrum" at (127, 96)
    And I wait 30 ticks
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "Workshop page, the instruments side by side"
    And Nelim's Pickle Tools: the decor is removed
