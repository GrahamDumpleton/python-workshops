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
concept properly takes time, and forty-three workshops, so roughly
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

**5. From notebook to program** (28 to 36). The move from notebook to
files, editor and terminal: modules, scripts, command line arguments,
packages, how imports are found, and debugging. The clicks that create
files and run commands are withdrawn over the collection until the
learner does both.

**6. Working like a Python developer** (37 to 43). Why virtual
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
`jupyterlab-workshop-showcase`. On 2026-10-03 none of the forty-three
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
  the step hard is told they are failing at something easy. "Easier to
  follow", said of a workshop and not of a task, is allowed.

- **Words in their usual sense.** A word that is correct but unusual
  in its context makes a reader stop, and a translation tool may pick
  the wrong meaning. A workshop is "easier to follow" and a notebook is
  "convenient"; neither is "comfortable".

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
| Predict | commits to an answer before seeing it | `quiz` before the `cell-insert` that answers it, with the answer typed where it can be |
| Modify | fixes or extends code that is nearly right | `cell-insert` with `:run: false`, a gap or a bug in it; a verify triggered by `cell-executed` |
| Write | fills an empty cell or file from a short spec | `cell-insert` of a tagged cell holding only a comment saying what to write; a verify on behaviour |
| Make | builds something from a goal, no starting code | the goal in prose; a verify; layered hints |

Every Write and Make step has a way out, so nobody is ever stuck: a
`hint` saying what to look at, a second `hint` that gets closer, and
then a "Show me a solution" `hint` that holds a `cell-insert`, which
puts a working answer in a separate cell for the learner to read and
compare with their own. The solution stays locked until the check of
the step has run once, so the learner tries first.
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
meet. Each of those messages is tested with an `attempt`, so no
message a learner can see is untried.

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

One page sets the notebook in context, after the learner has seen a
cell run. It is a Jupyter notebook, widely used for data science,
scientific computing and machine learning. It is not the only way to
use Python or the most common: most programs are written in files and
run from the command line, and Python can also be used directly there.
The course starts in a notebook because it is the most convenient
place to learn the first steps, and it moves to files, an editor and
the terminal later, in collection 5. The Python is the same in both.

It ends by saying what the course will ask of them: the clicks are
there to save time on things that are not the lesson, and as the course
goes on they will do more of the typing themselves, on purpose.

- Format: notebook, with a `tour` of the panel.

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
or the flashcard drill of workshop 43, remind the learner of Ctrl+C
the first time it is needed.

- Modes: Watch, then typed commands.

#### 29. `python-in-the-terminal`: Python in the terminal

Python without the notebook. Workshop 1 tells the learner that the
notebook is a convenience for learning, and that programmers mostly
use Python from the command line. This is where the course keeps that
promise.

The learner types `python` in the terminal and meets the `>>>` prompt
of the interactive interpreter, which is where most Python programmers
try a line of code. The Python is all familiar, expressions and names
from collection 1, so that the tool is the only new thing. What is the
same as a notebook cell: a line is run and its value is shown. What is
different: every expression shows its value as soon as it is entered,
where a notebook cell shows only the value of its last line (workshop
2 tells the learner that this rule belongs to the notebook, and this
is where they see it, and the workshop that first runs a program from
a file completes it: a program shows nothing unless it prints); each
line runs when Enter is pressed, the `...` prompt
appears inside a block, the up arrow brings back an earlier line, and
nothing is kept as a document. How to leave, with `exit()`. Also
`python --version`, and the idea that the terminal runs one particular
Python.

It ends on the limit that the next workshop answers: leave the
interpreter and everything typed is gone, so code worth keeping
belongs in a file.

- Modes: Watch, then typed by the learner.

- To settle when it is written: how the pages and the self-test drive
  a program that waits for input. The interpreter is started in the
  terminal and lines are sent to it, and checks can only read what the
  terminal printed, with `terminal-output` triggers, since nothing
  outside the interpreter can see its state.

#### 30. `code-in-a-file`: Code in a file

Functions moved from the notebook into a `.py` file and imported back
into the notebook. Why a file: code that outlives a notebook and can be
shared. The file is created by click; the learner moves the code.

- Modes: Modify, Write.

#### 31. `running-a-script`: Running a script

