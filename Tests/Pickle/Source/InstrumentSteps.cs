using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Xml.Linq;
using HarmonyLib;
using RimWorld;
using RimWorks.Pickle;
using Verse;
using Verse.Sound;

namespace EponaInstrumentsRenew.PickleSteps
{
    /// <summary>
    /// The things Epona Instruments Renew's suite needs that Pickle's own vocabulary cannot say. Every step text
    /// starts with the mod's name so it cannot collide with another suite's (Pickle loads them all into one
    /// namespace), and each reads a game fact rather than asserting an intention.
    ///
    ///  - the texts read as written for the language the pass runs (the language is fixed at launch, never
    ///    switched mid-run: one feature, two passes);
    ///  - a colonist is heard playing: the provider's Comp_PlayingMusic holds a live Sustainer while a performance
    ///    runs, and that sustainer is started from CompTick, which only ticks for tickerType Normal. The existence
    ///    of the sustainer is the automatable half of "the instrument makes a sound"; that a loudspeaker then
    ///    renders it is not something a headless run can say;
    ///  - the provider's sound checkbox, set and restored after the scenario;
    ///  - the game's own "complete this unfinished item" flag (UnfinishedThing.debugCompleted), so a craft that
    ///    needs 65,000 work is finished by the real recipe code without waiting for it.
    /// </summary>
    [PickleSteps]
    public class InstrumentSteps
    {
        private const string PackageId = "nelim.eponainstrumentsrenew";
        private static readonly string[] DefNames = { "JP_GreatHighlandBagpipes", "JP_UilleannPipes", "JP_Accordion" };
        private static bool? settingBefore;
        private static bool? settingWanted;

        // --- texts ---------------------------------------------------------------------------------------

        [Then("Epona Instruments Renew texts read as written for the language this pass runs")]
        public void TextsReadAsWritten(PickleContext ctx)
        {
            string root = ModRoot(ctx);
            LoadedLanguage language = LanguageDatabase.activeLanguage;
            string folder = language?.folderName ?? "(none)";
            // The folder of the French language is named "French (Français)" (2026-09-23 French pass), not "French":
            // recognise it by the prefix of its folder.
            bool french = folder.StartsWith("French", StringComparison.OrdinalIgnoreCase);

            var expected = new Dictionary<string, string>();
            if (french)
            {
                string path = Path.Combine(root, "Languages", "French", "DefInjected", "ThingDef", "JoyPreservation.xml");
                ctx.Require(File.Exists(path), "the mod ships no French DefInjected file at " + path);
                foreach (XElement e in XDocument.Load(path).Root.Elements())
                    expected[e.Name.LocalName] = e.Value.Trim();
            }
            else
            {
                // English is the native Def value written in the patch; a language the mod does not ship falls back to it.
                string path = Path.Combine(root, "Patches", "EponaInstruments.xml");
                ctx.Require(File.Exists(path), "the mod ships no patch at " + path);
                foreach (XElement def in XDocument.Load(path).Descendants("ThingDef"))
                {
                    string name = def.Element("defName")?.Value.Trim();
                    if (name == null) continue;
                    expected[name + ".label"] = def.Element("label")?.Value.Trim();
                    expected[name + ".description"] = def.Element("description")?.Value.Trim();
                }
            }

            var problems = new List<string>();
            foreach (string defName in DefNames)
            {
                ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
                if (def == null) { problems.Add(defName + ": no such ThingDef is loaded"); continue; }
                foreach (string field in new[] { "label", "description" })
                {
                    string key = defName + "." + field;
                    string want;
                    if (!expected.TryGetValue(key, out want) || string.IsNullOrEmpty(want)) { problems.Add(key + ": no text is written for it in " + folder); continue; }
                    string have = field == "label" ? def.label : def.description;
                    if (!string.Equals(have, want, StringComparison.Ordinal))
                        problems.Add(key + ": the game holds \"" + have + "\", the mod wrote \"" + want + "\"");
                }
            }
            ctx.Attach("language", folder + (french ? " (French DefInjected)" : " (native Def values)"));
            ctx.Assert(problems.Count == 0, "texts in the language of this pass (" + folder + "): " + string.Join("; ", problems));
        }

