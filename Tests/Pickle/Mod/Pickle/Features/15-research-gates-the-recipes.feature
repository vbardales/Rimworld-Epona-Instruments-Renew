# TEST_SCENARIOS.md scenario 2, the negative half a film cannot show: before its research a recipe is not on offer,
# after it it is. Read through the recipe's own AvailableNow, which is what the bench's bill menu asks. The research is
# marked finished by Pickle's step (without its prerequisites, which is enough for AvailableNow: it looks at the
# recipe's own prerequisite only). The pipes need Primitive instruments, the accordion Stringed instruments.
Feature: research gates the recipes of the carried instruments

  Scenario: each recipe appears with its research
    Given the save "test-colony" is loaded
    Then Epona Instruments Renew the recipe "Make_JP_GreatHighlandBagpipes" is unavailable
    And Epona Instruments Renew the recipe "Make_JP_UilleannPipes" is unavailable
    And Epona Instruments Renew the recipe "Make_JP_Accordion" is unavailable
    When research "PrimitiveInstruments" is finished
    Then Epona Instruments Renew the recipe "Make_JP_GreatHighlandBagpipes" is available
    And Epona Instruments Renew the recipe "Make_JP_UilleannPipes" is available
    And Epona Instruments Renew the recipe "Make_JP_Accordion" is unavailable
    When research "StringedInstruments" is finished
    Then Epona Instruments Renew the recipe "Make_JP_Accordion" is available
