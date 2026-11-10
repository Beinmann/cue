# Personal vocabulary

Keywords I use in any project. When a message contains one, follow its
definition. All end in `-me`.

## Acting

- **land-me**: implement what I'm pointing at (ticket, file, selection, or
  the last discussed change) in a fresh git worktree on its own branch.
  Run the tests, then merge into `main` (no force). Remove the worktree and
  branch afterwards. Do not push unless I say so. If the target is ambiguous,
  ask before starting. If tests fail or the merge conflicts, stop and report.
- **park-me**: capture the idea as a ticket or note (not code) and return to
  what we were doing.
- **ticket-me**: create a ticket for this (what we're discussing or pointing
  at). Ticket only, no code.

## Output style

- **tldr-me**: answer in 3 lines or fewer, conclusion first, no background.

## Report only (change nothing)

- **nudge-me**: tell me the one next action I should take, nothing else.
- **show-me**: demonstrate with real output (run it, print it) instead of
  describing it.
- **brief-me**: catch me up: what's done, what's pending, what needs my
  decision.
- **quiz-me**: ask every question you need answered in one batch before
  starting.
- **diff-me**: summarize what changed since the last commit (or since `main`),
  grouped by purpose, not by file.
