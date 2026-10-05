---
title: Welcome
requires: [quiz:recap-requirements, quiz:recap-activate, quiz:recap-main-file]
---

# The same with uv

You know how to make a virtual environment with `python -m venv`, and
how to install a package into it with pip. In this workshop you do
the same work with another tool. Its name is `uv`.

`uv` does not bring new ideas. The ideas are the ideas that you
already know: an environment, a package, a file that records what a
program needs. `uv` does the same steps in less time, and with fewer
commands. So every step of this workshop is shown beside the step
that you already know.

You type the commands yourself in this workshop. Each step says
exactly what to type. Each step also has help that you can open if
you need it.

You will learn:

- what `uv` is, and why many Python programmers use it

- how to make an environment and install packages with `uv`, in the
  way that you did with `python -m venv` and pip

- how to describe a project in one file, with the name
  `pyproject.toml`

- how `uv` records the exact version of every package, so that every
  computer gets the same versions

- how to run a program with no activation of the environment

- how to delete an environment and get it back with one command

The example is the spending of one person, Mariam. The file
`spending.csv` holds her 37 purchases from January to March 2026, and
a program shows a report about them. You do not need the earlier
workshops about this program. Each page says again what it uses.

This workshop gets a package from the internet, so the computer needs
a connection to the internet.

The workshop takes about twenty-five minutes.

````{when} "uv" in missing_tools
## The program `uv` was not found

This workshop needs the program `uv`, and this computer does not have
it. The page
[Installing uv](https://docs.astral.sh/uv/getting-started/installation/)
of the documentation of `uv` says how to install it. Install it, then
close JupyterLab and start it again, so that the terminal can find
the new program.
````

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Installing packages**. A
project has a file with the name `requirements.txt`. The file holds
one line:

```
rich
```

```{quiz}
:id: recap-requirements
:title: The file requirements.txt
question: "What is the file `requirements.txt` for?"
options:
  - { text: "It holds the code of the package `rich`", explanation: "The code of a package is not in this file. The file holds only the name of the package. The code comes from the internet when the package is installed." }
  - { text: "It records which packages the program needs, so that one command can install all of them", correct: true }
  - { text: "Python reads it every time that the program runs", explanation: "Python does not read this file. A person, or a tool such as pip, reads it to know what to install." }
explanation: "Here a **package** is code that someone has published for other people to install. A package that your program needs is a **dependency** of your program. A **requirements file** is a text file that lists the dependencies of a program, one on each line. The command `python -m pip install -r requirements.txt` installs every package that the file names. In this workshop you do the same with `uv`."
```

The second question is about the workshop **An environment of your
own**. A **virtual environment** is a directory that holds its own
`python` and its own `site-packages`, for one project. You make one
with `python -m venv .venv`. Then you type this command:

```
source .venv/bin/activate
```

```{quiz}
:id: recap-activate
:title: What activating does
question: "What does this command change?"
options:
  - { text: "It puts the directory `.venv/bin` first in the list of directories in which the shell looks for a program", correct: true }
  - { text: "It installs Python into the directory `.venv`", explanation: "The command `python -m venv .venv` made the environment, and that command put a `python` in it. The command `source .venv/bin/activate` installs nothing." }
  - { text: "It copies your program into the environment", explanation: "Your program stays where it is. An environment holds a `python` and the packages that are installed, not your own files." }
explanation: "To **activate** an environment means to make the terminal use it. The shell looks for a program such as `python` in a list of directories, which has the name `PATH`. Activating puts the directory `.venv/bin` first in that list, so the word `python` now means the `python` of the environment. It changes nothing more. The command `deactivate` takes the directory out of the list again."
```

The third question is about the workshop **Making a package**. The
spending tracker is a directory with the name `spending`, which holds
several files of Python code. You run it with this command:

```
python -m spending spending.csv
```

```{quiz}
:id: recap-main-file
:title: The file that starts a package
question: "Which file of the directory `spending` does this command run as the program?"
options:
  - { text: "`__init__.py`", explanation: "Python does run `__init__.py` first, as it does every time that a package is imported. But the file that is run as the program is another file." }
  - { text: "`cli.py`", explanation: "The file `cli.py` holds the function `main`, but Python does not choose a file by what it holds. It looks for one file with a fixed name." }
  - { text: "`__main__.py`", correct: true }
explanation: "The word **package** has two meanings. The first meaning is a directory that holds modules, and a **module** is a file of Python code. The directory `spending` is such a package. With `-m`, Python finds the package by its name and runs the file `__main__.py` inside it. The word after that, `spending.csv`, is a **command line argument**: a word after the name of the program, which the program receives."
```

## What comes next

Go to the next page. There you look at the program that you start
with, and at what it needs.
