---
title: The same loop in one line
requires: [verify:fares-ran, quiz:predict-ages, verify:ages-ran]
---

# The same loop in one line

A **list comprehension** is one line of code that builds a new list
from another list. It does the same work as the loop of the last
page: it takes the items one after another, calculates a new item from each one, and
puts the new items in a new list.

A list comprehension exists because that loop is so common. The loop
needs three lines to say one thing: "make a list of every price,
doubled". Two of the three lines are always the same: the empty list
and `.append()`. A list comprehension does not have those two
parts. It has only the parts that are different each time.

Compare a person who gives an instruction in a kitchen. One person
says: "Take an empty bowl. For each apple in the bag, peel the apple
and put it in the bowl." Another person says: "Give me a bowl of
peeled apples, one for each apple in the bag." Both mean the same
work. The second person says only what the result is.

Here is a loop that doubles three bus fares, in the form of the last
page:

```python
fares = [4, 10, 6]
double_fares = []
for fare in fares:
    double_fares.append(fare * 2)
print(double_fares)
```

Here is the same work with a list comprehension. Click the action
below. It adds a cell that holds the list comprehension, and runs it.

```{attempt}
:id: fares-not-run
:check: fares-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-fares
:title: Add a cell that doubles the fares with a list comprehension, and run it
:path: {{ notebook }}
:tags: [fares]
:run: true
fares = [4, 10, 6]
double_fares = [fare * 2 for fare in fares]
print(double_fares)
```

The output is:

```
[8, 20, 12]
```

```{verify}
:id: fares-ran
:label: The list comprehension built the list of doubled fares
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed fares
if globals().get("double_fares") == [8, 20, 12]:
    print("The cell ran. The name double_fares refers to the new list [8, 20, 12].")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("double_fares") == [8, 20, 12]
```

## What happened

The result is the same list that the loop builds. Look at the list
comprehension from the left to the right:

```python
[fare * 2 for fare in fares]
```

- The square brackets `[` and `]` are around the whole line. They say
  that the result is a list.

- `fare * 2` says what each new item is. This part is an
  **expression**: a piece of code that Python calculates to get a
  value. In the loop, it is the code between the parentheses of
  `.append()`.

- `for fare in fares` is the first line of the loop, without the
  colon. It says where the items come from, and it gives the loop name
  `fare` to each item, one after another.

Python does the same work as before. It makes an empty list. It makes
one pass for each item of `fares`. In each pass it calculates
`fare * 2` and adds the result to the end of the new list. You do not
write the empty list or `.append()`, because Python does those parts
for you.

Many people read a list comprehension from its middle: "for each
`fare` in `fares`, give me `fare * 2`".

The list `fares` does not change. A list comprehension always builds a
new list.

## Predict the result

Look at this cell. Do not run it yet.

```python
ages = [30, 41, 19]
next_year = [age + 1 for age in ages]
print(next_year)
```

Type your answer in the form that Python uses to show a list.

```{quiz}
:id: predict-ages
:type: text
:title: Predict the list
question: What does the notebook show under this cell when it runs?
answer:
  - { pattern: '\[\s*31\s*,\s*42\s*,\s*20\s*\]', example: "[31, 42, 20]" }
wrong:
  - { pattern: '\[\s*30\s*,\s*41\s*,\s*19\s*\]', explanation: "That is the list `ages`, which does not change. The cell shows the new list. The expression `age + 1` says what each new item is." }
  - { pattern: '\[\s*20\s*\]', explanation: "That is only the item of the last pass. A list comprehension makes one new item for each item of `ages`, so the new list has three items." }
  - { pattern: '\[\s*31\s*,\s*41\s*,\s*19\s*\]', explanation: "The expression `age + 1` is calculated for every item of `ages`, and not only for the first item." }
  - { pattern: '31\s*,?\s*42\s*,?\s*20', explanation: "The three numbers are correct. Python shows a list with square brackets around the items, so type the brackets too." }
otherwise: "Read it from the middle: for each `age` in `ages`, give me `age + 1`. The list `ages` has three items, so the new list has three items too."
explanation: "The list comprehension makes one new item for each item of `ages`. Each new item is the age plus 1, so the new list is `[31, 42, 20]`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: ages-not-run
:check: ages-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-ages
:title: Add the cell that adds one year to each age, and run it
:path: {{ notebook }}
:tags: [ages]
:run: true
ages = [30, 41, 19]
next_year = [age + 1 for age in ages]
print(next_year)
```

```{verify}
:id: ages-ran
:label: The list comprehension added one year to each age
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed ages
if globals().get("next_year") == [31, 42, 20]:
    print("The cell ran. The name next_year refers to the new list [31, 42, 20].")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("next_year") == [31, 42, 20]
```
