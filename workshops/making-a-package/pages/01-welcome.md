---
title: Welcome
requires: [quiz:recap-search, quiz:recap-own-imports, quiz:recap-name, quiz:first-line]
---

# Making a package

The spending tracker is now four files of Python code. In this
workshop you put them together in one place with one name, so that
the program is one thing and not four loose files.

You do the work yourself in this workshop. You type the commands, you
make the files, and you change the code. Each task says exactly what
to do. Each task also has hints, and a solution that you can open if
you need it.

You will learn:

- what a package is, and why a program needs one

- how to make a directory and move files into it, with two new
  commands

- how a module inside a package imports the other modules of the same
  package

- why a file inside a package cannot always be run by its path

- how to run a whole package by its name, with one command

- how another program uses your package

The example is the spending of one person, Mariam. The file
`spending.csv` holds her 37 purchases from January to March 2026, and
the program shows a report about them. You do not need the earlier
workshops about this program. Each page says again what it uses.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Where imports come from**.
A file with the name `shop.py` holds the line `import prices`. You run
the file with the command `python shop.py`.

```{quiz}
:id: recap-search
:title: Where Python looks for a module
question: "Where does Python look first for the module `prices`?"
options:
  - { text: "In every directory of the computer", explanation: "Python does not search the whole computer. It looks only in the directories of one list, in order." }
  - { text: "In the directory that holds the file `shop.py`", correct: true }
  - { text: "In the directory `site-packages`", explanation: "Python does look in `site-packages`, but later. That directory is near the end of the list." }
explanation: "When a line says `import prices`, Python looks for a file `prices.py` in the directories of the list `sys.path`, in order. When you run a file with `python shop.py`, the first directory of that list is the directory that holds `shop.py`. After it come the directories of the standard library, and then `site-packages`. This order matters in this workshop."
```

The second question is about the workshop **Splitting into modules**.
A **module** is a file of Python code. A program has two modules. The
module `main.py` begins with these two lines:

```python
from decimal import Decimal
from storage import read_ledger
```

The module `storage.py` defines the function `read_ledger`. The
function uses `Decimal`, but the file `storage.py` has no line that
imports `Decimal`.

```{quiz}
:id: recap-own-imports
:title: What a module must import
question: "The program calls `read_ledger`. What happens?"
options:
  - { text: "Python stops with a `NameError`, because `storage.py` does not import `Decimal`", correct: true }
  - { text: "The function works, because `main.py` imports `Decimal`", explanation: "An import gives a name to the module that holds the import line, and to no other module. The name `Decimal` exists in `main.py` only." }
  - { text: "The function works, because every module can use `Decimal` with no import", explanation: "`Decimal` is in the module `decimal` of the standard library. A module can use it only after it imports it." }
explanation: "Each module imports what it uses. The names that `main.py` imports exist in `main.py` only. The function `read_ledger` runs with the names of `storage.py`, and that file has no name `Decimal`, so Python stops with a `NameError`."
```

The third question is about the workshop **Running a script**. A
**script** is a file of Python code that you run as a program. A file
`report.py` ends with these two lines:

```python
if __name__ == "__main__":
    main()
```

```{quiz}
:id: recap-name
:title: The name of a module that runs as a program
question: "When does the line `main()` run?"
options:
  - { text: "When another file imports the module, with `import report`", explanation: "When a file is imported, Python sets `__name__` to the name of the module, here `\"report\"`. The comparison is `False`, so `main()` does not run." }
  - { text: "Every time that Python reads the file", explanation: "The `if` line makes a difference. The line `main()` runs only when the comparison is `True`." }
  - { text: "When you run the file as a program, with `python report.py`", correct: true }
explanation: "Python gives every module the name `__name__`. When you run a file as a program, `__name__` is the string `\"__main__\"`. When another file imports it, `__name__` is the name of the module. So these two lines mean: call `main()` only when this file is the program that was started."
```

## The program as it is now

The window has two parts beside this page. The lower part is the
**terminal**: a window in which you type commands for the computer. A
**command** is one line that you type in the terminal. The computer
runs it when you press `Enter`. The upper part is for the editor, and
it is empty until you open a file.

The terminal is in your work directory. A **directory** is a place
that holds files and other directories. Your work directory holds the
files of this workshop.

Click in the terminal. Type this command, and press `Enter`:

```
ls
```

The command `ls` shows the names of the files in the directory. You
see five names:

```
main.py  models.py  report.py  spending.csv  storage.py
```

The four files that end with `.py` are the four modules of the
program:

| Module | What it holds |
|------|------|
| `models.py` | the classes `Purchase` and `Ledger` |
| `storage.py` | the function `read_ledger`, which reads the purchases from a CSV file |
| `report.py` | the function `report_lines`, which makes the lines of the report |
| `main.py` | the function `main`, which reads the command and shows the report |

Now run the program. Type this command in the terminal, and press
`Enter`:

```
python main.py spending.csv
```

The program shows a report of 17 lines.

```{quiz}
:id: first-line
:type: text
:case: false
question: "What is the first line of the report in the terminal? Type the whole line."
answer:
  - { pattern: "Purchases:\\s*37", example: "Purchases: 37" }
wrong:
  - { text: "37", explanation: "That is the number. The line also has a word before the number. Type the whole line." }
  - { pattern: "Total:.*", explanation: "That is the second line of the report. The first line is above it, directly under the command." }
otherwise: "Look at the line directly under the command `python main.py spending.csv` in the terminal. It begins with the word `Purchases`."
explanation: "The program read 37 purchases from the file `spending.csv`. The program works. In this workshop you do not change what it does. You change where its files are, and how it is started."
```
