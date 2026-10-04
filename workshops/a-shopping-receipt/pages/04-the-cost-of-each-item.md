---
title: "Part 1: the cost of each item"
requires: [verify:costs-list]
---

# Part 1: the cost of each item

From this page on, you write the code. Each page gives you one part of
the program: the goal, what the result must be, and a new cell to
write in. No page gives you the code, but every page has hints.

## The goal

Two loaves of bread at 2.40 each cost 4.80 together. The receipt needs
that number for every item.

Make a list named `costs`. It must hold the cost of each item, in the
same order as the items.

## What your code must do

- It reads the lists `quantities` and `prices`, which your notebook
  already has.

- The cost of one item is its quantity multiplied by its price.

- It makes a list named `costs` that holds one cost for each item.
  The value at each index of `costs` is the cost of the item at the
  same index of `items`.

- It calculates the costs with a loop. Do not type the six results
  yourself. A program must still give the correct answer when the data
  changes.

- Its last line is `print(costs)`, so that you can see the result.

For example, the first value of `costs` is the cost of the bread: 2
multiplied by 2.40.

When your code is correct, the output under the cell is:

```
[4.8, 3.4499999999999997, 3.3000000000000003, 3.8, 7.25, 5.4]
```

Two of these numbers look strange: `3.4499999999999997` is the cost of
the milk, which is 3.45. This is not a mistake in your code. Python
holds decimal numbers with very small errors, as the workshop
**Talking to Python** showed. The receipt shows every number with two
decimal places, so these small errors do not appear on it. A later
workshop shows a better way to hold amounts of money.

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-costs
:title: Add a cell for part 1
:path: {{ notebook }}
:tags: [costs]
:run: false
# Part 1: the cost of each item. Write your code below this line.

```

Click on the empty line under the comment, and write your code. Then
run the cell: hold `Shift` and press `Enter`. The check at the bottom
of this page runs each time you run the cell.

If you see an error message, or the check does not pass, change your
code and run the cell again. You can try as many times as you like.

## If you need help

```{hint}
:title: Hint: what to look at
You need three things that you already know.

An empty list is written `[]`, and `append` adds one value to the end
of a list. The workshop **Keeping a list** taught both.

A loop over the index reads from two lists at the same time. Look at
the loop on the page **The shopping data**:
`for i in range(len(items)):`.

Inside the loop, `quantities[i]` and `prices[i]` belong to the same
item.
```

```{hint}
:title: Hint: the shape of the code
Your code needs four lines.

1. Before the loop, make an empty list: `costs = []`.

2. Start the loop: `for i in range(len(items)):`.

3. Inside the loop, with four spaces at the start of the line, add
   one cost to the list with `costs.append(...)`. Between the
   parentheses, write the expression that multiplies `quantities[i]`
   by `prices[i]`.

4. After the loop, with no spaces at the start of the line, write
   `print(costs)`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

An `IndentationError` means that the spaces at the start of a line are
wrong. Every line inside the loop starts with four spaces. The `for`
line itself starts with no spaces and ends with a colon.

A `NameError` means that a name is spelled differently from the name
that exists. The lists are named `items`, `quantities` and `prices`.

An `IndexError` means that an index is too large for a list. Use `i`
as the index, and `range(len(items))` in the `for` line.
```

```{hint}
:title: Hint: my cell shows [*] and never finishes
A cell that shows `[*]` at its left side is still running. A `for`
loop over a list always ends, so this should last less than a second.
If it does not end, open the `Kernel` menu and choose `Restart
Kernel`. Then run your cells again, from the first cell of the
notebook to the last. This is true for every page of this workshop.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: costs-not-started
:check: costs-list
:expect: The name costs does not exist yet
```

````{attempt}
:id: costs-no-data
:check: costs-list
:expect: The shopping data is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
del items
```
````

````{attempt}
:id: costs-not-a-list
:check: costs-list
:expect: must refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
items = ["Bread", "Milk", "Apples", "Rice", "Coffee", "Soap"]
costs = 0
```
````

````{attempt}
:id: costs-empty
:check: costs-list
:expect: The list costs is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
print(costs)
```
````

````{attempt}
:id: costs-append-outside
:check: costs-list
:expect: The number of values in the list costs is 1

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
for i in range(len(items)):
    cost = quantities[i] * prices[i]
costs.append(cost)
print(costs)
```
````

````{attempt}
:id: costs-strings
:check: costs-list
:expect: must hold only numbers

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
for i in range(len(items)):
    costs.append(f"{quantities[i] * prices[i]:.2f}")
print(costs)
```
````

