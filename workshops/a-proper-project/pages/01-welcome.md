---
title: Welcome
requires: [quiz:recap-test-names, quiz:recap-first-path, quiz:recap-activate]
---

# A proper project

The spending tracker works, and it has tests. But it works only in
one way: you must be in the right directory, and you must start it
with `python -m spending`. A program that other people can install
and use needs a little more. In this workshop you add it.

This workshop is part of the set **Working like a Python developer**.
You work in two places. The **terminal** is a window in which you type
commands for the computer. A **command** is one line that you type in
the terminal, which the computer runs when you press `Enter`. The
**editor** is the part of JupyterLab in which you change a file.

You will learn:

- how one file, `pyproject.toml`, describes a project: its name, its
  version, and the packages that it needs

- why programmers put the code of a project in a directory with the
  name `src`

- how to install your own project into its environment, so that the
  tests run against the installed code

- how to give your program a command of its own

- what a linter, a formatter and a type checker are, and what each
  one finds in your code

You type most of the commands yourself, and you write the file that
describes the project. On the last four pages you watch three tools
at work on your code. Each task says exactly what to do. Each task
also has hints, and a solution that you can open if you need it.

The example is the spending of one person, Mariam. The file
`spending.csv` holds her 37 purchases from January to March 2026, and
a program shows a report about them. You do not need the earlier
workshops about this program. Each page says again what it uses.

The workshop takes about twenty-five minutes. It needs a connection
to the internet, because it installs packages.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Testing your code**. A
**test** is code that checks other code. The package `pytest` finds
the tests of a project and runs them, with the command
`python -m pytest`.

```{quiz}
:id: recap-test-names
:title: The functions that pytest runs
question: "A file of tests holds several functions. Which of them does pytest run as tests?"
options:
  - { text: "Every function in the file", explanation: "A file of tests can also hold functions that help the tests, such as a function that makes a ledger. pytest does not run those as tests." }
  - { text: "Each function that has the word `assert` in it", explanation: "pytest does not look inside a function to choose it. It looks at the name of the function." }
  - { text: "Each function whose name begins with `test_`", correct: true }
explanation: "pytest looks for files whose names begin with `test_`, and in them for functions whose names begin with `test_`. It runs each of those functions. A test passes when its `assert` lines all hold. The spending tracker has seven tests, in the directory `tests`."
```

The second question is about the workshop **Where imports come
from**. When Python meets an `import` line, it looks for the module
in a list of directories, `sys.path`, one directory after another.

```{quiz}
:id: recap-first-path
:title: The first place that Python looks
question: "You start a module with `python -m`, for example `python -m pytest`. Which directory is first in `sys.path`?"
options:
  - { text: "The directory `site-packages`, which holds the installed packages", explanation: "`site-packages` is in the list, but near the end. One directory comes before every other." }
  - { text: "The directory that the terminal is in", correct: true }
  - { text: "The directory of the standard library", explanation: "The standard library is in the list, but it is not first." }
explanation: "With `python -m`, the first entry of `sys.path` is the **current directory**: the directory that the terminal is in now. So a module or a package in that directory is found before any installed package. On the third page of this workshop, you see why that matters."
```

The third question is about the workshop **An environment of your
own**. A **virtual environment** is a directory that holds its own
`python` and its own `site-packages`, for one project. These
workshops call it an environment, and give it the name `.venv`. You
**activate** it with the command `source .venv/bin/activate`, and
that makes the terminal use it.

```{quiz}
:id: recap-activate
:title: What activating does
question: "What does the command `source .venv/bin/activate` change?"
options:
  - { text: "It installs the packages that the project needs", explanation: "Activating installs nothing. pip installs packages, with the command `python -m pip install`." }
  - { text: "It copies a new Python into the directory `.venv`", explanation: "The command `python -m venv .venv` made the directory and its `python`. Activating copies nothing." }
  - { text: "It puts the directory `.venv/bin` first on `PATH`, so the command `python` runs the `python` of the environment", correct: true }
explanation: "`PATH` is the list of directories in which the shell looks for a program. Activating puts `.venv/bin` first on that list, and changes nothing more. After it, the prompt begins with `(.venv)`, and `python` is the `python` of the environment. On the next page you make an environment for the project and activate it."
```
