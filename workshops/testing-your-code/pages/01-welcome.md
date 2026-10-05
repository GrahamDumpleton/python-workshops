---
title: Welcome
requires: [quiz:recap-lock-file, quiz:recap-requirements, quiz:recap-return]
---

# Testing your code

A program is not finished on the day that you write it. You change it
many times after that: you add a new report, you make a function
faster, you correct a mistake. Each change can break something that
worked before. In this workshop you learn to write code that checks
your other code, so that you find such a break at once.

This workshop is part of the set **Working like a Python developer**.
You work in two places. The **terminal** is a window in which you type
commands for the computer. A **command** is one line that you type in
the terminal, which the computer runs when you press `Enter`. The
**editor** is the part of JupyterLab in which you change a file.

You will learn:

- what a test is, and why programmers write tests

- how the word `assert` checks that something is true

- how to install the package `pytest`, a tool that finds your tests
  and runs them

- how to write a test file for the spending tracker, and run every
  test with one command

- how to read what `pytest` shows when a test fails

- how to write tests of your own from a goal

You type the commands and write the code yourself in this workshop.
Each task says exactly what to do. Each task also has hints, and a
solution that you can open if you need it.

The example is the spending of one person, Mariam. Each thing that
she bought is a purchase. You do not need the earlier workshops about
her spending. Each page says again what it uses.

The workshop takes about twenty-five minutes. It needs a connection
to the internet, because it installs packages from a website.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **The same with uv**. The
tool `uv` installs packages, as pip does. In a project that uses
`uv`, the command `uv add rich` writes a file with the name
`uv.lock`.

```{quiz}
:id: recap-lock-file
:title: The lock file
question: "What does the file `uv.lock` record?"
options:
  - { text: "The code of every package that the project uses", explanation: "The code of a package is in the environment, in the directory `site-packages`. The lock file is a small text file. It holds names and numbers, not code." }
  - { text: "The commands that you typed in the terminal", explanation: "No file records your commands for `uv`. The lock file is about packages." }
  - { text: "The exact version of every package, so that every computer gets the same versions", correct: true }
explanation: "A **lock file** records the exact version of every package that a project uses, and of every package that those packages need. With it, every computer that installs the project gets the same versions. In this workshop you use pip and a requirements file, and you add one more package to it."
```

The second question is about the workshop **Installing packages**.
The spending tracker has a file with the name `requirements.txt`. It
holds one line:

```
rich
```

```{quiz}
:id: recap-requirements
:title: The file requirements.txt
question: "What does the command `python -m pip install -r requirements.txt` do?"
options:
  - { text: "It installs every package that the file `requirements.txt` names", correct: true }
  - { text: "It writes the file `requirements.txt`", explanation: "This command reads the file, and it does not change it. You write the file yourself, in the editor." }
  - { text: "It runs the program that the file names", explanation: "pip installs packages. It does not run programs. The file names packages, not programs." }
explanation: "A **requirements file** lists the packages that a project needs, one on each line. With `-r` and the name of the file, pip reads the file and installs every package that it names into the environment that is active. In this workshop the spending tracker needs one more package, and you add its name to this file."
```

The third question is about the workshop **Running a script**. The
spending tracker has a function `report_lines(ledger)`. A **ledger**
here is an object that holds a list of purchases. The function
returns the lines of the report as a list of strings, and another
function prints them.

```{quiz}
:id: recap-return
:title: Return the lines, or print them
question: "Why does `report_lines` return the lines, and not print them?"
options:
  - { text: "Because a function cannot call `print()`", explanation: "A function can call `print()`. Many functions do. The reason is about what the code that calls the function can do with the result." }
  - { text: "Because the code that calls it gets the lines, and can print them, write them to a file, or check that each line is correct", correct: true }
  - { text: "Because a list of strings uses less memory than printed text", explanation: "Memory is not the reason. Text that a function prints goes to the screen, and the code that called the function never gets it." }
explanation: "A function with a `return` line gives a value back to the code that called it. A function that only calls `print()` shows text to a person, and the code that called it gets `None`. Because `report_lines` returns its lines, other code can check them. In this workshop you write such code: a test that checks the lines of the report."
```

## What comes next

Go to the next page. There you see why programmers write tests.
