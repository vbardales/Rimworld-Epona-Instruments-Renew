using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Xml.Linq;
using HarmonyLib;
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

        // --- texts ---------------------------------------------------------------------------------------

        [Then("Epona Instruments Renew texts read as written for the language this pass runs")]
        public void TextsReadAsWritten(PickleContext ctx)
        {
            string root = ModRoot(ctx);
            string folder = LanguageDatabase.activeLanguage?.folderName ?? "(none)";
            bool french = string.Equals(folder, "French", StringComparison.OrdinalIgnoreCase);

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

        [Then("Epona Instruments Renew {string} is heard playing {string}", TimeoutSeconds = 30f)]
        public async Task IsHeardPlaying(PickleContext ctx, string nickname, string soundDefName)
        {
            Pawn pawn = FindPawn(ctx, nickname);
            await ctx.AssertEventually(
                () => { Sustainer s = SustainerOf(pawn); return s != null && !s.Ended && s.def != null && s.def.defName == soundDefName; },
                () => Describe(pawn, soundDefName),
                25f);
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
            f.SetValue(settings, state == "on");
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
            finally { settingBefore = null; }
        }

        // --- crafting ------------------------------------------------------------------------------------

        [When("Epona Instruments Renew the unfinished item on the bench is completed")]
        public void CompleteUnfinished(PickleContext ctx)
        {
            ctx.Require(Find.CurrentMap != null, "no map is loaded");
            List<UnfinishedThing> found = Find.CurrentMap.listerThings.AllThings.OfType<UnfinishedThing>().ToList();
            ctx.Require(found.Count > 0, "no unfinished item exists on the map: has a colonist started the bill yet?");
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

        // --- helpers -------------------------------------------------------------------------------------

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
