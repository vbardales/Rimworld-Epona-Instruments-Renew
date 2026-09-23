# 2026-09-21 - offline diagnostics (no game)

Outputs are on disk in `Tests/Audit-2026-09-21/` and `Tests/Reorganization-2026-09-13/` (`Results/`, `run*.txt`: ignored by
git; the scripts `Validate-Package.ps1` and `Tests/Test-EffectiveDefs.ps1` stay tracked). One line per run:

- 2026-09-13, `Tests/Reorganization-2026-09-13`: six shared diagnostics PASS on the extracted package (XML fields, config
  rules, type guards, DefInjected paths, XML classes, def references), plus the split test that passed 555 checks (45 typed
  definitions and 49 language entries each owned by exactly one package, texture bytes identical). Sole proof of the split
  test; not repeated since.
- 2026-09-21, `Tests/Audit-2026-09-21` first replay: the same six diagnostics PASS, exit 0 in 50 s. `Check-ConfigErrors`
  read 0 of 0 defs (no Defs folder): its PASS is no coverage.
- 2026-09-21, `Test-EffectiveDefs.ps1` before the fix: **3 assertions FAILED**, all `tickerType Never` against the
  provider's `Normal` on the three defs; the other assertions passed.
- 2026-09-21, after adding `<tickerType>Normal</tickerType>`: `Test-EffectiveDefs.ps1` all assertions passed (exit 0), and
  the six shared diagnostics PASS again (exit 0).

Not shown: anything in a running game (see `2026-09-21-pickle-first-suite.md`).
