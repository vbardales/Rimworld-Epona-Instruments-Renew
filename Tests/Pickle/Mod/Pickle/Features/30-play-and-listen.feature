# TEST_SCENARIOS.md scenarios 4 and 5, for a person with the sound on. Run it in the Windows game (see
# PLAY_AND_LISTEN.md at the repository root), in the in-game runner with "Include @wip" and "Watch" ticked:
# no sound comes out of the WSL install, and Watch runs at the speed a person can follow.
#
# For each instrument, alone on the map: a colonist with a high Artistic skill and the Art work type on
# top priority is sent to the provider's music spot and performs. The scenario only sets the scene and waits
# for the performance to start (job MusicPlayWork); you listen to it, then a few tens of seconds of game time
# pass. Nothing asserts a sound. Silence while the job is running is the fault to look for: the sound is
# started from CompTick, which only runs for `tickerType Normal` - the correction of 2026-09-21.
#
# `@wip`: skipped by a default run.
@wip
Feature: hear the carried instruments played

  Background:
    Given the save "test-colony" is loaded
    And a colonist "Jet" exists
    And "Jet" skill "Artistic" is set to level 12
    And I set "Jet" priority "Art" to 1
    And a "MusicSpot" is built at (146, 155)
    And I zoom in
    And I move the camera to (146, 155)

  Scenario: the great highland bagpipes are played
    When I spawn a "JP_GreatHighlandBagpipes" at (144, 155)
    And I wait for "Jet" to have job "MusicPlayWork"
    Then I take a screenshot "the bagpipes are being played"
    When I wait 600 ticks
    And I wait 600 ticks
    And I wait 600 ticks
    Then "Jet" has job "MusicPlayWork"

  Scenario: the uilleann pipes are played
    When I spawn a "JP_UilleannPipes" at (144, 155)
    And I wait for "Jet" to have job "MusicPlayWork"
    Then I take a screenshot "the uilleann pipes are being played"
    When I wait 600 ticks
    And I wait 600 ticks
    And I wait 600 ticks
    Then "Jet" has job "MusicPlayWork"

  Scenario: the accordion is played
    When I spawn a "JP_Accordion" at (144, 155)
    And I wait for "Jet" to have job "MusicPlayWork"
    Then I take a screenshot "the accordion is being played"
    When I wait 600 ticks
    And I wait 600 ticks
    And I wait 600 ticks
    Then "Jet" has job "MusicPlayWork"
