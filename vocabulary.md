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

## Modifiers

- **widget-me**: combined with another keyword or request (`todo-me
  widget-me`, `brief-me widget-me`), do what that says but show the result
  as a widget in `hatch` instead of in chat; it changes only where the
  output is shown, nothing else. Use a board (cards in columns, e.g. done /
  in progress / next) when the content has items or states, otherwise a
  plain widget. Update an existing widget rather than adding a second one.
  Alone, show the last answer (or what I'm pointing at) as a widget. If no
  `hatch` command exists, fall back to a visually structured file or chat
  output and say so in one line. Board layout is a first version, to be
  refined.

## Output style

- **tldr-me**: answer in 3 lines or fewer, conclusion first, no background.

## Report only (change nothing)

- **nudge-me**: tell me the one next action I should take, nothing else.
- **step-me**: give me the next 2-4 steps of the current plan, small and
  concrete enough to follow one by one: the exact command or action, which
  file, and what output to check for. Status per step: todo / in progress /
  done. Uses the most recent plan in the conversation, from context, no
  exploring; ask first if there is none or several. If asked again,
  continue from the first unfinished step, skip done ones, and say if the
  plan changed. Describe only, never execute. Differs from `nudge-me` (one
  bare action) and `todo-me` (whole list, one line each).
- **show-me**: demonstrate with real output (run it, print it) instead of
  describing it.
- **brief-me**: catch me up: what's done, what's pending, what needs my
  decision.
- **status-me**: extremely quick overview of the current situation: where
  we are, plus 1-2 next actions. Max 3 sentences or 4 short bullets, no
  background. Answer from context without exploring; fast over thorough.
- **todo-me**: make a todo list of 3-8 entries for the current goal (or what
  I'm pointing at), from context, no exploring; ask first if the target is
  unclear. One short line per entry, next action first, status todo /
  in progress / done. Sub-items count toward the limit, so entries stay
  roughly equal in length. If more doesn't fit, use judgment; by default add
  one sentence saying there is more. If a todo list already exists, update
  it in place instead: mark done, add new, drop obsolete (never silently
  drop something I wrote, flag it), collapse done items, say what changed
  in one line; with several lists take the most recent and name it. Stays in
  chat unless I name another format: `todo-me in hatch` = a Hatch widget
  with visuals (update the existing one rather than adding a second). No
  tickets, no parking ideas, no implementing.
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