````{attempt}
:id: costs-prices
:check: costs-list
:expect: is the same as its price

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
for i in range(len(items)):
    costs.append(prices[i])
print(costs)
```
````

````{attempt}
:id: costs-added
:check: costs-list
:expect: That happens when the quantity and the price are added

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
for i in range(len(items)):
    costs.append(quantities[i] + prices[i])
print(costs)
```
````

````{attempt}
:id: costs-wrong-index
:check: costs-list
:expect: The cost of Milk in your list is 7.20

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
for i in range(len(items)):
    costs.append(quantities[i] * prices[0])
print(costs)
```
````

````{attempt}
:id: costs-other-way
:check: costs-list
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
for i in range(len(prices)):
    cost = prices[i] * quantities[i]
    costs.append(cost)
print(costs)
```
````

````{hint}
:title: Show me a solution
:unlock: "costs-list" in failed_checks or "costs-list" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-costs-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [costs-solution]
:run: true
costs = []
for i in range(len(items)):
    costs.append(quantities[i] * prices[i])
print(costs)
```
````

```{verify}
:id: costs-list
:label: The list costs holds the cost of each item
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed costs; cell-executed costs-solution
if not (all(isinstance(globals().get(name), list) for name in ("items", "quantities", "prices")) and len(items) == len(quantities) == len(prices) and all(isinstance(number, (int, float)) for number in quantities + prices)):
    print("The shopping data is missing, or it has changed so that the three lists do not belong together. Return to the page The shopping data, and click the first action on that page again. It adds a new cell that holds the data, and runs it. Then return to this page and run your cell again.")
elif "costs" not in globals():
    print("The name costs does not exist yet. Write your code under the comment in the new cell, and begin with a line that makes an empty list named costs. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif not isinstance(costs, list):
    print(f"The name costs must refer to a list, but it refers to the value {costs!r}. Make an empty list before the loop, with the line costs = [] and add each cost to it inside the loop with append. Then run the cell again.")
elif len(costs) == 0:
    print("The list costs is empty. Add each cost to the list inside the loop, with costs.append and the cost between the parentheses. Then run the cell again.")
elif len(costs) != len(items):
    print(f"The number of values in the list costs is {len(costs)}, but the number of items is {len(items)}. When the list is too short, check that the line with append is inside the loop: it must start with four spaces. When the list is too long, check that the line costs = [] is in the same cell as the loop, above it. Then run the cell again.")
elif not all(isinstance(number, (int, float)) for number in costs):
    print("The list costs must hold only numbers, but it holds a value that is not a number. Add the result of the multiplication to the list, and not a string. The f-strings come in the next part. Then run the cell again.")
elif all(abs(costs[i] - quantities[i] * prices[i]) < 0.005 for i in range(len(items))):
    print(f"Correct. The list costs holds the cost of each of the {len(items)} items.")
elif all(abs(costs[i] - prices[i]) < 0.005 for i in range(len(items))):
    print("Each value in the list costs is the same as its price. That is the cost of one of each item. Multiply the price by the quantity: quantities[i] * prices[i]. Then run the cell again.")
elif all(abs(costs[i] - (quantities[i] + prices[i])) < 0.005 for i in range(len(items))):
    print(f"The first value in the list costs is {costs[0]:.2f}. That happens when the quantity and the price are added. Multiply them: quantities[i] * prices[i]. Then run the cell again.")
else:
    print([f"The cost of {items[i]} in your list is {costs[i]:.2f}, but {quantities[i]} multiplied by {prices[i]:.2f} is {quantities[i] * prices[i]:.2f}. Check the calculation inside your loop. Both values must come from the same index: quantities[i] * prices[i]. Then run the cell again." for i in range(len(items)) if abs(costs[i] - quantities[i] * prices[i]) >= 0.005][0])
all(isinstance(globals().get(name), list) for name in ("items", "quantities", "prices")) and len(items) == len(quantities) == len(prices) and all(isinstance(number, (int, float)) for number in quantities + prices) and isinstance(globals().get("costs"), list) and len(costs) == len(items) and all(isinstance(number, (int, float)) for number in costs) and all(abs(costs[i] - quantities[i] * prices[i]) < 0.005 for i in range(len(items)))
```

## What you have now

Your notebook now has a fourth list, `costs`, which belongs with the
other three. The next part uses it to build the lines of the receipt.
