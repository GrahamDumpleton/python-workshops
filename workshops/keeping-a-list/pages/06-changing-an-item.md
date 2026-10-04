---
title: Changing an item
requires: [verify:prices-ran, quiz:predict-stock, verify:stock-ran]
---

# Changing an item

The values in the real world change. A shop changes one price. A
player gets a new score. A program must be able to change one item of
a list, and leave the other items as they are.

To change an item, write an assignment that has the list and the
index on the left side: `prices[0] = 5`. Python replaces the item at
that index with the new value. The list keeps the same number of
items, in the same order.

Changing one line on a shopping list on paper is a good comparison:
you erase one line and write something new in its place. The
other lines stay the same.

Click the action below. It adds a cell that creates a list of three
prices, changes the first price, and shows the list.

```{attempt}
:id: prices-not-run
:check: prices-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-prices
:title: Add a cell that changes the first item of a list, and run it
:path: {{ notebook }}
:tags: [prices]
:run: true
prices = [4, 9, 2]
prices[0] = 5
print(prices)
```

The output is `[5, 9, 2]`.

1. `prices = [4, 9, 2]` creates the list.

2. `prices[0] = 5` replaces the item with the index 0. That item was
   `4`, and now it is `5`.

3. `print(prices)` shows the list. It is the same list as before,
   with one item changed.

```{verify}
:id: prices-ran
:label: The first item of the list prices changed
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed prices
if globals().get("prices") == [5, 9, 2]:
    print("The cell ran. The first item of the list prices is now 5.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("prices") == [5, 9, 2]
```

## A list can change, a string cannot

This is an important difference between a list and a string. You can
get one character of a string with an index, but you cannot change
that character. A string never changes. A list can change: you can
replace its items, and on the next page you add items to it.

## Predict

Look at this cell. Do not run it yet.

```python
stock = [30, 12, 25]
stock[1] = 8
print(stock)
```

Type the list exactly as Python shows it, with the square brackets
and the commas.

```{quiz}
:id: predict-stock
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer:
  - "[30, 8, 25]"
  - { pattern: "\\[30, ?8, ?25\\]", example: "[30,8,25]" }
wrong:
  - { pattern: "\\[8, ?12, ?25\\]", explanation: "The index 1 is the second item, because Python counts the indexes from 0. The first item, `30`, does not change." }
  - { pattern: "\\[30, ?12, ?25\\]", explanation: "That is the list before the second line runs. The line `stock[1] = 8` replaces one item." }
  - { pattern: "\\[30, ?12, ?25, ?8\\]", explanation: "The assignment does not add an item. It replaces the item with the index 1, so the list still has three items." }
  - { text: "8", explanation: "`print(stock)` shows the whole list, not only the item that changed." }
otherwise: "The second line replaces the item with the index 1. Count the items from 0. Then type the whole list, with the square brackets."
explanation: "The item with the index 1 is the second item, `12`. The assignment replaces it with `8`, and the other two items stay the same."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: stock-not-run
:check: stock-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-stock
:title: Add the cell that changes the item with the index 1, and run it
:path: {{ notebook }}
:tags: [stock]
:run: true
stock = [30, 12, 25]
stock[1] = 8
print(stock)
```

```{verify}
:id: stock-ran
:label: The second item of the list stock changed
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed stock
if globals().get("stock") == [30, 8, 25]:
    print("The cell ran. The item with the index 1 is now 8.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("stock") == [30, 8, 25]
```