`python app.py` in the terminal. What `__name__` is and why
`if __name__ == "__main__"` exists, shown by importing the same file
both ways. Commands run by click first, then typed by the learner.

- Modes: Watch, Write, typed commands.

#### 32. `taking-arguments`: Taking arguments

`sys.argv` first, to see what a program receives, then `argparse`. The
spending tracker learns to report on one month or one category.

- Modes: Write.

#### 33. `splitting-into-modules`: Splitting into modules

A program across several files and the imports between them. The
learner creates the files this time, checked with `exists`.

- Modes: Make, with files created by the learner.

#### 34. `where-imports-come-from`: Where imports come from

How `import` finds a module: `sys.path`, the current directory, the
standard library, `site-packages`, and the shadowing bug of a file
called `random.py`. This is the groundwork collection 6 builds on: a
virtual environment is a different `site-packages`.

- Modes: Predict, Investigate.

#### 35. `making-a-package`: Making a package

A package directory, `__init__.py`, relative imports and `python -m`.
The spending tracker becomes a package.

- Modes: Make.

#### 36. `finding-the-bug`: Finding the bug

Tracebacks across several files, `print` debugging, and `breakpoint()`
with the few `pdb` commands worth knowing.

- Modes: Modify throughout.

### Collection 6: Working like a Python developer

The emphasis is on why and how. Every tool here is shown working, then
opened up so the learner sees what it changed, then broken so they see
what goes wrong without it.

#### 37. `why-an-environment`: Why an environment

The problem before the solution: one Python shared by every project,
two projects needing different versions of the same package, and an
install that breaks something unrelated. Shown with what the learner
already knows from workshop 34: where `site-packages` is and what is in
it.

- Modes: Predict, Investigate.

#### 38. `an-environment-of-your-own`: An environment of your own

`python -m venv`, then a look inside: the interpreter, `site-packages`,
`pyvenv.cfg`. What activating does, which is to put a directory first
on `PATH` and nothing more, shown by comparing `which python` and `PATH`
before and after. Running the environment's Python without activating.
Deleting an environment and making it again, since it is disposable.
The manifest declares no `environment`, so the terminal has the bare
Python.

- Modes: typed commands throughout.

#### 39. `installing-packages`: Installing packages

`pip install` into the environment, where the package went, `pip list`
and `pip freeze`, and `requirements.txt` as a record of what a project
needs. Then `rich` used in the spending tracker to print its report as
a table.

- Modes: typed commands, Write.

#### 40. `the-same-with-uv`: The same with uv

uv doing what the last three workshops did by hand: making the
environment, installing, locking. Taught as the same ideas with a
faster tool, not as a replacement for understanding them, so every step
is matched to the pip workflow it stands for.

- Modes: typed commands, Make.

#### 41. `testing-your-code`: Testing your code

What a test is for, then `assert`, then `pytest`: writing tests for the
spending tracker and reading a failure.

- Modes: Write, Make.

#### 42. `a-proper-project`: A proper project

`pyproject.toml`, the `src` layout and why it exists, installing the
project into its own environment, a formatter and linter (`ruff`), and
type hints as documentation that a tool can check.

- Modes: Make.

#### 43. `your-own-project`: Your own project

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

The data, written with collection 3, is three files under `shared/`.
`spending.csv` is the clean data: 37 purchases of one person, Mariam,
from January to March 2026, in six categories, with no field that
holds a comma. `spending-raw.csv` is the same purchases as they might
have been typed: spaces round fields, categories in other cases and
two other spellings (`groceries` for `food`, `travel` for
`transport`), amounts written without their decimal places, and three
rows that cannot be read (an amount that is a word, an amount that is
empty, and a row with two fields). Cleaning the raw file gives the
clean file exactly, which workshop 22 uses as its last step.
`budgets.json` holds the budget of one month for each category, set
so that four totals of a category in a month go over it. Workshops 18
and 21 read the clean file, and 19, 22 and 23 the raw one. Workshop 27
reads the clean file and the budgets, so that its work is the classes
and not the cleaning.

`Decimal` is introduced in workshop 22, where amounts are turned from
text into numbers. Checks that compare a total compare it rounded to
two places, so a float and a `Decimal` both pass.

