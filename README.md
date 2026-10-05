# Python workshops

[![Launch in your browser](https://img.shields.io/badge/launch-in%20your%20browser-F37726?logo=jupyter&logoColor=white)](https://grahamdumpleton.github.io/python-workshops/lab/index.html)
[![Launch on Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/GrahamDumpleton/python-workshops/main?urlpath=lab)
[![Open in GitHub Codespaces](https://img.shields.io/badge/launch-codespaces-579ACA?logo=github&logoColor=white)](https://codespaces.new/GrahamDumpleton/python-workshops?quickstart=1)
[![test](https://github.com/GrahamDumpleton/python-workshops/actions/workflows/test.yml/badge.svg)](https://github.com/GrahamDumpleton/python-workshops/actions/workflows/test.yml)

Guided, hands-on workshops that teach the
[Python](https://www.python.org/) programming language to people who
have never written a program before. You do not need to know anything
about programming to start, and you do not need to install anything.

All six parts of the course are written, forty-three workshops in
all, and they are listed under [The course](#the-course).

## How the workshops work

Each workshop is a set of short pages, shown in a panel inside
[JupyterLab](https://jupyter.org/), beside the notebook, editor or
terminal you work in. Each page explains one idea, and then asks you
to do something with it. The workshop checks your work as you go, and
tells you what to look at if something is not right.

At the start, most steps are done by clicking a box on the page, which
types the code and runs it for you, so that you can watch what happens
and think about why. Then, step by step, the workshops ask you to type
more of the code yourself: first changing code you have been given,
then writing short pieces of your own, and at the end, writing a whole
program. If you are stuck, every exercise has hints, and a way to see
an answer.

Each workshop takes between fifteen and twenty-five minutes. They run
on the [jupyterlab-workshop](https://github.com/GrahamDumpleton/jupyterlab-workshop)
extension for JupyterLab. The design of the course, with what every
workshop covers, is in [OUTLINE.md](OUTLINE.md).

## The course

The course has six parts. Take them in order. Each part is a set of
workshops, and the Finish dialog at the end of each workshop offers you
the next one.

1. **Python first steps.** How these workshops work, and then your
   first Python: numbers, names, text, reading error messages,
   decisions, lists and loops. In a notebook:

   1. **How these workshops work** (`how-this-works`, 15 minutes).
      Start here. Learn how to use the workshops before you learn
      Python: read a page, click an action, run a cell in a notebook,
      change code yourself, and see how checks, hints and questions
      help you.

   2. **Talking to Python** (`talking-to-python`, 20 minutes). Learn
      what a program is and what Python does with it. Then use Python
      as a calculator, learn which part of a calculation Python does
      first, and write a calculation of your own.

   3. **Naming things** (`naming-things`, 20 minutes). Learn how a
      program remembers a value by giving it a name. Use names in
      calculations, give a name a new value, choose names that are
      clear to read, and show values with `print()`.

   4. **Working with text** (`working-with-text`, 25 minutes). Learn
      how Python works with words and sentences. Join strings, put
      values into text with an f-string, count and select characters,
      and use methods that give back new strings.

   5. **When things go wrong** (`when-things-go-wrong`, 25 minutes).
      Learn to read the error messages of Python. Every cell has a
      mistake in it: run it, read the type of the error, the line and
      the message, and correct the mistake.

   6. **Making decisions** (`making-decisions`, 25 minutes). Learn how
      a program chooses what to do. Compare values, choose between
      lines of code with `if`, `elif` and `else`, and combine
      conditions with `and`, `or` and `not`.

   7. **Keeping a list** (`keeping-a-list`, 25 minutes). Learn how a
      program keeps many values under one name. Get one item or a part
      of a list, change and add items, count them, and put a list in
      order.

   8. **Doing it again** (`doing-it-again`, 25 minutes). Learn how a
      program repeats work with a loop. Run the same lines for every
      item of a list, add up a total, count, find the largest value,
      and repeat with `while`.

   9. **A shopping receipt** (`a-shopping-receipt`, 25 minutes). Build
      a complete program in six parts, with hints but without the
      code: a receipt with a line for each item, a subtotal, a
      discount and a total.

2. **Python functions and data.** Organising code with functions, and
   data with dictionaries, tuples and sets. Looping over any kind of
   data, and how two names can share one list. In a notebook, writing
   most of the code yourself:

   10. **Your first function** (`your-first-function`, 25 minutes).
       Learn how to give a name to a group of lines, so that you write
       them once and use them many times. Define a function, call it,
       give it values, and make it give a result back with `return`.

   11. **Functions with options** (`functions-with-options`, 25
       minutes). Give a parameter a default value, name an argument in
       a call, describe a function with a docstring, and write a
       function that calls another function.

   12. **Looking things up** (`looking-things-up`, 25 minutes). Learn
       how a program finds a value by a name instead of a position.
       Make a dictionary, look up, add and change values, and count
       things with a dictionary.

   13. **Pairs and unique things** (`pairs-and-unique-things`, 25
       minutes). Learn two more kinds of value. A tuple keeps values
       that belong together, and a set keeps each value only once.

   14. **Looping over anything** (`looping-over-anything`, 25
       minutes). Loop over the characters of a string and over the
       keys and values of a dictionary, number the passes of a loop,
       and use two lists together.

   15. **Building lists in one line** (`building-lists-in-one-line`,
       25 minutes). Write a list comprehension from the loop that it
       replaces, keep only some items, build a dictionary in the same
       way, and learn when a loop is the clearer choice.

   16. **Two names, one list** (`two-names-one-list`, 25 minutes).
       Learn why a change to one list can appear under another name.
       You meet each mistake on purpose, and then you correct it.

   17. **Counting words** (`counting-words`, 25 minutes). Build a
       complete program in six parts, with hints but without the
       code. From five of Aesop's fables, it finds the most common
       words, the longest fable, and the words that are in every
       fable.

3. **Working with real data in Python.** Reading and writing files,
   handling errors, the standard library, CSV and JSON, and cleaning
   untidy text, while you build a program that tracks spending. In a
   notebook, with the data files shown under it:

   18. **Reading and writing files** (`reading-and-writing-files`, 25
       minutes). Learn how a program keeps data in a file, so that the
       data lasts longer than the program. Open a file, read it, turn
       its text into numbers, write a new file, and add lines to a
       file.

   19. **When the data is wrong** (`when-the-data-is-wrong`, 25
       minutes). Real data has mistakes in it, and a program must not
       stop at the first one. Handle an exception with `try` and
       `except`, name the type that you expect, and raise an exception
       of your own.

   20. **The batteries included** (`the-batteries-included`, 25
       minutes). Use code that comes with Python. Learn what a module
       is and what `import` does, use modules for mathematics, random
       choices, dates and counting, and read the Python documentation
       to find a function yourself.

   21. **CSV and JSON** (`csv-and-json`, 25 minutes). Learn the two
       formats that most data files use. Read and write CSV files
       with the module `csv`, and read, change and save a file of
       budgets with the module `json`.

   22. **Cleaning messy text** (`cleaning-messy-text`, 25 minutes).
       Learn why real data is untidy, and how a program makes it
       clean. Remove extra spaces, give every category one spelling,
       keep amounts of money exact with `Decimal`, and skip the rows
       that cannot be read.

   23. **Where the money went** (`where-the-money-went`, 25 minutes).
       Build a complete program in six parts, with hints but without
       the code. From an untidy file of purchases and a file of
       budgets, it makes a report of where the money went.

4. **Your own types in Python.** Classes: what a class is and why you
   would make one, objects that describe themselves, dataclasses, and
   building one class on another, using the spending tracker as the
   example. In a notebook:

   24. **Your first class** (`your-first-class`, 25 minutes). Learn
       how to make a new type of value of your own. Make objects from
       a class that describes one purchase, read and change their
       attributes, and write methods of your own.

   25. **Objects that explain themselves**
       (`objects-that-explain-themselves`, 25 minutes). Make your
       objects show useful text and compare as equal. Write the
       special methods `__repr__` and `__eq__` by hand, and then use a
       dataclass, where Python writes them for you.

   26. **Building on another class** (`building-on-another-class`, 25
       minutes). Learn two ways to build a class from classes that you
       already have, inheritance and composition, and a plain rule
       that tells you which of the two to choose.

   27. **Spending as objects** (`spending-as-objects`, 25 minutes).
       Build a complete program in seven parts, with hints but without
       the code: a class for one purchase, and a ledger that holds all
       the purchases and makes the report of where the money went.

5. **From a Python notebook to a program.** Moving your code from a
   notebook into files that you run in a terminal: modules, scripts,
   command line arguments, packages, how Python finds the code you
   import, and finding bugs. In JupyterLab, with an editor and a
   terminal:

   28. **Files, editors and terminals** (`files-editors-and-terminals`,
       25 minutes). Learn the file browser, the editor and the
       terminal before you use them for Python: find and save files,
       move between directories, stop a program that does not end, and
       copy and paste in the terminal.

   29. **Python in the terminal** (`python-in-the-terminal`, 20
       minutes). Start Python at the `>>>` prompt and type code one
       line at a time. See what is the same as a notebook cell and
       what is different, and why code worth keeping belongs in a
       file.

   30. **Code in a file** (`code-in-a-file`, 25 minutes). Move the
       code of the spending tracker from a notebook into a file of
       your own, and import it back. Learn why a module needs its own
       imports, and why the notebook keeps the old code until its
       kernel is restarted.

   31. **Running a script** (`running-a-script`, 25 minutes). Run a
       file as a program from the terminal, write the function where
       the program starts, and learn what `__name__` is and why most
       programs end with a test of it.

   32. **Taking arguments** (`taking-arguments`, 25 minutes). Read the
       words of the command that starts a program, first from
       `sys.argv` and then with `argparse`, so that one command chooses
       the file and the month or category to report on.

   33. **Splitting into modules** (`splitting-into-modules`, 25
       minutes). Split one long program into four modules, each with
       one job. Make the files yourself, and write the imports that
       connect them.

   34. **Where imports come from** (`where-imports-come-from`, 25
       minutes). Learn where Python looks for the file of an import,
       where the standard library and installed code are kept, and how
       to find and repair a file of your own that hides a module of
       Python.

   35. **Making a package** (`making-a-package`, 25 minutes). Keep the
       modules of one program together in a package, change their
       imports so that they find each other, and run the whole package
       by its name.

   36. **Finding the bug** (`finding-the-bug`, 25 minutes). Find three
       bugs in a program of several files: one with the traceback, one
       with `print()`, and one with the Python debugger.

6. **Working like a Python developer.** How Python projects are made,
   and why: what a virtual environment is and how it works, installing
   packages with pip and with uv, testing, project layout and tools,
   and a final project of your own. In JupyterLab, with an editor and
   a terminal, installing packages from PyPI:

   37. **Why an environment** (`why-an-environment`, 25 minutes). See
       what goes wrong when every project shares one Python: an
       install for one project breaks another that you did not
       change.

   38. **An environment of your own** (`an-environment-of-your-own`,
       25 minutes). Make a virtual environment, look inside it, see
       what activating it changes, install a package into it, and
       delete it and make it again.

   39. **Installing packages** (`installing-packages`, 25 minutes).
       Install a package from PyPI with pip, see where it went, record
       what the project needs in a requirements file, and use the
       package `rich` to show the spending as a table.

   40. **The same with uv** (`the-same-with-uv`, 25 minutes). Do the
       same work with the tool uv, each command matched to the one
       you know, then let uv record exact versions in a lock file and
       rebuild the environment with one command.

   41. **Testing your code** (`testing-your-code`, 25 minutes). Learn
       what a test is for, write tests for the spending tracker with
       `pytest`, break a method on purpose to read a failing test, and
       write more tests from a goal.

   42. **A proper project** (`a-proper-project`, 25 minutes). Describe
       the project in `pyproject.toml`, move its code into a `src`
       directory, install it into its own environment with a command
       of its own, and watch a linter, a formatter and a type checker
       at work.

   43. **Your own project** (`your-own-project`, 25 minutes). Choose
       one of four programs, a file organiser, a log analyser, a
       password checker or a flashcard drill, and build it with checks
       and hints but no code given. Then find out where to go next.

Parts 1 to 4 run in your web browser, with nothing to install. Parts 5
and 6 need a real computer, because they teach you to run programs in
a terminal: you can use GitHub Codespaces, mybinder.org, or your own
computer.

## Launch in your browser

Parts 1 to 4 run in a [JupyterLite](https://jupyterlite.readthedocs.io)
site: JupyterLab running completely inside your web browser, with
Python running in the browser tab. There is no server and no account.

**[Launch the workshops in your browser](https://grahamdumpleton.github.io/python-workshops/lab/index.html)**

Python is downloaded when the page first opens, so the first load
takes a moment. Your work is saved in your browser's own storage on
your computer. It is still there after you reload the page, but it is
only in that browser, and clearing the browser's data for the site
deletes it.

## Launch on Binder

[mybinder.org](https://mybinder.org) is a free public service that
runs JupyterLab for you, with no account. It runs every part of the
course.

**[Launch the workshops on Binder](https://mybinder.org/v2/gh/GrahamDumpleton/python-workshops/main?urlpath=lab)**

Starting a session can take a few minutes. The session is temporary:
when it ends, everything you did in it is deleted, so finish a
workshop in the session you started it in. When you have finished,
shut the session down from the Finish dialog or the File menu, rather
than only closing the tab. Workshops are trusted for you on Binder, so
no trust dialog appears.

## Launch on Codespaces

[GitHub Codespaces](https://github.com/features/codespaces) runs
JupyterLab in a computer that belongs to your GitHub account. It runs
every part of the course, and keeps your work between visits.

**[Open the workshops in a codespace](https://codespaces.new/GrahamDumpleton/python-workshops?quickstart=1)**

You need a GitHub account, and the codespace uses your monthly
Codespaces allowance while it runs. The codespace opens in VS Code
first, with a welcome file that explains how to open JupyterLab. When
you have finished with the workshops, delete the codespace at
[github.com/codespaces](https://github.com/codespaces).

## Your progress

On the browser site, on Binder and in a codespace, your progress
through a workshop is sent to the workshops' own analytics service:
which pages you visited, which steps you did, what the checks found,
and when. It is used to find the places where the workshops are not
clear. Nothing that is sent says who you are. The code you type, the
notebooks you make, the output of your code and your answers to forms
are never sent. When you run the workshops on your own computer,
nothing is sent unless you agree to it when a workshop opens.

## Run locally

You need Python 3.14 and [uv](https://docs.astral.sh/uv/). Clone the
repository, install the environment and start JupyterLab from the
checkout:

```
git clone https://github.com/GrahamDumpleton/python-workshops
cd python-workshops
uv sync --no-dev
uv run jupyter lab --config=jupyter_lab_config.py
```

Without uv, the environment comes from the requirements file Binder
uses:

```
python3 -m venv .venv && source .venv/bin/activate
pip install -r binder/requirements.txt
jupyter lab --config=jupyter_lab_config.py
```

The config file opens the workshop browser with every part of the
course listed in order. When you open a workshop, a trust dialog shows
what the workshop is allowed to do, and asks you to choose.

Or clone nothing: install the extension as a uv tool, with the `lab`
extra bringing JupyterLab along, and launch it on the catalog of the
course, with a directory of your own to keep the workshops in:

```
uv tool install --python 3.14 "jupyterlab-workshop[lab]"
jupyter-workshop launch --root ~/python-workshops --catalog https://raw.githubusercontent.com/GrahamDumpleton/python-workshops/main/catalog.json
```

The same in one line, installing nothing that stays:

```
uvx --python 3.14 --from "jupyterlab-workshop[lab]" jupyter-workshop launch --root ~/python-workshops --catalog https://raw.githubusercontent.com/GrahamDumpleton/python-workshops/main/catalog.json
```

## Subscribe from your own JupyterLab

With the extension installed in any JupyterLab, choose "Collections…"
in the workshop browser, and enter the raw URL of the catalog on the
Catalogs tab, or of one part's index on the Collections tab:

```
https://raw.githubusercontent.com/GrahamDumpleton/python-workshops/main/catalog.json
https://raw.githubusercontent.com/GrahamDumpleton/python-workshops/main/collections/first-steps/collection.json
https://raw.githubusercontent.com/GrahamDumpleton/python-workshops/main/collections/functions-and-data/collection.json
https://raw.githubusercontent.com/GrahamDumpleton/python-workshops/main/collections/working-with-data/collection.json
https://raw.githubusercontent.com/GrahamDumpleton/python-workshops/main/collections/your-own-types/collection.json
https://raw.githubusercontent.com/GrahamDumpleton/python-workshops/main/collections/notebook-to-program/collection.json
https://raw.githubusercontent.com/GrahamDumpleton/python-workshops/main/collections/working-like-a-developer/collection.json
```

## What is in the repository

```
AGENTS.md                 guidance for AI agents writing the workshops
CLAUDE.md                 points Claude Code at AGENTS.md
OUTLINE.md                the design of the course
Justfile                  every common task, and the order of each part
pyproject.toml, uv.lock   JupyterLab and the pinned extension, managed by uv
jupyter_lab_config.py     opens the workshop browser on the course, locally
catalog.json              names every part of the course, written by `just index`
catalog-lite.json         names the four parts the JupyterLite site carries
collection.yaml           the analytics block carried into every index
collections/<name>/       the ordered index of each part, written by `just index`
workshops/<name>/         one workshop: workshop.yaml, pages/ and files/
shared/                   the spending data and the code of the running project at each stage, copied into workshops by `just shared`
reference/                the jupyterlab-workshop repository, at the pinned release
binder/                   the Binder image: requirements, settings, welcome message
.devcontainer/            the codespace: setup, start and welcome message
lite/                     settings and welcome message for the browser site
.github/workflows/        lint and self-test on every push; publish the site
```

## Writing and checking workshops

`just install` sets up the environment: it syncs uv, fetches the
reference submodule, downloads the browser the self-test drives, and
links the authoring skill shipped in the jupyterlab-workshop package
into `.claude/skills`.

```
just new <name>          scaffold a workshop under workshops/
just lint                lint the catalog, every collection index and every workshop
just render <name>       render a workshop to HTML
just test <name>         self-test one workshop in a JupyterLab of its own
just test-lite <name>    self-test one workshop in JupyterLite
just index               write or refresh every collection index and the catalog
just shared              copy the files under shared/ into the workshops that ship them
just test-tracks <name>   self-test a workshop once for each of its tracks
just site-serve          build the JupyterLite site and serve it locally
```

The order of each part is the list of workshop names in the Justfile,
which `just index` passes to `jupyter workshop index` one by one.

## Updating the release

jupyterlab-workshop is pinned once, in `pyproject.toml`. `just bump
<version>` moves the pin, relocks, rewrites `binder/requirements.txt`,
relinks the skill and moves the `reference/jupyterlab-workshop`
submodule to the same release tag.
