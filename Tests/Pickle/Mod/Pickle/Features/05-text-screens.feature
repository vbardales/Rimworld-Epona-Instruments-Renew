# TEST_SCENARIOS.md scenario 8, the part a screenshot can show: how each instrument's name reads in the
# game's own interface. Language-agnostic on purpose: the game's language is fixed at launch, so the same
# file is run twice, once per language (`-Language English`, `-Language French`), and the reports are
# compared by a person.
#
# The name is the hover label at the bottom left of the screen, which names the thing under the pointer.
# The pointer sits at the centre of the screen, and the camera is centred on the item's cell, so each
# capture names one instrument (2026-09-21: the first English captures read "Steel uilleann pipes (normal)").
# The three items are one cell apart and overlap, which is why each capture has its own centre.
#
# `@wip`: aim at it with `-IncludeWip -Filter '05-text-screens.feature'`. Developer mode is on in every Pickle
# run, so a key missing from the active language shows as accented letters, letter by letter; a clean English
# word inside a French game is a text that never went through translation. Nothing here asserts that: a person
# reads the images.
@wip @review
Feature: how the carried instruments are named on screen

  Background:
    Given the save "test-colony" is loaded
    And I zoom all the way in
    And I spawn a "JP_GreatHighlandBagpipes" at (145, 155)
    And I spawn a "JP_UilleannPipes" at (146, 155)
    And I spawn a "JP_Accordion" at (147, 155)

  Scenario: the great highland bagpipes
    When I move the camera to (145, 155)
    And I wait 30 ticks
    Then I take a screenshot "great highland bagpipes, name at the bottom left"

  Scenario: the uilleann pipes
    When I move the camera to (146, 155)
    And I wait 30 ticks
    Then I take a screenshot "uilleann pipes, name at the bottom left"

  Scenario: the accordion
    When I move the camera to (147, 155)
    And I wait 30 ticks
    Then I take a screenshot "accordion, name at the bottom left"