`Decimal("unknown")` raises `decimal.InvalidOperation`, which is not a
`ValueError`. So workshop 19, which reads amounts with `float()`,
handles `ValueError`, and workshops 22 and 23, which use `Decimal`,
handle `InvalidOperation`. Both 22 and 23 say why.

Three things are taught in collection 3 that its entries do not list:
`file.readline()` in workshop 19, to read the header before the loop;
the module `statistics` in workshop 20, as the module whose
documentation the learner reads to find `mean()`; and the term
"attribute" in workshop 20, for `.year`, `.month` and `.day` of a
date.

In collection 4 a purchase is an object of a class `Purchase`, with
the attributes `date` (an ISO string), `description`, `amount` (a
`Decimal`) and `category`, in that order. Workshops 24 and 26 write it
by hand with `__init__`, workshop 25 writes it by hand and then as a
dataclass, and workshop 27 writes it as a dataclass, with a `Ledger`
written by hand that holds the purchases. The collection says
"object", and says once in each workshop that needs it that
programmers also say "instance"; "parent class" and "child class";
"replace" a method, with "override" named once; and "make an object",
never "instantiate".

Things taught in collection 4 that its entries do not list: `type()`
and `AttributeError` in workshop 24; `!r` in an f-string, a
"decorator" (only what a line that begins with `@` means), a "type
hint" and a "field" in workshop 25; `isinstance()` and `super()` in
workshop 26; and a method that calls another method of its own object
in workshop 27. Workshop 26 takes its composition example from a
receipt that holds products, so that the `Ledger` is new in workshop
27.

In collections 5 and 6 the tracker is code in files, and its state at
the start of each workshop is a directory under `shared/tracker/`,
copied into the workshop by `just shared` from the `shared_trees`
list in the Justfile: `s0`, one file `spending.py` holding the
classes of workshop 27 and `read_ledger`, at the start of workshop
31; `s1`, with `report_lines()`, `main()` and the test of `__name__`;
`s2`, with `Ledger.select()` and `argparse`; `s3`, four modules; `s4`,
the package `spending`, run with `python -m spending`; `s5`, with a
table made by `rich` and `requirements.txt`; and `s6`, with tests. The
pages of each workshop take the learner from its start stage to the
next one. The budgets of workshop 27 are left out of these stages, to
keep the program small. Workshop 36 ships its own copy of `s4` with
three bugs planted in it.

`rich` is the third-party package, used for printing the report as a
table, since it installs everywhere and shows a visible change.

The other themes considered were a reading log, a recipe box, a habit
log, weather readings and a to-do list. The recipe box was the closest
alternative, but units of measure differ between countries. The others
each fit only part of the course.

### The briefs for workshop 43

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
same version of the language. Running `sys.version` in a self-test on
2026-10-04 gave 3.14.5 in JupyterLab and 3.14.2 in JupyterLite.

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

**Tracebacks are the same on both frontends.** Compared on 2026-10-04,
before workshop 5 was written, by raising `NameError`, `TypeError`,
`SyntaxError`, `IndentationError`, `IndexError`, `ZeroDivisionError`
and `ValueError` in a cell on each frontend. The notebook shows the
same text for each, with no extra frames from Pyodide. Three things
follow for the pages. The number in `Cell In[N]` differs, because a
check also counts as a cell that ran in JupyterLite, so pages do not
quote it. The notebook does not show Python's "Did you mean"
suggestions on either frontend. And a bracket left open at the very
end of a cell gives `_IncompleteInputError: incomplete input` on both,
not a `SyntaxError`, so no page builds a step on that.

### Content

**Standard library until collection 6.** Nothing is installed for the
first five collections. Collection 6 installs packages, and the
learner installs them, since that is the lesson.

**The notebook is a convenience, and the learner is told so.**
Collections 1 to 4 use a notebook because it needs no setup, keeps
code and result together, and lets the workshop add cells and check
them. Workshop 1 says this plainly, and says that programmers mostly
work in files and at the command line. Collection 5 moves there, and
workshop 29 teaches the interactive interpreter in the terminal, so
that a learner does not finish the course knowing Python only through
notebooks.

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
Make mode put their solution before the check on the page, so that
the self-test runs it and the solution is what passes under test. The
wrong answers a check has a message for are tested by `attempt` blocks
above the solution.

