---
title: The notebook
requires: [verify:first-cell-ran]
---

# The notebook

The document in the work area is a **notebook**. A notebook is a
document where you write code and see the result directly under it.

**Code** is a set of instructions for a computer, written in a
programming language. In this course, the language is Python.

## Cells

A notebook is made of **cells**. A cell is a box in the notebook. Some
cells hold text for people to read, like the title at the top of your
notebook. Other cells hold code.

To **run** a cell means to send its code to Python. Python follows the
instructions in the code, and sends back the result. The notebook
shows the result under the cell. The result is called the **output**
of the cell.

You can think of a cell as a question that you send to Python, and the
output as the answer.

## See a cell run

The action below adds a new cell to your notebook, and runs it for
you. The cell holds one line of code, which asks Python to add two
numbers. Click the action, and watch the notebook.

```{attempt}
:id: first-cell-not-run
:check: first-cell-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-first-cell
:title: Add a cell that asks Python for 2 + 3, and run it
:path: {{ notebook }}
:tags: [first-cell]
:run: true
2 + 3
```

Look at the new cell in the notebook. There are three things to see:

- The code `2 + 3` is inside the cell.

- The output `5` is under the cell. Python calculated it.

- A number in square brackets, such as `[1]`, is at the left of the
  cell. This number counts the cells that have run. The first cell
  that runs gets `[1]`, the next gets `[2]`, and so on.

You do not need to understand the code yet. The important idea is the
pattern: code goes into a cell, the cell runs, and the output appears
under it. The first parts of this course use this pattern on every
page. The next page explains why.

```{verify}
:id: first-cell-ran
:label: The cell ran and gave the output 5
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed first-cell
if 5 in Out.values():
    print("The cell ran, and Python calculated 5.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
5 in Out.values()
```
