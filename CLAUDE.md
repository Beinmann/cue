# ai-vocabulary

This directory is where my personal keywords (all ending in `-me`, e.g.
`land-me`, `todo-me`, `widget-me`) are defined.

- `vocabulary.md` is the single source. Edit keywords there, never in the
  generated `~/.claude/CLAUDE.md` (its managed block is overwritten).
- After editing, run `./install.sh claude` (see `README.md` for other agents).
  New agent sessions pick up the change.
- Keep the definition style: `- **name-me**: ...`, wrapped at ~78 columns,
  filed under the section that fits (Acting, Modifiers, Output style,
  Report only).
- Commit changes; the repo is public, so keep no private details in it.
