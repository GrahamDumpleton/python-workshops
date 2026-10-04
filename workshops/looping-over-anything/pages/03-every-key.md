---
title: Every key of a dictionary
requires: [verify:stock-ran, verify:pantry-fixed]
---

# Every key of a dictionary

A **dictionary** is a value that holds pairs. Each pair has a **key**
and a **value**, with a colon between them. The key is what you look
up, and the value is what you get. For example, in the dictionary
`{"apples": 4, "pears": 0}` the key `"apples"` has the value `4`. You
write a key in square brackets to get the value that belongs to it.

A `for` loop works through a dictionary too. It makes one pass for
each pair, and in each pass the loop name refers to the **key** of the
pair. It does not refer to the value.

Programs often need this, because a dictionary usually holds many
pairs, and the program must do the same thing with each of them: print
every product of a shop, or check the amount of every product.

Think of a telephone list on paper, with a name and a number on each
line. You move your finger down the names, one line at a time. Each
name is a key. When you need the number, you read across the line.

Click the action below. It adds a cell with a `for` loop over a
dictionary, and runs it.

```{attempt}
:id: stock-not-run
:check: stock-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-stock
:title: Add a cell that prints every key of a dictionary, and run it
:path: {{ notebook }}
:tags: [stock]
:run: true
stock = {"apples": 4, "pears": 0, "plums": 7}
for product in stock:
    print(product)
```

The output has three lines, one for each key:

```
apples
pears
plums
```

```{verify}
:id: stock-ran
:label: The loop printed every key of the dictionary
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed stock
if globals().get("stock") == {"apples": 4, "pears": 0, "plums": 7} and "product" in globals():
    print("The cell ran. The loop printed one line for each of the three keys.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("stock") == {"apples": 4, "pears": 0, "plums": 7} and "product" in globals()
```

## What happened

1. `stock = {"apples": 4, "pears": 0, "plums": 7}` makes the name
   `stock` refer to a dictionary of three pairs.

2. `for product in stock:` starts the loop. Before each pass, Python
   makes the loop name `product` refer to the next key.

3. `print(product)` is the block of the loop. It shows the key.

The output shows the keys only. The values `4`, `0` and `7` do not
appear, because the loop gives the keys.

The loop gives the keys in the order in which they were added to the
dictionary. Here that is the order in which they are written.

## From the key to the value

When you have a key, you can get its value with the square brackets.
Inside the loop, the loop name refers to a key, so `stock[product]` is
the value that belongs to that key.

| Pass | `product` | `stock[product]` |
|------|-----------|------------------|
| 1 | `"apples"` | `4` |
| 2 | `"pears"` | `0` |
| 3 | `"plums"` | `7` |

## Your task

The dictionary `pantry` says how many packets of each food are in a
kitchen. The loop in the cell below is meant to build the list
`to_buy`, with every food that has `0` packets. The cell has a
mistake.

```{cell-insert}
:id: insert-pantry
:title: Add a cell with a loop for me to correct
:path: {{ notebook }}
:tags: [pantry]
:run: false
pantry = {"rice": 2, "flour": 0, "salt": 1, "sugar": 0}
to_buy = []
for food in pantry:
    if food == 0:
        to_buy.append(food)
print(to_buy)
```

The line `to_buy.append(food)` adds the value of `food` to the end of
the list `to_buy`.

First run the cell as it is: click inside it, hold `Shift` and press
`Enter`. The output is an empty list, `[]`, so the loop did not find
any food to buy.

Then correct the cell. Change only the line that begins with `if`, so
that it tests the number of packets of the food. Run the cell again.
When the cell is correct, the output is:

```
['flour', 'sugar']
```

```{hint}
:title: Hint: what is wrong?
The loop name `food` refers to a key, such as `"rice"`. A key in this
dictionary is a string, so it is never equal to the number `0`. The
`if` line must test the value that belongs to the key, not the key.
```

```{hint}
:title: Hint: how to get the value
Write the name of the dictionary, and then the key in square brackets:
`pantry[food]`. The corrected line is `if pantry[food] == 0:`.
```

```{hint}
:title: Hint: my cell shows [*] and does not finish
While a cell runs, the square brackets at its left side show a star:
`[*]`. The loop of this task finishes in less than a second. If the
star stays for longer than a few seconds, the cell probably holds a
loop that never ends. Python cannot run any other cell while it
waits.

To stop the loop, you restart the **kernel**. The kernel is the Python
interpreter that runs the cells of your notebook. First correct the
loop in the cell. Then open the `Kernel` menu at the top of the
window, choose `Restart Kernel and Run All Cells…`, and click
`Restart` in the box that appears. Python starts again, forgets every
name, and runs the cells of the notebook again from the top. If Python
stops at a cell that shows an error message, correct that cell, and
choose the same menu item again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: pantry-not-started
:check: pantry-fixed
:expect: The cell has not run yet
```

