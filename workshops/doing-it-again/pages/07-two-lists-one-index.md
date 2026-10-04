---
title: Two lists and one index
requires: [verify:shopping-ran, verify:line-costs]
---

# Two lists and one index

Information often comes in two lists that belong together. One list
holds the names of some items, and a second list holds their prices.
The first price belongs to the first item, the second price belongs
to the second item, and so on.

A loop such as `for item in items:` gives you each item, but it does
not tell you the position of the item. Without the position, you
cannot find the price that belongs to the item.

Think of two columns in a table on paper. To read one row, you put
your finger on the same line in both columns. The number of the line
connects the two columns.

In Python, the number of the line is the **index**: the number that
says the position of an item in a list. Python counts from `0`, so
`items[0]` is the first item, and `item_prices[0]` is its price. One
index, used with both lists, gives the two values that belong
together.

So the loop must give you the indexes: `0`, `1`, `2` and so on. You
already know a function that gives these numbers: `range()`. You also
know `len()`, which gives the number of items in a list.

- `len(items)` is the number of items. For a list of three items, it
  is `3`.

- `range(len(items))` is then the same as `range(3)`. It gives `0`,
  `1` and `2`, which are exactly the indexes of the list.

Click the action below. It adds a cell that prints each item with its
price, and runs it.

```{attempt}
:id: shopping-not-run
:check: shopping-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-shopping
:title: Add a cell that uses one index with two lists, and run it
:path: {{ notebook }}
:tags: [shopping]
:run: true
items = ["bread", "milk", "eggs"]
item_prices = [3, 2, 4]
for i in range(len(items)):
    print(i, items[i], item_prices[i])
```

The output is:

```
0 bread 3
1 milk 2
2 eggs 4
```

```{verify}
:id: shopping-ran
:label: The loop used one index with two lists
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shopping
if globals().get("items") == ["bread", "milk", "eggs"] and globals().get("item_prices") == [3, 2, 4]:
    print("The cell ran. Each pass printed the index, the item at that index, and the price at the same index.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("items") == ["bread", "milk", "eggs"] and globals().get("item_prices") == [3, 2, 4]
```

## What happened

The loop made three passes. The loop name `i` referred to `0`, then to
`1`, then to `2`.

| Pass | `i` | `items[i]` | `item_prices[i]` |
|------|-----|------------|------------------|
| 1 | `0` | `"bread"` | `3` |
| 2 | `1` | `"milk"` | `2` |
| 3 | `2` | `"eggs"` | `4` |

In each pass, `items[i]` and `item_prices[i]` use the same index, so
they give the item and the price that belong together.

The loop name is `i`, which is short for "index". Good names are
usually whole words, but programmers everywhere use `i` for an index
in a loop, so you will see it often.

This works only when the two lists have the same number of items. If
the second list is shorter, Python stops with an `IndexError` when the
index has no item in that list.

When you need only the items of one list, the loop `for item in
items:` is shorter and clearer. Use `range(len(items))` when you need
the index.

## Your task

A shop sells three products. One list holds how many of each product
a customer buys. A second list holds the price of one of each product.
The cost of a product is its quantity multiplied by its price.

Write a program that builds a new list with the three costs.

Your program must do these four things, in this order:

1. Give the name `quantities` to the list `[2, 1, 3]`.

2. Give the name `unit_prices` to the list `[4, 9, 5]`.

3. Give the name `line_costs` to an empty list: `[]`.

4. Use a `for` loop with `range(len(quantities))`. In each pass,
   multiply the quantity at the index by the price at the same index,
   and add the result to the end of `line_costs` with `.append()`.

To add a value to the end of a list, write the name of the list, then
a dot, then `append()` with the value between the parentheses. For
example, `line_costs.append(8)` adds `8` to the end of `line_costs`.

After the loop, show `line_costs` with `print()`. When the program is
correct, the output under the cell is:

```
[8, 9, 15]
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-line-costs
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [line-costs]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
The first three lines are assignments, one for each list. The loop is
similar to the loop in the cell with the bread, the milk and the eggs:
`for i in range(len(quantities)):`.
```

```{hint}
:title: Hint: the line inside the loop
The cost of one product is `quantities[i] * unit_prices[i]`. The line
inside the loop begins with four spaces, and gives that expression to
`.append()`: `line_costs.append(quantities[i] * unit_prices[i])`.
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
:id: line-costs-not-started
:check: line-costs
:expect: The name quantities does not exist yet
```

````{attempt}
:id: line-costs-one-list
:check: line-costs
:expect: The name unit_prices does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
```
````

````{attempt}
:id: line-costs-wrong-quantities
:check: line-costs
:expect: The name quantities refers to [2, 1]

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1]
unit_prices = [4, 9, 5]
```
````

````{attempt}
:id: line-costs-wrong-prices
:check: line-costs
:expect: The name unit_prices refers to [4, 9]

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9]
```
````

````{attempt}
:id: line-costs-two-lists
:check: line-costs
:expect: The name line_costs does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
```
````

````{attempt}
:id: line-costs-not-a-list
:check: line-costs
:expect: but it must refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
line_costs = 0
for i in range(len(quantities)):
    line_costs = line_costs + quantities[i] * unit_prices[i]
