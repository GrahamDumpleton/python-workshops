---
title: One Python for every project
requires: [verify:shared-made, quiz:which-python-runs]
---

# One Python for every project

Most people begin with one Python on their computer, and every
Python program that they write uses it. On this page you learn why
that matters, and you make a Python to experiment with.

## Projects

A **project** is one piece of work: a program, with the files that
belong to it, in a directory of its own. The spending tracker is a
project. A program that draws a poster is another project.

A programmer has many projects. Some are new. Some were finished a
year ago and still run every week. When a computer has one Python,
all of these projects use that one Python.

## Installed code

In the workshop **Making a package**, a **package** was a directory
that holds modules. People all over the world publish packages of
their own, so that other people can use them. Such a package does not
come with Python. You install it when a project needs it.

A Python keeps the packages that were installed for it in one
directory, with the name `site-packages`. So one Python has one
`site-packages`, and every project that uses this Python uses the
same installed packages.

## A kitchen with one shelf

Think of a kitchen that two people share. The kitchen has one shelf
for cookbooks, and the shelf has room for one copy of each book. Both
people cook from the same copy.

This works well as long as both people want the same copy. This
workshop shows what happens when they do not.

In this comparison, the kitchen is the computer, the shelf is
`site-packages`, a cookbook is a package, and the two people are two
of your projects.

## A Python to experiment with

In this workshop you install packages, and one install breaks a
program on purpose. You must not do that with the Python that runs
JupyterLab, because JupyterLab itself is a Python program, and it
uses that Python.

So the first step is to make another Python, inside your work
directory. The command below makes it, in a new directory with the
name `shared-python`.

```
python -m venv shared-python
```

This command is new, so the action below runs it for you. The command
needs a few seconds, and it shows nothing when it works. Wait until
the terminal shows its prompt again.

```{attempt}
:id: shared-not-made
:check: shared-made
:expect: There is no directory shared-python in your work directory yet
```

```{execute}
:id: make-shared
:title: Make the shared Python
:wait: prompt
:timeout: 120s
python -m venv shared-python
```

```{verify}
:id: shared-made
:label: The directory shared-python holds a Python
:trigger: after:make-shared
from pathlib import Path

assert Path("shared-python/bin/python").exists(), "There is no directory shared-python in your work directory yet. Click the action above that makes the shared Python, and wait until the terminal shows its prompt again."
print("Correct. The directory shared-python holds a Python of its own.")
```

The next workshop, **An environment of your own**, explains this
command, and you type it yourself there. For this workshop you need
to know only two things about the new directory:

- It holds a Python of its own. The program is the file
  `shared-python/bin/python`.

- It holds a `site-packages` of its own, which is almost empty.

In this workshop, `shared-python` stands for the one Python of a
computer. Think of it as the Python that all your projects share.
Because it is inside your work directory, nothing that you do to it
can harm JupyterLab or the rest of the computer.

## Choose which Python runs

Your terminal can now run two Pythons, so a command must say which
one it means.

- A command that begins with the word `python` runs the Python that
  the shell finds by that name. In most places where these workshops
  run, that is the Python that runs JupyterLab.

- A command that begins with a path runs exactly the program at that
  path. A **path** is the text that says where a file is. The path
  `shared-python/bin/python` names the file `python`, in the
  directory `bin`, in the directory `shared-python`.

The action below asks the shared Python for its version. The command
is the same as `python --version`, with the path in place of the word
`python`.

```{execute}
:id: shared-version
:title: Ask the shared Python for its version
:wait: prompt
shared-python/bin/python --version
```

The terminal shows the word `Python` and a version that begins with
`3.14`.

In the rest of this workshop, every command that runs Python begins
with `shared-python/bin/python`. This is how you make sure that you
experiment with the shared Python, and with no other.

```{quiz}
:id: which-python-runs
:title: Run a script with the shared Python
question: "Your work directory holds a script with the name `places.py`. Which command runs it with the shared Python?"
options:
  - { text: "`python places.py`", explanation: "This command runs the script with the Python that the terminal finds by the name `python`. It is not the shared Python." }
  - { text: "`shared-python places.py`", explanation: "The name `shared-python` is a directory. The program is the file `python`, in the directory `bin`, inside that directory." }
  - { text: "`shared-python/bin/python places.py`", correct: true }
explanation: "The first part of the command is the path of the program to run, and the second part is the script. On the next page you type this command."
```
