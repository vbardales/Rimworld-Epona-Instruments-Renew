# Images for the Workshop page (PUBLICATION.md, "Gallery"). Composition stays a visual review: a passed scenario
# proves the route ran, never that the picture sells the mod.
#
# NOT PLAYED. Rewritten 2026-10-15 for the Sanctuary (the 2026-10-02 version used the studio colony and three invented pawns;
# the rules since then: AUDIT.md 9.a, GALLERY.md). Several defNames and cells below are unconfirmed until a first run, and are
# marked "to confirm": a step that does not know a name fails with the list of the valid ones.
#
# STEP PREFIXES: "Nelim's Sanctuary:" is the Sanctuary Backlot (fixture, named places, Nelim's own face); "Nelim's Pickle Tools:" is
# PickleTools (framing, decor, apparel, face parts, hairstyles, presentation mode); "Epona Instruments Renew:" is this suite's own; the rest is Pickle's.
# Pass: -Language English -DepMap wsl-deps.gallery.map -Filter 14-publication-shots.feature (English: the page is English).
#
# THE STORY. A ceilidh at the hermit's hearth. Nelim (Virginie, the only colonist of the Sanctuary and the protagonist of the
# series) is the host: she plays the great highland bagpipes. Two guests come with the other two instruments: Flore, with the
# uilleann pipes, and Soleil, with the accordion. One set for the whole series, the hearth of the hall (named place "fire-pit",
# stone hearth at (181, 115), braziers in the next room), photographed at its own hour each time: dusk, then night, then the
# morning after. Palette of the series: deep green, ochre and wool red, so the brass of the accordion and the black of the
# pipes stand out against the dark parquet. The series is told in the order of the scenarios; image 1 is the whole band, the most
# demonstrative, and the next ones tell how the evening began (the subtitles say so, PUBLICATION.md "Gallery subtitles").
#
# WHO WEARS WHAT (chosen, never rolled). Props from two added mods, in the pass map: Irn Bru And Other Scottish Delights
# (geodesicdragon.irnbru: the kilt, IrnBruMod_KiltApparel) and Vanilla Hair Expanded (VanillaExpanded.VHE: the braids).
#   Nelim  : her own body, hair, face (SanctuaryBacklot "Nelim has her own face": two brows, a smirk, blink) and brown eyes
#            (the fixture's defaults); an ochre shirt, a wool-red jacket, her own trousers dyed deep green.
#   Flore  : Female body, dark hair (44, 30, 26), VHE_SideBraid; an ochre shirt, a green jacket, a wool-red kilt; face kit "calm" (a player
#            of a difficult instrument, lips closed, eyes steady).
#   Soleil : Fat body, white hair so that the braid VHE_Braid shows its own colours; a green shirt, an ochre jacket, a deep-red kilt;
#            face kit "smile" (the one who enjoys it).
# Faces: Facial Animation also draws an expression from the pawn's job (MusicPlayJoy) and mood, so every capture is read for the
# face (a smile that is not wanted, sweat or blush from the heat: the map is held at 20 degrees).
# Animals face the camera on at least one image (owner, 2026-10-14): Shogun the labrador and Yuki the husky, the fixture's dogs
# (names from the owner, not yet checked in the save: to confirm).
#
# SHOOTING PLAN, one line per image (hour; subject; composition; the living thing; what the image says):
#   1  hour 20, night; the three players in a row at z 117, north of the hearth, facing South; the band is the subject, the lit hearth
#      is the foreground, two torches flank them; Shogun lies at the hearth facing the camera; the ceilidh at its height.
#   2  hour 17, dusk; Nelim alone at (181, 117) with the great highland bagpipes; tight on her and the bag, the hearth behind-left;
#      Yuki beside her facing the camera; the host tuning, the evening before it starts.
#   3  hour 18; Flore alone at (181, 117) with the uilleann pipes; tight; no animal; the first guest.
#   4  hour 19; Soleil alone at (181, 117) with the accordion; tight; no animal; the second guest, the one that carries a dance.
#   5  hour 8, the morning after; the three new instruments and the provider's ocarina and frame drum on the stone of the hearth
#      row, Nelim one step behind with her own face; the size a subscriber compares against.
# Windows of the interface: none. Every image here is staged, so every one takes a subtitle (GALLERY.md "Sous-titres").
#
# Cells (SANCTUAIRE-CASES.md, fire-pit, free standable at z 117: x 178-185; z 118: 178, 181-183; z 119: 182-186; z 113-114: 172-184):
# the performer stands at (x, 117), the instrument is spawned at (x, 118).
@requires:nelim.sanctuarybacklot
@requires:nelim.pickletools.screenshotstudio
@requires:nelim.pickletools.stagedecor
@requires:nelim.pickletools.colonistrace
@requires:nelim.pickletools.camerazoom
@requires:geodesicdragon.irnbru
@requires:VanillaExpanded.VHE
@review
Feature: images for the Workshop page

  Scenario: image 1, the band by the fire
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 20
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And a colonist "Flore" exists
    And a colonist "Soleil" exists
    And Nelim's Sanctuary: the animals are removed from the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Flore" body type is Female
    And Nelim's Pickle Tools: "Flore" hairstyle is "VHE_SideBraid"
    And Nelim's Pickle Tools: "Flore" hair colour is rgb (44, 30, 26)
    And Nelim's Pickle Tools: "Flore" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Flore" wears "Apparel_Jacket" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Flore" wears "IrnBruMod_KiltApparel" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Flore" face kit is "calm"
    And Nelim's Pickle Tools: "Soleil" body type is Fat
    And Nelim's Pickle Tools: "Soleil" hairstyle is "VHE_Braid"
    And Nelim's Pickle Tools: I let the hairstyle of "Soleil" show its own colours
    And Nelim's Pickle Tools: "Soleil" wears "Apparel_CollarShirt" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Soleil" wears "Apparel_Jacket" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Soleil" wears "IrnBruMod_KiltApparel" dyed rgb (130, 30, 34)
    And Nelim's Pickle Tools: "Soleil" face kit is "smile"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (176, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (176, 117) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (187, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (187, 117) is lit
    And Nelim's Pickle Tools: "Flore" stands at (178, 117) facing South
    And Nelim's Pickle Tools: "Nelim" stands at (181, 117) facing South
    And Nelim's Pickle Tools: "Soleil" stands at (183, 117) facing South
    And I spawn a "JP_UilleannPipes" at (178, 118)
    And I spawn a "JP_GreatHighlandBagpipes" at (181, 118)
    And I spawn a "JP_Accordion" at (183, 118)
    And Nelim's Pickle Tools: the animal "Shogun" stands at (181, 114) facing South
    When Epona Instruments Renew "Flore" is offered the music joy and starts it
    And Epona Instruments Renew "Nelim" is offered the music joy and starts it
    And Epona Instruments Renew "Soleil" is offered the music joy and starts it
    And I wait for "Flore" to have job "MusicPlayJoy"
    And I wait for "Nelim" to have job "MusicPlayJoy"
    And I wait for "Soleil" to have job "MusicPlayJoy"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I frame the rectangle from (175, 112) to (188, 119)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "image 1, the band by the fire"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: image 2, Nelim tunes the great highland bagpipes
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 17
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Sanctuary: the animals are removed from the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Nelim" stands at (181, 117) facing South
    And I spawn a "JP_GreatHighlandBagpipes" at (181, 118)
    And Nelim's Pickle Tools: the animal "Yuki" stands at (182, 116) facing South
    When Epona Instruments Renew "Nelim" is offered the music joy and starts it
    And I wait for "Nelim" to have job "MusicPlayJoy"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I frame the rectangle from (178, 113) to (185, 119)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "image 2, Nelim tunes the great highland bagpipes"

  Scenario: image 3, Flore and the uilleann pipes
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 18
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And a colonist "Flore" exists
    And Nelim's Sanctuary: the animals are removed from the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: "Flore" body type is Female
    And Nelim's Pickle Tools: "Flore" hairstyle is "VHE_SideBraid"
    And Nelim's Pickle Tools: "Flore" hair colour is rgb (44, 30, 26)
    And Nelim's Pickle Tools: "Flore" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Flore" wears "Apparel_Jacket" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Flore" wears "IrnBruMod_KiltApparel" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Flore" face kit is "calm"
    And Nelim's Pickle Tools: "Flore" stands at (181, 117) facing South
    And I spawn a "JP_UilleannPipes" at (181, 118)
    When Epona Instruments Renew "Flore" is offered the music joy and starts it
    And I wait for "Flore" to have job "MusicPlayJoy"
    And Nelim's Pickle Tools: I frame the rectangle from (178, 113) to (185, 119)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "image 3, Flore and the uilleann pipes"

  Scenario: image 4, Soleil and the accordion
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 19
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And a colonist "Soleil" exists
    And Nelim's Sanctuary: the animals are removed from the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: "Soleil" body type is Fat
    And Nelim's Pickle Tools: "Soleil" hairstyle is "VHE_Braid"
    And Nelim's Pickle Tools: I let the hairstyle of "Soleil" show its own colours
    And Nelim's Pickle Tools: "Soleil" wears "Apparel_CollarShirt" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Soleil" wears "Apparel_Jacket" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Soleil" wears "IrnBruMod_KiltApparel" dyed rgb (130, 30, 34)
    And Nelim's Pickle Tools: "Soleil" face kit is "smile"
    And Nelim's Pickle Tools: "Soleil" stands at (181, 117) facing South
    And I spawn a "JP_Accordion" at (181, 118)
    When Epona Instruments Renew "Soleil" is offered the music joy and starts it
    And I wait for "Soleil" to have job "MusicPlayJoy"
    And Nelim's Pickle Tools: I frame the rectangle from (178, 113) to (185, 119)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "image 4, Soleil and the accordion"

  Scenario: image 5, the morning after, the instruments side by side
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 8
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Sanctuary: the animals are removed from the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Nelim" stands at (182, 119) facing South
    When I spawn a "Ocarina" at (179, 117)
    And I spawn a "JP_GreatHighlandBagpipes" at (180, 117)
    And I spawn a "JP_UilleannPipes" at (181, 117)
    And I spawn a "JP_Accordion" at (182, 117)
    And I spawn a "FrameDrum" at (183, 117)
    And Nelim's Sanctuary: Nelim has her own face
    And I wait 30 ticks
    And Nelim's Pickle Tools: I frame the rectangle from (176, 114) to (187, 120)
    And Nelim's Pickle Tools: studio presentation mode is enabled
    Then I take a screenshot "image 5, the morning after, the instruments side by side"
