# TEST_SCENARIOS.md 4b (MANUAL M1): a VIDEO WITH ITS SOUND of each instrument being played, for a person to open and listen to.
# Uses PickleTools' SoundCapture (SoundCapture/README.md): the recorder and a film by the clock start in one step, and the end
# step writes `screenshots/film/pickletools-sound--<name>/film-sound.mp4` (H.264 and AAC) and `sound.wav`. The run proves the
# file exists and that the sound in it is not silent; only a person says it is the RIGHT sound and that picture and sound agree.
#
# Played only in the pass "sound" (the tool is staged by the map), never in the plain suite:
#   Submit-PickleRun.ps1 ... -DepMap wsl-deps.sound.map -Filter 35-hear-the-instruments.feature -Extra '-pickle-scenario-timeout=300'
# The sound also plays on the owner's speakers during the recording (the WSLg sink is the way out): a few seconds per instrument.
# The WSL profile mutes the game (volumeMaster 0), hence the volume step; the mute of music and ambience is not yet played.
@requires:nelim.pickletools.soundcapture
Feature: hear the carried instruments, on film

  Background:
    Given the save "test-colony" is loaded
    And a colonist "Jet" exists
    And "Jet" skill "Artistic" is set to level 12
    And a "MusicSpot" is built at (146, 155)
    And I zoom in
    And I move the camera to (146, 155)
    And Nelim's Pickle Tools: the game volume is 80 percent
    And Nelim's Pickle Tools: the game music and ambience are muted

  Scenario: the great highland bagpipes are filmed with their sound
    When I spawn a "JP_GreatHighlandBagpipes" at (144, 155)
    And Epona Instruments Renew "Jet" is offered the music joy and starts it
    And I wait for "Jet" to have job "MusicPlayJoy"
    And Nelim's Pickle Tools: I film with sound as "highland-bagpipes"
    And Nelim's Pickle Tools: I let 10 real seconds go by
    And Nelim's Pickle Tools: I stop filming with sound
    Then Epona Instruments Renew "Jet" is heard playing "MIC_Ocarina_Play"
    And Nelim's Pickle Tools: the sound recorded as "highland-bagpipes" is not silent

  Scenario: the uilleann pipes are filmed with their sound
    When I spawn a "JP_UilleannPipes" at (144, 155)
    And Epona Instruments Renew "Jet" is offered the music joy and starts it
    And I wait for "Jet" to have job "MusicPlayJoy"
    And Nelim's Pickle Tools: I film with sound as "uilleann-pipes"
    And Nelim's Pickle Tools: I let 10 real seconds go by
    And Nelim's Pickle Tools: I stop filming with sound
    Then Epona Instruments Renew "Jet" is heard playing "MIC_Ocarina_Play"
    And Nelim's Pickle Tools: the sound recorded as "uilleann-pipes" is not silent

  Scenario: the accordion is filmed with its sound
    When I spawn a "JP_Accordion" at (144, 155)
    And Epona Instruments Renew "Jet" is offered the music joy and starts it
    And I wait for "Jet" to have job "MusicPlayJoy"
    And Nelim's Pickle Tools: I film with sound as "accordion"
    And Nelim's Pickle Tools: I let 10 real seconds go by
    And Nelim's Pickle Tools: I stop filming with sound
    Then Epona Instruments Renew "Jet" is heard playing "MIC_ElectronicOrgan_Play"
    And Nelim's Pickle Tools: the sound recorded as "accordion" is not silent
