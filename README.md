# AI vocabulary

Short keywords I teach an AI agent once, instead of retyping instructions.
`vocabulary.md` is the single source; `install.sh` copies it into whichever
agent's instructions file you use.

```
./install.sh claude            # ~/.claude/CLAUDE.md (global, all projects)
./install.sh codex             # ~/.codex/AGENTS.md
./install.sh gemini            # ~/.gemini/GEMINI.md
./install.sh project [dir]     # <dir>/AGENTS.md
./install.sh file <path>       # anywhere else
```

Re-running replaces only the managed block between the markers, so the rest
of the target file is left alone. Start a new agent session afterwards;
instruction files are read at session start.

To change a keyword: edit `vocabulary.md`, commit, then re-run `install.sh`
on each machine after `git pull`.
