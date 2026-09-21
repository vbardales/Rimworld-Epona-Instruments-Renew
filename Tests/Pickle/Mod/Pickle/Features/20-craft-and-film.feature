# TEST_SCENARIOS.md scenarios 2 and 3, as a film: a colonist makes each instrument at the musical
# instrument bench. `@wip`, so a default run skips it; aim at this file:
#   -Filter '20-craft-and-film.feature' -IncludeWip
# Best effort, written without ever having run: the first run decides what needs adjusting (the bench
# cell, a colonist who is free, the bill step's recipe name `Make_<defName>`, the ingredient choice for a
# stuff-made item). A failure here says which of those it was; it is not a defect of the mod until
# proven. It films what the offline tests cannot: that the recipe appears at the bench once the research is
# done, and that the product appears with a texture.
#
# What a film cannot show: sound. Playing and hearing the instruments stays manual (scenario 4).
@wip @film @review
Feature: making the carried instruments

  Background:
    Given the save "test-colony" is loaded
    And research "PrimitiveInstruments" is finished
    And research "StringedInstruments" is finished
    And a colonist "Keeper" exists
    And "Keeper" skill "Artistic" is set to level 8
    And I set "Keeper" priority "Crafting" to 1
    And a "TableMusicalInstruments" is built at (148, 155)
    And 100 "WoodLog" is spawned at the stockpile
    And 10 "ComponentIndustrial" is spawned at the stockpile
    And 100 "Steel" is spawned at the stockpile
    And 100 "Cloth" is spawned at the stockpile
    And I zoom all the way in
    And I move the camera to (148, 155)

  @timeout:900
  Scenario: the accordion is made
    When I add bill "Make_JP_Accordion" to the "TableMusicalInstruments"
    And game speed is ultrafast
    And I wait for bill "Make_JP_Accordion" to finish
    Then a "JP_Accordion" exists
    And I take a screenshot "accordion made at the bench"

  @timeout:900
  Scenario: the uilleann pipes are made
    When I add bill "Make_JP_UilleannPipes" to the "TableMusicalInstruments"
    And game speed is ultrafast
    And I wait for bill "Make_JP_UilleannPipes" to finish
    Then a "JP_UilleannPipes" exists
    And I take a screenshot "uilleann pipes made at the bench"

  @timeout:900
  Scenario: the great highland bagpipes are made
    When I add bill "Make_JP_GreatHighlandBagpipes" to the "TableMusicalInstruments"
    And game speed is ultrafast
    And I wait for bill "Make_JP_GreatHighlandBagpipes" to finish
    Then a "JP_GreatHighlandBagpipes" exists
    And I take a screenshot "great highland bagpipes made at the bench"
