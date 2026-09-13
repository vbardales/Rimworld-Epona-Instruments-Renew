# Reorganization checks

Validation from this project root:

    ./Tests/Reorganization-2026-09-13/Validate-Package.ps1 -Root .

Requires the shared scripts, installed RimWorld 1.6 runtime references, ilspycmd and
provider paths in the script parameters. These are offline tooling prerequisites,
not additional runtime dependencies. Results are per-project.

No game session was executed. The cross-project structural test and its result are
kept in JoyPreservation/Tests/Reorganization-2026-09-13. To replay it, use the pre-split
source snapshot (or export revision eafda413babde8984007380e3435e19b872ea001 from Git)
as -Before and the common parent directory of the five projects as -Candidates.
The successful run preserved all 45 definitions and 49 language entries with one owner.