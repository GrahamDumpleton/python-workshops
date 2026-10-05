---
title: Welcome
requires: [quiz:recap-formatter, quiz:recap-name, quiz:recap-stop]
---

# Your own project

This is the last workshop of the course. In it, you build a complete
program of your own. You choose the program from four short
descriptions. Nobody gives you the code: you make the file, you write
the code, and you run it.

This workshop is part of the set **Working like a Python developer**.
You work in two places. The **terminal** is a window in which you type
commands for the computer. A **command** is one line that you type in
the terminal, which the computer runs when you press `Enter`. The
**editor** is the part of JupyterLab in which you change a file. To
**save** a file means to write what the editor shows to the file on
the disk.

You will:

- choose one of four programs: a file organiser, a log analyser, a
  password checker or a flashcard drill

- read a description that says exactly what the program must do

- build the program in two parts, and check each part

- learn where to go next, and how to install Python on your own
  computer

Each part has a check that runs your program and says what is wrong.
Each part also has two hints, and a solution that opens after you
have clicked `Check` one time. Try without the solution first. You
learn the most when you find the answer yourself.

The program uses only Python and the modules that come with it, so
you install nothing. The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **A proper project**. In that
workshop you used the tool `ruff` in two ways. A **linter** is a tool
that reads your code and reports lines that are probably mistakes. A
**formatter** is a tool that changes the layout of your code, such as
spaces and line breaks, so that it is the same everywhere. It does
not change what the code does.

```{quiz}
:id: recap-formatter
:title: The linter and the formatter
question: "Which command is the formatter, which changes the layout of your code?"
options:
  - { text: "`ruff check`", explanation: "That is the linter. It reports lines that are probably mistakes, and it does not change your file." }
  - { text: "`python -m pip install -e .`", explanation: "That command installs the project into its environment. It does not change the layout of the code." }
  - { text: "`ruff format`", correct: true }
explanation: "`ruff format` rewrites your files with the same layout everywhere, and `ruff check` reports probable mistakes. Programmers run both before they share their code. Your program in this workshop is small, but it is good practice to keep it tidy."
```

The second question is about the workshop **Running a script**. A
**script** is a file of Python code that you run as a program. The
file `tools.py` ends with these two lines:

```python
if __name__ == "__main__":
    main()
```

Another file, `test_tools.py`, has the line `import tools`. You run
`python test_tools.py` in the terminal.

```{quiz}
:id: recap-name
:title: When main runs
question: "Does the function `main` of `tools.py` run when `test_tools.py` imports it?"
options:
  - { text: "Yes, because Python runs every line of a module when it imports it", explanation: "Python does run every line. But the line `main()` is inside an `if`, and the test of that `if` is false here." }
  - { text: "No, because `__name__` is `\"tools\"` in an imported module, and not `\"__main__\"`", correct: true }
  - { text: "No, because a file that is imported cannot have functions", explanation: "An imported file can have functions. That is the reason to import it: the other file uses those functions." }
explanation: "Python gives the name `__name__` the value `\"__main__\"` only in the file that you run. In a module that is imported, `__name__` is the name of the module. So the line `main()` runs when you run `python tools.py`, and it does not run when another file imports `tools`. One of the four programs in this workshop needs this."
```

The third question is about the workshop **Files, editors and
terminals**. A program in the terminal waits for you to type an
answer, and you want to stop it.

```{quiz}
:id: recap-stop
:title: How to stop a program
question: "How do you stop a program that runs in the terminal?"
options:
  - { text: "Click in the terminal, hold `Ctrl` and press `C`", correct: true }
  - { text: "Close the editor tab of the program", explanation: "The editor shows the file. The program runs in the terminal, and it does not stop when you close the file." }
  - { text: "Type `exit()` in the terminal", explanation: "`exit()` leaves the `>>>` prompt of Python. A program that you started with `python` and the name of a file stops with `Ctrl` and `C`." }
explanation: "`Ctrl` and `C` stop the program that runs in the terminal. Python shows some lines of a traceback, which end with `KeyboardInterrupt`, and then the shell is ready for the next command. Remember this: while you build a program, it can wait for ever or repeat for ever because of a mistake."
```

On the next page you choose your program.