````{attempt}
:id: pantry-unchanged
:check: pantry-fixed
:expect: The list to_buy is still empty

```{cell-insert}
:path: {{ notebook }}
:run: true
pantry = {"rice": 2, "flour": 0, "salt": 1, "sugar": 0}
to_buy = []
for food in pantry:
    if food == 0:
        to_buy.append(food)
print(to_buy)
```
````

````{attempt}
:id: pantry-changed-dictionary
:check: pantry-fixed
:expect: Do not change the first line

```{cell-insert}
:path: {{ notebook }}
:run: true
pantry = {"rice": 2, "flour": 0}
to_buy = []
for food in pantry:
    if pantry[food] == 0:
        to_buy.append(food)
print(to_buy)
```
````

````{attempt}
:id: pantry-appended-values
:check: pantry-fixed
:expect: The list holds the values, not the keys

```{cell-insert}
:path: {{ notebook }}
:run: true
pantry = {"rice": 2, "flour": 0, "salt": 1, "sugar": 0}
to_buy = []
for food in pantry:
    if pantry[food] == 0:
        to_buy.append(pantry[food])
print(to_buy)
```
````

````{attempt}
:id: pantry-every-food
:check: pantry-fixed
:expect: That is every food in the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
pantry = {"rice": 2, "flour": 0, "salt": 1, "sugar": 0}
to_buy = []
for food in pantry:
    if food != 0:
        to_buy.append(food)
print(to_buy)
```
````

````{attempt}
:id: pantry-wrong-test
:check: pantry-fixed
:expect: but it must refer to ['flour', 'sugar']

```{cell-insert}
:path: {{ notebook }}
:run: true
pantry = {"rice": 2, "flour": 0, "salt": 1, "sugar": 0}
to_buy = []
for food in pantry:
    if pantry[food] != 0:
        to_buy.append(food)
print(to_buy)
```
````

````{attempt}
:id: pantry-other-way
:check: pantry-fixed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
pantry = {"rice": 2, "flour": 0, "salt": 1, "sugar": 0}
to_buy = []
for food in pantry:
    packets = pantry[food]
    if packets < 1:
        to_buy.append(food)
print(to_buy)
```
````

````{hint}
:title: Show me a solution
:unlock: "pantry-fixed" in failed_checks or "pantry-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-pantry-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [pantry-solution]
:run: true
pantry = {"rice": 2, "flour": 0, "salt": 1, "sugar": 0}
to_buy = []
for food in pantry:
    if pantry[food] == 0:
        to_buy.append(food)
print(to_buy)
```
````

```{verify}
:id: pantry-fixed
:label: Your loop finds the foods that have 0 packets
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed pantry; cell-executed pantry-solution
if "pantry" not in globals() or "to_buy" not in globals():
    print("The cell has not run yet. Click the action that adds the cell with the loop. Then click inside the cell, hold Shift and press Enter.")
elif pantry != {"rice": 2, "flour": 0, "salt": 1, "sugar": 0}:
    print("The dictionary pantry is different from the dictionary at the start. Do not change the first line of the cell. It must be: pantry = {\"rice\": 2, \"flour\": 0, \"salt\": 1, \"sugar\": 0}. Then run the cell again.")
elif to_buy == ["flour", "sugar"]:
    print("Correct. The if line now tests the value that belongs to each key, and the list to_buy holds the two foods that have 0 packets.")
elif to_buy == []:
    print("The list to_buy is still empty. The loop name food refers to a key, such as \"rice\", and a key is never equal to 0. Change the if line so that it tests the value that belongs to the key: if pantry[food] == 0. Then run the cell again.")
elif to_buy == [0, 0]:
    print("The name to_buy refers to [0, 0]. The list holds the values, not the keys. The if line is correct now. Do not change the line with append: it must add the key, which is to_buy.append(food). Then run the cell again.")
elif to_buy == ["rice", "flour", "salt", "sugar"]:
    print("The name to_buy refers to a list of all four foods. That is every food in the dictionary, so the comparison in the if line is true in every pass. The if line must test whether the value that belongs to the key is equal to 0: if pantry[food] == 0. Then run the cell again.")
else:
    print(f"The name to_buy refers to {to_buy!r} but it must refer to ['flour', 'sugar']. The if line must test whether the value that belongs to the key is equal to 0: if pantry[food] == 0. Do not change the other lines. Then run the cell again.")
"pantry" in globals() and "to_buy" in globals() and pantry == {"rice": 2, "flour": 0, "salt": 1, "sugar": 0} and to_buy == ["flour", "sugar"]
```
