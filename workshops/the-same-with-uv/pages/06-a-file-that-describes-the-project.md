---
title: A file that describes the project
requires: [verify:project-file-open, quiz:requires-python, quiz:empty-dependencies]
---

# A file that describes the project

So far, `uv` did the steps that you know, one command for one step.
`uv` has a second way of working, in which it does the steps for you.
For that, `uv` must know what your project is. On this page you read
the file that tells it.

## What a project is

A **project** is one piece of work: the directory that holds your
program, and everything that belongs to it. Your work directory is a
project. It holds the package `spending`, the data, and the record of
what the program needs.

## Why one more file

The file `requirements.txt` records one thing: the names of the
packages to install. A project has more to say. What is its name?
Which version of the program is this? Which versions of Python can
run it?

Python has one standard file for all of this. Its name is always
`pyproject.toml`, and it is in the first directory of the project.
`uv` reads it, and many other tools for Python read it too. The file
also lists the dependencies, so it can take the place of
`requirements.txt`.

The commands of `uv` for a project look for `pyproject.toml` in the
directory that the terminal is in, and then in the directories above
it. That is why each project has a `pyproject.toml` of its own: so
that `uv` finds the right one.

An everyday comparison: `requirements.txt` is a shopping list. The
file `pyproject.toml` is the label on a product. The label gives the
name of the product, and it also lists what the product is made of.

## Open the file

This workshop gives you the file `pyproject.toml` in your work
directory. The action below opens it in the **editor**, the part of
JupyterLab in which you change a file.

```{file-open}
:id: open-project-file
:title: Open the file pyproject.toml
:path: pyproject.toml
```

```{verify}
:id: project-file-open
:label: The file pyproject.toml is open in the editor
:substrate: ui
:trigger: after:open-project-file
:message: The file pyproject.toml is not open yet. Click the action above to open it.
file-open pyproject.toml
```

The file has five lines:

```toml
[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = []
```

## The form of the file

The ending `.toml` is the name of a format for text files, TOML. The
format is made for settings that people write by hand. You need three
rules of it.

- A line with a name in square brackets, such as `[project]`, begins
  a group of settings. The group is called a table.

- A setting is a line of the form `name = value`.

- A value is written as in Python: text in double quotes, and a list
  in square brackets.

## Line by line

- `[project]` begins the table that describes the project.

- `name` is the name of the project. Here it is `"spending"`, the
  same name as the package.

- `version` is the version of your program. You choose it, and you
  make it larger when you change the program. `0.1.0` is a usual
  first number.

- `requires-python` says which versions of Python can run the
  project. `>=` means "this version, or a newer version".

- `dependencies` is the list of the packages that the program needs.

```{quiz}
:id: requires-python
:title: The versions of Python
question: "The file says `requires-python = \">=3.14\"`. Which of these versions of Python can run the project?"
options:
  - { text: "Python 3.13 only", explanation: "3.13 is older than 3.14. `>=3.14` means version 3.14, or a version that is newer." }
  - { text: "Python 3.14, and every newer version, such as 3.15", correct: true }
  - { text: "Python 3.14 only, and no other version", explanation: "That would be `==3.14`. The two characters `>=` also allow every newer version." }
explanation: "`>=3.14` means version 3.14 or a newer version. `uv` reads this line when it makes the environment, and it uses a Python that fits."
```

## A list with nothing in it

The last line is `dependencies = []`. The two square brackets with
nothing between them are an empty list, as in Python.

```{quiz}
:id: empty-dependencies
:title: The empty list
question: "The program needs the package `rich`. Why is the list `dependencies` empty?"
options:
  - { text: "Nobody has recorded `rich` in this file yet. The next page does it, with one command of `uv`", correct: true }
  - { text: "`rich` is part of Python, so the list does not need to name it", explanation: "`rich` is not part of Python. It comes from PyPI, and the program stops without it, as you saw on an earlier page." }
  - { text: "The list names only packages that are installed already", explanation: "The list does not depend on what is installed. It is a record of what the program needs, and someone must write that record." }
explanation: "The file is a description, and it says only what someone wrote in it. The package `rich` is named in `requirements.txt`, but not yet in `pyproject.toml`. On the next page, the command `uv add rich` writes it in the list for you."
```

## What happened

You read the description of your project. Nothing was installed, and
nothing changed: the file is only a description.

The file `requirements.txt` is still there. From the next page, you
do not need it, because `pyproject.toml` holds the list of
dependencies. You can keep both files while you learn.

Do not change `pyproject.toml` on this page. If you changed it by
mistake, close its tab, and do not save the change.
