---
title: Why a notebook?
requires: [quiz:why-a-notebook]
---

# Why a notebook?

You have now seen a notebook do its job: code goes in, and the result
appears. Before you continue, it is useful to know where notebooks
come from, and why this course uses one. This page has no code.

## Jupyter notebooks

The full name of the document in the work area is a **Jupyter
notebook**. Jupyter is a project that makes free tools for working
with code and data.

The program that you are using now is one of those tools. It is called
**JupyterLab**. JupyterLab shows your notebook, and it also shows
these workshop pages beside it.

Jupyter notebooks are very popular with people who use Python for
data science, for scientific research and for machine learning. A
notebook lets them keep their code, their results, their charts and
their notes together in one document, and share that document with
other people. If you work in one of those fields later, you will
probably use notebooks every day.

## Not the only way to use Python

A notebook is one way to use Python. It is not the only way, and it is
not the most common way.

Most Python programs are not written in notebooks. A programmer
usually writes the code of a program as text in a file. To run the
program, the programmer types a command in a program called a
**terminal**. A terminal is a window where you control the computer by
typing commands, and not by clicking. This way of working is called
the **command line**.

Python can also be used directly in a terminal, without a file. You
type one line of code, Python performs it and shows the result, and
then you type the next line. Programmers do this often, to try a small
piece of code quickly.

## Why this course starts with a notebook

For the first steps of learning, a notebook is more convenient than
the command line.

- There is nothing to prepare. You do not need to learn how a terminal
  works before you can write your first line of Python.

- Your code and its result stay together on the screen, so you can
  look back at what you did.

- You can change your code and run it again as many times as you like.

- The workshop can add code to your notebook, and can check your work
  there.

So the notebook is a convenience for this stage of your learning. It
lets you put all your attention on Python itself.

## What happens later in the course

When you do more programming, you will probably use files and the
command line more than notebooks. This course prepares you for that.

The first parts of the course use a notebook. A later part of the
course moves your code from the notebook into files. In that part, you
learn to use a terminal, to use Python directly at the command line,
and to run a program that is saved in a file.

Nothing that you learn in the notebook is lost when you move. The
Python language is exactly the same in a notebook, in a terminal and
in a file. Only the place where you type it is different.

```{quiz}
:id: why-a-notebook
:title: Why a notebook?
question: Why does this course start in a notebook?
options:
  - { text: "Because Python code only works in a notebook", explanation: "Python works in many places. Most Python programs are written in files and run from the command line." }
  - { text: "Because a notebook is a convenient place to learn the first steps", correct: true }
  - { text: "Because all Python programmers write their programs in notebooks", explanation: "Notebooks are popular in data science, science and machine learning. But most programs are written in files." }
explanation: "A notebook keeps your code and its result together, and needs no preparation. Later in the course, you also learn to use Python from files and the command line."
```
