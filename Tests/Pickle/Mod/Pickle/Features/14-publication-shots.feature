# Images for the Workshop page (PUBLICATION.md, "Gallery"). Composition stays a visual review: a passed scenario
# proves the route ran, never that the picture sells the mod.
#
# NOT PLAYED. Scenarios rewritten 2026-11-18 from the 2026-11-15 header (NSB sync of 2026-11-18, Nelim + Miel + Soren, no invented guest).
# Rules: AUDIT.md 9.a, GALLERY.md. Cells, hours and defNames below are unconfirmed until a first run ("to confirm"): a step that
# does not know a name fails with the list of the valid ones.
#
# STEP PREFIXES: "Nelim's Sanctuary:" is the Sanctuary Backlot (fixture, named places, Nelim's own face); "Nelim's Pickle Tools:" is
# PickleTools (framing, decor, apparel, face parts, hairstyles, presentation mode); "Epona Instruments Renew:" is this suite's own; the rest is Pickle's.
# Pass: -Language English -DepMap wsl-deps.gallery.map -Filter 14-publication-shots.feature (English: the page is English).
#
# THE STORY. A ceilidh at the hermit's hearth, one evening and the morning after, in chronological order, all at the hearth of the hall
# (named place "fire-pit", stone hearth at (181, 115), validated by Virginie 2026-11-08). Nelim, the protagonist, hosts and plays the great
# highland bagpipes; two Sanctuary friends bring the other two instruments: Miel the uilleann pipes and Soren the accordion. Both are NSB
# colonists, played as the roster says (owner rule 3, 2026-11-05): their properties are the verified block of MIEL-PROFIL.md (503b567,
# 2026-11-17) and SOREN-PROFIL.md, pasted below with existing steps, nothing changed; only outfits and the scene smile are chosen.
# Rhythm: one hour per image, the photographer's choice: 17, 18, 19, 20, then 8 the next morning; each image is a new Scenario that
# reloads the save and sets its own hour. The hall is indoors, so the hour is shown by the torches, not by the sky: one lit at 17, two
# lit at 18 and 19, two lit and the braziers burning at 20, one left lit and one out at 8. The series builds one person or object at a
# time: Nelim alone, then Miel, then Soren, then the whole band, then the morning. Palette: deep green (40, 88, 56), ochre (196, 152, 64),
# wool red (150, 40, 36), so the black of the pipes and the brass of the accordion stand out against the dark parquet and the grey stone.
# Gesture rule (director): the game cannot draw a breath or a squeeze; each image is paused a few ticks AFTER the pawn has reached its cell and
# the playing job runs (wait for the job, then 20 ticks), and the "mid-play" feeling comes from the job, the facing and the listener
# turned toward the player, never from an arm movement.
#
# WHO WEARS WHAT (chosen, never rolled; same outfit in every scene of the story). Outfits only, free (owner, 2026-11-05). The kilt comes from
# Irn Bru And Other Scottish Delights (geodesicdragon.irnbru, IrnBruMod_KiltApparel), the only mod added to the pass for a garment.
#   Nelim : her own body, hair, face (SanctuaryBacklot "Nelim has her own face") and eyes; ochre shirt (Apparel_CollarShirt), wool-red
#           jacket (Apparel_Jacket), her trousers (Apparel_Pants) dyed deep green; smile kit; no sweat: the map is held at 20 degrees.
#   Miel  : the roster block as in sanctuary-miel-wardrobe (validated 2026-11-17): Female, Thin, head Female_AverageWide, age 34, genes
#           GES_Skin_Chocolate, Hair_DarkBlack, Eyes_Orange, hairstyle Roo_Royal_NaturalcurlsHD, body tattoo STribalTat_Body_SacredGrass,
#           lipstick VanityCase_LipstickCaramel (VanityCase, Pickle map only), parts MouthLipsBig, BrowTriangle, LidFlirty, SkinEyeshadow,
#           Empathetic; smile kit first, then the parts. Outfit: deep-green shirt, ochre jacket, wool-red kilt (150, 40, 36).
#   Soren : the roster block as in sanctuary-soren-wardrobe: Male, age 38, head Male_AverageWide, genes Skin_Melanin5, Hair_DarkReddish,
#           Eyes_DarkGreen, hairstyle Roo_HD_Hair_Tidy, parts MouthClassicSmile, MonoScarredBrows, LidSimple, EyeThin; outfit: ochre shirt,
#           deep-green jacket, deep-red kilt (130, 30, 34).
# Animals face the camera (owner, 2026-10-14): Yuki the husky on images 1 to 3, Shogun the labrador (linked to Nelim) on images 4 and 5;
# both NSB dogs, undressed (nothing in the mod addresses animals).
#
# SHOOTING PLAN, one line per image. The instrument is spawned one cell SOUTH of the performer, at (x, 116), so the performer does not turn
# its back to the camera; to confirm at the first run (the interaction cell of the def decides). Fields: place and hour | subject | composition |
# living | decor | instant and how the gesture is obtained.
#   1. fire-pit, 17h, Clear, 20 degrees | OPENING: Nelim tunes the great highland bagpipes at the empty hearth, the guests have not come yet
#        (two empty Stool wait for them) | medium, framed x 176-186 / z 113-119 so the hall, hearth and the two empty stools set the place;
#        Nelim off-centre right at (181, 117), bag and drones a third of the frame height | Nelim in the MusicPlayJoy job, Yuki lying at
#        (183, 116) facing the camera | one TorchLamp lit at (178, 117) and one unlit at (184, 117), Stool at (176, 118) and (187, 118), a placed
#        PlantPot with Plant_Daylily fully grown at (177, 116), a DiningChair at (185, 118), all inside the frame; a Beer bottle (Core item, Cat: no mug exists) on the Stool at
#        (176, 118) | instant: she has just settled into her spot (job running 20 ticks), pipes at (181, 116).
#   2. fire-pit, 18h, Clear | Miel answers on the uilleann pipes while Nelim listens and smiles: the first guest has arrived | close,
#        framed from the knees up, x 178-184 / z 115-119, the pipes and bellows fill a third of the frame width against Miel's ochre jacket and
#        black curls; Miel at (181, 117), JP_UilleannPipes at (181, 116) | Miel in the job; Nelim at (178, 117) turned East toward her, JP_GreatHighlandBagpipes
#        under her arm; Yuki at (183, 116) facing the camera | two TorchLamp lit at (176, 117) and (183, 117), one Stool at (187, 118) | instant: the two
#        have just exchanged the first tune.
#   3. fire-pit, 19h, Clear | the band is gathering: Soren plays the accordion while Nelim hurries over with her bagpipes | medium,
#        framed x 177-185 / z 114-119; Soren at (181, 117) with JP_Accordion at (181, 116), brass against his deep-green jacket; Nelim at
#        (183, 117) turned West toward him, JP_GreatHighlandBagpipes in her hands; Miel's empty Stool at (178, 118) in the frame | Soren in the
#        job, Nelim carrying; Yuki at (178, 116) facing the camera | two TorchLamp lit at (176, 117) and (184, 117) | instant: Soren has just
#        started and Nelim is walking to join him; image 4 follows.
#   4. fire-pit, 20h, Clear | the whole band plays the ceilidh at its height | wide, framed x 178-184 / z 114-119 so each of the three
#        instruments takes at least 8 percent of the frame width at 268 px; Nelim (181, 117) centre, Miel (179, 117) and Soren (183, 117) at her
#        sides, facing South, hearth as foreground; JP_UilleannPipes at (179, 116), JP_GreatHighlandBagpipes at (181, 116), JP_Accordion at (183, 116)
#        | all three in the job; Shogun at (178, 116) facing the camera | two TorchLamp lit at (176, 117) and (184, 117), two Stool at
#        (176, 118) and (187, 118), two Brazier lit at (178, 118) and (182, 118) | instant: the three have been playing 20 ticks.
#   5. fire-pit, 8h (the morning after), Clear | CLOSING: the three new instruments rest beside the provider's Ocarina and FrameDrum on the
#        hearth floor, the size a subscriber compares against | medium wide, low angle along the row (z 116, x 177-183), the five instruments
#        each at least 8 percent of the frame width: Ocarina at (177, 116), FrameDrum at (178, 116), JP_GreatHighlandBagpipes at (179, 116),
#        JP_UilleannPipes at (180, 116), and Nelim at (181, 117) caught carrying JP_Accordion toward the row (mid-carry) | Nelim smiling, Shogun
#        curled at (176, 116) facing the camera | one TorchLamp left lit at (178, 117) all night, one out at (184, 117), a Stool at (187, 118),
#        a placed PlantPot with Plant_Daylily fully grown at (188, 117), a DiningChair at (185, 118) (frame x 176-189), the hearth cold, a Beer bottle
#        on the stone at (183, 118) | instant: she is putting the instruments back after the night.
# Windows of the interface: none. Every image is staged, so every one takes a subtitle (GALLERY.md "Sous-titres").
#
# Cells (SANCTUAIRE-CASES.md, fire-pit, free standable at z 116: 172-183, 187-189; z 117: 172-173, 176, 178-185, 187-190; z 118: 172-173,
# 176, 178, 181-183, 185, 187-190). Any cell above not in these lists is moved at the first run, and the header is corrected.
@requires:nelim.pickletools.stagedecor
@requires:nelim.pickletools.colonistrace
@requires:nelim.pickletools.camerazoom
@requires:geodesicdragon.irnbru
@requires:rooboid.hdhair.continued
@requires:lucius.eyegenes3
@requires:nelim.vanitycase
@review
Feature: images for the Workshop page

  Scenario: image 1, Nelim tunes the great highland bagpipes
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 17
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: a decor that finds no cell is skipped and logged
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Jacket" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Pants" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Nelim" face kit is "smile"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (178, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (178, 117) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (184, 117)
    And Nelim's Pickle Tools: I place the decor "Stool" at (176, 118)
    And Nelim's Pickle Tools: I place the decor "Stool" at (187, 118)
    And Nelim's Pickle Tools: I place the decor "PlantPot" holding "Plant_Daylily" fully grown at (177, 116)
    And Nelim's Pickle Tools: I place the decor "DiningChair" at (185, 118)
    And I spawn a "Beer" at (176, 118)
    And Nelim's Pickle Tools: "Nelim" stands at (181, 117) facing South
    And a "MusicSpot" is built at (181, 117)
    And I spawn a "JP_GreatHighlandBagpipes" at (181, 116)
    And Nelim's Pickle Tools: the animal "Yuki" stands at (183, 116) facing South
    When Epona Instruments Renew "Nelim" is offered the music joy and starts it
    And I wait for "Nelim" to have job "MusicPlayJoy"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I frame the cells (176, 113) to (186, 119) filling 85 percent of the screen
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 20 ticks
    Then I take a screenshot "image 1, Nelim tunes the great highland bagpipes"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: image 2, Miel answers on the uilleann pipes
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 18
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: a decor that finds no cell is skipped and logged
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Jacket" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Pants" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Nelim" face kit is "smile"
    And Nelim's Pickle Tools: a colonist "Miel" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Miel" has no backstory
    And Nelim's Pickle Tools: "Miel" loses all genes
    And Nelim's Pickle Tools: "Miel" gender is Female
    And "Miel" is 34 years old
    And Nelim's Pickle Tools: "Miel" body type is Thin
    And Nelim's Pickle Tools: "Miel" head type is "Female_AverageWide"
    And Nelim's Pickle Tools: "Miel" has the gene "GES_Skin_Chocolate"
    And Nelim's Pickle Tools: "Miel" has the gene "Hair_DarkBlack"
    And Nelim's Pickle Tools: "Miel" has the gene "Eyes_Orange"
    And Nelim's Pickle Tools: "Miel" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Miel" hairstyle is "Roo_Royal_NaturalcurlsHD"
    And Nelim's Pickle Tools: "Miel" beard is "NoBeard"
    And Nelim's Pickle Tools: "Miel" face tattoo is "none"
    And Nelim's Pickle Tools: "Miel" body tattoo is "STribalTat_Body_SacredGrass"
    And Nelim's Pickle Tools: "Miel" is undressed
    And Nelim's Pickle Tools: "Miel" wears "Apparel_CollarShirt" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Miel" also wears "Apparel_Jacket" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Miel" also wears "IrnBruMod_KiltApparel" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Miel" also wears "VanityCase_LipstickCaramel"
    And Nelim's Pickle Tools: "Miel" face kit is "smile"
    And Nelim's Pickle Tools: "Miel" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Miel" brows are "BrowTriangle"
    And Nelim's Pickle Tools: "Miel" lids are "LidFlirty"
    And Nelim's Pickle Tools: "Miel" face skin is "SkinEyeshadow"
    And Nelim's Pickle Tools: "Miel" eyeballs are "Empathetic"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (176, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (176, 117) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (183, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (183, 117) is lit
    And Nelim's Pickle Tools: I place the decor "Stool" at (187, 118)
    And Nelim's Pickle Tools: "Miel" stands at (181, 117) facing South
    And a "MusicSpot" is built at (181, 117)
    And I spawn a "JP_UilleannPipes" at (181, 116)
    And Nelim's Pickle Tools: "Nelim" stands at (178, 117) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "JP_GreatHighlandBagpipes"
    And Nelim's Pickle Tools: the animal "Yuki" stands at (183, 116) facing South
    When Epona Instruments Renew "Miel" is offered the music joy and starts it
    And I wait for "Miel" to have job "MusicPlayJoy"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I frame the cells (178, 115) to (184, 119) filling 85 percent of the screen
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 20 ticks
    Then I take a screenshot "image 2, Miel answers on the uilleann pipes"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: image 3, Soren plays the accordion, Nelim joins
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 19
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: a decor that finds no cell is skipped and logged
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Jacket" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Pants" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Nelim" face kit is "smile"
    And Nelim's Pickle Tools: a colonist "Soren" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Soren" has no backstory
    And Nelim's Pickle Tools: "Soren" loses all genes
    And Nelim's Pickle Tools: "Soren" gender is Male
    And "Soren" is 38 years old
    And Nelim's Pickle Tools: "Soren" body type is Male
    And Nelim's Pickle Tools: "Soren" head type is "Male_AverageWide"
    And Nelim's Pickle Tools: "Soren" has the gene "Skin_Melanin5"
    And Nelim's Pickle Tools: "Soren" has the gene "Hair_DarkReddish"
    And Nelim's Pickle Tools: "Soren" has the gene "Eyes_DarkGreen"
    And Nelim's Pickle Tools: "Soren" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Soren" hairstyle is "Roo_HD_Hair_Tidy"
    And Nelim's Pickle Tools: "Soren" beard is "NoBeard"
    And Nelim's Pickle Tools: "Soren" face tattoo is "none"
    And Nelim's Pickle Tools: "Soren" body tattoo is "none"
    And Nelim's Pickle Tools: "Soren" is undressed
    And Nelim's Pickle Tools: "Soren" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Soren" also wears "Apparel_Jacket" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Soren" also wears "IrnBruMod_KiltApparel" dyed rgb (130, 30, 34)
    And Nelim's Pickle Tools: "Soren" face kit is "smile"
    And Nelim's Pickle Tools: "Soren" face skin is "SkinNormal"
    And Nelim's Pickle Tools: "Soren" mouth is "MouthClassicSmile"
    And Nelim's Pickle Tools: "Soren" brows are "MonoScarredBrows"
    And Nelim's Pickle Tools: "Soren" lids are "LidSimple"
    And Nelim's Pickle Tools: "Soren" eyeballs are "EyeThin"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (176, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (176, 117) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (184, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (184, 117) is lit
    And Nelim's Pickle Tools: I place the decor "Stool" at (178, 118)
    And Nelim's Pickle Tools: "Soren" stands at (181, 117) facing South
    And a "MusicSpot" is built at (181, 117)
    And I spawn a "JP_Accordion" at (181, 116)
    And Nelim's Pickle Tools: "Nelim" stands at (183, 117) facing West
    And Nelim's Pickle Tools: "Nelim" carries the item "JP_GreatHighlandBagpipes"
    And Nelim's Pickle Tools: the animal "Yuki" stands at (178, 116) facing South
    When Epona Instruments Renew "Soren" is offered the music joy and starts it
    And I wait for "Soren" to have job "MusicPlayJoy"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I frame the cells (177, 114) to (185, 119) filling 85 percent of the screen
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 20 ticks
    Then I take a screenshot "image 3, Soren plays the accordion, Nelim joins"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: image 4, the whole band
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 20
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: a decor that finds no cell is skipped and logged
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Jacket" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Pants" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Nelim" face kit is "smile"
    And Nelim's Pickle Tools: a colonist "Miel" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Miel" has no backstory
    And Nelim's Pickle Tools: "Miel" loses all genes
    And Nelim's Pickle Tools: "Miel" gender is Female
    And "Miel" is 34 years old
    And Nelim's Pickle Tools: "Miel" body type is Thin
    And Nelim's Pickle Tools: "Miel" head type is "Female_AverageWide"
    And Nelim's Pickle Tools: "Miel" has the gene "GES_Skin_Chocolate"
    And Nelim's Pickle Tools: "Miel" has the gene "Hair_DarkBlack"
    And Nelim's Pickle Tools: "Miel" has the gene "Eyes_Orange"
    And Nelim's Pickle Tools: "Miel" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Miel" hairstyle is "Roo_Royal_NaturalcurlsHD"
    And Nelim's Pickle Tools: "Miel" beard is "NoBeard"
    And Nelim's Pickle Tools: "Miel" face tattoo is "none"
    And Nelim's Pickle Tools: "Miel" body tattoo is "STribalTat_Body_SacredGrass"
    And Nelim's Pickle Tools: "Miel" is undressed
    And Nelim's Pickle Tools: "Miel" wears "Apparel_CollarShirt" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Miel" also wears "Apparel_Jacket" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Miel" also wears "IrnBruMod_KiltApparel" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Miel" also wears "VanityCase_LipstickCaramel"
    And Nelim's Pickle Tools: "Miel" face kit is "smile"
    And Nelim's Pickle Tools: "Miel" mouth is "MouthLipsBig"
    And Nelim's Pickle Tools: "Miel" brows are "BrowTriangle"
    And Nelim's Pickle Tools: "Miel" lids are "LidFlirty"
    And Nelim's Pickle Tools: "Miel" face skin is "SkinEyeshadow"
    And Nelim's Pickle Tools: "Miel" eyeballs are "Empathetic"
    And Nelim's Pickle Tools: a colonist "Soren" of kind "Colonist" exists
    And Nelim's Pickle Tools: "Soren" has no backstory
    And Nelim's Pickle Tools: "Soren" loses all genes
    And Nelim's Pickle Tools: "Soren" gender is Male
    And "Soren" is 38 years old
    And Nelim's Pickle Tools: "Soren" body type is Male
    And Nelim's Pickle Tools: "Soren" head type is "Male_AverageWide"
    And Nelim's Pickle Tools: "Soren" has the gene "Skin_Melanin5"
    And Nelim's Pickle Tools: "Soren" has the gene "Hair_DarkReddish"
    And Nelim's Pickle Tools: "Soren" has the gene "Eyes_DarkGreen"
    And Nelim's Pickle Tools: "Soren" hair colour is taken from its genes
    And Nelim's Pickle Tools: "Soren" hairstyle is "Roo_HD_Hair_Tidy"
    And Nelim's Pickle Tools: "Soren" beard is "NoBeard"
    And Nelim's Pickle Tools: "Soren" face tattoo is "none"
    And Nelim's Pickle Tools: "Soren" body tattoo is "none"
    And Nelim's Pickle Tools: "Soren" is undressed
    And Nelim's Pickle Tools: "Soren" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Soren" also wears "Apparel_Jacket" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Soren" also wears "IrnBruMod_KiltApparel" dyed rgb (130, 30, 34)
    And Nelim's Pickle Tools: "Soren" face kit is "smile"
    And Nelim's Pickle Tools: "Soren" face skin is "SkinNormal"
    And Nelim's Pickle Tools: "Soren" mouth is "MouthClassicSmile"
    And Nelim's Pickle Tools: "Soren" brows are "MonoScarredBrows"
    And Nelim's Pickle Tools: "Soren" lids are "LidSimple"
    And Nelim's Pickle Tools: "Soren" eyeballs are "EyeThin"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (176, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (176, 117) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (184, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (184, 117) is lit
    And Nelim's Pickle Tools: I place the decor "Stool" at (176, 118)
    And Nelim's Pickle Tools: I place the decor "Stool" at (187, 118)
    And Nelim's Pickle Tools: I place the decor "Brazier" at (178, 118)
    And Nelim's Pickle Tools: the decor "Brazier" at (178, 118) is lit
    And Nelim's Pickle Tools: I place the decor "Brazier" at (182, 118)
    And Nelim's Pickle Tools: the decor "Brazier" at (182, 118) is lit
    And Nelim's Pickle Tools: "Miel" stands at (179, 117) facing South
    And Nelim's Pickle Tools: "Nelim" stands at (181, 117) facing South
    And Nelim's Pickle Tools: "Soren" stands at (183, 117) facing South
    And a "MusicSpot" is built at (179, 117)
    And a "MusicSpot" is built at (181, 117)
    And a "MusicSpot" is built at (183, 117)
    And I spawn a "JP_UilleannPipes" at (179, 116)
    And I spawn a "JP_GreatHighlandBagpipes" at (181, 116)
    And I spawn a "JP_Accordion" at (183, 116)
    And Nelim's Pickle Tools: the animal "Shogun" stands at (178, 116) facing South
    When Epona Instruments Renew "Miel" is offered the music joy and starts it
    And Epona Instruments Renew "Nelim" is offered the music joy and starts it
    And Epona Instruments Renew "Soren" is offered the music joy and starts it
    And I wait for "Miel" to have job "MusicPlayJoy"
    And I wait for "Nelim" to have job "MusicPlayJoy"
    And I wait for "Soren" to have job "MusicPlayJoy"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I frame the cells (178, 114) to (184, 119) filling 85 percent of the screen
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 20 ticks
    Then I take a screenshot "image 4, the whole band"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: image 5, the morning after
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 8
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And Nelim's Sanctuary: the animals are kept out of the sanctuary "fire-pit"
    And Nelim's Sanctuary: I am at the sanctuary "fire-pit"
    And Nelim's Pickle Tools: a decor that finds no cell is skipped and logged
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (196, 152, 64)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Jacket" dyed rgb (150, 40, 36)
    And Nelim's Pickle Tools: "Nelim" also wears "Apparel_Pants" dyed rgb (40, 88, 56)
    And Nelim's Pickle Tools: "Nelim" face kit is "smile"
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (178, 117)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (178, 117) is lit
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (184, 117)
    And Nelim's Pickle Tools: I place the decor "Stool" at (187, 118)
    And Nelim's Pickle Tools: I place the decor "PlantPot" holding "Plant_Daylily" fully grown at (188, 117)
    And Nelim's Pickle Tools: I place the decor "DiningChair" at (185, 118)
    And I spawn a "Beer" at (183, 118)
    And Nelim's Pickle Tools: "Nelim" stands at (181, 117) facing South
    And Nelim's Pickle Tools: the animal "Shogun" stands at (176, 116) facing South
    And I spawn a "Ocarina" at (177, 116)
    And I spawn a "FrameDrum" at (178, 116)
    And I spawn a "JP_GreatHighlandBagpipes" at (179, 116)
    And I spawn a "JP_UilleannPipes" at (180, 116)
    And Nelim's Pickle Tools: "Nelim" carries the item "JP_Accordion"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I frame the cells (176, 114) to (189, 119) filling 85 percent of the screen
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I wait 20 ticks
    Then I take a screenshot "image 5, the morning after"
    And Nelim's Pickle Tools: the decor is removed
