# Personal vocabulary

Experiment: using keywords to interact with ai's. Unsure whether I keep this (2026-11-10). Public repo so I can clone this from machines without my github login

Keywords I use in any project. When a message contains one, follow its
definition. All end in `-me`.

## Acting

- **land-me**: implement what I'm pointing at (ticket, file, selection, or
  the last discussed change) in a fresh git worktree on its own branch.
  Run the tests, then merge into `main` (no force). Remove the worktree and
  branch afterwards. Do not push unless I say so. If the target is ambiguous,
  ask before starting. If tests fail or the merge conflicts, stop and report.
- **wave-me**: I point at a collection of things to do (list, tickets,
  notes, selection) and want it done in two waves. Wave 1: every item that
  is clear enough to implement gets a background agent doing a `land-me`
  (independent items in parallel); tell me which ones you started. Wave 2:
  nothing is dropped. For the unclear items, ask me your questions in one
  batch (as in `quiz-me`) and discuss them with me until each can be
  implemented competently, then `land-me` those in the background too.
  Failures (tests, merge conflicts) are reported, not forced.
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
- **progress-me**: "where was I" view for coming back to a session: the
  goal, what we did this session (or a wider range if I specify one), next
  steps as a visual todo list (done / in progress / next), last commands,
  running and blocked agents, files changed, and what is waiting for me
  (merging progress window, run history, session report). Show it in
  `hatch` if a `hatch` command exists; otherwise report it in a visually nice
  form (file or chat) that is easy to parse at a glance. Idea only, no
  ticket: a dedicated window or always-visible status line is not designed
  yet.
