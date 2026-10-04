---
title: A new list from a list
requires: [verify:doubled-ran, quiz:predict-metres, verify:metres-ran]
---

# A new list from a list

A **list** is a value that holds several values in order. Each value
in a list is called an **item**. Programs often have one list and need
a second list that is made from it: one new item for each item of the
first list.

Think of a price list in a shop. The owner wants a second price list,
with every price doubled. The owner takes an empty sheet of paper,
reads the first price, writes the doubled price on the sheet, and
continues until the last price. The first price list does not change.
The sheet is the new list.

A program does the same work with a **loop**. A loop is a piece of
code that tells Python to run the same lines many times. The program
has three parts:

1. Before the loop, a name is given an empty list: `[]`.

2. Inside the loop, each pass adds one new item to the end of that
   list, with `.append()`.

3. After the loop, the name refers to the complete new list.

Click the action below. It adds a cell that builds a list of doubled
prices, and runs it.

```{attempt}
:id: doubled-not-run
:check: doubled-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-doubled
:title: Add a cell that builds a list of doubled prices, and run it
:path: {{ notebook }}
:tags: [doubled]
:run: true
prices = [4, 10, 6]
doubled = []
for price in prices:
    doubled.append(price * 2)
print(doubled)
```

The output is:

```
[8, 20, 12]
```

```{verify}
:id: doubled-ran
:label: The loop built the list of doubled prices
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed doubled
if globals().get("doubled") == [8, 20, 12]:
    print("The cell ran. The name doubled refers to the new list [8, 20, 12].")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("doubled") == [8, 20, 12]
```

## What happened

The line `doubled = []` makes an empty list. The loop then makes three
passes, one for each item of `prices`. A **pass** is one run of the
lines in the loop. Before each pass, the loop makes the name `price`
refer to the next item. This name is called the **loop name**.

| Pass | `price` | `price * 2` | `doubled` after the pass |
|------|---------|-------------|--------------------------|
| 1 | `4` | `8` | `[8]` |
| 2 | `10` | `20` | `[8, 20]` |
| 3 | `6` | `12` | `[8, 20, 12]` |

The list `prices` did not change. The program built a second list.

## Predict the result

Look at this cell. Do not run it yet. It has the same three parts,
with other names. The list holds three distances in kilometres, and
one kilometre is 1000 metres.

```python
distances_km = [5, 12, 8]
in_metres = []
for km in distances_km:
    in_metres.append(km * 1000)
print(in_metres)
```

Type your answer in the same form that Python uses to show a list:
with square brackets, and with a comma between the items.

```{quiz}
:id: predict-metres
:type: text
:title: Predict the list
question: What does the notebook show under this cell when it runs?
answer:
  - { pattern: '\[\s*5000\s*,\s*12000\s*,\s*8000\s*\]', example: "[5000, 12000, 8000]" }
wrong:
  - { pattern: '\[\s*5\s*,\s*12\s*,\s*8\s*\]', explanation: "That is the list `distances_km`, which does not change. The cell shows the new list `in_metres`, and each of its items is a distance multiplied by 1000." }
  - { pattern: '\[\s*8000\s*\]', explanation: "That is only the item of the last pass. Each pass adds one item to the end of `in_metres`, and the items of the earlier passes stay in the list." }
  - { text: "8000", explanation: "That is only the value of the last pass. Each pass adds one item to the end of the list `in_metres`, so the cell shows a list with three items." }
  - { pattern: '5000\s*,?\s*12000\s*,?\s*8000', explanation: "The three numbers are correct. Python shows a list with square brackets around the items, so type the brackets too." }
otherwise: "Follow the three passes. In each pass, `km` refers to one distance, and `.append()` adds `km * 1000` to the end of `in_metres`."
explanation: "The loop makes three passes. Each pass adds one distance in metres to the end of `in_metres`, so the new list is `[5000, 12000, 8000]`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: metres-not-run
:check: metres-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-metres
:title: Add the cell that changes kilometres to metres, and run it
:path: {{ notebook }}
:tags: [metres]
:run: true
distances_km = [5, 12, 8]
in_metres = []
for km in distances_km:
    in_metres.append(km * 1000)
print(in_metres)
```

```{verify}
:id: metres-ran
:label: The loop built the list of distances in metres
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed metres
if globals().get("in_metres") == [5000, 12000, 8000]:
    print("The cell ran. The name in_metres refers to the new list [5000, 12000, 8000].")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("in_metres") == [5000, 12000, 8000]
```

This kind of loop is very common. It always has the same three parts:
an empty list, a loop, and `.append()`. Because it is so common,
Python has a shorter way to write it. The next page shows that way.
