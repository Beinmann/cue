#!/usr/bin/env bash
# Install vocabulary.md into an agent's global (or a project's) instructions file.
# Idempotent: the block between the markers is replaced on re-run.
#
#   ./install.sh claude            -> ~/.claude/CLAUDE.md
#   ./install.sh codex             -> ~/.codex/AGENTS.md
#   ./install.sh gemini            -> ~/.gemini/GEMINI.md
#   ./install.sh file <path>       -> any file you name
#   ./install.sh project [dir]     -> <dir>/AGENTS.md (default: current dir)
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
src="$here/vocabulary.md"
begin='<!-- vocabulary:begin (managed by install.sh of the cue tool, edit vocabulary.md instead) -->'
end='<!-- vocabulary:end -->'

case "${1:-}" in
  claude)  target="$HOME/.claude/CLAUDE.md" ;;
  codex)   target="$HOME/.codex/AGENTS.md" ;;
  gemini)  target="$HOME/.gemini/GEMINI.md" ;;
  file)    target="${2:?usage: install.sh file <path>}" ;;
  project) target="${2:-.}/AGENTS.md" ;;
  *) sed -n '2,9p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 1 ;;
esac

mkdir -p "$(dirname "$target")"
touch "$target"

tmp="$(mktemp)"
# Drop any existing managed block, then append the fresh one.
# Match on the marker prefix so blocks written with an older wording are replaced too.
awk -v b="${begin%% (*}" -v e="$end" '
  index($0, b) == 1 {skip=1; next}
  $0 == e {skip=0; next}
  !skip {print}
' "$target" > "$tmp"
# Trim trailing blank lines before appending.
sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$tmp"
{
  [ -s "$tmp" ] && printf '\n'
  cat "$tmp"
  [ -s "$tmp" ] && printf '\n'
  printf '%s\n' "$begin"
  cat "$src"
  printf '%s\n' "$end"
} > "$target"
rm -f "$tmp"
echo "installed vocabulary into $target"
