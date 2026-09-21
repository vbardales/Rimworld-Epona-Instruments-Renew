# TEST_SCENARIOS.md scenario 3, the part a picture can show: the three items on the floor of the
# test colony, with the right texture, the mask applied and a size that sits with the provider's own
# instruments. Nothing here asserts about the image: whether a bagpipe reads as a bagpipe, whether the
# accordion is the right size next to an ocarina, are judgements about a picture. What the suite buys is
# that they are made on the same scene, framed the same way, after every change. Green means the route
# ran, never that the picture is right - a person opens the captures.
#
# Items are spawned on fixed cells of the test colony (the row 155 the other suites build on). Spawning a
# thing that is made of stuff without naming one is to confirm on the first run: if the step refuses,
# the run says so in the failure message.
#
# These are review captures of the colony, not the Workshop page's: those need their own scene and are
# prepared at the prepublished step.
@review
Feature: what the carried instruments look like

  Background:
    Given the save "test-colony" is loaded

  Scenario: the three instruments side by side
    Given I zoom all the way in
    And I move the camera to (146, 155)
    When I spawn a "JP_GreatHighlandBagpipes" at (145, 155)
    And I spawn a "JP_UilleannPipes" at (146, 155)
    And I spawn a "JP_Accordion" at (147, 155)
    And I wait 30 ticks
    Then I take a screenshot "great highland bagpipes, uilleann pipes and accordion"

  # The size reference: the provider's own instruments, made with the same base drawSize.
  Scenario: next to the provider's own instruments
    Given I zoom all the way in
    And I move the camera to (146, 155)
    When I spawn a "Ocarina" at (144, 155)
    And I spawn a "JP_GreatHighlandBagpipes" at (145, 155)
    And I spawn a "JP_UilleannPipes" at (146, 155)
    And I spawn a "JP_Accordion" at (147, 155)
    And I spawn a "FrameDrum" at (148, 155)
    And I wait 30 ticks
    Then I take a screenshot "ocarina, the three new instruments, frame drum"

  Scenario: at the default zoom, as a player sees them
    Given I move the camera to (146, 155)
    When I spawn a "JP_GreatHighlandBagpipes" at (145, 155)
    And I spawn a "JP_UilleannPipes" at (146, 155)
    And I spawn a "JP_Accordion" at (147, 155)
    And I wait 30 ticks
    Then I take a screenshot "default zoom"
