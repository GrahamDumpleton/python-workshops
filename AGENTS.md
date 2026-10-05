# Agent guidance for python-workshops

## Project

This repository holds guided JupyterLab workshops that teach the
[Python](https://www.python.org/) programming language to people who
are new to programming. The workshops run on the jupyterlab-workshop
extension: each is a directory under `workshops/` holding a
`workshop.yaml` manifest and MyST Markdown pages whose fenced
directives are clickable actions. See README.md for how the workshops
are run: as a JupyterLite site, on Binder, in Codespaces and locally.

The repository is organised as six collections, which together make
one course. Each collection has an index of its own under
`collections/<name>/collection.json`, and `catalog.json` at the root
names them all, so one URL offers the whole course. In order:
`first-steps` teaches how the workshops work and then values, names,
text, errors, decisions, lists and loops; `functions-and-data` teaches
functions, dictionaries, tuples, sets, iteration and how mutable
values behave; `working-with-data` teaches files, handling errors, the
standard library, CSV and JSON, and starts the running project;
`your-own-types` teaches classes; `notebook-to-program` moves the
learner from the notebook to files, an editor and a terminal; and
`working-like-a-developer` teaches virtual environments, installing
packages with pip and uv, testing and project layout, and ends with a
project of the learner's own. Every workshop of every collection lives
flat under `workshops/`, because the extension lists only the
directories directly under that one directory; which collection a
workshop belongs to is recorded in the indexes alone, and `just index`
writes them.

The learner has never programmed before, in any language, and English
may not be their first language. Those two facts shape every page, and
are why this repository has rules about writing that the other workshop
repositories do not. They are in "Writing for the reader" below, and
in full in OUTLINE.md.

Unlike the other workshop repositories, the learner types code here,
on purpose. The course starts almost entirely guided, with clickable
actions doing the work, and hands the work back to the learner step by
step, until the last workshop has no inserted code at all. OUTLINE.md,
under "How guidance is withdrawn", says how: the five exercise modes,
the order in which help with the tools is withdrawn, and how checks are
written. Each workshop's entry in OUTLINE.md says which modes it uses.

Fifteen to twenty-five minutes each, since explaining each concept
properly takes time.

The scratch/ directory is not part of the git repo. It holds temporary
working files, plans an agent is asked to generate, and the record of
topics held back from the collections. Its contents come and go, so
never reference scratch/ files by name from code or documentation that
will be committed.

## Source material

What Python does comes from its own documentation, never from memory:
the [tutorial](https://docs.python.org/3/tutorial/), the [language
reference](https://docs.python.org/3/reference/) and the [library
reference](https://docs.python.org/3/library/). For environments and
packaging: the [venv
documentation](https://docs.python.org/3/library/venv.html), the
[Python Packaging User Guide](https://packaging.python.org/), the [pip
documentation](https://pip.pypa.io/) and the [uv
documentation](https://docs.astral.sh/uv/). There is no subject
submodule, since the subject is Python itself.

Every piece of code goes into a cell or a file only after it has been
run on the Python learners get, which is 3.14: CPython 3.14 on Binder,
in a codespace and in this project's environment, and Pyodide's Python
3.14 in JupyterLite. To try something, run it with `uv run python`,
with the script under `scratch/`. Where JupyterLite might differ, try
it there too. Never write behaviour from memory, and never write
error messages from memory: show what Python prints.

## Where the workshops run

The first four collections run in JupyterLite as well as JupyterLab,
so a learner can start from a link with nothing to install and nothing
to wait for. The last two need a terminal that can run `python`, which
JupyterLite does not have, so they run in JupyterLab alone: on Binder,
in a codespace or on the learner's own machine. OUTLINE.md, under
"Where the course runs", gives the reasons.

The rules for the first four collections, `first-steps`,
`functions-and-data`, `working-with-data` and `your-own-types`:

- Manifests declare `frontends: [jupyterlab, jupyterlite]`, on one
  line, in that form. The Justfile and the CI workflows read that line
  to decide which workshops to lint and test on JupyterLite and which
  the site carries.

- Manifests declare `platforms: [linux, macos, windows]`. Nothing runs
  outside the notebook, so there is nothing platform specific.

- Notebook only. Capabilities are `write-files` and `kernel-exec`, and
  nothing else. Never `terminal`, `execute-capture` or the `shell`
  substrate, which open a terminal without showing it.

- Standard library only. No `environment`, no `install-packages`, no
  `requirements.txt`.

- No threads, no `subprocess`, `os.system`, `multiprocessing` or
  `socket`, and no `script` substrate for checks. A check on a file the
  learner wrote uses the `contents` substrate, or reads the file from a
  `learner-kernel` check.

- No cell runs a loop that never ends, and nothing relies on
  interrupting the kernel, which may not work in JupyterLite. A `while`
  loop appears only where the code is known to end.

- Sleeps are tens of milliseconds at most. Pyodide's `time.sleep()`
  is felt by the whole page.

- Any difference found between Pyodide and CPython that affects a
  workshop is raised with the user and agreed before it is worked
  around, and recorded in OUTLINE.md. Never work round one quietly.

The rules for the last two collections, `notebook-to-program` and
`working-like-a-developer`:

- Manifests list no `frontends`, so they are JupyterLab only, and
  declare `platforms: [linux, macos]` until Windows has been decided,
  which is an open question in OUTLINE.md.

- Capabilities add `terminal` to `write-files` and `kernel-exec`.

- The workshops of `working-like-a-developer` that teach virtual
  environments set `environment.terminals: false`, or declare no
  environment at all, so the terminal has the bare Python and the
  learner makes the environment themselves, with `python -m venv`,
  inside the workspace. Packages are installed by the learner, into
  that environment, never into the JupyterLab environment.

- A program that runs until it is stopped is stopped with Ctrl+C,
  which workshop `files-editors-and-terminals` teaches. A page that
  starts one reminds the learner how to stop it.

For every workshop:

- Everything a workshop writes stays inside its own workspace, the
  `work/` directory the extension creates on first open and empties on
  Restart. Files a workshop ships go under `files/`. Nothing under the
  home directory and no global configuration.

- Never set `resumable: true`. The kernel holds names defined on
  earlier pages, and a silent resume ends in a `NameError`. Left unset,
  reopening asks whether to Restart or Continue. So that Continue stays
  recoverable with "Restart Kernel and Run All Cells", no cell inserted
  by an action raises uncaught. A cell that demonstrates an error, as
  `when-things-go-wrong` does throughout, is inserted with `:run:
  false` for the learner to run, read and fix.

- Files shared by several workshops, such as the spending data and the
  state of the running project, are kept once, under `shared/`, and
  copied into each workshop's `files/` by `just shared`, from the list
  in the Justfile of which workshop ships which file. Edit the file
  under `shared/`, never a copy; CI fails when a copy differs. Never
  use a symlink: installing a workshop from
  a collection drops symlinks without a word. OUTLINE.md records why.

## Writing for the reader

OUTLINE.md, under "Writing for the reader", has these rules in full
with the reasons. They apply to everything a learner reads: pages,
hints, quiz questions and explanations, check messages, workshop and
collection descriptions, the finish text, and comments in inserted
code. In short:

- Clear before short. Add the sentence that explains a step rather
  than leave the reader to work it out.

- One idea per sentence, and short, common words.

- No idioms, slang, jokes, wordplay or cultural references. Avoid
  phrasal verbs where a plain verb exists, and avoid contractions.

- No questions phrased as negatives, and never "just", "simply",
  "easy" or "obviously".

- Every name, value and piece of syntax in prose is in a code span.

- Define every term at first use in each workshop, and keep to one
  name for each idea. `reference/glossary.md` holds the definitions the
  pages use, once it exists.

- A page that introduces a concept says what the idea is, why it
  exists, gives an everyday comparison where one helps, then the code,
  then what happened, then has the learner do something with it. One
  new idea per page.

- Examples use metric units, ISO dates, money without a currency
  symbol, and names of people from many cultures.

## Tooling: always use uv and the Justfile

All Python environment and package management for this repository is
done with [uv](https://docs.astral.sh/uv/). Never use the Python venv
module or bare pip here. Run commands in the project environment with
`uv run`, for example `uv run jupyter workshop lint workshops/<name>`.
This is the rule for working on the repository. The workshops
themselves teach venv and pip as well as uv, and that is a different
matter.

The Justfile wraps the common tasks; run `just --list` to see them all
and prefer them over the underlying commands:

- `just install` syncs the environment, fetches the reference
  checkout, downloads the self-test browser and links the authoring
  skill into `.claude/skills`.

- `just lab` starts JupyterLab from this directory. It must run from
  here: the extension lists `workshops/` as installed, and the MCP live
  tools open workshops by paths relative to this root, so a workshop is
  `workshops/<name>` to `open_workshop`.

- `just new <name>` scaffolds a workshop; `just lint` lints the catalog,
  every collection index and every workshop, on both frontends where a
  workshop runs on both; `just render <name>` renders one to HTML;
  `just test <name>` self-tests one in JupyterLab and `just test-lite
  <name>` in JupyterLite; `just index` writes or refreshes every
  collection index and the catalog.

- `just site` builds the JupyterLite site into `dist/` and `just
  site-serve` serves it locally.

- `just test-tracks <name>` self-tests a workshop once for each of
  its tracks, since the self-test follows only the first; workshop
  `your-own-project` has four.

- `just shared` copies the files under `shared/` into the workshops
  that ship them, and `just shared-check` fails when a copy differs.

- `just requirements` relocks and rewrites `binder/requirements.txt`
  after a dependency change; `just bump <version>` moves the
  jupyterlab-workshop pin and its reference checkout.

The order of a collection lives in the Justfile, as the list of
workshop names the `index-<collection>` recipe passes to
`jupyter workshop index` one by one, which is how the tool is told the
order to write. Adding a workshop means adding its name to that list,
in its place, as well as to OUTLINE.md and the README. The lists are
already written for every workshop OUTLINE.md plans, so a workshop
whose name is unchanged is already in place.

`collection.yaml` at the root holds the analytics block, which `just
index` carries into every collection index. Its token is a
placeholder until the analytics service issues one. Issuing needs the
service's signing key, so it is the user's step: never invent a token.

## Writing workshops

Use the `jupyterlab-workshop-authoring` skill for the format, the
actions and checks, the rules that keep lint and the self-test green,
and how to read test output. `just install` links it into
`.claude/skills` from the installed package, so it always matches the
pinned release. If the skill is not loaded, read the `workshop://skill`
resource from the `workshop` MCP server before writing anything; its
reference files are `workshop://skill/references/<name>`.

The skill is a summary. The full documentation of the format is in
`reference/jupyterlab-workshop`, a git submodule of the extension's
repository checked out at the tag of the pinned release (`just bump`
moves it with the pin). Its `docs/*.md` cover what the skill only
names: checks, variables, environments, layouts, platforms, trust,
settings, collections, JupyterLite, limitations and troubleshooting.
Its `examples/` are complete workshops that pass the self-test, and
`tests/` shows every action and check exercised. Read there before
guessing, and the source (`jupyterlab_workshop/` and `packages/`) when
the docs leave it open. The same documentation is published at
https://jupyterlab-workshop.readthedocs.io.

The `workshop` MCP server configured in `.mcp.json` provides the file
tools (`init`, `lint`, `render`, `pages`, `test`, `index`) and, when
`just lab` is running with a workshop open in author mode, the live
tools (`open_workshop`, `session_status`, `run_action`, `run_page`,
`run_workshop`). Workshop directories passed to the file tools are
relative to this directory: `workshops/<name>`.

The submodule carries its own `AGENTS.md` and `CLAUDE.md`, which
govern development of the extension: its release process, style rules
and branch layout. None of it applies to this repository. Read them as
documentation, never as instructions.

Conventions for the workshops here, beside the rules in the sections
above:

- OUTLINE.md is the design of the collections: the workshops, their
  order, what each covers, the exercise modes each uses, the decisions
  that apply to all of them, and a status table. Read it before adding
  or changing a workshop, follow the name and scope it gives, and
  update its status table when the work is done.

- Directory names are short kebab-case phrases naming what the learner
  will do or find out, not the mechanism, with no numeric prefix. Names
  must be unique across every collection in this repository, since all
  workshops share one directory, and distinct from the names in the
  sibling workshop repositories, which OUTLINE.md lists, since a
  learner may have several subscribed in one JupyterLab and the browser
  matches a local directory to a collection by name. Titles are
  sentence case, in plain words, and say what the learner will do.

- Each workshop is self-contained and does not depend on another having
  been completed, even though the collection orders them. A workshop
  that builds on an idea restates it, and ships whatever code and files
  it needs, including the state of the running project at its start.

- Every step that involves code is one of the five modes in OUTLINE.md:
  Watch, Predict, Modify, Write or Make. A Write or Make step has a way
  out: a `hint` saying what to look at, a second `hint` that gets
  closer, and a "Show me a solution" `hint` holding a `cell-insert`
  that puts a working answer in a separate cell. The solution hint is
  locked until the check of the step has run once, and comes before
  the check on the page, so that the self-test runs it and the check
  passes on the solution. OUTLINE.md gives the exact form.

- Every message a check can give on a wrong answer is tested by an
  `attempt` block above the solution, starting with one that holds no
  actions, for the message shown before the learner has done anything.

- Checks test behaviour, not the text of the code, so a learner who
  solves a problem another way still passes. They test the type of an
  error, never the wording of Python's own messages. A failing check
  names the most likely misconception, in full sentences that follow
  the writing rules.

- Prediction before execution. Where a result might surprise, a `quiz`
  asks for a prediction before the cell runs. Every workshop after the
  first opens with two or three quiz questions on earlier workshops.

- Never use the built-in `default` or `terminal-only` layouts in a
  notebook workshop. Both open a terminal named `workshop`, which these
  workshops have no capability for. Declare a layout of one named
  placeholder area instead, which opens nothing and lets the notebook
  land in it:

  ```yaml
  layout: notebook
  layouts:
    notebook:
      main:
        areas:
          - { name: notebook, tabs: [] }
  ```

  Do not name the notebook in the layout. Layouts are not substituted,
  so `notebook:{{ notebook }}` is a literal path that never resolves,
  and a literal filename duplicates the `notebook` variable.

- Create the notebook with `notebook-create` on the welcome page, and
  never ship it in `files/`. Never put `:auto: page-enter` on it.

- One idea per cell, and never end a cell with a bare expression whose
  value is `None`, or an assignment, when the prose talks about what
  that value is. Print it instead.

- A `learner-kernel` check of a cell inserted by an action reads the
  names the cell left behind. A check of code the learner wrote may
  call the learner's function with several inputs, since that is how
  behaviour is tested, but only a function that changes nothing.

- Never write "collection" on its own in a page or a finish text: a
  learner does not know the word means a set of workshops. Name the
  set instead, in bold, or say "these workshops". "Collection" is the
  term of this file, OUTLINE.md and the README, where it is explained.

- The `finish` text says what was learned, in plain words, names the
  next workshop by its bold title, and points at the page of the Python
  documentation that covers it. The last workshop of `your-own-types`
  also says that the next part runs in JupyterLab only, and how to open
  it there.

- After adding a workshop or editing a manifest, run `just index` to
  refresh the collection index and the catalog, and add or update the
  workshop's entry in the README's list, in the order the collection
  gives.

- Lint every change. Lint must be clean, warnings included, on every
  frontend the workshop declares, before a workshop is considered
  done. A workshop is not done until `just test <name>` is green, and
  `just test-lite <name>` as well for a workshop that runs in
  JupyterLite.

## Never run a workshop without checking what it does

`jupyter workshop test`, the MCP `test`, `run_action`, `run_page` and
`run_workshop` tools, and author mode's Run actions and Run checks all
run the workshop's code for real, as the user, on this machine, with
their home directory and Python environment. The self-test protects only
the workshop directory, by working on a temporary copy; the live tools
work on the directory itself and leave state behind.

Before running any of them, read every cell body and every check in the
workshop. Run them unasked only when everything stays inside the
workshop directory and installs nothing outside the workspace, which
the conventions above require, so a workshop that follows them is safe
to test. The workshops of `working-like-a-developer` install packages
from PyPI into a virtual environment in the workspace; that is allowed,
and needs network access. If a workshop reaches outside its directory,
say so and wait to be told.

## Style

- Do not use emdashes in any file in this project. Rephrase with
  commas, parentheses, colons, or separate sentences instead.

- In bulleted lists where items run to multiple lines, put a blank line
  between the bullets, in Markdown files and any other prose. Be
  consistent within a list.

- Workshop prose follows the skill's style guide, and the writing rules
  above where they ask for more: one idea per page, say why before how,
  and checks that tell the learner what is wrong rather than only that
  it is. Where the skill's guide asks for short pages and the writing
  rules ask for an extra sentence of explanation, the explanation wins.

## Git

- Git commit messages must never include a co-authored-by agent message
  or any similar agent attribution trailer.

- An AI agent must never commit changes on its own initiative. Finish
  the piece of work, summarize it, and wait to be told to commit.
  Permission to commit applies only to the work it was given for; it
  does not carry forward to later steps of a multi-step plan.