        // --- sound ---------------------------------------------------------------------------------------

        [Then("Epona Instruments Renew {string} is heard playing {string}", TimeoutSeconds = 90f)]
        public async Task IsHeardPlaying(PickleContext ctx, string nickname, string soundDefName)
        {
            Pawn pawn = FindPawn(ctx, nickname);
            // The sustainer is spawned from CompTick, so ticks must pass: they are driven here, 20 at a time, up to
            // 2,000 ticks (the colonist may still be walking to the instrument), instead of trusting the ambient game speed.
            for (int i = 0; i < 100; i++)
            {
                Sustainer s = SustainerOf(pawn);
                if (s != null && !s.Ended && s.def != null && s.def.defName == soundDefName) return;
                await ctx.WaitTicks(20);
            }
            ctx.Assert(false, Describe(pawn, soundDefName));
        }

        [Then("Epona Instruments Renew {string} is not heard playing")]
        public void IsNotHeardPlaying(PickleContext ctx, string nickname)
        {
            Pawn pawn = FindPawn(ctx, nickname);
            Sustainer s = SustainerOf(pawn);
            ctx.Assert(s == null || s.Ended, "expected no live sound for '" + nickname + "', found: " + Describe(pawn, "(none)"));
        }

        [Given("Epona Instruments Renew the provider sound checkbox is {word}")]
        public void ProviderSoundCheckbox(PickleContext ctx, string state)
        {
            ctx.Require(state == "on" || state == "off", "write 'on' or 'off', not '" + state + "'");
            object settings = ProviderSettings(ctx);
            FieldInfo f = AccessTools.Field(settings.GetType(), "PlayMusic");
            ctx.Require(f != null, "the provider's settings class no longer has a PlayMusic field");
            if (settingBefore == null) settingBefore = (bool)f.GetValue(settings);
            settingWanted = state == "on";
            f.SetValue(settings, settingWanted.Value);
            ctx.Attach("provider checkbox", "set to " + settingWanted + ", reads " + f.GetValue(settings) + " (settings object " + settings.GetHashCode() + ")");
        }

        /// <summary>The provider's checkbox is a game-wide setting: put it back, whatever the scenario did.</summary>
        [AfterScenario]
        public void RestoreProviderSoundCheckbox()
        {
            if (settingBefore == null) return;
            try
            {
                Type mod = AccessTools.TypeByName("MusicalInstruments.MusicalInstrumentsMod");
                object instance = mod?.GetField("instance", BindingFlags.Public | BindingFlags.Static)?.GetValue(null);
                object settings = instance == null ? null : AccessTools.Property(mod, "Settings")?.GetValue(instance, null);
                if (settings != null) AccessTools.Field(settings.GetType(), "PlayMusic")?.SetValue(settings, settingBefore.Value);
            }
            finally { settingBefore = null; settingWanted = null; }
        }

        // --- crafting ------------------------------------------------------------------------------------

        [When("Epona Instruments Renew the unfinished item on the bench is completed")]
        public void CompleteUnfinished(PickleContext ctx)
        {
            ctx.Require(Find.CurrentMap != null, "no map is loaded");
            // Only the items of this mod's recipes: a fixture or another bill may hold unfinished things of its own.
            List<UnfinishedThing> found = Find.CurrentMap.listerThings.AllThings.OfType<UnfinishedThing>()
                .Where(u => u.Recipe?.products != null && u.Recipe.products.Any(p => DefNames.Contains(p.thingDef.defName)))
                .ToList();
            ctx.Require(found.Count > 0, "no unfinished instrument of this mod exists on the map: has a colonist started the bill yet?");
            foreach (UnfinishedThing u in found) u.debugCompleted = true;
            ctx.Attach("completed", string.Join(", ", found.Select(u => u.LabelCap.ToString())));
        }

        // --- research ------------------------------------------------------------------------------------

