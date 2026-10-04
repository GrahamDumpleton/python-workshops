---
title: Welcome
requires: [quiz:recap-output-changes, quiz:recap-brackets, verify:notebook-created]
---

# Talking to Python

In this workshop you write your first Python. You start with the
simplest thing that Python can do for you: calculations with numbers.

You will learn:

- what a program is, and what Python does with one

- how to ask Python to add, subtract, multiply and divide

- which part of a calculation Python does first

- how to write a calculation of your own

The workshop takes about twenty minutes.

## Two questions before you start

Most workshops in this course begin with a few questions about earlier
workshops. Remembering an idea again, some time after you learned it,
helps you keep it.

These two questions are about the workshop **How these workshops
work**. If you have not done that workshop, you can still answer them.
The explanations tell you what you need to know.

```{quiz}
:id: recap-output-changes
:title: Changing code
question: You change the code in a cell of a notebook. When does the output under the cell change?
options:
  - { text: "Immediately, while you type", explanation: "Typing only changes the code. The output stays the same until the cell runs." }
  - { text: "When you run the cell again", correct: true }
  - { text: "When you click `Next`", explanation: "`Next` shows the next page of the workshop. It does not run any cell." }
explanation: "The output only changes when the cell runs. To run a cell, click inside it, then hold `Shift` and press `Enter`."
```

```{quiz}
:id: recap-brackets
:title: Square brackets
question: "A cell in a notebook has `[3]` at its left side. What does this tell you?"
options:
  - { text: "The cell has run", correct: true }
  - { text: "The cell contains three lines of code", explanation: "The number does not count lines. It counts the cells that have run." }
  - { text: "The cell has an error", explanation: "The number does not show an error. It shows that the cell has run." }
explanation: "A number in the square brackets means that the cell has run. Empty brackets `[ ]` mean that it has not run yet."
```

## Create your notebook

You do the work of this workshop in a notebook. Click the action below
to create the notebook and open it. You start to use it on the third
page.

```{notebook-create}
:id: create-notebook
:title: Create my notebook and open it
:path: {{ notebook }}
:open: true
- markdown: |
    # Talking to Python

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
