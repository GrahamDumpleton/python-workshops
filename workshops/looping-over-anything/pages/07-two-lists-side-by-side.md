---
title: Two lists side by side
requires: [verify:towns-ran, verify:heights-ran, quiz:predict-short, verify:short-ran, verify:zip-costs]
---

# Two lists side by side

Information often comes in two lists that belong together. One list
holds the names of some towns, and a second list holds the height of
each town above the sea, in metres. The first height belongs to the
first town, the second height belongs to the second town, and so on.

## The way with an index

In the workshop **Doing it again**, a loop used two lists with one
**index**. An index is the number that says the position of an item
in a list, and Python counts from `0`. The loop went through the
indexes, and used each index with both lists.

Click the action below. It adds a cell with that kind of loop, and
runs it.

```{attempt}
:id: towns-not-run
:check: towns-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-towns
:title: Add a cell that uses one index with two lists, and run it
:path: {{ notebook }}
:tags: [towns]
:run: true
towns = ["Quito", "Hanoi", "Accra"]
heights = [2850, 20, 61]
for i in range(len(towns)):
    print(towns[i], heights[i])
```

The output is:

```
Quito 2850
Hanoi 20
Accra 61
```

```{verify}
:id: towns-ran
:label: The loop used one index with two lists
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed towns
if globals().get("towns") == ["Quito", "Hanoi", "Accra"] and globals().get("heights") == [2850, 20, 61]:
    print("The cell ran. Each pass printed the town at the index, and the height at the same index.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("towns") == ["Quito", "Hanoi", "Accra"] and globals().get("heights") == [2850, 20, 61]
```

This loop works, but it is not clear to read. `len(towns)` is the
number of items, which is `3`. `range(len(towns))` gives the numbers
`0`, `1` and `2`. The loop name `i` refers to each of these numbers,
and the block uses it two times with square brackets. The reader must
follow all of that to see a simple thing: each town is printed with
its height.

## The way with zip()

Python has a function that puts two lists together, named `zip()`.
You write the two lists between its parentheses, with a comma between
them. In each pass of the loop, `zip()` gives a tuple of two values:
the next item of the first list, and the next item of the second
list.

Think of two lines of people who stand side by side. The first person
of one line walks with the first person of the other line, then the
second with the second, and so on. `zip()` joins the two lists in
that way.

```{attempt}
:id: heights-not-run
:check: heights-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-heights
:title: Add a cell that uses zip() with the two lists, and run it
:path: {{ notebook }}
:tags: [heights]
:run: true
towns = ["Quito", "Hanoi", "Accra"]
heights = [2850, 20, 61]
for town, height in zip(towns, heights):
    print(town, height)
```

The output is the same as before:

```
Quito 2850
Hanoi 20
Accra 61
```

```{verify}
:id: heights-ran
:label: The loop used zip() with the two lists
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed heights
if globals().get("towns") == ["Quito", "Hanoi", "Accra"] and "town" in globals() and "height" in globals():
    print("The cell ran. In each pass, the name town referred to an item of the first list, and the name height referred to the item at the same position in the second list.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("towns") == ["Quito", "Hanoi", "Accra"] and "town" in globals() and "height" in globals()
```

## What happened

The line `for town, height in zip(towns, heights):` has two loop
names. Before each pass, Python unpacks the tuple that `zip()` gives:
the first loop name refers to the item of the first list, and the
second loop name refers to the item of the second list.

| Pass | `town` | `height` |
|------|--------|----------|
| 1 | `"Quito"` | `2850` |
| 2 | `"Hanoi"` | `20` |
| 3 | `"Accra"` | `61` |

The loop has no index, no `range()`, no `len()` and no square
brackets. The loop names say what the values are.

So `zip()` replaces the loop `for i in range(len(towns)):` of the
workshop **Doing it again**. When you need the items of two lists
together, use `zip()`. Use `range(len(...))` only when you need the
index for another reason.

## Lists of different lengths

The two lists must belong together, so they normally have the same
number of items. Look at this cell. Do not run it yet. The first list
has three items, and the second list has only two.

```python
keys_on_ring = ["door", "car", "office"]
colours = ["red", "blue"]
for key_name, colour in zip(keys_on_ring, colours):
    print(key_name, colour)
```