        [Then("Epona Instruments Renew the recipe {string} is {word}")]
        public void RecipeAvailability(PickleContext ctx, string recipeDefName, string state)
        {
            ctx.Require(state == "available" || state == "unavailable", "write 'available' or 'unavailable', not '" + state + "'");
            RecipeDef recipe = DefDatabase<RecipeDef>.GetNamedSilentFail(recipeDefName);
            ctx.Require(recipe != null, "no recipe named '" + recipeDefName + "' is loaded");
            bool now = recipe.AvailableNow;
            ctx.Assert(now == (state == "available"),
                "recipe " + recipeDefName + " should be " + state + " but AvailableNow is " + now +
                " (research prerequisite: " + (recipe.researchPrerequisite?.defName ?? "none") + ", finished: " + (recipe.researchPrerequisite?.IsFinished.ToString() ?? "n/a") + ")");
        }

        // --- performance scene ---------------------------------------------------------------------------

        /// <summary>
        /// Gives the colonist the provider's own music joy job. The provider's WORK route (WorkGiver_MusicPlay) only offers a
        /// venue that is itself an instrument (a piano, an organ: its CompMusicalInstrument), so a plain music spot with a
        /// carried instrument never gets it: found 2026-09-23 by the diagnostic that first listed the provider's own checks
        /// (spot active, instrument reachable, sit spot found, and HasJobOnThing still false). Carried instruments are played
        /// through JoyGiver_MusicPlay, which needs a low Joy need and a free recreation slot; the colonist is not left to
        /// chance: the provider's giver is asked directly, so it chooses the spot and the instrument itself, and the job it
        /// returns is started.
        /// </summary>
        [When("Epona Instruments Renew {string} is offered the music joy and starts it")]
        public void MusicJoyStarts(PickleContext ctx, string nickname)
        {
            Pawn pawn = FindPawn(ctx, nickname);
            JoyGiverDef giverDef = DefDatabase<JoyGiverDef>.GetNamedSilentFail("MusicPlay");
            ctx.Require(giverDef != null, "no JoyGiverDef 'MusicPlay': is Musical Instruments (Continued) loaded?");
            Verse.AI.Job job = null;
            for (int i = 0; i < 20 && job == null; i++) job = giverDef.Worker.TryGiveJob(pawn);
            string facts = SceneFacts(pawn);
            ctx.Attach("scene", facts);
            if (settingWanted != null)
            {
                object settings = ProviderSettings(ctx);
                FieldInfo f = AccessTools.Field(settings.GetType(), "PlayMusic");
                ctx.Attach("provider checkbox at the start", "wanted " + settingWanted + ", reads " + f.GetValue(settings) + " (settings object " + settings.GetHashCode() + ")");
                f.SetValue(settings, settingWanted.Value);
            }
            ctx.Assert(job != null, "the provider's music joy gives no job to '" + nickname + "' after 20 tries: " + facts);
            pawn.jobs.StartJob(job, Verse.AI.JobCondition.InterruptForced);
        }

        // --- helpers -------------------------------------------------------------------------------------

        private static string CompProperty(Thing thing, string compTypeName, string property)
        {
            ThingWithComps twc = thing as ThingWithComps;
            ThingComp comp = twc?.AllComps.FirstOrDefault(c => c.GetType().Name == compTypeName);
            if (comp == null) return "(no " + compTypeName + ")";
            object v = AccessTools.Property(comp.GetType(), property)?.GetValue(comp, null);
            return v == null ? "(unreadable)" : v.ToString();
        }

