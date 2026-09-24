# TEST_SCENARIOS.md scenario 6, the part that needs no old save: the three items, and a bill in progress at
# the instrument bench, survive a save and a reload with no error. The pre-split case (a save made with the
# former Joy Preservation collection) is 50-old-collection-save.feature.
Feature: the carried instruments across a save and a reload

  Scenario: three instruments on the ground
    Given the save "test-colony" is loaded
    And I spawn a "JP_GreatHighlandBagpipes" at (145, 155)
    And I spawn a "JP_UilleannPipes" at (146, 155)
    And I spawn a "JP_Accordion" at (147, 155)
    And I wait 30 ticks
    When I save and reload
    Then 1 "JP_GreatHighlandBagpipes" exist
    And 1 "JP_UilleannPipes" exist
    And 1 "JP_Accordion" exist
    And the save round trips
    And no errors were logged

  Scenario: a bill in progress at the bench
    Given the save "test-colony" is loaded
    And research "PrimitiveInstruments" is finished
    And research "StringedInstruments" is finished
    And "Jet" skill "Artistic" is set to level 8
    And I set "Jet" priority "Crafting" to 1
    And a "TableMusicalInstruments" is built at (148, 155)
    And 100 "WoodLog" is spawned at the stockpile
    And 10 "ComponentIndustrial" is spawned at the stockpile
    And 100 "Steel" is spawned at the stockpile
    And 100 "Cloth" is spawned at the stockpile
    When I add bill "Make_JP_UilleannPipes" to the "TableMusicalInstruments"
    # Four waits of 900 ticks (a wait step is capped at 5 real seconds and the machine does 350 to 700 ticks per second: a wait of
    # 1,800 ticks timed out on 2026-09-24): the colonist walks over, fetches the ingredients and starts; the 2026-09-21 films show
    # the unfinished item between 2,400 and 3,200 ticks.
    And Epona Instruments Renew 3600 ticks pass
    Then a "UnfinishedSculpture" exists
    When I save and reload
    Then the "TableMusicalInstruments" has 1 bills
    And a "UnfinishedSculpture" exists
    And the save round trips
    And no errors were logged
