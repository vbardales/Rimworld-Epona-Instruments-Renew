# The texts the game actually loaded, in an English game. Only true in an English game, so the whole
# feature is `@wip` and skipped by a default run, where a French pass would fail on English text.
# The wrapper wants a filter with `-IncludeWip`, so aim at this file:
#   -Language English -Filter '10-english-texts.feature' -IncludeWip
# English is the native Def value written in Mod/Patches/EponaInstruments.xml; there is no English
# DefInjected file on purpose. This is the live counterpart of the offline EN/FR inventory: it proves
# the game applied the texts, not that they fit in the interface (manual scenario 8).
@wip
Feature: English texts of the carried instruments

  Scenario: JP_GreatHighlandBagpipes reads in English
    Then def "JP_GreatHighlandBagpipes" field "label" is "great highland bagpipes"
    And def "JP_GreatHighlandBagpipes" field "description" is "A loud reed instrument driven by a bag of air kept under the arm. Built to be heard across a valley, which makes it a questionable choice indoors."

  Scenario: JP_UilleannPipes reads in English
    Then def "JP_UilleannPipes" field "label" is "uilleann pipes"
    And def "JP_UilleannPipes" field "description" is "Bellows-blown pipes played sitting down, with a softer and sweeter voice than their highland cousins. Difficult to play well, and unmistakable when played badly."

  Scenario: JP_Accordion reads in English
    Then def "JP_Accordion" field "label" is "accordion"
    And def "JP_Accordion" field "description" is "A box of reeds worked by a bellows and two banks of keys. Loud, portable, and capable of carrying a whole dance on its own."