```{quiz}
:id: predict-short
:title: Predict what happens
question: What happens when this cell runs?
options:
  - { text: "Python shows an `IndexError`, because the second list has no third item", explanation: "The loop with an index stops with an `IndexError` in this situation. `zip()` does not use an index, and it does not show an error message." }
  - { text: "The loop makes three passes, and the last pass has no colour", explanation: "`zip()` gives a tuple only when both lists have a next item. The second list has no third item, so there is no third pass." }
  - { text: "The loop makes two passes, and then it ends", correct: true }
explanation: "`zip()` stops when the shorter list has no more items. The loop makes two passes. The third item of the first list, `\"office\"`, is never used, and Python does not show an error message."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: short-not-run
:check: short-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-short
:title: Add the cell with lists of different lengths, and run it
:path: {{ notebook }}
:tags: [short]
:run: true
keys_on_ring = ["door", "car", "office"]
colours = ["red", "blue"]
for key_name, colour in zip(keys_on_ring, colours):
    print(key_name, colour)
```

The output has only two lines:

```
door red
car blue
```

```{verify}
:id: short-ran
:label: The loop stopped at the end of the shorter list
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed short
if globals().get("keys_on_ring") == ["door", "car", "office"] and globals().get("colours") == ["red", "blue"] and "colour" in globals():
    print("The cell ran. The loop made two passes, because the shorter list has two items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("keys_on_ring") == ["door", "car", "office"] and globals().get("colours") == ["red", "blue"] and "colour" in globals()
```

Python does not tell you that an item was not used. When the result
of a loop with `zip()` has fewer lines than you expect, check that
the two lists have the same number of items.

## Your task

A shop sells three products. One list holds how many of each product
a customer buys. A second list holds the price of one of each
product. The cost of a product is its quantity multiplied by its
price.

Write a program that builds a new list with the three costs. Use
`zip()`, and do not use an index.

Your program must do these things, in this order:

1. Give the name `amounts` to the list `[2, 1, 3]`.

2. Give the name `prices_each` to the list `[4, 9, 5]`.

3. Give the name `costs` to an empty list: `[]`.

4. Use a `for` loop over `zip(amounts, prices_each)`, with two loop
   names. Good loop names are `amount` and `price_each`. In each pass,
   multiply the two values, and add the result to the end of `costs`
   with `.append()`.

5. After the loop, show `costs` with `print()`.

When the program is correct, the output under the cell is:

```
[8, 9, 15]
```

The first cost is `8`, because `2` multiplied by `4` is `8`.

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-amounts
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [amounts]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
The first three lines are assignments, one for each list. The loop
line is similar to the loop line in the cell with the towns:
`for amount, price_each in zip(amounts, prices_each):`.
```

```{hint}
:title: Hint: the line inside the loop
The cost of one product is `amount * price_each`. The line inside
the loop begins with four spaces, and gives that expression to
`.append()`: `costs.append(amount * price_each)`.
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
:id: amounts-not-started
:check: zip-costs
:expect: The name amounts does not exist yet
```

````{attempt}
:id: amounts-one-list
:check: zip-costs
:expect: The name prices_each does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1, 3]
```
````

````{attempt}
:id: amounts-wrong-amounts
:check: zip-costs
:expect: The name amounts refers to [2, 1]

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1]
prices_each = [4, 9, 5]
```
````

````{attempt}
:id: amounts-wrong-prices
:check: zip-costs
:expect: The name prices_each refers to [4, 9]

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1, 3]
prices_each = [4, 9]
```
````

````{attempt}
:id: amounts-two-lists
:check: zip-costs
:expect: The name costs does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1, 3]
prices_each = [4, 9, 5]
```
````

````{attempt}
:id: amounts-not-a-list
:check: zip-costs
:expect: but it must refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1, 3]
prices_each = [4, 9, 5]
costs = 0
for amount, price_each in zip(amounts, prices_each):
    costs = costs + amount * price_each
print(costs)
```
````

````{attempt}
:id: amounts-empty
:check: zip-costs
:expect: The list costs is still empty

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1, 3]
prices_each = [4, 9, 5]
costs = []
for amount, price_each in zip(amounts, prices_each):
    print(amount * price_each)
print(costs)
```
````

