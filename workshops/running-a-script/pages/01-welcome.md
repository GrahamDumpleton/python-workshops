---
title: Welcome
requires: [quiz:recap-restart, quiz:recap-prompt, quiz:recap-import, verify:file-is-open]
---

# Running a script

In the workshop **Code in a file** you moved your classes from a
notebook into the file `spending.py`, and a notebook imported them. In
this workshop there is no notebook. You run the file itself as a
program, from the terminal. Most Python programs in the world are run
in this way.

You will learn:

- how to run a file of Python code with the command `python`

- why a program shows only what it prints

- how to give a program one function where it starts

- what the name `__name__` is

- why most Python programs end with the line
  `if __name__ == "__main__":`

At the start of this workshop, a click runs each command for you.
Later, you type the commands yourself.

The example is the spending of one person, Mariam, from January to
March 2026. You do not need the earlier workshops about her spending.
Each page says again what it uses.

The workshop takes about twenty-five minutes.

## The editor and the terminal

You work in two parts of the window in this workshop.

The **editor** is the part of JupyterLab in which you change a file.
It is the upper part, and it is empty now. When you change a file in
the editor, the change is not in the file on the disk yet. To **save**
a file means to write what the editor shows to the file on the disk.
To save, hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and press
`S`. While a file has changes that are not saved, its tab shows a dot
in place of the cross.

The **terminal** is a window in which you type commands for the
computer. It is the lower part. A **command** is one line that you
type in the terminal, which the computer runs when you press `Enter`.
The terminal shows a short text at the start of the line where you
type. This text is the **prompt**. It shows that the terminal is ready
for a command.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Code in a file**. A
notebook runs the line `import spending`, and uses the code of the
file `spending.py`. Then you change the file `spending.py` in the
editor, and you save it. You run the cell with `import spending`
again.

```{quiz}
:id: recap-restart
:title: A module that changed
question: "Which code does the notebook use now?"
options:
  - { text: "The new code, because the file was saved", explanation: "The file on the disk has the new code. But the notebook does not read the file again." }
  - { text: "The old code, until the kernel of the notebook is restarted", correct: true }
  - { text: "No code, because Python stops with an error", explanation: "Python shows no error message here. The second `import` does nothing, because the module was already read." }
explanation: "A **module** is a file of Python code. Python reads a module one time only. A second `import` of the same module does nothing. So the notebook keeps the old code until you restart its kernel. In this workshop you will see that a program that you run from the terminal does not have this problem."
```

The second question is about the workshop **Python in the terminal**.
When you type the command `python` with nothing after it, Python
shows the `>>>` prompt and runs each line as you enter it. You type
`price = 4` at the `>>>` prompt. Then you leave Python with `exit()`,
and you start it again with the command `python`.

```{quiz}
:id: recap-prompt
:title: Names at the >>> prompt
question: "You type `price` at the new `>>>` prompt. What does Python show?"
options:
  - { text: "`4`", explanation: "The name `price` existed only while the first `python` was running. When that program ended, all its names were lost." }
  - { text: "A `NameError`, because the name `price` does not exist", correct: true }
  - { text: "Nothing", explanation: "The `>>>` prompt shows the value of every expression that you type. For a name that does not exist, it shows an error message." }
explanation: "Each time the command `python` starts, it starts with no names from the last time. Code that you want to keep must be in a file. This workshop shows how to run such a file."
```

The third question is about the workshop **The batteries included**.

```{quiz}
:id: recap-import
:title: A name from a module
question: "The module `math` has a function `sqrt`. Which line lets you call it as `sqrt(16)`, with no `math.` before it?"
options:
  - { text: "`import math`", explanation: "After `import math`, you write the name of the module, a dot, and the name of the function: `math.sqrt(16)`." }
  - { text: "`from math import sqrt`", correct: true }
  - { text: "`import sqrt`", explanation: "`import` needs the name of a module. `sqrt` is a function inside the module `math`. It is not a module." }
explanation: "`import math` gives you the module, and you reach its names with a dot: `math.sqrt(16)`. `from math import sqrt` gives you the one name `sqrt`. Both forms read the module `math` first. On the last pages of this workshop, you import your own file in the same way."
```

## Open the file

Your workspace holds two files:

- `spending.csv` holds the 37 purchases of Mariam. Each line has a
  date, a description, an amount and a category, with commas between
  them. For example: `2026-01-03,Bread and milk,6.40,food`.

- `spending.py` holds the code from the workshop **Code in a file**.

Click the action below to open `spending.py` in the editor.

```{attempt}
:id: file-not-open
:check: file-is-open
:expect: The file spending.py is not open yet
```

```{file-open}
:id: open-spending
:title: Open spending.py in the editor
:path: spending.py
```

```{verify}
:id: file-is-open
:label: The file spending.py is open in the editor
:substrate: ui
:trigger: after:open-spending
:message: The file spending.py is not open yet. Click the action above to open it in the editor.
file-open spending.py
```

Read the file from the top to the bottom. You do not need to
understand every line. The file has three parts:

| Part | What it is |
|------|------------|
| `class Purchase` | A class that describes one purchase. An object of this class has the attributes `date`, `description`, `amount` and `category`. Its method `month()` returns the month of the purchase, such as `"2026-01"`. |
| `class Ledger` | A class that holds a list of purchases, in the attribute `purchases`. Its methods return the total of all the amounts, the total for each category, the total for each month, and the largest purchase. |
| `def read_ledger(filename):` | A function that reads a CSV file, and returns a `Ledger` that holds one `Purchase` for each line of the file. |

A ledger is a book in which a shop or a person writes down every
payment. On the next page, you run this file.
