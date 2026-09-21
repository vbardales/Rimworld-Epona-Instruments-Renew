# TEST_SCENARIOS.md scenarios 2 and 3, as a film: a colonist starts each instrument at the musical
# instrument bench. `@wip`, so a default run skips it; aim at this file:
#   -Filter '20-craft-and-film.feature' -IncludeWip
#
# First attempt (2026-09-21) waited for the finished product with `I wait for bill`, which allows 120
# real seconds. The film showed everything up to that point working - the bench built, the recipe on
# offer once the research was finished, a colonist walking over and an "Unfinished steel accordion" on the
# bench - and the accordion (65,000 work) simply is not made in 120 s. So this version stops where the
# film is still telling something: a bill is added, the colonist works for a while, and the unfinished
# item exists. The finished products are shown by 02-review-captures.feature instead.
#
# A wait step is limited to 5 real seconds (about 2,000 ticks on this machine): a 3,500-tick wait timed
# out on 2026-09-21, hence two waits of 1,800. The colonist was already at the bench when it did.
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

  Scenario: the accordion is started
    When I add bill "Make_JP_Accordion" to the "TableMusicalInstruments"
    Then the "TableMusicalInstruments" has 1 bills
    When I wait 1800 ticks
    And I wait 1800 ticks
    Then a "UnfinishedSculpture" exists
    And I take a screenshot "accordion under construction"

  Scenario: the uilleann pipes are started
    When I add bill "Make_JP_UilleannPipes" to the "TableMusicalInstruments"
    Then the "TableMusicalInstruments" has 1 bills
    When I wait 1800 ticks
    And I wait 1800 ticks
    Then a "UnfinishedSculpture" exists
    And I take a screenshot "uilleann pipes under construction"

  Scenario: the great highland bagpipes are started
    When I add bill "Make_JP_GreatHighlandBagpipes" to the "TableMusicalInstruments"
    Then the "TableMusicalInstruments" has 1 bills
    When I wait 1800 ticks
    And I wait 1800 ticks
    Then a "UnfinishedSculpture" exists
    And I take a screenshot "great highland bagpipes under construction"
