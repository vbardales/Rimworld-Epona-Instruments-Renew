# Second launch of two (see 50-pre-split-write.feature): a fresh process loads the game the first launch saved, and the
# instruments must be there as they were: their place, their quality, the one in the inventory, the bill at the bench; then the
# same after a save and a reload of this process, and no error logged anywhere.
Feature: a game saved by another launch, loaded by this one

  Scenario: the three instruments, their qualities, the carried one and the bill are as they were saved
    Given mod "nelim.eponainstrumentsrenew" is loaded
    And the save "epona-pre-split" is loaded
    When I wait 120 ticks
    Then 1 "JP_GreatHighlandBagpipes" exist
    And 1 "JP_Accordion" exist
    And Epona Instruments Renew pre-split: the "JP_GreatHighlandBagpipes" on the ground lies at 145 155
    And Epona Instruments Renew pre-split: the "JP_Accordion" on the ground lies at 147 155
    And Epona Instruments Renew pre-split: the "JP_GreatHighlandBagpipes" on the ground has the quality Legendary
    And Epona Instruments Renew pre-split: the "JP_Accordion" on the ground has the quality Masterwork
    And Epona Instruments Renew pre-split: "Bard" carries a "JP_UilleannPipes" of quality Excellent
    And the "TableMusicalInstruments" has 1 bills
    And no errors were logged
    When I save and reload
    Then Epona Instruments Renew pre-split: the "JP_Accordion" on the ground has the quality Masterwork
    And Epona Instruments Renew pre-split: "Bard" carries a "JP_UilleannPipes" of quality Excellent
    And the "TableMusicalInstruments" has 1 bills
    And the save round trips
    And no errors were logged
