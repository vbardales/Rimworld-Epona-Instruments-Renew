# The texts the game actually loaded, in a French game. Only true in a French game, so the whole
# feature is `@wip` and skipped by a default run, where it would fail on English text. Aim at this file:
#   -Language French -Filter '11-french-texts.feature' -IncludeWip
# The strings are the ones in Mod/Languages/French/DefInjected/ThingDef/JoyPreservation.xml. A label that
# came back English here would be a DefInjected path that did not land; an accented-letter-by-letter English
# sentence would be the game's own missing-key marker (developer mode). This proves the game applied the
# texts, not that they fit in the interface (manual scenario 8).
@wip
Feature: French texts of the carried instruments

  Scenario: JP_GreatHighlandBagpipes reads in French
    Then def "JP_GreatHighlandBagpipes" field "label" is "grande cornemuse des Highlands"
    And def "JP_GreatHighlandBagpipes" field "description" is "Un instrument à anche puissant, alimenté par un sac d'air tenu sous le bras. Conçu pour s'entendre d'un bout à l'autre d'une vallée, ce qui en fait un choix discutable en intérieur."

  Scenario: JP_UilleannPipes reads in French
    Then def "JP_UilleannPipes" field "label" is "cornemuse uilleann"
    And def "JP_UilleannPipes" field "description" is "Une cornemuse à soufflet, jouée assis, à la voix plus douce et plus suave que sa cousine des Highlands. Difficile à bien jouer, et reconnaissable entre toutes quand on la joue mal."

  Scenario: JP_Accordion reads in French
    Then def "JP_Accordion" field "label" is "accordéon"
    And def "JP_Accordion" field "description" is "Une boîte à anches actionnée par un soufflet et deux claviers. Puissant, transportable, et capable de porter un bal entier à lui seul."
