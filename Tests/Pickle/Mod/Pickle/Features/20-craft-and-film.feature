# TEST_SCENARIOS.md scenarios 2 and 3: a colonist makes each instrument at the musical instrument bench, filmed,
# and the finished item is captured.
#
# The first two versions could not finish the craft: `I wait for bill` allows 120 real seconds and a 65,000-work
# accordion does not fit; a 3,500-tick wait exceeds the five seconds a wait step is given. So the craft is
# started for real (a bill, a colonist who walks over, fetches the ingredients and works until an unfinished item
# exists), and then finished by the game's own "complete this unfinished item" flag
# (UnfinishedThing.debugCompleted, what its developer gizmo sets), through the suite's step. The recipe code that
# makes the product, its quality and its art then runs as it would for a player; only the waiting is skipped.
#
# What a film cannot show: sound (30-play-and-listen.feature asserts that a sound is started).
@film @review
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

  Scenario: the accordion is made
    When I add bill "Make_JP_Accordion" to the "TableMusicalInstruments"
    Then the "TableMusicalInstruments" has 1 bills
    When I wait 1800 ticks
    And I wait 1800 ticks
    Then a "UnfinishedSculpture" exists
    When Epona Instruments Renew the unfinished item on the bench is completed
    And I wait 300 ticks
    Then a "JP_Accordion" exists
    And I take a screenshot "accordion made at the bench"

  Scenario: the uilleann pipes are made
    When I add bill "Make_JP_UilleannPipes" to the "TableMusicalInstruments"
    Then the "TableMusicalInstruments" has 1 bills
    When I wait 1800 ticks
    And I wait 1800 ticks
    Then a "UnfinishedSculpture" exists
    When Epona Instruments Renew the unfinished item on the bench is completed
    And I wait 300 ticks
    Then a "JP_UilleannPipes" exists
    And I take a screenshot "uilleann pipes made at the bench"

  Scenario: the great highland bagpipes are made
    When I add bill "Make_JP_GreatHighlandBagpipes" to the "TableMusicalInstruments"
    Then the "TableMusicalInstruments" has 1 bills
    When I wait 1800 ticks
    And I wait 1800 ticks
    Then a "UnfinishedSculpture" exists
    When Epona Instruments Renew the unfinished item on the bench is completed
    And I wait 300 ticks
    Then a "JP_GreatHighlandBagpipes" exists
    And I take a screenshot "great highland bagpipes made at the bench"
