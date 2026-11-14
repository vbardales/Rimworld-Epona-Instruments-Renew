# The declared incompatibility with Epona Instruments Standalone (Epona.Culture, the original this mod replaces), looked at in a
# running game (AUDIT.md, one more pass per declared incompatibility). Played only in the pass "incompat-eponaculture":
#   Submit-PickleRun.ps1 ... -DepMap wsl-deps.incompat-eponaculture.map -Filter 45-incompat-epona-original.feature
# The documented symptom is not a crash: the defNames differ (Epona_Instrument_* against JP_*), so both sets of three instruments exist
# side by side, six instruments for three. The scenarios ASSERT that symptom (green stays green); a red means something changed.
@requires:Epona.Culture
@allow-errors
Feature: the original Epona Instruments sits beside this mod

  Scenario: both mods load
    Then mod "Epona.Culture" is loaded
    And mod "nelim.eponainstruments" is loaded

  Scenario: the three of this mod exist
    Then def "JP_GreatHighlandBagpipes" of type "ThingDef" exists
    And def "JP_UilleannPipes" of type "ThingDef" exists
    And def "JP_Accordion" of type "ThingDef" exists

  Scenario: the three of the original exist too, under their own names
    Then def "Epona_Instrument_GreatHighlandPipes" of type "ThingDef" exists
    And def "Epona_Instrument_UilleannPipes" of type "ThingDef" exists
    And def "Epona_Instrument_Accordion" of type "ThingDef" exists