**Shared files are copies, not symlinks.** The spending data, and the
state of the running project at the start of each workshop, are needed
in the `files/` directory of many workshops. They are kept once, under
`shared/` at the top of the repository, and copied into each workshop
by `just shared`, from a list in the Justfile that says which workshop
ships which file. `just shared-check` fails when a copy differs, and
the `test` workflow makes the same comparison for every file under a
workshop's `files/` that has the name of a shared file. Symlinks were
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
every workshop that runs there, with `catalog-lite.json`, a second
catalog that names collections 1 to 4 only and which `just index`
writes beside `catalog.json`. The full catalog would list collections
5 and 6 on a site where they cannot run. The four indexes cannot be
passed one by one either: the build carries each at the root of the
site under its file name, and all are named `collection.json`, so it
refuses the second, which is how the first pages run failed. A catalog
carries the indexes it names at their relative paths.

**Binder, Codespaces and local runs** subscribe to all six collection
indexes, as `wrapt-workshops` does, with the same disabled features
and the same trust policies: forced to trusted on Binder, the
learner's choice in a codespace, on the site and locally. There is no
wheelhouse, since no workshop builds an environment from a
requirements file. If the installs of collection 6 turn out slow on
Binder, the packages they name can be put in one.

**Seeing where learners need help.** The extension records a
`hint-opened` event when a hint is opened, and an `action-executed`
event when the action inside a solution hint is clicked, each with the
id of the block. A learner who opened a solution can so be told from
one who ran it. So the analytics show which exercises needed their hints and
their solutions, with nothing more to build.

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

These were settled by writing the first two workshops, and revised on
2026-10-04 for release 0.21.0 of the extension. Both workshops pass
the self-test on both frontends with them.

**Notebook pages.** As in `decorator-workshops`: the welcome page
creates the notebook with `notebook-create`, steps add cells with
`cell-insert` and a tag, and checks are `learner-kernel` verifies
triggered by `cell-executed <tag>`.

**A Watch step** is a `cell-insert` with `:run: true`, whose `:title:`
says in plain words what the cell does.

**A Predict step** is a `quiz` and then the Watch step that answers
it. Where the question is what Python will show, and the learner could
reasonably arrive at it, the quiz is `:type: text`: the learner types
the value, and it is matched exactly, so `4` is not `4.0`. Each `wrong`
entry names the mistake that leads to that answer, with entries for a
decimal comma and other near misses, and `otherwise` gives a pointer
for any other answer. Every `answer` and `text` is quoted. A question
whose answer nobody could guess, such as the value of `0.1 + 0.2`,
keeps its options, as do the recap questions. Workshop 1 teaches both
kinds of question.

**A Modify step** inserts the code to change in a cell of its own,
with `:run: false`. The code is not put in a cell that has already
run, because the check is triggered when that cell runs, and would
show a failure before the learner has started. Workshop 1 does this
once on purpose, on the page that follows the one about checks, and
says so.

**A Write step** inserts a cell with `:run: false` that holds only a
comment saying where to write, and an empty line under it for the
learner to click on. One blank line after the comment in the body of
the action leaves that empty line in the cell, from release 0.21.1 of
the extension.

**The way out of a Modify or Write step** is, in this order on the
page: the task, one or two `hint` blocks, the `attempt` blocks, a
`hint` titled "Show me a solution", and then the check. The solution
hint holds a `cell-insert` with `:run: true` and a tag of its own, and
the check lists both tags in its `:trigger:`. The hint is locked until
the check has run once, whatever the result:

```
:unlock: "total-cost" in failed_checks or "total-cost" in passed_checks
:locked: Try the task first. This opens after the check below has run.
```

A learner who is stuck before running anything can click `Check`,
which fails and unlocks the solution. A learner who passed can open it
too, to compare. Since the solution comes before the check, the
self-test runs it, and the check passes on it. Workshop 1 explains the
lock on the page that introduces hints.

**What an action box shows.** A clicked action shows the word `done`
at its right side and a green bar on its left edge; `running` with an
orange bar while it works; `failed` with a red bar and a message when
it goes wrong. It shows no tick or cross: only a check shows `✓` and
`✗`. Under the title the box shows the body of the action, which for a
`cell-insert` is the code. For a `tour` it shows what each step says,
numbered, and for a `notebook-create` the content of each cell, so the
notebook of every workshop starts with a title cell.

