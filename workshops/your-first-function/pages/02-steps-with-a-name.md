---
title: Steps with a name
requires: [quiz:predict-define, verify:hours-defined]
---

# Steps with a name

A **function** is a group of lines of code that has a name. When you
use the name, Python runs the lines.

You have used functions already. `print()` is a function, and `len()`
is a function. Other people wrote them, and you used them by name. Now
you write your own.

## Why functions exist

There are two reasons.

The first reason is that you write the steps once and use them many
times. Imagine a program for a library that shows the opening hours in
five places. With no function, you write the same lines five times.
When the hours change, you must find all five places and change each
one. With a function, the lines are in one place, and you change them
once.

The second reason is that the name says what the steps do. A long
program that is made of names such as `show_opening_hours` is easier
to read than a long program that is made of hundreds of separate
lines.

Think of a recipe. A recipe has a name, such as "tomato soup", and a
list of steps. You write the recipe one time. After that, every time
you want soup, you find the recipe by its name and follow the steps.

One more thing about a recipe is important here. When you write a
recipe, you do not make any soup. You only record the steps, so that
you can follow them later.

## How to write a function

To **define** a function means to write it: you give Python the name
and the lines. Look at this cell. Do not run it yet.

```python
def show_opening_hours():
    print("The library opens at 09:00.")
    print("The library closes at 18:00.")
```

The first line has four parts:

1. The word `def`. It is short for "define", and it tells Python that
   a function begins here.

2. The name of the function, `show_opening_hours`. You choose the
   name. The rules are the same as for every other name: small
   letters, with underscores between the words.

3. A pair of parentheses, `()`. They are empty here. A later page
   shows what can go between them.

4. A colon, `:`.

The lines under the first line are the **body** of the function. The
body is the group of lines that Python runs when you use the function.
Each line of the body begins with four spaces, in the same way as the
lines of the block of an `if` or of a `for` loop. The spaces tell
Python which lines belong to the function.

Before you run the cell, think about the recipe. Then answer the
question.

```{quiz}
:id: predict-define
:title: Predict the output
question: What does the notebook show under this cell when it runs?
options:
  - { text: "The two lines about the library", explanation: "The cell only defines the function. Python records the two lines of the body, but it does not run them yet. It is the same as with a recipe: when you write the recipe, you do not make any soup." }
  - { text: "Nothing", correct: true }
  - { text: "An error message", explanation: "The cell is correct, so Python shows no error message. It also shows no other output, because the cell only defines the function." }
explanation: "A cell that only defines a function shows nothing. Python records the lines of the body under the name of the function, and it does not run them yet."
```

Click the action below. It adds the cell to your notebook and runs it.
Look under the cell: there is no output.

```{attempt}
:id: hours-not-defined
:check: hours-defined
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-define-hours
:title: Add a cell that defines the function show_opening_hours, and run it
:path: {{ notebook }}
:tags: [define-hours]
:run: true
def show_opening_hours():
    print("The library opens at 09:00.")
    print("The library closes at 18:00.")
```

```{verify}
:id: hours-defined
:label: Python knows the function show_opening_hours
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed define-hours
if callable(globals().get("show_opening_hours")):
    print("The cell ran. Python now knows a function with the name show_opening_hours.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
callable(globals().get("show_opening_hours"))
```

## What happened

Python read the three lines. It recorded the two lines of the body,
and it made the name `show_opening_hours` refer to them. Python did
not run the body, so the cell shows no output.

The function now exists. On the next page, you use it.
