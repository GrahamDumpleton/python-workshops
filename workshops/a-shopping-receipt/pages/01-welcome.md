---
title: Welcome
requires: [quiz:recap-decision, quiz:recap-append, quiz:recap-adding, verify:notebook-created]
---

# A shopping receipt

This is the last workshop of **Python first steps**. It teaches almost
nothing new. Instead, you use what you already know to build one
complete program.

A **receipt** is the piece of paper that a shop gives you when you
pay. It shows what you bought, what each thing cost, and how much you
paid. Your program prints a receipt like this one:

```
Bread       2    4.80
Milk        3    3.45
Apples      6    3.30
Rice        1    3.80
Coffee      1    7.25
Soap        4    5.40
Subtotal        28.00
Discount         2.80
Total           25.20
```

Each of the first six lines shows one thing that was bought: its name,
how many were bought, and what they cost together. The last three
lines show the sum of the costs, an amount that the shop subtracts
from that sum, and the amount to pay.

This workshop is different from the earlier ones. The pages do not
give you the code. Each page gives you a goal and says exactly what
the result must be. You write the code. You build the program in six
small parts, and each part has a check, two hints, and a solution that
you can open if you need it.

You will use:

- lists, to hold the shopping data

- a `for` loop, to do the same work for every item

- `if` and `else`, to decide whether there is a discount

- f-strings, to build each line of the receipt

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Making decisions**. Read
this code:

```python
temperature = 18
if temperature > 25:
    print("hot")
elif temperature > 15:
    print("mild")
else:
    print("cold")
```

```{quiz}
:id: recap-decision
:title: Which block runs?
question: "Which word does this code show?"
options:
  - { text: "`hot`", explanation: "The value 18 is smaller than 25, so the comparison `temperature > 25` is `False`. Python does not run the first block." }
  - { text: "`cold`", explanation: "Python runs the `else` block only when every comparison above it is `False`. Here `temperature > 15` is `True`." }
  - { text: "`mild`", correct: true }
explanation: "Python tests the comparisons from the top. `temperature > 25` is `False`, because 18 is smaller than 25. `temperature > 15` is `True`, so Python runs the block under `elif` and shows `mild`. It then skips the `else` block."
```

The second question is about the workshop **Keeping a list**. Read
this code:

```python
colours = ["red", "green", "blue"]
colours.append("yellow")
print(len(colours))
```

```{quiz}
:id: recap-append
:title: The length of a list
question: "Which number does this code show?"
options:
  - { text: "`4`", correct: true }
  - { text: "`3`", explanation: "The list starts with three values, but `append` adds one more value before `len()` counts them." }
  - { text: "`6`", explanation: "`len()` counts the values in the list. It does not count the letters of the word `yellow`." }
explanation: "`colours.append(\"yellow\")` adds one value to the end of the list. The list then holds four values, and `len(colours)` gives 4."
```

The third question is about the workshop **Doing it again**. Read this
code:

```python
steps = 0
for number in [2, 4, 6]:
    steps = steps + number
print(steps)
```

```{quiz}
:id: recap-adding
:title: Adding in a loop
question: "Which number does this code show?"
options:
  - { text: "`6`", explanation: "6 is only the last value in the list. Each time the loop repeats, it adds one value to `steps`, so `steps` holds the sum of all three values." }
  - { text: "`12`", correct: true }
  - { text: "`0`", explanation: "`steps` starts at 0, but the line inside the loop gives it a new value each time the loop repeats." }
explanation: "The loop repeats one time for each value in the list. Each time, it adds the value to `steps`. After the loop, `steps` is 0 + 2 + 4 + 6, which is 12."
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
    # A shopping receipt

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
