# TEST_SCENARIOS.md scenario 8, the half a running game settles: the label and the description the game actually
# holds for each of the three items equal what the mod wrote for the language this pass runs.
#
# The language is chosen at launch and never switched mid-run (SelectLanguage reloads every def under the runner),
# so this one feature is played twice and asserts against whichever language the game runs in:
#
#   Run-PickleWsl.ps1 -Mod EponaInstrumentsRenew                      English: the native Def values of the patch
#   Run-PickleWsl.ps1 -Mod EponaInstrumentsRenew -Language French     French: Languages/French/DefInjected
#
# It replaces two features (one per language) that had to be set aside by tag and played by hand-picking them:
# a feature that is true in one language is not a test of the mod, it is a test of the pass. The comparison is done by the
# suite's own step (Tests/Pickle/Source/InstrumentSteps.cs), which reads the expected text from the mod's own files.
#
# What it proves: the game applied the texts. What it does not: how they fit in the interface (05-text-screens.feature
# captures the names on screen, and a person reads them).
Feature: the texts of the carried instruments, in the language this pass runs

  Scenario: the label and the description of the three items read as written
    Then Epona Instruments Renew texts read as written for the language this pass runs
