---
title: One item by its index
requires: [verify:fruits-ran, quiz:predict-snacks, verify:snacks-ran]
---

# One item by its index

A list keeps many items together. Often a program needs only one of
them: the first price, or the third name.

Each item has a position in the list, and the position is a number.
This number is called the **index** of the item. To get one item,
write the name of the list, and then the index between square
brackets: `fruits[0]`.

## Counting starts at zero

Python counts the indexes from 0, not from 1. The first item has the
index 0, the second item has the index 1, and so on.

```python
fruits = ["apple", "banana", "cherry", "mango"]
```

| Index | 0 | 1 | 2 | 3 |
|-------|---|---|---|---|
| Item | `"apple"` | `"banana"` | `"cherry"` | `"mango"` |

Why zero? The index says how far the item is from the start of the
list. The first item is at the start, so its distance from the start
is 0. The second item is one step from the start, so its index is 1.

A ruler is a good comparison. The numbers on a ruler begin at 0, not
at 1, because each number is a distance from the start of the ruler.

The characters of a string are counted in the same way, as the
workshop **Working with text** showed: the first character of a
string has the index 0.

Click the action below. It adds a cell that shows the first item and
the second item of the list.

```{attempt}
:id: fruits-not-run
:check: fruits-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-fruits
:title: Add a cell that shows two items of a list, and run it
:path: {{ notebook }}
:tags: [fruits]
:run: true
fruits = ["apple", "banana", "cherry", "mango"]
print(fruits[0])
print(fruits[1])
```

The output has two lines: `apple` and `banana`.

- `fruits[0]` is the item with the index 0. That is the first item,
  `"apple"`.

- `fruits[1]` is the item with the index 1. That is the second item,
  `"banana"`.

`print()` shows one string without its quotes. It shows the quotes
only when the string is inside a list.

```{verify}
:id: fruits-ran
:label: The cell showed the first two items
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed fruits
if globals().get("fruits") == ["apple", "banana", "cherry", "mango"]:
    print("The cell ran. It showed the items with the indexes 0 and 1.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("fruits") == ["apple", "banana", "cherry", "mango"]
```

## Predict

Look at this cell. Do not run it yet.

```python
snacks = ["dates", "olives", "almonds", "figs"]
print(snacks[2])
```

```{quiz}
:id: predict-snacks
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "almonds"
wrong:
  - { text: "olives", explanation: "`\"olives\"` is the second item, and its index is 1. Python counts the indexes from 0." }
  - { pattern: "[\"']almonds[\"']", explanation: "The item is correct. `print()` shows one string without its quotes, so type the word only." }
  - { text: "2", explanation: "`2` is the index. The cell shows the item that has this index." }
otherwise: "Count the items from 0: the first item has the index 0, and the second item has the index 1. Which item has the index 2?"
explanation: "The indexes are 0, 1, 2 and 3. The item with the index 2 is the third item, `\"almonds\"`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: snacks-not-run
:check: snacks-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-snacks
:title: Add the cell that shows the item with the index 2, and run it
:path: {{ notebook }}
:tags: [snacks]
:run: true
snacks = ["dates", "olives", "almonds", "figs"]
print(snacks[2])
```

```{verify}
:id: snacks-ran
:label: The cell showed the item with the index 2
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed snacks
if globals().get("snacks") == ["dates", "olives", "almonds", "figs"]:
    print("The cell ran. It showed almonds, the item with the index 2.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("snacks") == ["dates", "olives", "almonds", "figs"]
```

## An index past the end

The list `snacks` has four items, so its last index is 3. An index
that is past the end of the list, such as `snacks[10]`, does not
refer to any item. Python stops and shows an `IndexError`. The
workshop **When things go wrong** showed the same error for a string.
When you see an `IndexError`, count the items again, from 0.
