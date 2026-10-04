---
title: Finding the largest
requires: [verify:tallest-ran, quiz:predict-freezer, verify:freezer-ran]
---

# Finding the largest

Another common question is "which is the largest?". Which person is
the tallest? Which price is the highest? Which day was the warmest?

Think of how you find the tallest person in a line of people. You
remember the height of the first person. Then you walk along the line.
Each time that you meet a taller person, you forget the old height and
remember the new height. At the end of the line, the height that you
remember is the largest.

A program does the same, again with a loop and an `if`:

1. Before the loop, a name is given the first item of the list. This
   is the largest value so far.

2. Inside the loop, an `if` tests whether the item is greater than the
   largest value so far.

3. Inside the `if`, one line makes the name refer to the item.

The first item of a list has the index `0`, so the first item of the
list `heights` is `heights[0]`.

Click the action below. It adds a cell that finds the largest of five
heights in centimetres, and runs it.

```{attempt}
:id: tallest-not-run
:check: tallest-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-tallest
:title: Add a cell that finds the largest of five heights, and run it
:path: {{ notebook }}
:tags: [tallest]
:run: true
heights = [152, 171, 165, 180, 158]
tallest = heights[0]
for height in heights:
    if height > tallest:
        tallest = height
print(tallest)
```

The output is `180`.

```{verify}
:id: tallest-ran
:label: The loop found the largest height
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed tallest
if globals().get("heights") == [152, 171, 165, 180, 158] and globals().get("tallest") == 180:
    print("The cell ran. The name tallest refers to 180, the largest of the five heights.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("heights") == [152, 171, 165, 180, 158] and globals().get("tallest") == 180
```

## What happened

Before the loop, `tallest` refers to the first height, `152`. The loop
then made five passes.

| Pass | `height` | `height > tallest` | `tallest` after |
|------|----------|--------------------|-----------------|
| 1 | `152` | `False` | `152` |
| 2 | `171` | `True` | `171` |
| 3 | `165` | `False` | `171` |
| 4 | `180` | `True` | `180` |
| 5 | `158` | `False` | `180` |

The name `tallest` changed only in the passes where the item was
greater than the value that it referred to. After the loop, it refers
to the largest item.

The first pass compares the first item with itself, so nothing
changes in that pass. That is not a problem.

## Why the start value is the first item

A total starts from `0`. It seems natural to start the largest value
from `0` as well. Look at this cell. Do not run it yet. It holds three
temperatures of a freezer in degrees Celsius, and it starts from `0`.

```python
freezer = [-18, -15, -20]
warmest_reading = 0
for reading in freezer:
    if reading > warmest_reading:
        warmest_reading = reading
print(warmest_reading)
```

```{quiz}
:id: predict-freezer
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "0"
wrong:
  - { text: "-15", explanation: "`-15` is the largest item of the list. But the cell starts from 0, and no item is greater than 0, so the comparison is never true." }
  - { text: "-20", explanation: "`-20` is the smallest item. The cell looks for the largest value, and it starts from 0." }
  - { text: "-18", explanation: "`-18` is the first item, but this cell does not start from the first item. It starts from 0." }
otherwise: "Follow the passes. The name `warmest_reading` starts at 0. Is any item of the list greater than 0?"
explanation: "Every item is below 0, so the comparison is never true, and the name never changes. The cell shows 0, which is not an item of the list at all."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: freezer-not-run
:check: freezer-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-freezer
:title: Add the cell that starts the largest value from 0, and run it
:path: {{ notebook }}
:tags: [freezer]
:run: true
freezer = [-18, -15, -20]
warmest_reading = 0
for reading in freezer:
    if reading > warmest_reading:
        warmest_reading = reading
print(warmest_reading)
```

```{verify}
:id: freezer-ran
:label: The cell that starts from 0 gave a wrong answer
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed freezer
if globals().get("freezer") == [-18, -15, -20] and globals().get("warmest_reading") == 0:
    print("The cell ran. The name warmest_reading refers to 0, which is not an item of the list. The correct answer is -15.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("freezer") == [-18, -15, -20] and globals().get("warmest_reading") == 0
```

The answer `0` is wrong: the warmest reading in the list is `-15`.
Again Python showed no error message, because the cell is correct
Python that gives a wrong answer.

A start value of `0` works only when you know that the list holds an
item that is `0` or greater. A start value of the first item always works,
because the first item is a real item of the list. So start from the
first item: `warmest_reading = freezer[0]`.

To find the smallest value, use the same code with the operator `<`,
which means "less than".
