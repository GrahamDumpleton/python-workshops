---
title: Welcome
requires: [quiz:recap-option, quiz:recap-name, quiz:recap-from-import, verify:program-open]
---

# Splitting into modules

In the workshop **Taking arguments**, the spending tracker became a
program that you run in the **terminal**, which is the window in
which you type commands for the computer. The program reads the
purchases of Mariam from a file, and it shows a report for one month
or for one category.

All the code of that program is in one file, `spending.py`. The file
has about one hundred lines, and it does four different things. In
this workshop, you split it into four smaller files.

You will learn:

- why programmers split a long program into several files

- how to make a new file yourself, in the file browser

- how one of your files uses the code of another of your files, with
  `import`

- that each file imports the names that it uses itself

- what Python shows when an import is missing or wrong, and how to
  repair it

This workshop is different from most of the earlier ones. The pages
do not make the files for you, and they do not move the code for you.
Each page gives you a goal and says exactly what the result must be.
You do the work. Each part has a check, hints, and a solution that
you can open if you need it.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Taking arguments**. Read
this command:

```
python spending.py spending.csv --month 2026-02
```

```{quiz}
:id: recap-option
:title: The parts of a command
question: "Which part of this command is an option?"
options:
  - { text: "`spending.py`", explanation: "That is the name of the file that holds the program. Python reads this file and runs it." }
  - { text: "`--month`", correct: true }
  - { text: "`spending.csv`", explanation: "That is a command line argument, but it is not an option. An option begins with `--`." }
explanation: "A **command** is one line that you type in the terminal. The computer runs it when you press `Enter`. A **command line argument** is a word after the name of the program in a command. This command has three: `spending.csv`, `--month` and `2026-02`. An **option** is a command line argument that begins with `--`. Here the option is `--month`, and `2026-02` is the value that belongs to it. The program can run without an option."
```

The second question is about the workshop **Running a script**. A
file with the name `greet.py` holds one line:

```python
print(__name__)
```

You run the file with the command `python greet.py`.

```{quiz}
:id: recap-name
:title: The name of the file that you run
question: "What does the terminal show?"
options:
  - { text: "`greet`", explanation: "That is what the line shows when another file imports `greet.py`. Here you run the file itself." }
  - { text: "`greet.py`", explanation: "`__name__` never holds the `.py` at the end of the name of the file." }
  - { text: "`__main__`", correct: true }
explanation: "Python gives every file of code a name with two underscores on each side, `__name__`. In the file that you run with `python`, its value is the string `__main__`. In a file that another file imports, its value is the name of the file without `.py`. This is why a program ends with the lines `if __name__ == \"__main__\":` and `main()`. The function `main` then runs only when you run the file itself."
```

The third question is about the workshop **The batteries included**.
A new file holds these two lines, and nothing else:

```python
from math import sqrt
print(sqrt(16))
```

```{quiz}
:id: recap-from-import
:title: Importing one name
question: "Someone changes the second line to `print(math.sqrt(16))`. What happens when the file runs?"
options:
  - { text: "Python stops with a `NameError`", correct: true }
  - { text: "It shows `4.0`, as before", explanation: "The line `from math import sqrt` makes only the name `sqrt`. It does not make the name `math`, so Python does not know what `math` is." }
  - { text: "It shows `16`", explanation: "`sqrt(16)` gives the square root of 16, which is `4.0`. But the new line cannot run, because the name `math` does not exist in this file." }
explanation: "A **module** is a file of Python code. The line `from math import sqrt` takes one name, `sqrt`, from the module `math`, and makes it ready to use in this file. It does not make the name `math`. A `NameError` is the error that Python shows when code uses a name that does not exist. In this workshop you write lines of this form for your own modules."
```

## Open the program

The file `spending.py` is ready for you. The first action below opens
it in the **editor**, which is the part of JupyterLab in which you
change a file. The second action shows the files of this workshop in
the **file browser**, which is the list of files at the left side of
the window.

```{attempt}
:id: program-not-open
:check: program-open
:expect: The file spending.py is not open yet
```

```{file-open}
:id: open-program
:title: Open spending.py in the editor
:path: spending.py
```

```{file-browser-reveal}
:id: show-files
:title: Show the files of this workshop in the file browser
:path: spending.py
```

```{verify}
:id: program-open
:label: The file spending.py is open
:substrate: ui
:trigger: after:open-program
:message: The file spending.py is not open yet. Click the action above that opens spending.py in the editor.
file-open spending.py
```

The file browser now shows two files: `spending.py`, which holds the
program, and `spending.csv`, which holds the 37 purchases of Mariam.
Do not change these two files in this workshop. You only read
`spending.py`, and copy code from it.
