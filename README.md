# Python workshops

[![Launch in your browser](https://img.shields.io/badge/launch-in%20your%20browser-F37726?logo=jupyter&logoColor=white)](https://grahamdumpleton.github.io/python-workshops/lab/index.html)
[![Launch on Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/GrahamDumpleton/python-workshops/main?urlpath=lab)
[![Open in GitHub Codespaces](https://img.shields.io/badge/launch-codespaces-579ACA?logo=github&logoColor=white)](https://codespaces.new/GrahamDumpleton/python-workshops?quickstart=1)
[![test](https://github.com/GrahamDumpleton/python-workshops/actions/workflows/test.yml/badge.svg)](https://github.com/GrahamDumpleton/python-workshops/actions/workflows/test.yml)

Guided, hands-on workshops that teach the
[Python](https://www.python.org/) programming language to people who
have never written a program before. You do not need to know anything
about programming to start, and you do not need to install anything.

**The workshops are being written.** The first part is ready, and its
nine workshops are listed under [The course](#the-course). The rest of this page
describes the course as it is planned.

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
   most of the code yourself.

3. **Working with real data in Python.** Reading and writing files,
   handling errors, the standard library, CSV and JSON, and cleaning
   untidy text, while you build a program that tracks spending.

4. **Your own types in Python.** Classes: what a class is and why you
   would make one, objects that describe themselves, dataclasses, and
   building one class on another.

5. **From a Python notebook to a program.** Moving your code from a
   notebook into files that you run in a terminal: modules, scripts,
   command line arguments, packages, how Python finds the code you
   import, and finding bugs.

6. **Working like a Python developer.** How Python projects are made,
   and why: what a virtual environment is and how it works, installing
   packages with pip and with uv, testing, project layout and tools,
   and a final project of your own.

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
just site-serve          build the JupyterLite site and serve it locally
```

The order of each part is the list of workshop names in the Justfile,
which `just index` passes to `jupyter workshop index` one by one.

## Updating the release

jupyterlab-workshop is pinned once, in `pyproject.toml`. `just bump
<version>` moves the pin, relocks, rewrites `binder/requirements.txt`,
relinks the skill and moves the `reference/jupyterlab-workshop`
submodule to the same release tag.
