---
title: Why a file
requires: [quiz:module-name, verify:file-shown]
---

# Why a file

The code of the spending tracker works. But it lives in the cells of
one notebook, and that limits what you can do with it.

## The problem

Think about what happens next week. You start a second notebook, to
look at the spending of February only. That notebook needs the class
`Purchase`, the class `Ledger` and the function `read_ledger`.

A notebook cannot use the cells of another notebook. So you copy the
four cells into the second notebook. Now the same code exists in two
places. Later you find a mistake in the method `total()`, and you
correct it in one notebook. The other notebook still has the mistake.
With every new notebook, there is one more copy to correct.

A program that runs in the terminal has the same problem. It cannot
use the cells of a notebook.

## The answer

The answer is to keep the code in one place that every notebook and
every program can use. That place is a file of Python code.

A **module** is a file of Python code. In the workshop **The batteries
included** you used modules that other people wrote, such as `math`
and `csv`. Each of them is a file of Python code that came with
Python. You can write a module yourself, in the same way. It is a text
file, and its name ends with `.py`.

Think of a recipe that you wrote on a page of your own notebook. Only
a person who has your notebook can cook from it. Now write the recipe
on a card and put the card in a box in the kitchen. Everybody who
cooks in that kitchen can take the card and use it. When you correct
the recipe on the card, it is correct for everybody. A module is the
card.

You already know how to use a module: with `import`. A module of your
own is used in the same way. The name of the module is the name of
the file without `.py`. So a file with the name `spending.py` is the
module `spending`, and a notebook gets it with `import spending`.

```{quiz}
:id: module-name
:title: The name of a module
:type: text
:case: false
question: "A file has the name `recipes.py`. Which line makes this module ready to use in a notebook? Type the whole line."
answer: "import recipes"
wrong:
  - { text: "import recipes.py", explanation: "The name of the module is the name of the file without `.py`. Type the line again without `.py`." }
  - { text: "recipes", explanation: "That is the name of the module. The line needs a word before the name, the same word that you used for `math`." }
  - { text: "import recipes()", explanation: "A module is not a function, so the line has no parentheses." }
  - { pattern: "from recipes import .*", explanation: "A line of that form gets one name from the module. The question asks for the line that makes the whole module ready to use." }
otherwise: "The line begins with the word `import`. After it comes the name of the module, which is the name of the file without `.py`."
explanation: "The line is `import recipes`. The name of the module is the name of the file without `.py`."
```

## Create the file

Click the action below. It creates the file `spending.py` in the
directory of this workshop, beside your notebook and the file
`spending.csv`.

```{file-write}
:id: create-file
:title: Create the file spending.py
:path: spending.py
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

```

The file holds one line of text for now. Click the next action to
show the file in an editor, under your notebook.

```{attempt}
:id: file-not-shown
:check: file-shown
:expect: The file is not open yet
```

```{layout}
:id: show-file
:title: Show the file spending.py under the notebook
:name: code
```

```{verify}
:id: file-shown
:label: The file spending.py is open under the notebook
:substrate: ui
:trigger: after:show-file
:message: The file is not open yet. Click the two actions above, in order, to create the file and to show it under the notebook.
file-open spending.py
```

Your notebook is now in the top part of the window, and the editor
with the file `spending.py` is in the bottom part.

## What the file holds

The one line in the file is a string between two groups of three
double quotes. In the workshop **Functions with options**, a string
of this kind was the first line of a function, and it said what the
function does. Programmers call it a docstring. A module can have a
docstring too, as its first line. It says what the module is for.

A string on a line of its own does nothing when Python runs it. So
this module is still empty: it defines no class and no function. On
the next page you begin to fill it.
