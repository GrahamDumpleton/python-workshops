# Python fundamentals workshops: outline

The design of the course: how it is organised, what each workshop
covers, its name and format, and the decisions that cut across all of
them. It is a living document. Read it before adding a workshop, and
update it when one is added, changed or dropped: the status table below
records where each workshop stands, and the open questions section
shrinks as they are settled.

## What this course is

A course in Python for people who have not programmed before, or have
tried and not got far, run as guided workshops in JupyterLab with the
jupyterlab-workshop extension. It starts with typing an expression into
a notebook and ends with the learner building a small project of their
own, structured across files, run from a terminal, tested, and living in
a virtual environment they made and understand.

The course has to do two jobs at once, and most ways of teaching
beginners do only one. It has to keep the learner moving, so that they
see something working in the first few minutes of every workshop and
never stall on setup, typing or the tools. It also has to make them do
the work, because a learner who only clicks and reads ends up as able
to program as one who has watched a video. The extension's clickable
actions are how the first job is done. This outline is mostly about
how the course hands the work back to the learner, step by step, so it
also does the second.

## Who the learner is

Two facts about the learner shape every page of the course, and are
the reason for the section on [writing for the
reader](#writing-for-the-reader) below.

**Programming is new to them, not only Python.** They may not know what
a program is, what it means to run one, what a variable or a function
is in any language, or why anyone would want one. The course cannot
assume ideas that other introductions take for granted. Every concept
is explained before the code that uses it, in plain words, with the
reason it exists.

**English may not be their first language.** Many learners will read
the pages slowly, look words up, or use the browser's translation. The
pages must be easy to read for them, and that matters more than being
short. A longer explanation that is clear is better than a short one
that needs to be read three times.

## Source material

Python's own documentation is the authority on behaviour: the
[tutorial](https://docs.python.org/3/tutorial/), the [language
reference](https://docs.python.org/3/reference/), the [library
reference](https://docs.python.org/3/library/), and for environments
and packaging the [venv
documentation](https://docs.python.org/3/library/venv.html), the
[Python Packaging User Guide](https://packaging.python.org/) and the
[uv documentation](https://docs.astral.sh/uv/).

The teaching approach draws on the notes in `scratch/notes.md`: active
production over passive consumption, fast and specific feedback, worked
examples first with guidance removed as skill grows, keeping incidental
load low early, and transfer to a real environment by the end.

## Shape of the course

A catalog of six ordered collections. Each collection is numbered in
the workshop browser and each Finish dialog offers the next workshop,
and the last workshop of each collection names the first of the next.
Fifteen to twenty-five minutes per workshop, since explaining each
concept properly takes time, and forty-two workshops, so roughly
thirteen to fifteen hours in total.

**1. First steps** (1 to 9). How the workshop environment works, then
what a program is, values, names, text, errors, decisions, lists and
loops, in a notebook. Starts almost entirely guided, and by the end the
learner is writing short cells themselves.

**2. Functions and data** (10 to 17). Functions, dictionaries, tuples
and sets, iteration, comprehensions, and how names and mutable values
behave. Still in a notebook. Most exercises are written by the learner.

**3. Working with real data** (18 to 23). Files, errors as something to
handle, the standard library, CSV and JSON. The running project starts
here. The notebook is still home, but data files and the editor appear.

**4. Your own types** (24 to 27). Classes, introduced in the notebook.
This is a place where clickable actions earn their keep: a class is a
lot of lines to type before anything happens, so the boilerplate
arrives by click and the learner writes the methods that matter.

**5. From notebook to program** (28 to 35). The move from notebook to
files, editor and terminal: modules, scripts, command line arguments,
packages, how imports are found, and debugging. The clicks that create
files and run commands are withdrawn over the collection until the
learner does both.

**6. Working like a Python developer** (36 to 42). Why virtual
environments exist and how they work, installing packages with pip and
then uv, testing, project layout and tools, and a project of the
learner's own from a short brief.

The first four collections teach what Python is. The last two teach how
Python programs are made and run, and there the emphasis moves from
what to do to why it is done and how it works underneath: a learner who
knows what activating an environment does to `PATH` can fix it when it
goes wrong, where one who has only memorised the command cannot.

Collections 1 to 4 run in JupyterLite as well as JupyterLab, so they
can be opened from a link with nothing to install. Collections 5 and 6
need a terminal that can run `python`, which JupyterLite does not have,
so they run in JupyterLab alone: in a codespace, on Binder, or on the
learner's own machine. Workshop 28 is where the learner makes that
move, and is written for it. See [where the course
runs](#where-the-course-runs).

Each workshop is self-contained and ships whatever it needs, including
the state of the running project at its start, so it can be taken on
its own or restarted without depending on what the learner did before.

## Naming

Directory names are short kebab-case phrases naming what the learner
will do or find out, not the mechanism, with no numeric prefix. The
collection index carries the order, and unnumbered names stay stable as
workshops are inserted, split or moved. Titles are sentence case, in
plain words, and say what the learner will do.

Names are unique across every collection in this repository, since
all workshops share one directory. They must also differ from the
names in the sibling workshop repositories, since a learner may have
several subscribed in one JupyterLab and the browser matches a local
directory to a collection by name. The siblings are
`decorator-workshops`, `wrapt-workshops`, `wrapture-workshops`,
`claude-sdk-workshops`, `tachyon-workshops`, `wsgi-workshops` and
`jupyterlab-workshop-showcase`. On 2026-10-03 none of the forty-two
names in this outline was used by any of them. Check again before
adding or renaming a workshop.

## Writing for the reader

These rules apply to everything a learner reads: pages, hints, quiz
questions and explanations, check messages, workshop and collection
descriptions, the finish text, and comments inside inserted code.

### Plain, clear English

- **Clear before short.** When making a sentence shorter would make it
  harder to understand, keep it longer. Add the extra sentence that
  explains a step rather than leaving the reader to work it out.

- **One idea per sentence.** Prefer two short sentences to one long
  sentence with several clauses. Prefer short, common words to rare
  ones: "use" rather than "employ", "start" rather than "initiate".

- **No idioms, slang or cultural references.** Phrases such as "under
  the hood", "out of the box", "a piece of cake" or "rule of thumb" do
  not translate and may not be known. Say what is meant directly. The
  same goes for jokes and wordplay, and for references to sports,
  television or holidays of one country.

- **Avoid phrasal verbs where a plain verb exists.** "Find" rather than
  "figure out", "remove" rather than "get rid of", "continue" rather
  than "carry on". Phrasal verbs are among the hardest parts of English
  for a learner, and translation tools often get them wrong.

- **Avoid contractions.** "Do not" rather than "don't", "it is" rather
  than "it's". They are harder to read for some learners and are often
  translated badly.

- **No negative questions.** A quiz asks "Which of these is a list?"
  and not "Which of these is not a list?". The quiz tests the Python,
  not the reader's English.

- **No "just", "simply", "easy" or "obviously".** A learner who finds
  the step hard is told they are failing at something easy.

- **Code stays in code formatting.** Every name, value and piece of
  syntax in prose is in a code span, so that a translation tool leaves
  it alone and the learner can tell code from English.

### One word for one thing

- **Define every term at first use, in each workshop.** A new term is
  shown in bold the first time it appears, with a plain definition in
  the same sentence or the next. Since workshops can be taken on their
  own, a term that an earlier workshop defined gets a short reminder in
  the first workshop of each collection that uses it.

- **Keep to one name for each idea.** Once a page says "list", it never
  calls the same thing an "array" or a "sequence". Once it says
  "function", it never switches to "routine". Where Python has two
  words for one thing, such as "argument" and "parameter", the
  difference is explained once and then both are used exactly.

- **A list of terms for authors.** The terms used across the course
  are kept in one list, `reference/glossary.md`, with the plain
  definition the pages use, so every workshop defines a term the same
  way. Learners are not given a glossary to begin with: each workshop
  defines its own terms. If one turns out to be needed, it can be
  published on GitHub Pages and linked from the pages, rather than
  shipped in every workshop.

### Explain before showing

Every page that introduces a concept follows the same order, so the
learner always knows what comes next:

1. **What the idea is**, in plain words, with no code yet.
2. **Why it exists**: the problem it solves, ideally a problem the
   learner has just met.
3. **An everyday comparison**, where one helps and does not mislead.
   A comparison that is not quite right is worse than none.
4. **The code**, short, doing one thing.
5. **What happened**, line by line where the code is new, saying what
   Python did at each step, not only what the result was.
6. **The learner does something with it**: predicts, changes or writes
   code.

A page never shows code that uses an idea the learner has not been
told about. When this is unavoidable, for example `print()` in the
first workshop, the page says that it will be explained later and what
the learner needs to know about it for now.

A page introduces one new idea. If a page needs two, it becomes two
pages.

### Examples that travel

- **Everyday and international.** Shopping, cooking, travelling,
  temperatures, people's names, the days of a week. Nothing that needs
  knowledge of one country's systems, such as its taxes, school grades
  or sports.

- **Names from many places.** People in examples have names from many
  languages and cultures.

- **Metric units and ISO dates.** Temperatures in Celsius, distances in
  kilometres, and dates written as `2026-03-14`, which is read the same
  way everywhere, unlike `03/14/2026` or `14/03/2026`.

- **Money without a currency symbol.** Amounts are plain numbers, so no
  learner meets an unfamiliar symbol or the habits of one currency.

### Check messages and hints

A check message is often what the learner reads when they are already
confused, so it follows the same rules and is written with special
care. It says what was expected, what was found, and what to try, in
full sentences: "The function returned `None`. That usually means it
uses `print()` but does not use `return`. Add a `return` line so that
the result is given back to the code that called it." See also
[checks](#checks) below.

## How guidance is withdrawn

This is the decision the rest of the course hangs on, so it comes
before the workshops.

### Exercise modes

Every step that involves code is one of five modes, following PRIMM
(Predict, Run, Investigate, Modify, Make). Each workshop's entry below
says which modes it uses, and the mix moves down the table as the course
goes on.

| Mode | The learner | Built from |
|------|-------------|------------|
| Watch | reads a worked example as it runs | `cell-insert` with `:run: true` |
| Predict | commits to an answer before seeing it | `quiz` before the `cell-insert` that answers it |
| Modify | fixes or extends code that is nearly right | `cell-insert` with `:run: false`, a gap or a bug in it; a verify triggered by `cell-executed` |
| Write | fills an empty cell or file from a short spec | `cell-insert` of a tagged cell holding only a comment saying what to write; a verify on behaviour |
| Make | builds something from a goal, no starting code | the goal in prose; a verify; layered hints |

Every Write and Make step has a way out, so nobody is ever stuck: a
`hint` saying what to look at, a second `hint` that gets closer, and
then a "Show a solution" `cell-insert` that puts a working answer in a
separate cell, for the learner to read and compare with their own.
Gating is `soft`, so a learner can move on, and the page records that
they did.

The specification for a Write or Make step is written as carefully as
any other page, since a learner who misreads it will write the wrong
thing correctly. It says what goes in, what should come out, and gives
an example of each.

### Tools

The environment is withdrawn in the same way as the code.

| Collection | Code | Files and directories | Commands | Where |
|------------|------|-----------------------|----------|-------|
| 1 | inserted, then modified, then short cells written | none | none | notebook |
| 2 | mostly written | none | none | notebook |
| 3 | written | data files shipped; `file-write` of boilerplate | none | notebook and editor |
| 4 | boilerplate inserted, methods written | none | none | notebook |
| 5 | written | created by click, then by the learner, checked with `exists` | `execute`, then `terminal-type` with the learner pressing Enter, then typed | editor and terminal |
| 6 | written | created by the learner | typed by the learner | editor and terminal |

A collection never withdraws two kinds of help at once. When the
terminal first appears in collection 5 the code being run is code the
learner already knows how to write, and when the learner first has to
create files themselves the commands that use them are still clicks.

### Checks

Checks test behaviour, not the text of the code: `add(2, 3) == 5 and
add(-1, 1) == 0` rather than a regex over the cell. A learner who
solves a problem a different way from the author still passes.

A failing check names the most likely misconception rather than saying
that something is wrong. The common beginner errors are known and few,
and each check should be written against the one it is most likely to
meet.

Checks do not depend on the exact wording of Python's own error
messages, which change between Python versions and differ between
JupyterLite and JupyterLab. They check the type of the error.

### Remembering

Every workshop after the first opens with two or three quiz questions
on the workshops before it, a few steps back rather than only the last
one, which is retrieval practice and costs a minute. Every collection
ends with a capstone that is mostly Make, which is where the learner
finds out what they can do without being told the next step.

## The workshops

### Collection 1: First steps

#### 1. `how-this-works`: How these workshops work

The orientation, and the first thing any learner does. It teaches the
environment and not Python, using a few lines of Python as the material.

The panel and the session beside it. Clicking an action and seeing it
do something real. What a notebook is: cells, running one, the output
under it, running it again. A check, passing and then failing on
purpose. A quiz. A hint. Gating, and what the footer says when a page
is not finished. Restarting a workshop and what it keeps. Finishing and
the next workshop. Then the first thing the learner types: change a
number in a cell that was inserted for them and run it again.

Where the learner is running matters here, and the page says so with a
`when` on the `frontend` variable. In JupyterLite their work is kept in
this browser on this computer, and reloading the page starts Python
again, so the workshop asks whether to restart or continue. On a
codespace or their own machine, the work is in files that stay.

It ends by saying what the course will ask of them: the clicks are
there to save time on things that are not the lesson, and as the course
goes on they will do more of the typing themselves, on purpose.

- Format: notebook, with a `tour` of the panel.
- Modes: Watch, then one Modify.
- Length: 10 to 15 minutes.

#### 2. `talking-to-python`: Talking to Python

Starts before any code, with what a program is: a list of instructions
that a computer follows exactly, one after another. What Python is: a
language for writing those instructions, and a program, the
interpreter, that reads them and carries them out. What a notebook cell
has to do with that.

Then expressions and numbers: Python as a calculator. Integers and
floats, the operators, the order in which they are worked out, `//` and
`%`, and that `0.1 + 0.2` is not exactly `0.3` (shown and named, with
the full reason left for later). A cell shows its last value.

- Modes: Watch, Predict, Modify, and the first Write at the end: a
  calculation of their own.

#### 3. `naming-things`: Naming things

Why a program needs to remember values, then variables and assignment.
A name is a label on a value, not a box. Reassignment, using a name
before it exists, and how to choose good names. `print()` and why a
cell shows some things without it.

- Modes: Predict, Modify, Write.

#### 4. `working-with-text`: Working with text

What a string is and why text is different from numbers to a computer.
Quotes, f-strings, a handful of methods (`upper`, `strip`, `replace`,
`split`), what a method is, `len`, indexing and the first slice.
Strings do not change; methods give back new ones.

- Modes: Predict, Modify, Write.

#### 5. `when-things-go-wrong`: When things go wrong

Reading an error message, early and on purpose. Errors are normal, and
every programmer meets them every day. The traceback read from the
bottom up, and `NameError`, `TypeError`, `SyntaxError`,
`IndentationError` and `IndexError`, each caused, read and fixed. A
learner who can read a traceback is not afraid of one.

Error messages are in English, which is harder for some learners. The
page shows how to read one by its parts: the type of the error, the
line, and the message, and that the type alone often says enough.

- Modes: Modify throughout: every cell is broken, and the learner
  fixes it. Checks confirm the fix and quizzes ask which line the error
  is on.

#### 6. `making-decisions`: Making decisions

Why a program needs to choose, then booleans, comparisons, `and`, `or`,
`not`, `if`, `elif`, `else`, and indentation as structure. `=` against
`==`.

- Modes: Predict, Modify, Write.

#### 7. `keeping-a-list`: Keeping a list

Why keep many values under one name, then lists: creating, indexing
from both ends and why counting starts at zero, slicing, `append`,
`len`, `in`, `sorted` against `.sort()`.

- Modes: Predict, Write.

#### 8. `doing-it-again`: Doing it again

Why repeat, then `for` over a list and over `range`, adding up a total,
counting, finding the largest. `while` briefly: a `while` loop keeps
going until its condition becomes false, so its condition must be able
to become false. That is shown with a loop that has a safety limit,
which stops it after a fixed number of steps and prints that it would
otherwise have gone on forever. No cell in the course runs a loop that
really never ends, so the course never relies on interrupting the
kernel, which may not work in JupyterLite.

- Modes: Predict, Write. Write and Make steps use `for` loops, which
  always end; `while` loops appear only in Watch and Modify steps,
  where the code is known to end.

In case a learner writes a loop that never ends by accident, here or
later, the hint beside each loop exercise says what a cell that stays
at `[*]` means, and to restart the kernel and run the cells again,
which works the same in JupyterLite and JupyterLab.

#### 9. `a-shopping-receipt`: A shopping receipt

Capstone. A list of items, quantities and prices written into the cell,
and a program that prints a receipt from it: one aligned line per item
with its cost, a subtotal, a discount when the subtotal is over a given
amount, and the total. It uses lists, loops, `if` and the f-strings of
workshop 4, and everyone has seen a receipt, so the goal needs no
explaining.

- Modes: Make, with checks for each part and layered hints.

### Collection 2: Functions and data

#### 10. `your-first-function`: Your first function

Why a function: the same steps written once and used many times, and a
name that says what they do. Then `def`, parameters, calling.
`return` against `print`, the most common misconception in the whole
course, given a page of its own and checked for directly. Functions
that return `None`.

- Modes: Watch, Predict, Write.

#### 11. `functions-with-options`: Functions with options

Default arguments, keyword arguments, docstrings, and calling functions
from other functions.

- Modes: Modify, Write.

#### 12. `looking-things-up`: Looking things up

Why look values up by a name instead of a position, compared with a
word and its meaning in a dictionary. Then dictionaries: keys and
values, lookup, `get`, adding and changing, checking for a key,
`KeyError`.

- Modes: Predict, Write.

#### 13. `pairs-and-unique-things`: Pairs and unique things

Tuples and unpacking, returning more than one value, sets and
membership.

- Modes: Predict, Write.

#### 14. `looping-over-anything`: Looping over anything

Iterating over strings, dictionaries (`items`), `enumerate`, `zip`.

- Modes: Modify, Write.

#### 15. `building-lists-in-one-line`: Building lists in one line

List and dictionary comprehensions, written from the loop they replace,
and when a loop is clearer.

- Modes: Predict, Write.

#### 16. `two-names-one-list`: Two names, one list

Mutability and aliasing: two names for one list, a function that
changes its argument, the copy that was not one, and local against
global names. The source of a whole class of beginner bugs, met here on
purpose rather than later by accident.

- Modes: Predict throughout, then Modify to fix each bug.

#### 17. `counting-words`: Counting words

Capstone. Word frequencies from a set of Aesop's fables, given to the
learner as a string so that files are not needed yet. Which words are
most common, which fable is longest, and which words appear in every
fable, which uses the sets of workshop 13. See
[themes](#themes) for why these texts.

- Modes: Make.

### Collection 3: Working with real data

The running project starts here: a spending tracker, a single program
that grows over collections 3 to 6. Each workshop ships the project as
it should be at that workshop's start, so a learner who skipped ahead or
made a mess can restart and carry on. See [themes](#themes).

#### 18. `reading-and-writing-files`: Reading and writing files

What a file is, and why a program needs to read and write them: so that
data lasts longer than the program does. Then `open`, `with`, reading
lines, writing, and `pathlib` for paths. The spending data, a CSV file,
is opened in the editor beside the notebook, so the learner sees what
their code reads before reading it.

- Modes: Watch, Write.

#### 19. `when-the-data-is-wrong`: When the data is wrong

`try` and `except`, catching the specific exception, `raise`, and the
difference between an error to handle and an error that is a bug.
Shown on rows of the spending data that cannot be read.

- Modes: Predict, Modify, Write.

#### 20. `the-batteries-included`: The batteries included

What a module is and what `import` does. Then a tour of `math`,
`random`, `datetime` and `collections`, and reading the library
documentation to find something out for themselves.

- Modes: Write, with one step that needs the documentation.

#### 21. `csv-and-json`: CSV and JSON

What the two formats are and when each is used, then reading and
writing both with the standard library. The spending data read with
`csv`, and the categories and their monthly budgets kept in JSON.

- Modes: Modify, Write.

#### 22. `cleaning-messy-text`: Cleaning messy text

Real data is untidy: extra spaces, categories spelled in different
ways, amounts that arrive as strings. Stripping, splitting, normalising
case, and turning text into numbers. The shipped spending data has
untidy rows for exactly this.

- Modes: Write.

#### 23. `where-the-money-went`: Where the money went

Capstone. From the shipped spending data to a report: total by
category, total by month, the largest single purchase, and which
categories went over their budget.

- Modes: Make.

### Collection 4: Your own types

#### 24. `your-first-class`: Your first class

What a class is and why you would make one: grouping data and the
functions that work on it, so a purchase is one thing rather than four
separate values. Then `class`, `__init__`, `self`, attributes and
methods. The class body arrives by click and the learner writes the
methods, so the first class they meet is about what a class does rather
than how many lines it takes to type one.

- Modes: Watch, Modify, Write.

#### 25. `objects-that-explain-themselves`: Objects that explain themselves

`__repr__` and `__eq__` written by hand, then `dataclasses` doing the
same, so the learner knows what the decorator saved them.

- Modes: Predict, Write.

#### 26. `building-on-another-class`: Building on another class

Inheritance and composition, kept light, and when each is the right
choice.

- Modes: Modify, Write.

#### 27. `spending-as-objects`: Spending as objects

Capstone. The spending tracker rebuilt around a `Purchase` class and a
`Ledger` that holds them, with the report from workshop 23 as methods.

- Modes: Make.

The finish text of this workshop says that the next collection runs in
JupyterLab alone, and how to open it there, since a learner in
JupyterLite cannot continue in the same place.

### Collection 5: From notebook to program

#### 28. `files-editors-and-terminals`: Files, editors and terminals

A second orientation, since the environment changes here. For a learner
coming from JupyterLite, first what is different and why: a real
computer, in a codespace or their own, where Python can be run from a
terminal and files stay where they are put. Then the file browser, the
editor, saving, and the terminal: what a shell is and why programmers
use one, the current directory, `ls`, `cd` and `pwd`. No new Python.

How to stop a program running in the terminal gets a page of its own:
pressing Ctrl+C. This needs explaining carefully. To many learners,
Windows users most of all, Ctrl+C means "copy", and in a terminal it
does something different: it tells the running program to stop. On a
Mac it is Ctrl+C as well, not Cmd+C. The page starts a program that
does not end by itself, stops it first with an `interrupt` action, and
then has the learner start it again and stop it with Ctrl+C
themselves. The page also says how to copy and paste in the JupyterLab
terminal, since Ctrl+C and Ctrl+V cannot be used for that in the usual
way. Exactly which keys work for copying and pasting on each platform
is to be confirmed in JupyterLab before the page is written.

Later workshops that run a program in the terminal, such as a server
or the flashcard drill of workshop 42, remind the learner of Ctrl+C
the first time it is needed.

- Modes: Watch, then typed commands.

#### 29. `code-in-a-file`: Code in a file

Functions moved from the notebook into a `.py` file and imported back
into the notebook. Why a file: code that outlives a notebook and can be
shared. The file is created by click; the learner moves the code.

- Modes: Modify, Write.

#### 30. `running-a-script`: Running a script

`python app.py` in the terminal. What `__name__` is and why
`if __name__ == "__main__"` exists, shown by importing the same file
both ways. Commands run by click first, then typed by the learner.

- Modes: Watch, Write, typed commands.

#### 31. `taking-arguments`: Taking arguments

`sys.argv` first, to see what a program receives, then `argparse`. The
spending tracker learns to report on one month or one category.

- Modes: Write.

#### 32. `splitting-into-modules`: Splitting into modules

A program across several files and the imports between them. The
learner creates the files this time, checked with `exists`.

- Modes: Make, with files created by the learner.

#### 33. `where-imports-come-from`: Where imports come from

How `import` finds a module: `sys.path`, the current directory, the
standard library, `site-packages`, and the shadowing bug of a file
called `random.py`. This is the groundwork collection 6 builds on: a
virtual environment is a different `site-packages`.

- Modes: Predict, Investigate.

#### 34. `making-a-package`: Making a package

A package directory, `__init__.py`, relative imports and `python -m`.
The spending tracker becomes a package.

- Modes: Make.

#### 35. `finding-the-bug`: Finding the bug

Tracebacks across several files, `print` debugging, and `breakpoint()`
with the few `pdb` commands worth knowing.

- Modes: Modify throughout.

### Collection 6: Working like a Python developer

The emphasis is on why and how. Every tool here is shown working, then
opened up so the learner sees what it changed, then broken so they see
what goes wrong without it.

#### 36. `why-an-environment`: Why an environment

The problem before the solution: one Python shared by every project,
two projects needing different versions of the same package, and an
install that breaks something unrelated. Shown with what the learner
already knows from workshop 33: where `site-packages` is and what is in
it.

- Modes: Predict, Investigate.

#### 37. `an-environment-of-your-own`: An environment of your own

`python -m venv`, then a look inside: the interpreter, `site-packages`,
`pyvenv.cfg`. What activating does, which is to put a directory first
on `PATH` and nothing more, shown by comparing `which python` and `PATH`
before and after. Running the environment's Python without activating.
Deleting an environment and making it again, since it is disposable.
The manifest sets `environment.terminals: false`, so the terminal has
the bare Python.

- Modes: typed commands throughout.

#### 38. `installing-packages`: Installing packages

`pip install` into the environment, where the package went, `pip list`
and `pip freeze`, and `requirements.txt` as a record of what a project
needs. Then `rich` used in the spending tracker to print its report as
a table.

- Modes: typed commands, Write.

#### 39. `the-same-with-uv`: The same with uv

uv doing what the last three workshops did by hand: making the
environment, installing, locking. Taught as the same ideas with a
faster tool, not as a replacement for understanding them, so every step
is matched to the pip workflow it stands for.

- Modes: typed commands, Make.

#### 40. `testing-your-code`: Testing your code

What a test is for, then `assert`, then `pytest`: writing tests for the
spending tracker and reading a failure.

- Modes: Write, Make.

#### 41. `a-proper-project`: A proper project

`pyproject.toml`, the `src` layout and why it exists, installing the
project into its own environment, a formatter and linter (`ruff`), and
type hints as documentation that a tool can check.

- Modes: Make.

#### 42. `your-own-project`: Your own project

Graduation. The learner picks one of four briefs with a `choice`, and
builds it with checks and nothing else: no inserted code, no clicks
that do the work. Then where to go next, including setting Python up
on their own machine. See [themes](#themes) for the briefs.

- Modes: Make.

## Themes

### What a theme has to do

- **Be familiar without explanation, in any country.** The learner
  should never have to learn the domain to do the exercise, and should
  not need to know one country's customs to understand it.

- **Fit the workshops it runs through.** The running project has to
  start as a list in a notebook, grow into data in a CSV or JSON file,
  become a class or two, then a command line program across modules,
  with tests and one third-party package.

- **Have shippable data.** Small, made up or public domain, shipped
  under `files/`. Nothing fetched from the network, since that is not
  certain everywhere the course runs and a check that depends on it is
  unreliable.

- **Give answers a check can know.** Totals, counts, the largest, the
  latest. Anything random or based on today's date is seeded or fixed,
  or a check cannot say what is right.

- **Be worth keeping.** Something a learner might use after the course,
  or adapt to something they would.

### Small examples inside workshops

Each workshop uses whatever small example teaches its idea best, kept
within the rules in [examples that travel](#examples-that-travel): a
shopping list, temperatures for a week, the people in a class, the
stops on a journey. There is no single cast of characters across the
course, since forcing one costs more than it saves.

### Capstone of collection 1: a shopping receipt

Chosen over a bill splitter, a grade report and a temperature table. A
receipt is the same everywhere, needs only what collection 1 teaches,
and has a visible, checkable result. Grades are left out because
grading systems differ from country to country, and a temperature table
is too small to be a capstone.

### Text for workshop 17: Aesop's fables

Public domain, so it can be shipped and quoted freely. The fables are
known in many countries, are short enough to compare against one
another, and are written in plain English. *Alice's Adventures in
Wonderland* was considered and left out, since much of it is wordplay
that a reader whose first language is not English would find hard.

### The running project: a spending tracker

The spending of one made-up person over a few months: a CSV file of
purchases with a date, a description, an amount and a category, and a
JSON file of monthly budgets per category. Dates in ISO format, amounts
without a currency symbol, and categories in simple words such as
`food`, `transport` and `rent`.

It was chosen because it fits every collection: lists and totals, then
files, untidy data, dates and grouping in collection 3, classes in
collection 4, a command line program in collection 5, and a third-party
package and tests in collection 6. It also gives the course a reason
to show `Decimal`, which completes the `0.1 + 0.2` story that workshop
2 starts: money should not be added as floats. It is something a
learner can use for their own spending after the course.

`rich` is the third-party package, used for printing the report as a
table, since it installs everywhere and shows a visible change.

The other themes considered were a reading log, a recipe box, a habit
log, weather readings and a to-do list. The recipe box was the closest
alternative, but units of measure differ between countries. The others
each fit only part of the course.

### The briefs for workshop 42

A `choice` at the start picks one of four. A track is worth its cost
here, since the learner's own choice is much of the point of a final
project, and each brief is one page with its checks.

- **A file organiser.** Sort a directory of mixed files into folders by
  type or date, with a dry run that prints what it would do first. A
  real tool, and `pathlib` in earnest. Shipped with a directory of
  made-up files to sort.
- **A log analyser.** Read a shipped web server log and report the
  busiest hours, the most requested pages and the errors.
- **A password checker.** Score a password against rules and say why,
  with a command line interface and tests.
- **A flashcard drill.** Questions and answers from a file, asked in the
  terminal, with wrong answers asked again. Uses `input()`, and its
  checks run it with answers given to it in advance.

## Topics not covered

Generators and iterators beyond what a `for` loop uses, decorators,
context managers written by hand, async, threads and processes,
regular expressions, git, web frameworks and data science libraries.
Each is a reasonable next step and none is needed to write a small
program well. Decorators already have their own collection in
`decorator-workshops`, which the finish of the last workshop can point
to.

## Decisions that cut across the workshops

### Where the course runs

**Collections 1 to 4 in JupyterLite and JupyterLab.** Their manifests
declare `frontends: [jupyterlab, jupyterlite]`, and they are published
as a JupyterLite site on GitHub Pages, so a learner can start from a
link with nothing to install and nothing to wait for. They keep to the
rules that make that possible: notebook only, no terminal, no
`subprocess`, no packages, short sleeps.

**Collections 5 and 6 in JupyterLab alone.** Their manifests list no
`frontends`, which means JupyterLab only.

**Python 3.14 everywhere.** CPython 3.14 on Binder, in a codespace and
in the project's environment, and Pyodide's Python in JupyterLite. The
Pyodide kernel in the pinned release loads Pyodide `v314.0.0`, which by
Pyodide's version naming is Python 3.14, so both frontends run the
same version of the language. That was read from the kernel package on
2026-10-03, not tested by running code in the site; the first workshop
written confirms it with `sys.version` on both frontends.

**Three ways to run JupyterLab**, all subscribing to the catalog so the
whole course is listed:

- A codespace, from `.devcontainer/`, as in the other workshop
  repositories.
- Binder, from `binder/`, as in the other workshop repositories.
- The learner's own machine, with instructions in the README and in
  workshop 28: `uv tool install "jupyterlab-workshop[lab]"` and
  `jupyter-workshop launch` with the catalog.

The README and the welcome messages set expectations for the startup
time of a codespace and of Binder.

**Differences between Pyodide and CPython.** None is expected to matter
for collections 1 to 4, but any that is found while writing them is
raised with the course owner and agreed before it is worked around,
and recorded here. The ones known so far are under open questions.

### Content

**Standard library until collection 6.** Nothing is installed for the
first five collections. Collection 6 installs packages, and the
learner installs them, since that is the lesson.

**Learners type code, on purpose.** This departs from the other
workshop repositories, where every cell arrives by click. The modes
above say when.

**Every page ends with something checkable**, where it involves code.

**Prediction before execution** wherever the result might surprise.

### Building and testing

**Platforms.** To be settled: codespaces and Binder are Linux, but a
learner on their own machine may be on Windows, and collections 5 and
6 teach shell commands. See open questions.

**Self-test.** A workshop is done when `jupyter workshop test` is green
on it, on both frontends for collections 1 to 4. Exercises in Write and
Make mode need the self-test to run their "Show a solution" action
before the check, so that the solution is what passes under test, and
each solution is therefore tested on every run.

**Shared files are copies, not symlinks.** The spending data, and the
state of the running project at the start of each workshop, are needed
in the `files/` directory of many workshops. They are kept once at the
top of the repository and copied into each workshop by a Justfile
recipe, with a check in CI that the copies match. The recipe and the
check are written with collection 3, which is the first to need them.
Symlinks were
considered and do not work. Filling the workspace locally follows a
symlink, since it reads through the contents API. But installing a
workshop from a collection, which is how Binder, a codespace and the
workshop browser get it, keeps only directories and regular files from
the downloaded archive, so a symlinked file is dropped without a word.

## Collections and the repository

**Six collections, one catalog.** The six collections are one course,
so they share one repository, laid out as `wrapt-workshops` is: a
`catalog.json` at the root naming every collection, and one directory
per collection under `collections/`, each holding the ordered index
that `just index` writes. Every workshop sits flat under `workshops/`,
whatever its collection, since the extension lists only the
directories directly under that one directory.

**The ids never change.** A collection's id is its identity to the
analytics service and to anyone who has subscribed, so it is fixed for
good:

| # | Directory | Id | Title |
|---|-----------|----|-------|
| 1 | `first-steps` | `grahamdumpleton.me/python-fundamentals/first-steps` | Python first steps |
| 2 | `functions-and-data` | `grahamdumpleton.me/python-fundamentals/functions-and-data` | Python functions and data |
| 3 | `working-with-data` | `grahamdumpleton.me/python-fundamentals/working-with-data` | Working with real data in Python |
| 4 | `your-own-types` | `grahamdumpleton.me/python-fundamentals/your-own-types` | Your own types in Python |
| 5 | `notebook-to-program` | `grahamdumpleton.me/python-fundamentals/notebook-to-program` | From a Python notebook to a program |
| 6 | `working-like-a-developer` | `grahamdumpleton.me/python-fundamentals/working-like-a-developer` | Working like a Python developer |

The product in the id is `python-fundamentals` rather than `python`,
so that another Python course could have ids of its own later.

**The order lives in the Justfile.** Each collection's workshops are a
list of names in the Justfile, which `just index` passes to `jupyter
workshop index` one by one, skipping names whose directories do not
exist yet. The lists already hold every workshop in this outline.

**Which frontends, from the manifest.** Whether a workshop runs in
JupyterLite is recorded once, in the `frontends` line of its manifest.
The Justfile and the CI workflows read that line to decide which
workshops to lint and test on JupyterLite, and which the site carries.

**The JupyterLite site carries four collections.** It is built from
every workshop that runs there, with the indexes of collections 1 to 4
passed one by one rather than the catalog, which would list
collections 5 and 6 on a site where they cannot run. Until the first
such workshop exists, the pages workflow builds nothing.

**Binder, Codespaces and local runs** subscribe to all six collection
indexes, as `wrapt-workshops` does, with the same disabled features
and the same trust policies: forced to trusted on Binder, the
learner's choice in a codespace, on the site and locally. There is no
wheelhouse, since no workshop builds an environment from a
requirements file. If the installs of collection 6 turn out slow on
Binder, the packages they name can be put in one.

**Analytics.** `collection.yaml` at the root declares the analytics
sink once, and `just index` carries the block into every collection
index. The deployments turn reporting on with `report: always`. The
token is a placeholder until the analytics service issues one, which
needs the service's signing key and is the owner's step. Until then
the sink refuses the events and nothing is recorded, though the
welcome messages already say that progress is reported.

**CI.** `test.yml` lints the catalog, every index and every workshop,
and self-tests every workshop, on both frontends where it runs on
both. `pages.yml` publishes the JupyterLite site after `test` passes
on `main`, from the commit that was tested. GitHub Pages has to be
enabled, with GitHub Actions as its source, once the repository is on
GitHub.

## Extension features the workshops use

Patterns to settle as the first workshops are written, recorded here so
each workshop does not rediscover them. These are first thoughts.

**Notebook pages.** As in `decorator-workshops`: the welcome page
creates the notebook with `notebook-create`, steps add cells with
`cell-insert` and a tag, and checks are `learner-kernel` verifies
triggered by `cell-executed <tag>`. Write-mode cells are inserted with
`:run: false` and hold only a comment saying what to write.

**Layouts.** As in `decorator-workshops`, collections 1 to 4 use a
layout with one named placeholder area for the notebook, never the
built-in `default` or `terminal-only`, which open a terminal that these
workshops have no capability for and a JupyterLite site may not have.
Collections 5 and 6 use a layout with the editor above a terminal.

**Checks on files in collections 3 and 4.** These run in JupyterLite,
where there is no `subprocess` and no `script` check, so files the
learner writes are checked with `contents` predicates, or by reading
them from a `learner-kernel` check.

**Checks on files in collections 5 and 6.** The learner's code is in
files. A `kernel` check that imports the learner's module would keep the
first version it imported, so file checks run the learner's code in a
fresh process, either from a `kernel` check through `subprocess` or a
`script` check with the check script shipped beside the pages, out of
the learner's sight. The script runs with the server's Python, which is
enough while the learner's code uses the standard library alone.

**Files and terminals.** `file-write` with `open` creates boilerplate
and shows it; `editor-highlight` points at what changed;
`contents` checks with `exists` confirm files the learner made.
Commands go from `execute` to `terminal-type` to typed by the learner,
with `terminal-output` triggers on the checks that follow.

**Manifest.** `gating: soft`, `duration` and `tags` filled in, `finish`
naming the next workshop. `resumable` is left unset in collections 1 to
4, since the pages of a notebook workshop share one kernel. Capabilities
`write-files` and `kernel-exec` throughout, plus `terminal` from
collection 5.

## Status

The repository was set up on 2026-10-03, from `wrapt-workshops` and
`claude-sdk-workshops`, with the JupyterLite parts from
`decorator-workshops`: the Justfile, the uv project pinned to
jupyterlab-workshop 0.20.1 with its reference submodule at the same
tag, the six collection index stubs and the catalog, `collection.yaml`
with a placeholder token, the Binder, Codespaces and JupyterLite
files, the two workflows, AGENTS.md and the README. No workshop is
written yet.

The writing order is the collection order. The first workshop settles
the manifest, the layout, the page shape and the checks for the rest,
and the first Write step settles how the exercise modes work in
practice.

Status is one of: planned, in progress, written (lint clean), tested
(self-test green), published (indexed and in the README), or committed.

| # | Workshop | Status |
|---|----------|--------|
| 1 | `how-this-works` | planned |
| 2 | `talking-to-python` | planned |
| 3 | `naming-things` | planned |
| 4 | `working-with-text` | planned |
| 5 | `when-things-go-wrong` | planned |
| 6 | `making-decisions` | planned |
| 7 | `keeping-a-list` | planned |
| 8 | `doing-it-again` | planned |
| 9 | `a-shopping-receipt` | planned |
| 10 | `your-first-function` | planned |
| 11 | `functions-with-options` | planned |
| 12 | `looking-things-up` | planned |
| 13 | `pairs-and-unique-things` | planned |
| 14 | `looping-over-anything` | planned |
| 15 | `building-lists-in-one-line` | planned |
| 16 | `two-names-one-list` | planned |
| 17 | `counting-words` | planned |
| 18 | `reading-and-writing-files` | planned |
| 19 | `when-the-data-is-wrong` | planned |
| 20 | `the-batteries-included` | planned |
| 21 | `csv-and-json` | planned |
| 22 | `cleaning-messy-text` | planned |
| 23 | `where-the-money-went` | planned |
| 24 | `your-first-class` | planned |
| 25 | `objects-that-explain-themselves` | planned |
| 26 | `building-on-another-class` | planned |
| 27 | `spending-as-objects` | planned |
| 28 | `files-editors-and-terminals` | planned |
| 29 | `code-in-a-file` | planned |
| 30 | `running-a-script` | planned |
| 31 | `taking-arguments` | planned |
| 32 | `splitting-into-modules` | planned |
| 33 | `where-imports-come-from` | planned |
| 34 | `making-a-package` | planned |
| 35 | `finding-the-bug` | planned |
| 36 | `why-an-environment` | planned |
| 37 | `an-environment-of-your-own` | planned |
| 38 | `installing-packages` | planned |
| 39 | `the-same-with-uv` | planned |
| 40 | `testing-your-code` | planned |
| 41 | `a-proper-project` | planned |
| 42 | `your-own-project` | planned |

## Open questions

Decisions not yet taken. Remove each as it is settled and record the
answer in the section it belongs to.

### Pyodide differences to discuss

These are expected from how JupyterLite works and are not yet confirmed
by a test. Each needs agreement before a workaround goes into a
workshop.

- **Tracebacks.** Both frontends run Python 3.14 (see "Python 3.14
  everywhere"), but a traceback in JupyterLite may still show
  different file names or extra frames from Pyodide's own code, which
  matters to workshop 5, where reading a traceback is the lesson. To be
  compared on both frontends before workshop 5 is written.

- **Reading the shipped files (collection 3).** Opening `spending.csv`
  by a relative path from the notebook should work in JupyterLite as it
  does in JupyterLab, since the kernel starts in the notebook's
  directory. To be confirmed by a small test before collection 3 is
  written.

### Other questions

- **The analytics token.** `collection.yaml` holds a placeholder until
  a token is issued for these workshops, with the origin of the
  JupyterLite site, `https://grahamdumpleton.github.io`, allowed to
  post with it.

- **Windows and the learner's own machine.** Whether the course
  supports JupyterLab on Windows, which changes every shell command in
  collections 5 and 6, or keeps to codespaces and Binder and covers
  the learner's own machine only in workshop 42.

- **uv in the image.** Workshop 39 needs uv installed where the
  learner's terminal can find it, declared in `requires.tools`.

- **A free-response quiz.** The extension's quizzes are single or
  multiple choice, which tests recognising an answer rather than
  producing one. A quiz type where the learner types what a cell will
  print would suit the Predict mode better. Worth raising for the
  extension, or approximating with a `form` and a check.

- **Seeing where learners need help.** Whether opening a hint or
  revealing a solution is recorded as a progress event. If not, it
  would be worth adding, since it shows which exercises are too hard.

- **Placement.** Whether a learner who already knows some Python can
  skip ahead, with a short quiz at the start of each collection
  pointing them to where to begin.

- **Course length.** Forty-two workshops at fifteen to twenty-five
  minutes each. Whether any should be merged, split or dropped once
  the first collection is written and timed.
