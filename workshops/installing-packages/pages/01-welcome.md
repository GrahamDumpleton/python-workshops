---
title: Welcome
requires: [quiz:recap-activate, quiz:recap-main-file, quiz:recap-site-packages, quiz:first-line]
---

# Installing packages

Until now, every module that your programs imported came with Python,
or you wrote it yourself. Many thousands of programmers have published
code that you can use in your own programs. In this workshop you
learn how to get such code and how to use it.

This workshop is part of the set **Working like a Python developer**.
You work in two places. The **terminal** is a window in which you type
commands for the computer. A **command** is one line that you type in
the terminal, which the computer runs when you press `Enter`. The
**editor** is the part of JupyterLab in which you change a file.

You will learn:

- what the word "package" means when programmers talk about
  installing one

- how to install a package into an environment of your own, and where
  the package goes

- how to see which packages an environment holds

- how to record what a project needs in one small file, and how to
  get everything back from that file

- how to use the package `rich` to show a table in the terminal

In this workshop you type most of the commands yourself, and you
write the code yourself. Each task says exactly what to do. Each task
also has hints, and a solution that you can open if you need it.

The example is the spending of one person, Mariam. Each thing that
she bought is a purchase. You do not need the earlier workshops about
her spending. Each page says again what it uses.

The workshop takes about twenty-five minutes. It needs a connection
to the internet, because a package comes from a website.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **An environment of your
own**. A **virtual environment** is a directory that holds its own
`python` and its own place for installed code, for one project. These
workshops call it an environment. You make one with the command
`python -m venv .venv`. Then you **activate** it with the command
`source .venv/bin/activate`.

```{quiz}
:id: recap-activate
:title: What activating does
question: "What does the command `source .venv/bin/activate` change?"
options:
  - { text: "It copies Python into the directory `.venv`", explanation: "The command `python -m venv .venv` made the directory and put a `python` in it. Activating copies nothing." }
  - { text: "It puts the directory `.venv/bin` first on `PATH`, so the command `python` runs the `python` of the environment", correct: true }
  - { text: "It installs the code that the project needs", explanation: "Activating installs nothing. You install code with another command, which you learn in this workshop." }
explanation: "`PATH` is the list of directories in which the shell looks for a program. To activate an environment means to make the terminal use it. The command puts the directory `.venv/bin` first on `PATH`, and it changes nothing more. After it, the command `python` runs the `python` of the environment. In this workshop you make an environment and activate it again."
```

The second question is about the workshop **Making a package**. A
directory with the name `spending` holds the modules of a program. A
**module** is a file of Python code. You start the program with this
command:

```
python -m spending spending.csv
```

```{quiz}
:id: recap-main-file
:title: The file that runs first
question: "Which file of the directory `spending` does Python run for this command?"
options:
  - { text: "`__main__.py`", correct: true }
  - { text: "`__init__.py`", explanation: "The file `__init__.py` marks the directory as a package, and Python reads it first. But the file that Python runs as the program has another name." }
  - { text: "`spending.csv`", explanation: "That is the file of data. The program reads it. It is a command line argument: a word after the name of the program in a command." }
explanation: "With `-m`, Python looks for the name `spending` in the same way that `import spending` does, and it runs the file `__main__.py` inside that directory. The word `spending.csv` after the name is given to the program. In this workshop you start the spending tracker with this command."
```

The third question is about the workshop **Where imports come from**.
A program has the line `import csv`, and the module `csv` comes with
Python. Another program has a line that imports a module which does
not come with Python, and which you did not write.

```{quiz}
:id: recap-site-packages
:title: Where installed code is kept
question: "In which directory does Python look for code that was installed?"
options:
  - { text: "In the directory `site-packages`", correct: true }
  - { text: "In every directory of the computer, one after another", explanation: "That would take a very long time. Python looks only in the directories of the list `sys.path`." }
  - { text: "On the internet, each time that the program runs", explanation: "An `import` line never uses the internet. The code must be on your computer before the program runs." }
explanation: "An `import` line makes Python look in a short list of directories, which is in `sys.path`. One of them holds the standard library, the modules that come with Python. Another one has the name `site-packages`, and it holds the code that was installed. Each environment has a `site-packages` of its own. In this workshop you see a package arrive in that directory."
```

## The program as it is now

Your work directory holds the spending tracker as the workshop
**Making a package** left it. A **directory** is a place that holds
files and other directories. The directory `spending` holds the six
files of the program:

| File | What it holds |
|------|------|
| `__init__.py` | one line of text that describes the program |
| `__main__.py` | the two lines that start the program |
| `cli.py` | the function `main`, which reads the command and shows the report |
| `models.py` | the classes `Purchase` and `Ledger` |
| `storage.py` | the function `read_ledger`, which reads the purchases from a CSV file |
| `report.py` | the function `report_lines`, which makes the lines of the report |

The file `spending.csv` is beside that directory. It holds 37
purchases.

Run the program. Click in the terminal, which is the lower part of
the window. Type this command, and press `Enter`:

```
python -m spending spending.csv
```

The program shows a report of 17 lines.

````{hint}
:title: Run the command for me
The action below types the command in the terminal and runs it.

```{execute}
:id: run-first
:title: Run the spending tracker
:wait: prompt
python -m spending spending.csv
```
````

```{quiz}
:id: first-line
:title: The first line of the report
:type: text
:case: false
question: "What is the first line of the report in the terminal? Type the whole line."
answer:
  - { pattern: "Purchases:\\s*37", example: "Purchases: 37" }
wrong:
  - { text: "37", explanation: "That is the number. The line also has a word before the number. Type the whole line." }
  - { pattern: "Total:.*", explanation: "That is the second line of the report. The first line is above it, directly under the command." }
otherwise: "Look at the line directly under the command `python -m spending spending.csv` in the terminal. It begins with the word `Purchases`."
explanation: "The program read 37 purchases from the file `spending.csv`. The report is plain lines of text. At the end of this workshop, the same program can also show its totals as a table with lines round it."
```

The program uses only modules that come with Python, and modules of
its own. On the next page you learn where more code can come from.
