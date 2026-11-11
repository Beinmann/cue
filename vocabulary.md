# Personal vocabulary

Experiment: using keywords to interact with ai's. Unsure whether I keep this (2026-11-10). Public repo so I can clone this from machines without my github login

Keywords I use in any project. When a message contains one, follow its
definition. All end in `-me`.

## Acting

- **land-me**: implement what I'm pointing at (ticket, file, selection, or
  the last discussed change) in the background, in a fresh git worktree on
  its own branch, so we can keep talking meanwhile. Run the tests, then merge
  into `main` (no force). Remove the worktree and branch afterwards. Do not
  push unless I say so. If the target is ambiguous, ask before starting (in
  the foreground, before launching). If tests fail or the merge conflicts,
  stop and report back to me.
- **wave-me**: I point at a collection of things to do (list, tickets,
  notes, selection) and want it done in two waves. Wave 1: everything clear
  enough to implement is implemented in the background by one agent, in one
  worktree on one branch (one commit per item, one merge into `main`, as in
  `land-me`). Only a large change may get its own agent and branch. Ask me
  no questions about clear items; tell me which ones you started. Wave 2:
  nothing is dropped. The unclear items are held back, not implemented. Ask
  me your questions in one batch (as in `quiz-me`) in the foreground and
  discuss until each can be implemented competently, then implement those in
  the background too. Failures (tests, merge conflicts) are reported, not
  forced.
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
- **chisel-me**: take the idea I'm describing from vague to
  implementation-ready within 1-2 turns, and stop there. Ask every question
  needed in one batch (as in `quiz-me`), each with a proposed default so I
  can answer "yes". Then restate the idea as a short ready-to-implement
  summary: scope, approach, done criteria. No code, no files changed, no
  ticket. Only getting to that state, nothing more.
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