**The tour is checked, not run.** The self-test skips a `tour`, since
it needs a person, but reports a step whose selector matches nothing.
The four selectors of the tour in workshop 1 pass that test.

**A step the learner does by hand**, such as running a cell with
`Shift` and `Enter`, has a `cell-run` action beside it titled "Run the
cell for me", for the learner who has a problem and for the self-test.

**Checks before names are taught.** Workshop 2 has no variables, so a
check cannot read a name. It reads `Out`, the record that the kernel
keeps of every value a cell has shown, which exists in both the
JupyterLab kernel and the Pyodide kernel: `44 in Out.values()`. Three
rules follow. Every value that a check looks for is different from
every other value the workshop's cells produce, so one cell cannot
pass the check of another. A check that must tell an integer from a
float tests the type as well, since `4 == 4.0`. From workshop 3 a
check reads names.

**Pass on any cell, diagnose the latest.** A check passes when the
value it looks for is anywhere in `Out`, so a pass stays a pass. Its
messages for wrong answers read `_`, the value the last cell showed,
so a learner who gets it wrong twice is told about the second mistake
and not the first again. The extension keeps the check's own closing
expression out of `Out` and `_`, which is what makes both safe. Where
the value before the learner has started is itself a likely wrong
answer, as on the parentheses step of workshop 2, the message is
worded to be true in both situations: "The last cell that ran gives
14".

**Checks that read names.** From workshop 3 a check reads the names
that a cell left behind. A check that raises shows Python's error as
its message, so a check never reads a name that may not exist: it
tests `"total" in globals()` first, or reads `globals().get("total")`,
and says that the cell has not run yet, or which name is missing and
how it is spelled. Each step of a workshop uses names of its own, so
that a later cell cannot change what an earlier check finds. Where
the learner writes an `if`, the check tests the relation between the
names the code reads and the names it sets, for whatever values they
have now, since there is no function to call with several inputs.

**Checks that call a function.** From workshop 10 the learner writes
functions, and a check calls them. Such a check is one function named
`_workshop_check`, which prints one message on every path and returns
`True` or `False`, and the last line of the check is
`globals().pop("_workshop_check")()`, which removes the name and calls
it, so nothing is left in the learner's kernel. Tried on both
frontends on 2026-10-04. Inside it: every call of the learner's code
is in a `try`, and the message names the type of the error; every call
is inside `contextlib.redirect_stdout`, so what the function prints
does not become the message, and a function that prints its result
where it should return it is told so; the function is called with
several inputs, made fresh inside the check; and the number of
parameters is tested with `inspect.signature(...).bind(...)` before
the call, so that a `TypeError` from inside the body is not reported
as a wrong number of parameters. A check that needs values of its own
while it works uses the same form, function or not.

**Braces in a check.** The body of a check goes through `{{ }}`
substitution, so an f-string in a check cannot show a literal brace
with `{{`. A message that must show braces is built from plain
strings.

**A Watch cell that leaves no name.** A cell that only calls a
function that prints leaves nothing for a `learner-kernel` check to
read. Workshop 10 checks six such cells with the `contents` predicate
`cell-executed`. From release 0.22.0 a `contents` check takes
`:message:`, the text to show when it fails, so these checks say "The
cell has not run yet. Click the action above to add the cell and run
it." as every other check does, where the extension's own words would
name the tag of the cell.

**Check messages.** A `learner-kernel` check prints one message when
it passes and another when it fails, and ends with the expression that
decides. The failure message says what was found and what to do next.
Where a wrong answer is likely, the check looks for it and names the
mistake, as the last check of workshop 2 does for four wrong totals.
A check assigns no names, so it leaves nothing in the learner's
kernel.

**Every failure message has an attempt.** The self-test follows the
correct path, so each message a check can give on a wrong answer is
tested by an `attempt`: a block the learner never sees, holding a
`cell-insert` of the wrong answer, the id of the check, and part of
the message expected. The first attempt of a check holds no actions
and tests the message shown before the learner has done anything.
Attempts go above the solution, and one with `:result: pass` goes last
among them, for a right answer written another way. Nothing is undone
between attempts, so a wrong answer whose value would pass a later
check on the page cannot be an attempt. The report prints what each
check said, which is the place to read every message in one pass.

