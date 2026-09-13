# Mod workflow

Use the shared protocols under `C:/Users/nelim/Documents/rimworld/`:
PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and TRANSLATIONS.md.
Read them before advancing a gate. This standalone private repository retains the
user's audit precedence rules: settings source analysis and applicable automated tests
can pass before game testing; a justified absence of settings needs no empty page or
MainButtons shortcut. Interactive game checks belong to the final tested gate.

Order: dansMonoRepo -> horsMonoRepo -> ModIcon generated -> Preview generated ->
preOptions -> options -> l10n -> preTest -> done -> tested. STATUS.md uses the exact
French workflow spellings for the two generated-image states.

Record settings_audit and English/French localization evidence before preTest.
Primary settings access, when useful settings exist, is Mod options -> Mod name.
An optional MainButtons shortcut must be hidden by default and open the same settings.
Do not invent settings. Missing mandatory checks remain unverified, never a pass.

This is a local recreation extraction classified silent, not an upstream permission grant. Do not publish without an explicit user instruction. Follow the ordered gates and record missing tests honestly.