print(line_costs)
```
````

````{attempt}
:id: line-costs-empty
:check: line-costs
:expect: The list line_costs is still empty

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
line_costs = []
for i in range(len(quantities)):
    print(quantities[i] * unit_prices[i])
print(line_costs)
```
````

````{attempt}
:id: line-costs-empty-inside
:check: line-costs
:expect: That is only the cost of the last product

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
for i in range(len(quantities)):
    line_costs = []
    line_costs.append(quantities[i] * unit_prices[i])
print(line_costs)
```
````

````{attempt}
:id: line-costs-append-after-loop
:check: line-costs
:expect: That is only the cost of the last product

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
line_costs = []
for i in range(len(quantities)):
    print(i)
line_costs.append(quantities[i] * unit_prices[i])
print(line_costs)
```
````

````{attempt}
:id: line-costs-added
:check: line-costs
:expect: That happens when the quantity and the price are added

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
line_costs = []
for i in range(len(quantities)):
    line_costs.append(quantities[i] + unit_prices[i])
print(line_costs)
```
````

````{attempt}
:id: line-costs-short-range
:check: line-costs
:expect: The list line_costs has 2 items

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
line_costs = []
for i in range(2):
    line_costs.append(quantities[i] * unit_prices[i])
print(line_costs)
```
````

````{attempt}
:id: line-costs-wrong-values
:check: line-costs
:expect: but it must refer to [8, 9, 15]

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
line_costs = []
for i in range(len(quantities)):
    line_costs.append(quantities[i] * unit_prices[0])
print(line_costs)
```
````

````{attempt}
:id: line-costs-range-three
:check: line-costs
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
line_costs = []
for position in range(3):
    cost = unit_prices[position] * quantities[position]
    line_costs.append(cost)
print(line_costs)
```
````

````{hint}
:title: Show me a solution
:unlock: "line-costs" in failed_checks or "line-costs" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-line-costs-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [line-costs-solution]
:run: true
quantities = [2, 1, 3]
unit_prices = [4, 9, 5]
line_costs = []
for i in range(len(quantities)):
    line_costs.append(quantities[i] * unit_prices[i])
print(line_costs)
```
````

```{verify}
:id: line-costs
:label: Your loop builds the list of costs from two lists
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed line-costs; cell-executed line-costs-solution
if "quantities" not in globals():
    print("The name quantities does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the first list: quantities = [2, 1, 3]. Then hold Shift and press Enter to run the cell.")
elif "unit_prices" not in globals():
    print("The name unit_prices does not exist yet. Add a line that makes the second list: unit_prices = [4, 9, 5]. Check the spelling. Then run the cell again.")
elif quantities != [2, 1, 3]:
    print(f"The name quantities refers to {quantities} but it must refer to the list [2, 1, 3]. Correct the first line of your program. Then run the cell again.")
elif unit_prices != [4, 9, 5]:
    print(f"The name unit_prices refers to {unit_prices} but it must refer to the list [4, 9, 5]. Correct the second line of your program. Then run the cell again.")
elif "line_costs" not in globals():
    print("The name line_costs does not exist yet. Add a line before the loop that makes an empty list: line_costs = []. Check the spelling. Then run the cell again.")
elif not isinstance(line_costs, list):
    print(f"The name line_costs refers to {line_costs} but it must refer to a list. Start with an empty list before the loop: line_costs = []. Inside the loop, add each cost to the list with line_costs.append(). Then run the cell again.")
elif line_costs == [8, 9, 15]:
    print("Correct. Your loop used one index with two lists, and built the list of costs: [8, 9, 15].")
elif line_costs == []:
    print("The list line_costs is still empty, so the loop does not add anything to it. Inside the loop, write a line that begins with four spaces and adds the cost to the list: line_costs.append(quantities[i] * unit_prices[i]). Then run the cell again.")
elif line_costs == [15]:
    print("The name line_costs refers to [15]. That is only the cost of the last product. There are two usual reasons. The line line_costs = [] may be inside the loop: move it before the loop, so that it runs one time. Or the line with append may begin without spaces, so that it runs one time after the loop: give it four spaces. Then run the cell again.")
elif line_costs == [6, 10, 8]:
    print("The name line_costs refers to [6, 10, 8]. That happens when the quantity and the price are added. Multiply them with the operator *: quantities[i] * unit_prices[i]. Then run the cell again.")
elif len(line_costs) != 3:
    print(f"The list line_costs has {len(line_costs)} items, but it must have 3 items, one for each product. The loop must make one pass for each index: for i in range(len(quantities)). The line line_costs = [] must be before the loop, and the line with append must be inside the loop. Then run the cell again.")
else:
    print(f"The name line_costs refers to {line_costs} but it must refer to [8, 9, 15]. Each cost is the quantity multiplied by the price at the same index: quantities[i] * unit_prices[i]. Then run the cell again.")
"quantities" in globals() and "unit_prices" in globals() and "line_costs" in globals() and quantities == [2, 1, 3] and unit_prices == [4, 9, 5] and line_costs == [8, 9, 15]
```