**Layouts.** As in `decorator-workshops`, collections 1 to 4 use a
layout with one named placeholder area for the notebook, never the
built-in `default` or `terminal-only`, which open a terminal that these
workshops have no capability for and a JupyterLite site may not have.
Collections 5 and 6 use a layout with the editor above a terminal.

**Checks on files in collections 3 and 4.** These run in JupyterLite,
where there is no `subprocess` and no `script` check, so files the
learner writes are checked with `contents` predicates, or by reading
them from a `learner-kernel` check. Tried on both frontends on
2026-10-04 with a probe workshop: the kernel starts in the workspace,
so a shipped file is opened by its plain name; a file that a cell
writes is seen at once by a `contents` check and by `file-open`; and
a file that a `file-write` action writes is read by the next cell. A
check never calls a learner's function that writes a file under a
name the learner uses. A file that a check writes for its own input
has a name that begins with `_check_`, stays in the workspace and is
removed when the check ends.

**A data file under the notebook.** A workshop of collection 3 that
shows a file declares a second layout, `data`, with the notebook's
placeholder area above an area named `data` that holds the shipped
file, and the page that first talks about the file applies it with a
`layout` action. Other files, and files the learner's code has
written, are shown with `file-open` and `:area: data`. The editor does
not follow a file that changes, so a page shows a file again after a
cell has written it. Two placeholder areas in one layout are a lint
error, which is why the second area names a file. From release 0.22.1
the action that applies the layout is followed by a `ui` check,
`file-open` with the name of the file and a `:message:`, triggered by
`after:` the action, and the page requires it. From the same release
an action can write a file that the learner's code has changed while
it is open in the editor, so workshop 21 puts `budgets.json` back, for
a learner whose code saved over it, with a `file-write` that copies
the shipped file with `:from:`.

**Classes in collection 4.** A cell that defines a class again makes
a new class, and objects made before still belong to the old one. So
a step in which the learner adds a method works in a cell that holds
the whole class so far, inserted without being run, with a comment
where the method goes and the methods of earlier steps given complete;
the cell, or one beside it, makes the objects again; and the page says
why. A check makes fresh objects of the learner's class inside itself,
after it has tested that the name is a class and that the parameters
fit, and reads attributes with `getattr()` so that a missing one gives
a message. A check that looks at an object the learner made compares
the name of its class, since the class may have been defined again
since. The default text of an object holds a number that differs on
every run and between the frontends, so pages write it as `0x...` and
no quiz or check reads it.

**Terminals in collections 5 and 6.** The probes of these
collections, run on 2026-10-05 with 0.22.1, settled the patterns. The
layout has a placeholder area above a terminal named `workshop`, so no
action names a session. Every `execute` that sends a line to anything
but the shell (the `>>>` prompt, `(Pdb)`, an answer to `input()`, a
program that does not end) has an explicit `:wait:`. Every check
declares a trigger, since the self-test gives a check with none a
single try and the shell's prompt can arrive late. A check cannot read
the terminal: it checks what a command left on disk, runs the
learner's program itself in a fresh process from a `kernel` check, or
is a typed quiz on what the terminal showed. Commands go from a click
(`execute`), to typed by the page with the learner pressing Enter
(`terminal-type`, with a `send-key` in a hint for the self-test), to
typed by the learner, with the command in a locked hint. A hint is
locked only on a `verify`, which a learner can click to fail, and it
unlocks when that check has run, passed or failed:
`"x" in failed_checks or "x" in passed_checks`. A hint that runs the
command for a step whose only check is a quiz about the command's
output is not locked. A correct answer puts a quiz in `passed_checks`
and never in `failed_checks`, and the learner needs the command's
output to answer, so a lock on the quiz would open only after a wrong
guess. Workshop 28 was released with such locks, which a learner
found on 2026-10-05. Workshop 29
reads what the learner typed at the `>>>` prompt from
`.python_history` in the workspace, which the manifest's `env` names.

