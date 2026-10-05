---
title: Welcome
requires: [quiz:recap-package, quiz:recap-option, quiz:recap-traceback]
---

# Finding the bug

Every program that people write has mistakes in it at some time. This
is normal, and it is true for people who have programmed for many
years. So an important part of programming is to find a mistake and
to repair it. In this workshop you learn three ways to find one.

This is the last workshop of the set **From a Python notebook to a
program**. In this workshop you do not write a new program. The
program is already written, and it is nearly right. Your work is to
find what is wrong, and to change it.

You will learn:

- how to read an error message that names several files

- how to see what a program does while it runs, with `print()`

- how to stop a program in the middle, and look at its values

- how to run a program one line at a time

The program is the spending tracker of one person, Mariam. It reads
the things that she bought from a file, and shows a report. You do
not need the earlier workshops about it. Each page says again what it
uses.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Making a package**. A
directory with the name `spending` holds the files of a program:
`__init__.py`, `__main__.py`, `cli.py`, `models.py`, `report.py` and
`storage.py`.

```{quiz}
:id: recap-package
:title: A program that is a package
question: "Which command runs this program, with the file `spending.csv` as its data?"
options:
  - { text: "`python spending/cli.py spending.csv`", explanation: "This command runs one file of the directory on its own. The files of this program import each other with a dot, such as `from .report import report_lines`, and that works only when Python runs the whole directory as a package." }
  - { text: "`python -m spending spending.csv`", correct: true }
  - { text: "`python spending.py spending.csv`", explanation: "There is no file with the name `spending.py`. The program is a directory with the name `spending`." }
explanation: "A **module** is a file of Python code. A **package** is a directory that holds modules. The command `python -m spending` tells Python to run the package `spending`, and Python then runs the file `__main__.py` inside it. You use this command many times in this workshop."
```

The second question is about the workshop **Taking arguments**. Read
this command:

```
python -m spending spending.csv --category food
```

```{quiz}
:id: recap-option
:title: An option of a program
question: "What does `--category food` do in this command?"
options:
  - { text: "It makes the report use only the purchases of the category `food`", correct: true }
  - { text: "It makes the program read a file with the name `food`", explanation: "The file that the program reads is `spending.csv`, the word before `--category`." }
  - { text: "It changes the category of every purchase to `food`", explanation: "The program only reads the file `spending.csv`. It does not change it." }
explanation: "A **command line argument** is a word after the name of the program in a command. An **option** is a command line argument that begins with `--`. This program has two options. `--category food` makes the report use only the purchases of one category, and `--month 2026-02` makes it use only the purchases of one month."
```

The third question is about the workshop **When things go wrong**.
When Python cannot perform a line, it stops and shows an error
message of several lines. Programmers call this message a
**traceback**.

```{quiz}
:id: recap-traceback
:title: Where to start reading
question: "Which line of a traceback do you read first?"
options:
  - { text: "The first line", explanation: "The first line is always the same: `Traceback (most recent call last):`. It tells you nothing about this error." }
  - { text: "The longest line", explanation: "The length of a line does not tell you how important it is." }
  - { text: "The last line", correct: true }
explanation: "The last line of a traceback says what went wrong. It begins with the type of the error, such as `NameError`, and then gives a short message. The lines above it say where Python was when it stopped. In this workshop you read a traceback that is longer than the ones that you saw in a notebook."
```

## What is on your screen

A **terminal** is a window in which you type commands for the
computer. The terminal is in the lower part of your screen. A
**command** is one line that you type in the terminal. The computer
runs it when you press `Enter`. The **shell** is the program inside
the terminal that reads each command and runs it. The **prompt** is
the short text that shows that the shell is ready for a command. It
is at the start of the last line of the terminal.

The **editor** is the part of JupyterLab in which you change a file.
It opens above the terminal when you open a file.

The file browser is at the left side of your screen. A **directory**
is a place that holds files and other directories. Your work
directory is the directory that holds the files of this workshop.
Click the action below, so that the file browser shows your work
directory.

```{file-browser-reveal}
:id: show-work-directory
:title: Show my work directory in the file browser
:path: spending.csv
```

The file browser now shows the file `spending.csv` and the directory
`spending`.

The file `spending.csv` holds 37 purchases of Mariam, from January to
March of 2026. Each line has a date, a description, an amount and a
category.

The directory `spending` is the program. It holds these files:

| File | What it holds |
|------|---------------|
| `__init__.py` | one line of text that describes the package |
| `__main__.py` | the two lines that start the program |
| `cli.py` | the function `main`, which reads the command line arguments and shows the report |
| `storage.py` | the function `read_ledger`, which reads the purchases from the file |
| `models.py` | the class `Purchase`, which describes one purchase, and the class `Ledger`, which holds all the purchases and adds them up |
| `report.py` | the function `report_lines`, which makes the lines of the report |

You do not need to read these files now. On the next page you run the
program, and you see what happens.
