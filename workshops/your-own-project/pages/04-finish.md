---
title: What you have learned
---

# What you have learned

You have built a complete program of your own. Nobody gave you the
code. You had a description of what the program must do, and you
made the file, wrote the code, ran it in the terminal and made it
correct.

```{when} track == "file-organiser"
Your program, `organise.py`, sorts the files of any directory into
directories by their type. It shows its plan first, and it moves the
files only with the option `--move`. You used `Path` from the module
`pathlib` to list a directory, to read the ending of each file name,
to make directories and to move files.
```

```{when} track == "log-analyser"
Your program, `analyse.py`, reads the log of a web server of any
length and reports the number of requests, the three busiest hours,
the three pages that people asked for the most, and the errors. You
used `.split()` to divide each line into its fields, and `Counter` to
count the hours, the pages and the statuses.
```

```{when} track == "password-checker"
Your program, `checker.py`, gives a password a score against five
rules and says which rules it breaks. Your tests, in
`test_checker.py`, check the function `problems()`, and they found
four bugs that the check planted. You used the string methods
`.islower()`, `.isupper()` and `.isdigit()`, and `assert`.
```

```{when} track == "flashcard-drill"
Your program, `drill.py`, asks the questions of any file of cards, and
asks the wrong ones again until every answer is right. You used
`input()` to ask, a `while` loop for the rounds, and a list of the
cards that got a wrong answer.
```

## The ideas

- A program starts from a description: what it is called, how it is
  run, what it reads and what it shows. A clear description, with an
  example, saves much work later.

- A program is built in small steps. After each step you save the
  file, run the program and read what it shows.

- An error message is read from its last line first. It names the
  type of the error, and the lines above it name the file and the
  line.

- A program that reads its data from the command line, and not from a
  name written in the code, works on any data. The checks proved this:
  they ran your program on data of their own.

- The code that does the work is in functions, and the code that reads
  the command line is in `main()`, which runs only under
  `if __name__ == "__main__":`. Then other code, such as tests, can
  import the module and use its functions.

## The course is complete

This was the last workshop. You started with one line of Python in a
notebook. You can now:

- write Python with values, names, lists, dictionaries, loops,
  functions and classes

- read and write files, and handle the errors that come from data

- write a program in files, run it in the terminal with command line
  arguments, and divide it into modules and packages

- find a bug with the traceback, with `print()` and with the debugger

- make a virtual environment, install packages into it with pip or uv,
  and record what a project needs

- test your code

## Where to go next

**Python on your own computer.** These workshops ran on a computer
that was ready for you. To write programs on your own computer:

1. Install Python from
   [python.org](https://www.python.org/downloads/). The Python
   documentation has a part,
   [Python Setup and Usage](https://docs.python.org/3/using/index.html),
   that describes how to install it on each kind of computer.

2. Open a terminal, and run `python --version`. On some computers the
   command has the name `python3` and not `python`. If
   `python --version` gives an error, try `python3 --version`.

3. Make a directory for each project, and a virtual environment in it
   with `python -m venv .venv`, as you did in the workshop **An
   environment of your own**. Activate it, and install the packages
   that the project needs into it. On Windows a few commands are
   different. The
   [documentation of venv](https://docs.python.org/3/library/venv.html#how-venvs-work)
   shows them.

4. Use an editor that you like. JupyterLab, which you used in these
   workshops, is one.

**These workshops on your own computer.** The page of the course on
GitHub explains how to run all of these workshops on your own
computer, under
["Run locally"](https://github.com/GrahamDumpleton/python-workshops#run-locally).
Then you can do them again, or choose another of the four programs on
the page **Choose your project**.

**More Python.** The
[Python tutorial](https://docs.python.org/3/tutorial/index.html)
covers what these workshops covered, in more detail, and some ideas
that they did not cover. Read it from the start: you know most of its
first nine chapters already. The
[library reference](https://docs.python.org/3/library/index.html)
describes every module that comes with Python. Both are written for
people who already program, and you are now one of them.

**A project of your own.** The best next step is a program that you
want for yourself. Think of a small task that you do by hand on a
computer, and write a program that does it. Start small, and add one
part at a time, as you did here.

Click `Finish` at the bottom of this panel.
