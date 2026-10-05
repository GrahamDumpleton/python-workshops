---
title: A place for each project
requires: [quiz:install-for-labels, quiz:what-it-holds]
---

# A place for each project

You have seen the problem. On this page you learn the idea that
solves it. The next workshop shows you how to use it.

## The idea

Each project gets a `site-packages` of its own. Then an install for
one project changes the `site-packages` of that project, and of no
other project.

A `site-packages` belongs to a Python. So each project also gets a
Python of its own, which searches the `site-packages` of that
project.

## Back to the kitchen

Think of the kitchen again. The two people shared one shelf, with
room for one copy of each cookbook. Now each person gets a shelf of
their own. One person keeps the old edition of a cookbook, and the
other keeps the new edition. When one person changes a book on their
shelf, the shelf of the other person does not change.

## A virtual environment

Python has a tool for this idea. A **virtual environment** is a
directory that holds its own `python` and its own `site-packages`,
for one project. These pages also say **environment** for short.

You have already made one. The directory `shared-python` is a virtual
environment. The command `python -m venv shared-python` made it, on
the page **One Python for every project**. You saw both of its parts:

- its own Python, the file `shared-python/bin/python`

- its own `site-packages`, which held only `pip` at first, and which
  was the last line that `places.py` showed

In this workshop you used that one environment for both projects, so
that it stood for the one Python of a computer. That is why the
problem appeared. The right way is one environment for each project:

| Project | Its environment holds |
|---------|-----------------------|
| `poster` | a Python, and version `1.13` of `webcolors` |
| `labels` | a Python, and version `24.11.1` of `webcolors` |

Each project runs with the Python of its own environment. Both
projects work, and an install for one project cannot break the other.

```{quiz}
:id: install-for-labels
:title: An install for one project
question: "Each of the two projects has an environment of its own, as in the table. You install a newer version of `webcolors` into the environment of `labels`. What happens to the project `poster`?"
options:
  - { text: "It stops working, because its version of the package is replaced.", explanation: "The install changes only the `site-packages` of the environment of `labels`. The `site-packages` of `poster` is another directory, and it does not change." }
  - { text: "Nothing changes for `poster`. It still has version `1.13` in its own environment.", correct: true }
  - { text: "It gets the newer version too, because it is the same package.", explanation: "An install copies files into one `site-packages`. The `site-packages` of `poster` is another directory, and nothing is copied into it." }
explanation: "An install goes into the `site-packages` of the Python that runs it. With one environment for each project, the other projects keep what they have."
```

## What an environment does not hold

An environment holds a Python and installed packages. It does not
hold your own code. The files `poster.py` and `labels.py` stay in the
directories of their projects, where you wrote them.

```{quiz}
:id: what-it-holds
:title: What is inside an environment
question: "Which of these does a virtual environment hold?"
options:
  - { text: "A copy of the code of your project", explanation: "Your code stays in the directory of your project. The environment holds the Python that runs the code, and the packages that the code imports." }
  - { text: "Every package that exists, so that each project can choose one", explanation: "An environment holds only the packages that were installed into it. A new environment holds almost nothing." }
  - { text: "Its own `python` and its own `site-packages`", correct: true }
explanation: "A **virtual environment** is a directory that holds its own `python` and its own `site-packages`, for one project. Because it holds nothing that you wrote, you can delete it and make it again. The next workshop shows this."
```

## What is not explained yet

This workshop ran the Python of an environment by its path, such as
`shared-python/bin/python`. That works, but the path is long. The
next workshop, **An environment of your own**, explains the command
`python -m venv`, makes an environment for a project, looks at what
is inside it, and shows a shorter way to use it.
