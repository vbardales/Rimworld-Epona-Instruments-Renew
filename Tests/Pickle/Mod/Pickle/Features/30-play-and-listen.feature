# TEST_SCENARIOS.md scenarios 4 and 5: a colonist plays each instrument, and the game starts its sound.
#
# Two ways to run it, the same file:
#   - headless (Run-PickleWsl.ps1), with no loudspeaker (written 2026-09-23, not yet played: without an audio device the
#     game may not create the sound at all, and the failure message then says so): the suite's step reads the provider's live Sustainer for the
#     performer. That sustainer is started from CompTick, which only ticks for `tickerType Normal` - the correction
#     of 2026-09-21 - so "heard playing" here means "the game started the sound of this instrument", and its absence
#     is exactly the regression. It does not say that a loudspeaker then renders it;
#   - on the Windows game, with the sound on, in the in-game runner ("Watch" pace): PLAY_AND_LISTEN.md, for the
#     person to hear it. The scenarios pause long enough after the performance starts for that.
#
# For each instrument, alone on the map: a colonist with a high Artistic skill is given the provider's music joy (its own
# giver chooses the spot and the instrument; job MusicPlayJoy, 4,000 ticks) and performs. Not the work route: the provider's
# WorkGiver only offers a venue that is itself an instrument (2026-09-23: a plain music spot never got the work, HasJobOnThing
# false while every one of its checks held). The sound is the provider's stand-in sample (an ocarina for both
# pipes, an electronic organ for the accordion).
#
# The provider only starts an instrument's sound when its own checkbox is ticked (the default) and Royalty is
# active: the last scenario unticks it and asserts silence, then the checkbox is put back by the suite's step.
Feature: hear the carried instruments played

  Background:
    Given the save "test-colony" is loaded
    And a colonist "Jet" exists
    And "Jet" skill "Artistic" is set to level 12
    And a "MusicSpot" is built at (146, 155)
    And I zoom in
    And I move the camera to (146, 155)

  Scenario: the great highland bagpipes are played, and heard
    When I spawn a "JP_GreatHighlandBagpipes" at (144, 155)
    And Epona Instruments Renew "Jet" is offered the music joy and starts it
    And I wait for "Jet" to have job "MusicPlayJoy"
    Then Epona Instruments Renew "Jet" is heard playing "MIC_Ocarina_Play"
    And I take a screenshot "the bagpipes are being played"
    When Epona Instruments Renew 1800 ticks pass
    Then "Jet" has job "MusicPlayJoy"
    And Epona Instruments Renew "Jet" is heard playing "MIC_Ocarina_Play"

  Scenario: the uilleann pipes are played, and heard
    When I spawn a "JP_UilleannPipes" at (144, 155)
    And Epona Instruments Renew "Jet" is offered the music joy and starts it
    And I wait for "Jet" to have job "MusicPlayJoy"
    Then Epona Instruments Renew "Jet" is heard playing "MIC_Ocarina_Play"
    And I take a screenshot "the uilleann pipes are being played"
    When Epona Instruments Renew 1800 ticks pass
    Then "Jet" has job "MusicPlayJoy"
    And Epona Instruments Renew "Jet" is heard playing "MIC_Ocarina_Play"

  Scenario: the accordion is played, and heard
    When I spawn a "JP_Accordion" at (144, 155)
    And Epona Instruments Renew "Jet" is offered the music joy and starts it
    And I wait for "Jet" to have job "MusicPlayJoy"
    Then Epona Instruments Renew "Jet" is heard playing "MIC_ElectronicOrgan_Play"
    And I take a screenshot "the accordion is being played"
    When Epona Instruments Renew 1800 ticks pass
    Then "Jet" has job "MusicPlayJoy"
    And Epona Instruments Renew "Jet" is heard playing "MIC_ElectronicOrgan_Play"

  Scenario: with the provider's sound checkbox unticked, the same performance is silent
    Given Epona Instruments Renew the provider sound checkbox is off
    When I spawn a "JP_Accordion" at (144, 155)
    And Epona Instruments Renew "Jet" is offered the music joy and starts it
    And I wait for "Jet" to have job "MusicPlayJoy"
    And Epona Instruments Renew 600 ticks pass
    Then "Jet" has job "MusicPlayJoy"
    And Epona Instruments Renew "Jet" is not heard playing
