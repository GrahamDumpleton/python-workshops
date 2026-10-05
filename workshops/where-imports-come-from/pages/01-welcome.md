---
title: Welcome
requires: [quiz:recap-imports, quiz:recap-library, quiz:recap-directory]
---

# Where imports come from

You have written `import` many times. Each time, Python found the
code that you asked for. In this workshop you learn how Python finds
it, and what goes wrong when Python finds the wrong file.

You will learn:

- that an import is a search for a file

- which directories Python searches, and in which order

- where the modules that come with Python are kept

- where code that was installed later is kept

- how to ask a module which file it came from

- how a file of your own can hide a module of Python, and how to
  repair that

This workshop does not use the spending tracker. It uses a few small
files about food, so that you can look at the search and at nothing
else.

In this workshop you type most commands yourself, and you make two
files yourself. Each step says exactly what to type. Each task has
hints, and a solution that you can open if you need it.

The workshop takes about twenty-five minutes.

## What you see

The window has three parts beside this panel:

- On the left is the file browser. It shows the files of this
  workshop. They are in one **directory**, which is a place that
  holds files and other directories. These pages call it your work
  directory.

- In the middle, at the top, is the place for the **editor**, the
  part of JupyterLab in which you change a file. It is empty until
  you open a file.

- Under it is the **terminal**, a window in which you type commands
  for the computer. A **command** is one line that you type in the
  terminal. The computer runs it when you press `Enter`.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Splitting into modules**.
A program is in several files. The file `models.py` defines a class
with the name `Ledger`. The file `report.py` has a function that
uses `Ledger`.

```{quiz}
:id: recap-imports
:title: An import between two files
question: "Which line must the file `report.py` have, so that its function can use `Ledger`?"
options:
  - { text: "`import report`", explanation: "This line asks for the module `report`, which is the file itself. The class is in the file `models.py`." }
  - { text: "`from models import Ledger`", correct: true }
  - { text: "No line. `models.py` is in the same directory, so Python finds `Ledger` without help.", explanation: "Python does not look in other files for a name. Each file must import the names that it uses." }
explanation: "A **module** is a file of Python code. The file `models.py` is the module `models`. The line `from models import Ledger` gets the name `Ledger` from that module. Each module imports what it uses itself. In this workshop you learn how Python finds the file `models.py` when it reads such a line."
```

The second question is about the workshop **The batteries included**.

```{quiz}
:id: recap-library
:title: The standard library
question: "The line `import random` works on every computer that has Python. Why?"
options:
  - { text: "The module `random` is part of the standard library, which comes with Python.", correct: true }
  - { text: "Python gets the module `random` from the internet when it reads the line.", explanation: "Python does not use the internet for an import. It looks for a file on your computer." }
  - { text: "Python writes the module `random` when it reads the line.", explanation: "Python does not write code for an import. Somebody wrote the module `random`, and the file is on your computer." }
explanation: "The **standard library** is the set of modules that come with Python, such as `random`, `math`, `csv` and `datetime`. They are files on your computer, and they arrived when Python was installed. In this workshop you find the directory that holds them."
```

The third question is about the workshop **Files, editors and
terminals**.

```{quiz}
:id: recap-directory
:title: The current directory
question: "Which command shows the current directory of the terminal?"
options:
  - { text: "`ls`", explanation: "The command `ls` shows the names of the files in the current directory. It does not show which directory that is." }
  - { text: "`cd`", explanation: "The command `cd` changes the current directory. It does not show it." }
  - { text: "`pwd`", correct: true }
explanation: "The **current directory** is the directory that the terminal is in now. The command `pwd` shows its path. A **path** is the text that says where a file or a directory is, such as `kitchen/cook.py`. In this workshop the current directory is always your work directory."
```

When you have answered the three questions, go to the next page.