**Never install into JupyterLab's Python.** In the self-test and under
`just lab` the terminal's bare `python` is this repository's own
environment, and on Binder it is the one JupyterLab runs in. So
packages are installed only into a `.venv` in the workspace, after it
is activated or by its path, and every manifest of collection 6 sets
`PIP_REQUIRE_VIRTUALENV`, so pip refuses an install outside a virtual
environment. Workshop 37 tells its story of one shared Python with an
environment named `shared-python`, made by click, which stands for
the one Python of a computer. uv is a runtime dependency of this
repository, so that Binder, a codespace and the self-test have the
same uv on the terminal's `PATH`. A uv project command run in a
workspace with no `pyproject.toml` would find this repository's
project and change it, so workshop 40 ships a `pyproject.toml` from
the start and the learner reads it rather than writing it, no page
runs `uv init`, and this repository's `pyproject.toml` excludes
`workshops/*/work` from its uv workspace as a second guard.

**Tracks.** The self-test follows the first track of a workshop that
offers a choice, so `just test-tracks <name>` and the `test` workflow
test workshop 43 once for each of its four tracks.

**No directory listings.** `os.listdir(".")` shows
`.ipynb_checkpoints` in JupyterLab and not in JupyterLite, so no page
prints a listing of the workspace.

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

## Extension problems and suggestions

Things found in jupyterlab-workshop while writing these workshops, and
what the workshops do about each in the meantime. Remove an entry when
a release settles it, and undo the workaround it names.

Release 0.21.0 settled seven of the eight entries found on 2026-10-03
with 0.20.1, and the workshops were revised for it on 2026-10-04: the
docs now describe what an action box shows; a `tour` and a
`notebook-create` show a readable form of their body; a hint can hold
an action and stay locked; a quiz can take a typed answer; the
self-test checks a tour's selectors and can point at the panel; an
`attempt` tests what a check says on a wrong answer; and the
JupyterLite site starts with jupyterlite-core 0.8.5, so the pin on
0.8.3 is gone. One entry remained.

Two more were found on 2026-10-04 with 0.21.1, while the rest of
collection 1 was written, and release 0.21.2 settled both the same
day. In JupyterLab a check that ended in an expression failed with a
`TokenError` after the learner ran a cell with an open quote or
bracket, and in JupyterLite a check that raised `AssertionError`
showed `<class 'AssertionError'>:` before its message. Both were
confirmed gone on both frontends with a probe workshop. The workshops
changed nothing for either: their checks kept the closing expression
throughout. One thing was shaped by the first and is now a choice, not
a need: see workshop 5 under open questions.

One suggestion was made on 2026-10-04 with 0.21.2, while collection 2
was written, and release 0.22.0 took it up the same day: a `verify` of
the `contents` or `ui` substrate takes `:message:`. See "A Watch cell
that leaves no name" above for where the workshops use it.

Two problems were found on 2026-10-04 with 0.22.0, while collection 3
was written, and release 0.22.1 settled both the next day. A `ui`
check with `file-open spending.csv` said that the file was not open
when it was open in the text editor, because the predicate looked only
for the viewer that JupyterLab chooses for a `.csv` file by default.
And a `file-write` action on a file that was open in the editor, after
a cell had changed it on disk, raised JupyterLab's "File Changed"
dialog. Both were confirmed gone on both frontends with the probe
workshop. The workshops took up both fixes: see "A data file under
the notebook" above.

**Symlinks in `files/` are dropped on install.** See "Shared files are
copies, not symlinks" above.

## Status

The writing order is the collection order. The first workshop settles
the manifest, the layout, the page shape and the checks for the rest,
and the first Write step settles how the exercise modes work in
practice.

The numbers are those the workshops have throughout this document,
which run through the whole course and do not start again with each
collection.

First steps:

| # | Workshop | Status |
| --- | --- | --- |
| 1 | `how-this-works` | Done |
| 2 | `talking-to-python` | Done |
| 3 | `naming-things` | Done |
| 4 | `working-with-text` | Done |
| 5 | `when-things-go-wrong` | Done |
| 6 | `making-decisions` | Done |
| 7 | `keeping-a-list` | Done |
| 8 | `doing-it-again` | Done |
| 9 | `a-shopping-receipt` | Done |

Functions and data:

| # | Workshop | Status |
| --- | --- | --- |
| 10 | `your-first-function` | Done |
| 11 | `functions-with-options` | Done |
| 12 | `looking-things-up` | Done |
| 13 | `pairs-and-unique-things` | Done |
| 14 | `looping-over-anything` | Done |
| 15 | `building-lists-in-one-line` | Done |
| 16 | `two-names-one-list` | Done |
| 17 | `counting-words` | Done |