        /// <summary>What a performance needs, as the game holds it, for a failure message.</summary>
        private static string SceneFacts(Pawn pawn)
        {
            var facts = new List<string>();
            Map map = Find.CurrentMap;
            facts.Add("pawn: faction " + (pawn.Faction?.Name ?? "none") + ", downed " + pawn.Downed + ", awake " + RestUtility.Awake(pawn) +
                      ", Artistic tag disabled " + pawn.WorkTagIsDisabled(WorkTags.Artistic) +
                      ", Manipulation " + pawn.health.capacities.CapableOf(PawnCapacityDefOf.Manipulation) +
                      ", Hearing " + pawn.health.capacities.CapableOf(PawnCapacityDefOf.Hearing) +
                      ", job " + (pawn.CurJobDef?.defName ?? "none"));
            ThingDef spotDef = DefDatabase<ThingDef>.GetNamedSilentFail("MusicSpot");
            List<Thing> spots = spotDef == null ? new List<Thing>() : map.listerThings.ThingsOfDef(spotDef).ToList();
            foreach (Thing spot in spots)
                facts.Add("spot at " + spot.Position + ": faction " + (spot.Faction?.Name ?? "none") + ", Active " + CompProperty(spot, "CompMusicSpot", "Active"));
            if (spots.Count == 0) facts.Add("no MusicSpot on the map");
            foreach (Thing t in map.listerThings.AllThings.Where(x => x is ThingWithComps twc && twc.AllComps.Any(c => c.GetType().Name == "CompMusicalInstrument")))
                facts.Add("instrument " + t.LabelCap + " at " + t.Position + ": forbidden " + t.IsForbidden(pawn) +
                          ", reachable " + pawn.CanReach(t, Verse.AI.PathEndMode.Touch, Danger.Deadly));
            return string.Join(" | ", facts);
        }

        private static string ModRoot(PickleContext ctx)
        {
            ModContentPack pack = LoadedModManager.RunningMods.FirstOrDefault(m => string.Equals(m.PackageId, PackageId, StringComparison.OrdinalIgnoreCase));
            ctx.Require(pack != null, "the mod " + PackageId + " is not among the running mods");
            return pack.RootDir;
        }

        private static Pawn FindPawn(PickleContext ctx, string nickname)
        {
            ctx.Require(Find.CurrentMap != null, "no map is loaded");
            Pawn pawn = Find.CurrentMap.mapPawns.AllPawnsSpawned.FirstOrDefault(p => string.Equals(p.Name?.ToStringShort, nickname, StringComparison.OrdinalIgnoreCase));
            ctx.Require(pawn != null, "no pawn named '" + nickname + "' is on the map");
            return pawn;
        }

        private static object ProviderSettings(PickleContext ctx)
        {
            Type mod = AccessTools.TypeByName("MusicalInstruments.MusicalInstrumentsMod");
            ctx.Require(mod != null, "Musical Instruments (Continued) is not loaded");
            object instance = mod.GetField("instance", BindingFlags.Public | BindingFlags.Static)?.GetValue(null);
            object settings = instance == null ? null : AccessTools.Property(mod, "Settings")?.GetValue(instance, null);
            ctx.Require(settings != null, "the provider's settings object could not be read");
            return settings;
        }

        private static object CompOf(Pawn pawn)
        {
            Type comp = AccessTools.TypeByName("MusicalInstruments.Comp_PlayingMusic");
            if (comp == null) return null;
            IDictionary notebook = comp.GetField("Notebook", BindingFlags.Public | BindingFlags.Static)?.GetValue(null) as IDictionary;
            return notebook != null && notebook.Contains(pawn) ? notebook[pawn] : null;
        }

        private static Sustainer SustainerOf(Pawn pawn)
        {
            object comp = CompOf(pawn);
            return comp == null ? null : AccessTools.Field(comp.GetType(), "soundPlaying")?.GetValue(comp) as Sustainer;
        }

        private static string Describe(Pawn pawn, string wanted)
        {
            object comp = CompOf(pawn);
            string job = pawn.CurJobDef?.defName ?? "none";
            if (comp == null) return "wanted " + wanted + "; the pawn has no entry in the provider's performance notebook (job: " + job + ")";
            Sustainer s = SustainerOf(pawn);
            return "wanted " + wanted + "; the pawn is in the notebook (job: " + job + ") but the sustainer is " + (s == null ? "null" : (s.Ended ? "ended" : "live, " + s.def?.defName));
        }
    }
}
