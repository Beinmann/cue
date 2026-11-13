# ai-vocabulary

This directory is where my personal keywords (all ending in `-me`, e.g.
`land-me`, `todo-me`, `widget-me`, `snap-me`) are defined.

## Workflow for any keyword change (add, edit, remove)

1. Make the change here first, in `vocabulary.md`. This is the single
   source. Never edit the keywords in the user-wide `~/.claude/CLAUDE.md`
   directly: its managed block (between the `vocabulary:begin` and
   `vocabulary:end` markers) is overwritten by the install step, so a direct
   edit is lost.
2. Run `./install.sh claude`. This copies `vocabulary.md` into the managed
   block of `~/.claude/CLAUDE.md`, which is how the keywords reach the
   user-wide instructions. See `README.md` for other agents (codex, gemini).
   New agent sessions pick up the change.
3. Verify both are in sync (e.g. `grep <keyword> vocabulary.md
   ~/.claude/CLAUDE.md`).
4. Commit here. Do not push unless I say so.

## Style

- Keep the definition style: `- **name-me**: ...`, wrapped at ~78 columns,
  filed under the section that fits (Acting, Modifiers, Output style,
  Report only).
- The repo is public, so keep no private details in it.
