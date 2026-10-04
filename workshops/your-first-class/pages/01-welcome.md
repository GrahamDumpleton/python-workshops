---
title: Welcome
requires: [quiz:recap-return, quiz:recap-key, quiz:recap-decimal, verify:notebook-created]
---

# Your first class

Until now, every value in your programs had a type that Python gave
you: an integer, a string, a list, a dictionary. In this workshop you
learn how to make a type of your own.

A new set of workshops, **Your own types in Python**, begins here. In
these workshops, a page often gives you the first lines of the code
with one click, and you write the part that matters. Each task says
exactly what to write. Each task also has hints, and a solution that
you can open if you need it.

You will learn:

- what a class is, and why a program needs one

- how to make a value from a class

- how a value made from a class keeps its data

- how to write a function that belongs to your class

- how to keep many of these values in a list, and add up their
  amounts

The example in this workshop is the spending of one person, Mariam.
Each thing that she bought is a purchase. A purchase has a date, a
description, an amount and a category. You do not need the earlier
workshops about her spending. Each page says again what it uses.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Your first function**. Read
this code:

```python
def double(number):
    print(number * 2)

result = double(4)
```

```{quiz}
:id: recap-return
:title: A function that shows a value
question: "The code runs. What does the name `result` refer to?"
options:
  - { text: "`8`", explanation: "The function shows `8` on the screen with `print()`. But it has no `return` line, so it gives nothing back to the code that called it." }
  - { text: "`None`", correct: true }
  - { text: "`4`", explanation: "The value `4` is the argument that the call gives to the function. The name `result` refers to the value that the function gives back." }
explanation: "The function `print()` only shows a value on the screen. To give a value back to the code that called it, a function needs a `return` line, such as `return number * 2`. A function with no `return` line gives back the value `None`. In this workshop you write functions that return a value."
```

The second question is about the workshop **Looking things up**. Read
this code:

```python
prices = {"tea": 3, "soup": 4}
print(prices["cake"])
```

```{quiz}
:id: recap-key
:title: A key that does not exist
question: "What happens when this code runs?"
options:
  - { text: "Python stops with a `KeyError`", correct: true }
  - { text: "The code shows `None`", explanation: "Square brackets do not give `None` for a key that does not exist. Python stops with an error message." }
  - { text: "The code shows `0`", explanation: "Python does not choose a value for a key that does not exist. It stops with an error message." }
explanation: "A dictionary holds pairs of a key and a value. `prices[\"tea\"]` gives the value for the key `\"tea\"`. The dictionary has no key `\"cake\"`, so Python stops with a `KeyError`. Python finds the mistake only when the code reads the key."
```

The third question is about the workshop **Cleaning messy text**.

```{quiz}
:id: recap-decimal
:title: An exact amount of money
question: "Which of these makes an exact number for the amount 6.40?"
options:
  - { text: "`float(\"6.40\")`", explanation: "A float is not exact. A sum of floats can give a result such as `0.30000000000000004`, so money is not kept in floats." }
  - { text: "`Decimal(\"6.40\")`", correct: true }
  - { text: "`\"6.40\"`", explanation: "This is a string. A string is a row of characters, and Python cannot add it to a number." }
explanation: "`Decimal` is a type of number that is exact. It keeps a number digit by digit, in the way that you write it on paper. The line `from decimal import Decimal` gets it from the module `decimal`, which comes with Python. You make a `Decimal` from a string: `Decimal(\"6.40\")`. In this workshop, every amount of money is a `Decimal`."
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
    # Your first class

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
