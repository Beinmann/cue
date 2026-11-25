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
- **implement-me**: implement what I'm pointing at (ticket, file,
  selection, or the last discussed change) right away, in the foreground,
  directly in the current git checkout, no worktree (the in-place variant of
  `land-me`). Usually just do it. If the request is unclear or confusing,
  refuse or ask your questions first. Run the tests for decently sized
  changes; skip them for trivial ones (a word, a typo). Then commit on the
  current branch (normally `main`; never force, never switch branches, do
  not push unless I say so). Commit only your own changes. If the working
  tree already has unrelated uncommitted changes, or tests fail, stop, tell
  me honestly and ask what to do instead of committing.
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
  forced. Marking: once an item is merged into `main`, mark it as done in
  place in the collection I pointed at (ideas file, list, ticket), with at
  least the date, in that item's commit. Only merged items are marked;
  held-back, failed and unmerged ones stay untouched. Never move items to
  an archive; I do that myself later.
- **park-me**: capture the idea as a ticket or note (not code) and return to
  what we were doing.
- **ticket-me**: create a ticket for this (what we're discussing or pointing
  at). Ticket only, no code.
- **ask-me**: ask me 2-5 questions in one batch, then go ahead with the
  work on my answers, no further confirmation. Questions only where the
  answer changes what you build, each with a proposed default so I can reply
  "yes"; take the default for anything I leave unanswered. Differs from
  `quiz-me` (asks everything needed, before starting) and `chisel-me`
  (stops after a summary, no work).
- **spec-me**: specification by example, in two phases. Phase 1 (changes
  nothing): give me a numbered list of 3-10 cases (C1, C2, ...) for the
  current change (or what I'm pointing at): the situation or input, the
  outcome you expect, and a status of unconfirmed / agreed / corrected.
  Cover the normal path, edge cases and failures. Work from context, read
  code only where needed, run nothing; ask first if the target is unclear.
  I react by pointing at cases or asking questions. Update the list in
  place: keep numbers stable, answer my questions and keep that case open,
  for a case I call wrong take my correction or propose one (ask only if
  you cannot infer it), cases I don't point at count as agreed, new cases
  get the next number, say what changed in one line. Phase 2, only when I
  say the list is final ("done", "lock it"), as in `implement-me` (current
  checkout, commit only your own files, never push, stop and report on
  unrelated uncommitted changes or unexpected test failures): deliver
  something I can verify later. Always a short decisions record (final
  expectation per case, what was corrected or chosen, why if I said so),
  next to the tests or in the project's docs (in a notes-only directory,
  there). If the project has a test setup, also one test per testable case
  in its own framework, tagged with the case number; behavior that doesn't
  exist yet gets an expected-fail or skip mark with its case number, no
  production code. Without a test setup the record alone is the result, and
  say so. Report what was delivered, skipped (why) and the test results.
  Differs from `test-me` (I test) in that you state expectations and I
  check them. Works with `widget-me` and `board-me`.