````{attempt}
:id: amounts-empty-inside
:check: zip-costs
:expect: That is only the cost of the last product

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1, 3]
prices_each = [4, 9, 5]
for amount, price_each in zip(amounts, prices_each):
    costs = []
    costs.append(amount * price_each)
print(costs)
```
````

````{attempt}
:id: amounts-added
:check: zip-costs
:expect: That happens when the quantity and the price are added

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1, 3]
prices_each = [4, 9, 5]
costs = []
for amount, price_each in zip(amounts, prices_each):
    costs.append(amount + price_each)
print(costs)
```
````

````{attempt}
:id: amounts-same-list-twice
:check: zip-costs
:expect: but it must refer to [8, 9, 15]

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1, 3]
prices_each = [4, 9, 5]
costs = []
for amount, price_each in zip(amounts, amounts):
    costs.append(amount * price_each)
print(costs)
```
````

````{attempt}
:id: amounts-other-names
:check: zip-costs
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
amounts = [2, 1, 3]
prices_each = [4, 9, 5]
costs = []
for how_many, one_price in zip(amounts, prices_each):
    cost_of_product = one_price * how_many
    costs.append(cost_of_product)
print(costs)
```
````

````{hint}
:title: Show me a solution
:unlock: "zip-costs" in failed_checks or "zip-costs" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-amounts-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [amounts-solution]
:run: true
amounts = [2, 1, 3]
prices_each = [4, 9, 5]
costs = []
for amount, price_each in zip(amounts, prices_each):
    costs.append(amount * price_each)
print(costs)
```
````

```{verify}
:id: zip-costs
:label: Your loop builds the list of costs from two lists
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed amounts; cell-executed amounts-solution
if "amounts" not in globals():
    print("The name amounts does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the first list: amounts = [2, 1, 3]. Then hold Shift and press Enter to run the cell.")
elif "prices_each" not in globals():
    print("The name prices_each does not exist yet. Add a line that makes the second list: prices_each = [4, 9, 5]. Check the spelling. Then run the cell again.")
elif amounts != [2, 1, 3]:
    print(f"The name amounts refers to {amounts!r} but it must refer to the list [2, 1, 3]. Correct the first line of your program. Then run the cell again.")
elif prices_each != [4, 9, 5]:
    print(f"The name prices_each refers to {prices_each!r} but it must refer to the list [4, 9, 5]. Correct the second line of your program. Then run the cell again.")
elif "costs" not in globals():
    print("The name costs does not exist yet. Add a line before the loop that makes an empty list: costs = []. Check the spelling. Then run the cell again.")
elif not isinstance(costs, list):
    print(f"The name costs refers to {costs!r} but it must refer to a list. Start with an empty list before the loop: costs = []. Inside the loop, add each cost to the list with costs.append(). Then run the cell again.")
elif costs == [8, 9, 15]:
    print("Correct. Your loop used the two lists together, and built the list of costs: [8, 9, 15].")
elif costs == []:
    print("The list costs is still empty, so the loop does not add anything to it. Inside the loop, write a line that begins with four spaces and adds the cost to the list: costs.append(amount * price_each). Then run the cell again.")
elif costs == [15]:
    print("The name costs refers to [15]. That is only the cost of the last product. There are two usual reasons. The line costs = [] may be inside the loop: move it before the loop, so that it runs one time. Or the line with append may begin without spaces, so that it runs one time after the loop: give it four spaces. Then run the cell again.")
elif costs == [6, 10, 8]:
    print("The name costs refers to [6, 10, 8]. That happens when the quantity and the price are added. Multiply them with the operator *: amount * price_each. Then run the cell again.")
else:
    print(f"The name costs refers to {costs!r} but it must refer to [8, 9, 15]. The loop line must give both lists to zip(): for amount, price_each in zip(amounts, prices_each). Each cost is the two loop names multiplied: amount * price_each. Then run the cell again.")
"amounts" in globals() and "prices_each" in globals() and "costs" in globals() and amounts == [2, 1, 3] and prices_each == [4, 9, 5] and costs == [8, 9, 15]
```
