---
title: Welcome
requires: [quiz:recap-f-string, quiz:recap-else, quiz:recap-passes, verify:notebook-created]
---

# Your first function

You have already used functions that other people wrote, such as
`print()` and `len()`. In this workshop you learn how to write
functions of your own.

A new set of workshops, **Python functions and data**, begins here. In
the workshops of **Python first steps**, the pages gave you most of
the code. In these workshops, you write most of the code yourself.
Each task says exactly what to write. Each task also has hints, and a
solution that you can open if you need it.

You will learn:

- why programs are built from functions

- how to write a function, and how to use it

- how to give a function values to work with

- how to make a function give a result back

- why a function that shows a result is different from a function
  that gives a result back

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about workshops of **Python first steps**.
If you have not done those workshops, you can still answer the
questions. The explanations tell you what you need to know.

The first question is about the workshop **Working with text**.

```{quiz}
:id: recap-f-string
:title: Text with a value inside it
question: 'The name `city` refers to the string `"Lima"`. What is the value of `f"Welcome to {city}!"`?'
options:
  - { text: '`"Welcome to {city}!"`', explanation: "The letter `f` before the first quote makes this an f-string. In an f-string, Python replaces the curly brackets and the name inside them with the value of the name." }
  - { text: '`"Welcome to city!"`', explanation: "Python does not keep the name. It replaces the curly brackets and the name with the value that the name refers to." }
  - { text: '`"Welcome to Lima!"`', correct: true }
explanation: "A string that begins with the letter `f` is an f-string. Python replaces each pair of curly brackets with the value of the name inside them. You use f-strings in this workshop."
```

The second question is about the workshop **Making decisions**.

```{quiz}
:id: recap-else
:title: The block that runs
question: "An `if` line holds the comparison `temperature > 20`. Under its block there is an `else` line, which has a block of its own. The name `temperature` refers to `15`. Which block does Python run?"
options:
  - { text: "The block of the `else`", correct: true }
  - { text: "The block of the `if`", explanation: "Python runs the block of the `if` only when the comparison is true. The value 15 is not greater than 20, so the comparison is false." }
  - { text: "Both blocks, one after the other", explanation: "Python runs exactly one of the two blocks. It runs the block of the `if` when the comparison is true, and the block of the `else` when the comparison is false." }
explanation: "A block is a group of lines that begin with four spaces. Python runs the block of the `if` when the comparison is true. When the comparison is false, Python runs the block of the `else`. The value 15 is not greater than 20, so Python runs the block of the `else`."
```

The third question is about the workshop **Doing it again**.

```{quiz}
:id: recap-passes
:title: The passes of a loop
question: 'A loop begins with the line `for guest in ["Amara", "Kenji", "Sofia"]:`. How many times does Python run the block of the loop?'
options:
  - { text: "One time", explanation: "A `for` loop runs its block one time for each item of the list, and this list has three items." }
  - { text: "Three times", correct: true }
  - { text: "Until you stop it", explanation: "A `for` loop over a list always ends. It runs its block one time for each item, and then it stops." }
explanation: "A `for` loop runs its block one time for each item of the list. Before each run, it makes the name `guest` refer to the next item. The list has three items, so the block runs three times."
```

## Create your notebook

You do the work of this workshop in a notebook. Click the action below
to create the notebook and open it. You start to use it on the next
page.

```{notebook-create}
:id: create-notebook
:title: Create my notebook and open it
:path: {{ notebook }}
:open: true
- markdown: |
    # Your first function

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