- **log-me**: write a log of this session into a dated file in `logs/` of
  the project's outer directory. From context only: no exploring, no
  commands beyond finding the outer dir. Find the outer dir in this order:
  (1) the superproject root if the project is a git submodule; (2) the
  nearest ancestor that is a git repo containing the project (gitignored
  nested clone); (3) the parent of the project repo if it is not a repo and
  holds `CLAUDE.md` or `logs/`, or the working directory if it is a non-git
  dir containing the project repo. If none fits (project dir only), ask
  where to write and write nothing before the answer. Never stage or commit
  the log. File: `logs/log-YYYY-MM-DD.md` (create `logs/` if missing). The
  log day starts at 06:00: take the date from the current time minus 6
  hours, so before 06:00 it is still the previous day's file (the section
  heading keeps the real clock time). Never overwrite or rewrite existing
  content: if that day's file exists, append a new section; otherwise
  create it with a `# Log YYYY-MM-DD` title. I may call it several times
  per session: a section covers only what happened since the previous
  `log-me` in this session (if you cannot tell, e.g. after compaction, read
  the last section of that day's file and continue from there); if nothing
  is new, say so and write nothing. Section:
  `## HH:MM – <short session goal>`, then `### Steps` (chronological, one
  line each: what I asked, what you did with files touched and significant
  commands, the result; failed attempts too), then `### Decisions` (what
  was chosen and why), `### Mistakes`, `### Open follow-ups`; omit empty
  ones, roughly 5-20 lines. Leave out secrets, tokens and personal data.
  Report the file path and whether it was created or appended to.

## Modifiers

- **widget-me**: combined with another keyword or request (`todo-me
  widget-me`, `brief-me widget-me`), do what that says but show the result
  as a widget in `hatch` instead of in chat; it changes only where the
  output is shown, nothing else. For items or states use `board-me`
  instead, otherwise a plain widget. Update an existing widget rather than
  adding a second one. Alone, show the last answer (or what I'm pointing
  at) as a widget. If no `hatch` command exists, fall back to a visually
  structured file or chat output and say so in one line.
- **board-me**: combined with another keyword or request (`todo-me
  board-me`, `brief-me board-me`), do what that says but show the result
  as a board (cards in columns) in `hatch`, one I can keep working on with
  you; it changes only where the output is shown, nothing else. Alone,
  board the last answer (or what I'm pointing at). Without a name there is
  one shared board, widget `board`; reuse and update it instead of adding
  a second. If I name one (`board-me releases`), use widget
  `board-<name>` the same way. How to build it:
  1. `hatch widget list`. If the widget exists, only edit its data (step
     3) and stop. Otherwise `hatch widget new board-<name>` (or `board`)
     and write `widget.json`: `{"title": "Board: <name>", "w": 760, "h":
     460, "placement": "float", "sources": []}`; fill `index.html` (step 2).
  2. `index.html`: one `<script type="application/json" id="data">` block
     holds all content: `{"title": "...", "columns": [{"name": "...",
     "cards": [{"title": "...", "detail": "...", "tag": "..."}]}]}`
     (`detail`, `tag` optional). A small script renders it: columns side
     by side (equal width, horizontal scroll if narrow), header = name +
     card count, cards as rounded boxes with bold title, dim one-line
     detail and a small tag pill; colours from `hatch.theme` (load
     `/sdk.js`), a distinct accent per column; no network, no libraries.
     Columns fit the content, 2-5 of them: next / in progress / done for
     work; decide / waiting / done for questions; or what the content
     calls for. Keep titles under ~60 characters.
  3. Updating = rewrite only the JSON in that block (keeps the layout,
     reloads the board). When I say "move X to done" or "add Y", edit the
     JSON, nothing else; never create a second board.
  4. `hatch widget open board[-<name>]`, then say in one line which board
     and what it shows. If no `hatch` command exists, fall back to a
     visually structured file or chat output and say so in one line.
- **confirm-me**: combined with another keyword or request (`land-me
  confirm-me`), do what that says, but ask me first instead of guessing
  when the answer would change what you build or the action is hard to
  reverse (delete, push, force, an unusual merge; routine merges in repos
  where they happen often need no asking). Ask in one batch, each question
  with a proposed default so I can reply "yes"; take the default for
  anything I leave unanswered. With background keywords (`land-me`,
  `wave-me`) ask in the foreground before launching; after launch no more
  questions, report failures instead. If there is nothing to ask, proceed
  silently. Differs from `ask-me` (always asks 2-5 questions): this asks
  zero or more, only if needed. It changes only whether you may stop and
  ask, nothing else. Alone, apply it to the current request.
- **snap-me**: combined with another keyword or request (`brief-me
  snap-me`, `snap-me` plus a question), answer fast: from context and
  what you already know, minimal or no exploring, no subagents, no
  questions unless truly blocked, take the obvious default and say which
  one. It changes only speed and effort, not the output format or what the
  other keyword does. Alone, apply it to the current request. If a fast
  answer would likely be wrong, say so in one line and give your best
  quick guess anyway.

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
- **test-me**: give me a numbered list of 3-10 things to test manually for
  the current change (or what I'm pointing at), from context, no exploring;
  ask first if the target is unclear. Entries are numbered T1, T2, ... so I
  can refer to them ("T3 failed: ..."). Each entry: the action to take and
  the expected result, plus a status of untested / pass / fail. Describe
  only, never run them. If a list already exists, update it in place: keep
  the numbers stable (never renumber, new entries get the next number),
  record the results I report, and say what changed in one line.
- **show-me**: demonstrate with real output (run it, print it) instead of
  describing it.
- **brief-me**: catch me up: what's done, what's pending, what needs my
  decision.
- **status-me**: extremely quick overview of the current situation: where
  we are, plus 1-2 next actions. Max 3 sentences or 4 short bullets, no
  background. Answer from context without exploring; fast over thorough.
- **close-me**: I am unsure whether this session can be closed safely: tell
  me what is still open, or that nothing is. Changes nothing, fixes
  nothing. Answer from context plus quick read-only checks (`git status`,
  `git worktree list`, running agents); fast over exhaustive. Check:
  uncommitted or unmerged work of this session; leftover worktrees,
  branches, background agents, temp files; important new information in
  context not yet logged (`log-me`); ideas or follow-ups mentioned but not
  parked or ticketed; open questions or decisions waiting on me. Unpushed
  commits are info only, not a blocker. Verdict first: "Safe to close,
  nothing left", or a short list of open items, each naming the action or
  keyword that resolves it (e.g. "commit the 2 changed files", "`log-me`:
  decision on X not logged"). No long prose.
- **path-me**: show me the path this session is on, visually in chat.
  Answer from context, normally in one turn after some thinking: no
  exploring and no changes. Rarely a tool call or a counter question is
  fine. Extremely condensed. Layout, in this order: (1) At most 6 items
  found or done in this session, a representative pick in the order they
  happened, related steps merged, not repeating the tree's tasks. One
  plain `- ` line each, no table, no emoji; an emoji only for an
  exceptional item (🎫 became a ticket, ⚠️ problem). Text is telegraphic,
  ~8 words max, no "I", shorter than seems necessary. (2) Last, `###
  Overall status` with a tree in a code block, zoomed out in levels: the
  overall goal as root, below it the phases (finished `├─ ✅ text`, the
  current one `├─ 📍 text` expanded, upcoming `└─ later: text`); inside
  the current phase its tasks the same way (finished ✅, current 📍
  last), with `└─ next: ...` nested under the current task (plain text,
  no emoji; if none is clear, `next: pick direction`). Max 4 levels and
  ~9 lines. Root and phases come from context only: if the overall goal
  is not discernible, leave the root out instead of inventing it (the
  topic is then the root). Several parallel topics: one tree each.
  Example:
      AI keyword vocabulary
      ├─ ✅ first keywords defined
      ├─ 📍 path-me
      │  ├─ ✅ defined, installed
      │  └─ 📍 layout polish
      │     └─ next: test in a longer session
      └─ later: more keywords
  Differs from `status-me` (quick situation plus next actions, no
  trajectory) and `brief-me` (done / pending / needs my decision). Stays
  in chat; with `widget-me` or `board-me` it goes to `hatch` instead.
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
- **feedback-me**: give me quick feedback on what I'm pointing at (an idea,
  a plan, a piece of wording; else the last thing discussed): improvements
  and problems. Answer from context, no exploring, no files changed; the
  only tool call allowed is reading the target itself if it is a file or
  selection not already in context. Ask only if the target is unclear. Short: a one-line verdict,
  then at most 3 numbered points (F1-F3), most important first, one line
  each, tagged problem or improvement. If more is worth saying, add one
  line that there is more (with a count) and stop; I'll ask for it. Keep
  the rough structure of the original: do not rewrite it or propose a new
  structure unless the structure is the main problem (then say so). Suggest
  concrete wording only when I'm unsure how to phrase something. Differs from
  `quiz-me` and `chisel-me` (they ask questions, this judges), and
  `spec-me` (cases to confirm). Works with `widget-me` and `board-me`.
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
