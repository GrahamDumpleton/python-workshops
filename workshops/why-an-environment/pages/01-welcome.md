---
title: Welcome
requires: [quiz:recap-traceback, quiz:recap-installed, quiz:recap-which]
---

# Why an environment

This is the first workshop of the set **Working like a Python
developer**. You can already write a program in several files, run it
in a terminal, and find its bugs. In this set you learn the tools that
programmers use around their code: tools that install code which
other people wrote, and tools that test code.

The first of these tools is the virtual environment. Before you learn
the tool, this workshop shows you the problem that it solves. When
you have seen the problem yourself, the tool is much easier to
understand.

You will learn:

- what it means that every project on a computer shares one Python

- where a Python keeps the code that was installed for it

- how to install one particular version of a package

- how an install for one project can break another project, although
  nobody changed that other project

- what each project needs so that this cannot happen

This workshop uses two very small programs about colours. It does not
use the spending tracker, so that you can look at the problem and at
nothing else.

In this workshop you type most commands yourself. Each step says
exactly what to type. A command that is new is run by a click the
first time. You predict what a command will do before you run it,
and then you look at what really happened. Each step has help that
you can open if you need it.

The workshop takes about twenty-five minutes.

## What this workshop needs

This workshop installs code from the internet, so the computer that
runs JupyterLab must have a connection to the internet.

Everything that this workshop installs goes into one directory inside
the files of this workshop. Nothing else on the computer changes.

## What you see

The window has two parts beside this panel:

- At the bottom is the **terminal**, a window in which you type
  commands for the computer. A **command** is one line that you type
  in the terminal. The computer runs it when you press `Enter`.

- Above the terminal is the place for the **editor**, the part of
  JupyterLab in which you look at a file and change it. It is empty
  until you open a file, so at first the terminal fills the whole
  space.

Two more words are used on every page. The **shell** is the program
inside the terminal that reads each command and runs it. The
**prompt** is the short text that shows that the shell is ready for a
command. You type each command after the prompt.

The files of this workshop are in one **directory**, which is a place
that holds files and other directories. ("Folder" is another word for
it.) The terminal is in this directory when the workshop starts.
These pages call it your work directory.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Finding the bug**. A
program in several files stops with an error message. The error
message is long, and it names three files.

```{quiz}
:id: recap-traceback
:title: A long error message
question: "Which line of the error message do you read first?"
options:
  - { text: "The first line, which begins with the word `Traceback`", explanation: "The first line is the same in every error message of this kind. It does not say what went wrong." }
  - { text: "The last line", correct: true }
  - { text: "The first line that names a file of your own", explanation: "The lines that name files say where Python was. They are useful after you know what went wrong, and the last line says that." }
explanation: "A **traceback** is the text that Python shows when a program stops with an error. Its last line names the type of the error, such as `AttributeError`, and says what went wrong. The lines above it say where Python was, and you read them from the bottom upward. You read several tracebacks in this workshop, and each time the last line is enough."
```

The second question is about the workshop **Where imports come
from**.

```{quiz}
:id: recap-installed
:title: Code that was installed
question: "Some Python code does not come with Python. It is installed later. In which directory does Python keep installed code?"
options:
  - { text: "In the directory `site-packages`", correct: true }
  - { text: "In the directory of the script that you run", explanation: "The directory of the script holds your own modules. Installed code is kept apart from them, in a directory that every script of that Python can use." }
  - { text: "In the directory of the standard library, beside `random.py`", explanation: "The directory of the standard library holds only the modules that come with Python. Installed code has a directory of its own." }
explanation: "A **module** is a file of Python code. When Python reads an `import` line, it searches a list of directories for the module, in order. One of these directories has the name `site-packages`, and it holds the code that was installed later. To install code for Python means to copy its files into `site-packages`. This whole workshop is about that one directory."
```

The third question is about the workshop **Python in the terminal**.

```{quiz}
:id: recap-which
:title: The word python in a command
question: "A command begins with the word `python`, for example `python hello.py`. What is `python` in this command?"
options:
  - { text: "The name of a file of Python code that you wrote", explanation: "The file of your code is `hello.py`, the second part of the command. The first part names the program that runs it." }
  - { text: "A word that the terminal needs before the name of every file", explanation: "The terminal does not need a fixed word. The first part of a command is the name of the program to run." }
  - { text: "The name of a program, which the computer finds and runs", correct: true }
explanation: "The **interpreter** is the program named `python`, which runs Python code. It is a file on the computer, in the same way as other programs. A computer can hold more than one Python, each in a file of its own, and a command runs one of them. Remember this. On the next page you make a second Python, and you choose which one a command runs."
```

When you have answered the three questions, go to the next page.
