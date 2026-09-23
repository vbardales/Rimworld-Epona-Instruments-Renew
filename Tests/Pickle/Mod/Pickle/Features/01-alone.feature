# The only pass this mod needs: Core, the DLCs, Harmony, RimLogging, Pickle, Musical Instruments
# (Continued) - the hard dependency the staging places from About.xml - and this mod. It declares no
# optional mod, so there is no second "with the optional mods" pass to run (see TESTING.md at the repository root).
#
# What only a running game can say, and what Tests/Test-EffectiveDefs.ps1 can only replay:
#   - that the three defs really exist after the game's own patch pipeline ran against the real
#     provider (the offline test evaluates the guard and the inheritance itself);
#   - which value the loaded def reports for tickerType. It is inherited as Never from
#     HeldMusicalInstrumentBase and the patch overrides it; Comp_PlayingMusic starts the sound from
#     CompTick, which never runs for Never. Ocarina is asserted alongside as the reference: if the
#     provider ever changes its own value, this is the line that says the reference moved.
#   - that the load stayed silent.
#
# NOT here, on purpose: spawning, crafting, taking to inventory and playing. They need a colony with a
# pawn, and no test save exists; they live in TEST_SCENARIOS.md at the repository root and are run by hand.
Feature: Epona Instruments Renew alone

  Scenario: it loads after Musical Instruments and says nothing
    Then mod "nelim.eponainstrumentsrenew" is loaded
    And mod "Mlie.MusicalInstruments" is loaded
    And mod "nelim.eponainstrumentsrenew" loads after "Mlie.MusicalInstruments"
    # DISPLAY NAME here, not the packageId: the step compares against RimLogging's LogEntry.Mod,
    # which holds About.xml's <name>. The packageId would pass its guard and never match a warning.
    And no warnings from mod "Epona Instruments Renew (unofficial)"
    And no errors were logged

  Scenario: the patch added the three carried instruments
    Then def "JP_GreatHighlandBagpipes" of type "ThingDef" exists
    And def "JP_UilleannPipes" of type "ThingDef" exists
    And def "JP_Accordion" of type "ThingDef" exists

  Scenario: they are ticked held items, like the provider's own instruments
    Then def "Ocarina" field "tickerType" is "Normal"
    And def "JP_GreatHighlandBagpipes" field "tickerType" is "Normal"
    And def "JP_UilleannPipes" field "tickerType" is "Normal"
    And def "JP_Accordion" field "tickerType" is "Normal"

  Scenario: they are medieval items, not buildings
    Then def "JP_GreatHighlandBagpipes" field "techLevel" is "Medieval"
    And def "JP_UilleannPipes" field "techLevel" is "Medieval"
    And def "JP_Accordion" field "techLevel" is "Medieval"
    And def "JP_Accordion" field "category" is "Item"

  # The costs a player pays, as the game holds them: the wood and components of the patch's costList. The stuff
  # (fabric or leather for the highland pipes, metal for the other two) is asserted offline, with the stuff categories.
  Scenario: they cost what the patch says
    Then def "JP_GreatHighlandBagpipes" costs 40 "WoodLog"
    And def "JP_UilleannPipes" costs 20 "WoodLog"
    And def "JP_UilleannPipes" costs 3 "ComponentIndustrial"
    And def "JP_Accordion" costs 30 "WoodLog"
    And def "JP_Accordion" costs 5 "ComponentIndustrial"