Working with real data:

| # | Workshop | Status |
| --- | --- | --- |
| 18 | `reading-and-writing-files` | Done |
| 19 | `when-the-data-is-wrong` | Done |
| 20 | `the-batteries-included` | Done |
| 21 | `csv-and-json` | Done |
| 22 | `cleaning-messy-text` | Done |
| 23 | `where-the-money-went` | Done |

Your own types:

| # | Workshop | Status |
| --- | --- | --- |
| 24 | `your-first-class` | Done |
| 25 | `objects-that-explain-themselves` | Done |
| 26 | `building-on-another-class` | Done |
| 27 | `spending-as-objects` | Done |

From notebook to program:

| # | Workshop | Status |
| --- | --- | --- |
| 28 | `files-editors-and-terminals` | Done |
| 29 | `python-in-the-terminal` | Done |
| 30 | `code-in-a-file` | Done |
| 31 | `running-a-script` | Done |
| 32 | `taking-arguments` | Done |
| 33 | `splitting-into-modules` | Done |
| 34 | `where-imports-come-from` | Done |
| 35 | `making-a-package` | Done |
| 36 | `finding-the-bug` | Done |

Working like a Python developer:

| # | Workshop | Status |
| --- | --- | --- |
| 37 | `why-an-environment` | Done |
| 38 | `an-environment-of-your-own` | Done |
| 39 | `installing-packages` | Done |
| 40 | `the-same-with-uv` | Done |
| 41 | `testing-your-code` | Done |
| 42 | `a-proper-project` | Done |
| 43 | `your-own-project` | Done |

The status words:

- **Planned:** designed in the outline, not yet written.

- **Written:** the pages exist and lint is clean.

- **Done:** `just test <name>` is green, and `just test-lite <name>`
  as well for a workshop that runs in JupyterLite, and the workshop is
  in the index and the README.

## Open questions

Decisions not yet taken. Remove each as it is settled and record the
answer in the section it belongs to.

### Pyodide differences to discuss

Each needs agreement before a workaround goes into a workshop.

- **The number in a `FileNotFoundError`.** Found on 2026-10-04 while
  collection 3 was written. Opening a file that does not exist gives
  `[Errno 2] No such file or directory: 'missing.txt'` in JupyterLab
  and `[Errno 44] No such file or directory: 'missing.txt'` in
  JupyterLite, since Emscripten numbers its errors differently. The
  pages of collection 3 that show this error say that the number can
  differ and does not matter, and no quiz or check reads it. To be
  agreed, since it is a way round a difference.

Reading the shipped files, which was the question here before
collection 3, is settled: see "Checks on files in collections 3 and
4".

### Other questions

- **Syntax errors in workshop 5.** `when-things-go-wrong` builds its
  `SyntaxError` step on a missing comma, and describes the open quote
  and the open bracket in prose with no cell to run, because with
  0.21.1 a check failed with a `TokenError` after such a cell. Release
  0.21.2 removed that limit. Whether to add a step for each, since
  they are the most common syntax errors of a beginner, or to keep the
  workshop at its present length.

- **The analytics token.** `collection.yaml` holds a placeholder until
  a token is issued for these workshops, with the origin of the
  JupyterLite site, `https://grahamdumpleton.github.io`, allowed to
  post with it.

- **Windows and the learner's own machine.** Whether the course
  supports JupyterLab on Windows, which changes every shell command in
  collections 5 and 6, or keeps to codespaces and Binder and covers
  the learner's own machine only in workshop 43. Collections 5 and 6
  are written for Linux and macOS, with commands that behave the same
  in bash and zsh, and declare `platforms: [linux, macos]`.

- **Collections 5 and 6 on Linux.** They were written and self-tested
  on macOS with zsh. Binder and a codespace are Linux with bash. The
  `test` workflow on GitHub is the first run of them there.

- **Placement.** Whether a learner who already knows some Python can
  skip ahead, with a short quiz at the start of each collection
  pointing them to where to begin.

- **Course length.** Forty-three workshops at fifteen to twenty-five
  minutes each. Whether any should be merged, split or dropped once
  the first collection is written and timed.
