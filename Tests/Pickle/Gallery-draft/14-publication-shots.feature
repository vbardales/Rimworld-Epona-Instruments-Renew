# Images for the Workshop page (PUBLICATION.md, "Gallery"). Composition stays a visual review: a passed scenario
# proves the route ran, never that the picture sells the mod.
#
# NOT PLAYED. Header rewritten 2026-11-15 (NSB sync, Nelim + Miel + Soren); the scenarios below still name Flore and Soleil and are TO REWRITE from this header (gate 2 of write-shotlist). Older text: rules AUDIT.md 9.a, GALLERY.md.
# Several defNames and cells below are unconfirmed until a first run and are
# marked "to confirm": a step that does not know a name fails with the list of the valid ones.
#
# STEP PREFIXES: "Nelim's Sanctuary:" is the Sanctuary Backlot (fixture, named places, Nelim's own face); "Nelim's Pickle Tools:" is
# PickleTools (framing, decor, apparel, face parts, hairstyles, presentation mode); "Epona Instruments Renew:" is this suite's own; the rest is Pickle's.
# Pass: -Language English -DepMap wsl-deps.gallery.map -Filter 14-publication-shots.feature (English: the page is English).
#
# THE STORY (rewritten 2026-11-15 after sync-nsb-npt and the director's pass). A ceilidh at the hermit's hearth, one evening and
# the morning after, in chronological order, all at the hearth of the hall (named place "fire-pit", stone hearth at (181, 115),
# validated by Virginie 2026-11-08). Nelim, the protagonist, hosts and plays the great highland bagpipes; two Sanctuary friends bring
# the other two instruments: Miel the uilleann pipes and Soren the accordion (NSB colonists, played as the roster says: no property
# of a colonist is changed, only outfits and scene expressions). The invented guests Flore and Soleil are dropped (outside NSB, no
# validation). Rhythm: one hour per image, the photographer's choice (GALLERY.md): 17, 18, 19, 20, then 8 the next morning; each image
# is a new Scenario that reloads the save and sets its own hour. The hall is indoors, so the hour is shown by the torches, not by the
# sky: one lit at 17, two lit at 18 and 19, two lit and the braziers burning at 20, one left lit and one out at 8. The series builds
# one person or object at a time: Nelim alone, then Miel, then Soren, then the whole band, then the morning. Palette: deep green
# (40, 88, 56), ochre (196, 152, 64), wool red (150, 40, 36), so the black of the pipes and the brass of the accordion stand out
# against the dark parquet and the grey stone. Gesture rule (director): the game cannot draw a breath or a squeeze; each image is
# paused a few ticks AFTER the pawn has reached its cell and the playing job runs (wait for the job, then 20 ticks), and the "mid-play"
# feeling comes from the job, the facing and the listener turned toward the player, never from an arm movement.
#
# WHO WEARS WHAT (chosen, never rolled; same outfit in every scene of the story, nobody changes clothes in one evening).
# Outfits only: colours and garments are free (owner, 2026-11-05). The kilt comes from Irn Bru And Other Scottish Delights
# (geodesicdragon.irnbru, IrnBruMod_KiltApparel), the only mod added to the pass besides the Musical Instruments dependency.
#   Nelim : her own body, hair, face (SanctuaryBacklot "Nelim has her own face") and eyes; ochre shirt (Apparel_CollarShirt), wool-red
#           jacket (Apparel_Jacket), her trousers (Apparel_Pants) dyed deep green. Smile (default scene expression), no sweat: the map
#           is held at 20 degrees.
#   Miel  : roster look as in sanctuary-looks.feature (Female, Thin, Female_AverageWide, black curls Roo_Royal_NaturalcurlsHD, very dark
#           skin, orange eyes, kit smile; her looks are still "D" in NSB AVANCEMENT.md, played as the roster says); deep-green shirt,
#           ochre jacket, wool-red kilt (150, 40, 36). The black curls and the ochre jacket separate against the dark skin.
#   Soren : roster look as in sanctuary-soren-wardrobe (Male, Roo_HD_Hair_Tidy, short dark reddish hair); ochre shirt, deep-green
#           jacket, deep-red kilt (130, 30, 34); smile.
# Animals face the camera (owner, 2026-10-14): Yuki the husky on images 2 and 3, Shogun the labrador (linked to Nelim) on images 4
# and 5; both NSB dogs, undressed (nothing in the mod addresses animals).
#
# SHOOTING PLAN, one line per image. Fields: place and hour | weather and time | subject (what the image says) | composition |
# living | decor | instant and how the gesture is obtained. The instrument is spawned one cell SOUTH of the performer, at (x, 116),
# so the performer does not turn its back to the camera; to confirm at the first run (the interaction cell of the def decides).
#   1  fire-pit, hour 17, Clear, 20 degrees | OPENING: Nelim tunes the great highland bagpipes at the empty hearth, the guests have not come
#      yet (two empty Stools side by side wait for them) | medium, framed x 176-186 / z 113-119 so the hall, hearth and the two empty
#      stools set the place; Nelim off-centre right at (181, 117), bag and drones a third of the frame height | Nelim in the
#      MusicPlayJoy job, Yuki lying at (183, 116) facing the camera | one TorchLamp lit at (178, 117) (the light in frame) and one
#      unlit at (184, 117), two empty Stool at (176, 118) and (187, 118), PlantPot at (176, 113) kept, a placed PlantPot with a fully grown plant at (177, 116), a placed DiningChair at (186, 118) and a mug on the Stool at (176, 118), all inside the frame,
#      the hearth stone bare of other objects | instant: she has just settled into her spot with the bag under her arm (job running 20 ticks).
#   2  fire-pit, hour 18, Clear | Miel answers on the uilleann pipes while Nelim listens and smiles: the first guest has arrived | close,
#      framed from the knees up, x 178-184 / z 115-119, the pipes and bellows fill a third of the frame width against Miel's ochre jacket
#      and black curls; Miel at (181, 117), pipes at (181, 116) | Miel in the job; Nelim at (178, 117) turned toward her, bagpipes under
#      her arm; Yuki lying at (184, 116) facing the camera | two TorchLamp lit at (176, 117) and (183, 117), one Stool at (187, 118) with
#      a mug on it, PlantPot at (176, 113) kept | instant: the two have just exchanged the first tune.
#   3  fire-pit, hour 19, Clear | the band is gathering: Soren plays the accordion while Nelim hurries over with her bagpipes | medium,
#      framed x 177-185 / z 114-119; Soren at (181, 117) with the accordion at (181, 116), brass against his deep-green jacket; Nelim at
#      (183, 117) in a haul job toward her spot, bagpipes in her hands, head turned toward him; Miel's empty Stool in the frame | Soren in
#      the job, Nelim carrying; Yuki at (178, 116) facing the camera | two TorchLamp lit at (176, 117) and (184, 117), two Stool, PlantPot
#      kept | instant: Soren has just started and Nelim is walking to join him; image 4 follows.
#   4  fire-pit, hour 20, Clear | the whole band plays the ceilidh at its height | wide, framed x 178-184 / z 114-119 so each of the
#      three instruments takes at least 8 percent of the frame width at 268 px; Nelim (181, 117) centre, Miel (179, 117) and Soren (183,
#      117) at her sides, facing South, hearth as foreground; instruments at (179, 116), (181, 116), (183, 116) | all three in the job;
#      Shogun at (185, 116) facing the camera so the hearth stays visible | two TorchLamp lit at (176, 117) and (184, 117), two Stool at
#      (176, 118) and (187, 118), the braziers lit, PlantPot kept | instant: the three have been playing 20 ticks.
#   5  fire-pit, hour 8 (the morning after), Clear | CLOSING: the three new instruments rest beside the provider's ocarina and frame drum
#      on the hearth floor, the size a subscriber compares against | medium wide, low angle along the row (z 116, x 177-183), the five
#      instruments each at least 8 percent of the frame width; Nelim at (181, 117) caught carrying the last instrument toward the row (a
#      haul job, mid-carry) | Nelim smiling, Shogun curled at (176, 116) facing the camera | one TorchLamp left lit at (178, 117) all
#      night (the light in frame), one out at (184, 117), a Stool at (187, 118), PlantPot kept at (176, 113), a placed PlantPot with a fully grown plant at (188, 117), a placed DiningChair at (186, 118), a mug left on the stone at (184, 118) (frame x 176-189), the hearth cold, all inside the frame | instant: she is putting the
#      instruments back after the night | defNames of the ocarina and the frame drum to confirm (Musical Instruments, a hard
#      dependency already in the map).
# Windows of the interface: none. Every image is staged, so every one takes a subtitle (GALLERY.md "Sous-titres").
#
# Cells (SANCTUAIRE-CASES.md, fire-pit, free standable at z 116: 172-183, 187-189; z 117: 172-173, 176, 178-185, 187-190; z 118: 172-173,
# 176, 178, 181-183, 185, 187-190). Any cell above not in these lists is moved at the first run, and the header is corrected.
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
    And a "MusicSpot" is built at (178, 117)
    And a "MusicSpot" is built at (181, 117)
    And a "MusicSpot" is built at (183, 117)
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
    And a "MusicSpot" is built at (181, 117)
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
    And a "MusicSpot" is built at (181, 117)
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
    And a "MusicSpot" is built at (181, 117)
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
