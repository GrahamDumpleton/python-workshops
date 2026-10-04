---
title: Welcome
requires: [quiz:recap-order, quiz:recap-last-value, verify:notebook-created]
---

# Naming things

In the last workshop, Python calculated a value, showed it, and then
forgot it. In this workshop you learn how to make Python remember a
value, by giving the value a name.

You will learn:

- how to give a name to a value, and how to use the name later

- how to give a name a new value

- what happens when you use a name that does not exist

- how to choose names that are clear to read

- how to show a value with `print()`

The workshop takes about twenty minutes.

## Two questions before you start

These two questions are about the workshop **Talking to Python**. If
you have not done that workshop, you can still answer them. The
explanations tell you what you need to know.

```{quiz}
:id: recap-order
:title: What is calculated first?
question: "Which part of the expression `10 - 2 * 3` does Python calculate first?"
options:
  - { text: "`10 - 2`, because it is written first", explanation: "The position in the expression does not decide the order. Python multiplies before it subtracts." }
  - { text: "`2 * 3`, because Python multiplies before it subtracts", correct: true }
  - { text: "Python chooses a different part each time", explanation: "Python always follows the same rule. It multiplies and divides before it adds and subtracts." }
explanation: "Python multiplies and divides before it adds and subtracts. It calculates `2 * 3` first, which is 6, and then calculates `10 - 6`, which is 4."
```

```{quiz}
:id: recap-last-value
:title: The output of a cell
question: A cell in a notebook holds two expressions, on two lines. Python calculates both. Which values does the notebook show under the cell?
options:
  - { text: "Only the value of the last line", correct: true }
  - { text: "Only the value of the first line", explanation: "The notebook shows the value of the last line of the cell, not the first." }
  - { text: "The values of both lines", explanation: "Python calculates both values, but the notebook shows only the value of the last line." }
explanation: "A notebook shows only the value of the last line of a cell. In this workshop you learn an instruction that shows a value from any line."
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
    # Naming things

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
