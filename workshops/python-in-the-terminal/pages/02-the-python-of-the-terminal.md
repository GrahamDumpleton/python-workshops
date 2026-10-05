---
title: The Python of the terminal
requires: [quiz:version, quiz:which-python]
---

# The Python of the terminal

In a notebook, you wrote Python code in a cell, and the code ran. You
did not see what ran it. A program ran it, and that program has a
name.

The **interpreter** is the program named `python`, which runs Python
code. It reads your code and does what the code says. The notebook
started an interpreter for you and kept it out of sight.

In the terminal, nothing is out of sight. You start the interpreter
yourself, with a command that begins with the word `python`. Outside
a notebook, this is how every Python program is run, so it is the
first thing to learn.

## Ask for the version

The first command asks the interpreter for its version:

```
python --version
```

The command has two parts. The first part, `python`, is the name of
the program to run. The second part, `--version`, tells the program
what to do: show its version and then end.

Click the action below. It types the command in the terminal and
presses `Enter` for you.

```{execute}
:id: show-version
:title: Run the command python --version
:wait: prompt
python --version
```

Look at the terminal. Under the command there is one new line. Under
that line, the shell shows its prompt again, because the program has
ended.

```{quiz}
:id: version
:title: The version of Python
:type: text
:case: false
question: "What does the terminal show under the command `python --version`? Type the whole line."
answer:
  - { pattern: "Python\\s+3\\.\\d+\\.\\d+\\S*", example: "Python 3.14.5" }
wrong:
  - { pattern: "3\\.\\d+(\\.\\d+)?\\S*", explanation: "That is the number. The line in the terminal begins with the word `Python`. Type the whole line." }
  - { pattern: "python\\s+--version", explanation: "That is the command. The answer is the line that the terminal shows under the command." }
otherwise: "Look at the line under the command in the terminal. It begins with the word `Python`, and then there are three numbers with dots between them."
explanation: "The line is the word `Python` and the version of the interpreter. The first two numbers are `3` and `14`, so this is Python 3.14, the Python that these workshops use. The third number counts small corrections, and it can differ from one computer to another."
```

## One particular Python

A computer can hold more than one Python. For example, it can hold an
older version and a newer version. Each of them is a program of its
own, in a file of its own.

When you type `python`, the shell looks for a program with that name,
and runs the one that it finds. So the terminal runs one particular
Python, and it is the same one each time.

You can ask the shell which one. The command `which` shows where the
shell finds a program. It shows a **path**: the text that says where
a file is.

```
which python
```

Click the action below to run the command.

```{execute}
:id: show-which
:title: Run the command which python
:wait: prompt
which python
```

The terminal shows one line. This page cannot show you that line,
because it is different on each computer. A **directory** is a place
that holds files and other directories. On every computer, the line
names directories, with `/` between them, and it ends with `/python`.
The last part, `python`, is the file that holds the interpreter.

```{quiz}
:id: which-python
:title: What which shows
question: "What does the line under the command `which python` tell you?"
options:
  - { text: "The version of the interpreter", explanation: "The version is what `python --version` shows. The command `which python` shows a path." }
  - { text: "Where the file of the program `python` is", correct: true }
  - { text: "The Python code that ran last", explanation: "The shell does not keep your Python code. The command `which python` shows where a program is." }
explanation: "The line is the path of the file that the shell runs when you type `python`. Every command in this terminal that begins with `python` runs this one program. In the later workshops of this course, you learn how each of your projects can have a Python of its own."
```

You now know which program runs your code. On the next page you start
it and type Python.
