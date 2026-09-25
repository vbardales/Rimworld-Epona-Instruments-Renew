using System;
using System.IO;
using System.Linq;
using RimWorld;
using RimWorks.Pickle;
using Verse;

namespace EponaInstrumentsRenew.PickleSteps.PreSplit
{
    /// <summary>
    /// The hand-over of a saved game between two launches, and the facts a load must keep. Every step text starts with
    /// "Epona Instruments Renew pre-split:" so it cannot collide with another suite's (Pickle loads them all into one
    /// namespace).
    ///
    /// Why this stands for MANUAL M2 (a real save made while these items came from the former Joy Preservation
    /// collection): the definitions of that collection and this mod's differ only by `tickerType Normal`
    /// (git diff d16973d HEAD -- Mod/Patches/EponaInstruments.xml, 2026-09-25), which is not saved data. A game saved by
    /// one launch and loaded by a second one, in a fresh process, is therefore the same load. The pattern is Housebroken's
    /// (a `.rws` handed to the `Pickle/Fixtures` folder of a mod that the next launch loads).
    /// </summary>
    [PickleSteps]
    public sealed class PreSplitSteps
    {
        private const string Prefix = "Epona Instruments Renew pre-split: ";

        // --- writing -------------------------------------------------------------------------------------

        [When("Epona Instruments Renew pre-split: the {string} on the ground is given the quality {word}")]
        public void GiveQuality(PickleContext ctx, string defName, string quality)
        {
            Thing thing = OnGround(ctx, defName);
            SetQuality(ctx, thing, quality);
        }

        [When("Epona Instruments Renew pre-split: {string} carries a new {string} of quality {word}")]
        public void Carry(PickleContext ctx, string nickname, string defName, string quality)
        {
            Pawn pawn = FindPawn(ctx, nickname);
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Require(def != null, "no thing def named '" + defName + "' is loaded");
            Thing item = ThingMaker.MakeThing(def, GenStuff.DefaultStuffFor(def));
            SetQuality(ctx, item, quality);
            ctx.Require(pawn.inventory.innerContainer.TryAdd(item), nickname + " could not take the " + defName + " into the inventory");
        }

        [When("Epona Instruments Renew pre-split: the game is saved as {string}")]
        public void Save(PickleContext ctx, string file)
        {
            GameDataSaveLoader.SaveGame(file);
            ctx.Require(File.Exists(GenFilePaths.FilePathForSavedGame(file)), "no save file was written for " + file);
        }

        // Pickle finds a saved game as a fixture: a .rws in the Pickle/Fixtures folder of an active mod. A game saved in
        // this launch is handed to the mod that the next launch loads it with.
        [When("Epona Instruments Renew pre-split: the saved game {string} is handed to the mod {string}")]
        public void Hand(PickleContext ctx, string file, string packageId)
        {
            ModContentPack target = LoadedModManager.RunningModsListForReading.FirstOrDefault(m =>
                string.Equals(m.PackageIdPlayerFacing, packageId, StringComparison.OrdinalIgnoreCase));
            ctx.Require(target != null, "no active mod has the packageId " + packageId);
            string folder = Path.Combine(target.RootDir, "Pickle", "Fixtures");
            Directory.CreateDirectory(folder);
            string destination = Path.Combine(folder, file + ".rws");
            File.Copy(GenFilePaths.FilePathForSavedGame(file), destination, true);
            ctx.Require(File.Exists(destination), "the saved game was not copied to " + destination);
        }

        // --- reading -------------------------------------------------------------------------------------

        [Then("Epona Instruments Renew pre-split: the {string} on the ground has the quality {word}")]
        public void HasQuality(PickleContext ctx, string defName, string quality)
        {
            Thing thing = OnGround(ctx, defName);
            CompQuality comp = thing.TryGetComp<CompQuality>();
            ctx.Require(comp != null, "the " + defName + " has no quality comp");
            ctx.Assert(comp.Quality == ParseQuality(ctx, quality),
                "the " + defName + " on the ground should be " + quality + " but is " + comp.Quality);
        }

        [Then("Epona Instruments Renew pre-split: the {string} on the ground lies at {int} {int}")]
        public void LiesAt(PickleContext ctx, string defName, int x, int z)
        {
            Thing thing = OnGround(ctx, defName);
            ctx.Assert(thing.Position.x == x && thing.Position.z == z,
                "the " + defName + " should lie at " + x + " " + z + " but lies at " + thing.Position.x + " " + thing.Position.z);
        }

        [Then("Epona Instruments Renew pre-split: {string} carries a {string} of quality {word}")]
        public void CarriesQuality(PickleContext ctx, string nickname, string defName, string quality)
        {
            Pawn pawn = FindPawn(ctx, nickname);
            Thing item = pawn.inventory.innerContainer.FirstOrDefault(t => t.def.defName == defName);
            ctx.Assert(item != null, nickname + " carries no " + defName + " (inventory: " +
                string.Join(", ", pawn.inventory.innerContainer.Select(t => t.def.defName)) + ")");
            CompQuality comp = item.TryGetComp<CompQuality>();
            ctx.Require(comp != null, "the carried " + defName + " has no quality comp");
            ctx.Assert(comp.Quality == ParseQuality(ctx, quality),
                "the " + defName + " carried by " + nickname + " should be " + quality + " but is " + comp.Quality);
        }

        // --- helpers -------------------------------------------------------------------------------------

        private static Thing OnGround(PickleContext ctx, string defName)
        {
            ctx.Require(Find.CurrentMap != null, "no map is loaded");
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Require(def != null, "no thing def named '" + defName + "' is loaded");
            Thing thing = Find.CurrentMap.listerThings.ThingsOfDef(def).FirstOrDefault(t => t.Spawned);
            ctx.Require(thing != null, "no spawned " + defName + " is on the map");
            return thing;
        }

        private static Pawn FindPawn(PickleContext ctx, string nickname)
        {
            ctx.Require(Find.CurrentMap != null, "no map is loaded");
            Pawn pawn = Find.CurrentMap.mapPawns.AllPawnsSpawned.FirstOrDefault(p =>
                string.Equals(p.Name?.ToStringShort, nickname, StringComparison.OrdinalIgnoreCase));
            ctx.Require(pawn != null, "no pawn named '" + nickname + "' is on the map");
            return pawn;
        }

        private static QualityCategory ParseQuality(PickleContext ctx, string quality)
        {
            QualityCategory parsed;
            ctx.Require(Enum.TryParse(quality, true, out parsed), "'" + quality + "' is not a quality: Awful, Poor, Normal, Good, Excellent, Masterwork or Legendary");
            return parsed;
        }

        private static void SetQuality(PickleContext ctx, Thing thing, string quality)
        {
            CompQuality comp = thing.TryGetComp<CompQuality>();
            ctx.Require(comp != null, "the " + thing.def.defName + " has no quality comp");
            comp.SetQuality(ParseQuality(ctx, quality), ArtGenerationContext.Outsider);
        }
    }
}
