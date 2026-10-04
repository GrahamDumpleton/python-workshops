---
title: The shopping data
requires: [verify:data-ran, quiz:predict-index, verify:rows-ran]
---

# The shopping data

A program that prints a receipt needs to know what was bought. On this
page you add that data to your notebook, and you look at how to read
it. You write no code on this page.

## Three lists

A **list** holds many values under one name, in a fixed order. You
write a list with square brackets, and with a comma between the
values.

The data for the receipt is in three lists:

- `items` holds the name of each thing that was bought

- `quantities` holds how many of each thing were bought

- `prices` holds the price of one of each thing

In this workshop, the word "item" means one thing that was bought,
such as the bread. For the things that a list holds, these pages use
the word "value".

Click the action below. It adds a cell that creates the three lists,
and runs it.

```{attempt}
:id: data-not-run
:check: data-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-data
:title: Add a cell that holds the shopping data, and run it
:path: {{ notebook }}
:tags: [data]
:run: true
items = ["Bread", "Milk", "Apples", "Rice", "Coffee", "Soap"]
quantities = [2, 3, 6, 1, 1, 4]
prices = [2.40, 1.15, 0.55, 3.80, 7.25, 1.35]
```

The cell shows nothing, because each line is an assignment. Python now
remembers the three lists.

```{verify}
:id: data-ran
:label: The three lists exist
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed data
if all(isinstance(globals().get(name), list) for name in ("items", "quantities", "prices")) and len(items) == len(quantities) == len(prices) > 0:
    print(f"The cell ran. Each of the three lists holds {len(items)} values.")
elif all(isinstance(globals().get(name), list) for name in ("items", "quantities", "prices")):
    print(f"The three lists must hold the same number of values, but items holds {len(items)}, quantities holds {len(quantities)} and prices holds {len(prices)}. Correct the lists in the cell, and run the cell again.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
all(isinstance(globals().get(name), list) for name in ("items", "quantities", "prices")) and len(items) == len(quantities) == len(prices) > 0
```

## The same position in each list

The three lists belong together. The first value of each list
describes the bread: the name is `"Bread"`, the quantity is `2` and
the price of one is `2.40`. The second value of each list describes
the milk, and so on.

An **index** is the position of a value in a list. Python counts
positions from 0, so the first value has the index 0. You write the
index in square brackets after the name of the list: `items[0]` is
`"Bread"`, and `prices[0]` is `2.4`.

```{quiz}
:id: predict-index
:type: text
:title: Predict the value
question: "What does `print(items[2])` show?"
answer: "Apples"
wrong:
  - { text: "Milk", explanation: "Python counts positions from 0. The index 0 is `Bread`, the index 1 is `Milk`, and the index 2 is the value after that." }
  - { text: "\"Apples\"", explanation: "The value is correct. But `print()` shows text without the quotes, so type the word only." }
  - { text: "'Apples'", explanation: "The value is correct. But `print()` shows text without the quotes, so type the word only." }
  - { text: "6", explanation: "6 is `quantities[2]`. The question asks about the list `items`." }
otherwise: "Count the values of the list `items` from 0, and type the value at position 2 as `print()` shows it."
explanation: "The index 0 is `Bread`, the index 1 is `Milk`, and the index 2 is `Apples`."
```

## One index for three lists

A **loop** repeats the same lines of code many times. To print a
receipt, the program must do the same work for every item, so it needs
a loop.

The loop must read from three lists at the same time. The way to do
that is to loop over the index. Read this code:

```python
for i in range(len(items)):
    print(items[i], quantities[i], prices[i])
```

- `len(items)` is the number of values in the list `items`, which is 6.

- `range(6)` gives the numbers 0, 1, 2, 3, 4 and 5, one after another.
  These are exactly the indexes of a list that holds 6 values.

- The `for` line gives the name `i` to each of those numbers in turn,
  and runs the line under it one time for each number.

- That line is the **block** of the loop. It starts with four spaces,
  which is how Python knows that it belongs to the loop.

- In the block, `items[i]`, `quantities[i]` and `prices[i]` are the
  values at the same position of the three lists. They describe the
  same item.

Click the action below to add this loop to your notebook and run it.

```{attempt}
:id: rows-not-run
:check: rows-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-rows
:title: Add a cell that shows the data for each item, and run it
:path: {{ notebook }}
:tags: [rows]
:run: true
for i in range(len(items)):
    print(items[i], quantities[i], prices[i])
```

The output has one line for each item:

```
Bread 2 2.4
Milk 3 1.15
Apples 6 0.55
Rice 1 3.8
Coffee 1 7.25
Soap 4 1.35
```

All the data is there, but it is not a receipt yet. The values do not
form columns, the prices do not all have two decimal places, and
nothing is added up. The rest of this workshop corrects that.

```{verify}
:id: rows-ran
:label: The loop showed the data for each item
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rows
if isinstance(globals().get("items"), list) and globals().get("i") == len(items) - 1:
    print("The cell ran. The loop showed one line for each item.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("items"), list) and globals().get("i") == len(items) - 1
```
