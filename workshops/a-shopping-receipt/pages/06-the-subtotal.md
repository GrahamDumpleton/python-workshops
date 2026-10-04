---
title: "Part 3: the subtotal"
requires: [verify:subtotal-sum]
---

# Part 3: the subtotal

The bottom of the receipt shows three numbers. The first is the
**subtotal**: the sum of the costs of all the items, before any
discount is subtracted.

## The goal

Give the name `subtotal` to the sum of all the values in the list
`costs`.

## What your code must do

- It reads the list `costs`.

- It adds the costs with a loop, one cost at a time.

- It gives the name `subtotal` to the result, which is a number.

- Its last line prints the subtotal with two decimal places. Use an
  f-string: `print(f"{subtotal:.2f}")`.

For example, after the first two costs, the sum is 4.80 + 3.45, which
is 8.25. After all six costs, the sum is 28.00.

When your code is correct, the output under the cell is:

```
28.00
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-subtotal
:title: Add a cell for part 3
:path: {{ notebook }}
:tags: [subtotal]
:run: false
# Part 3: the subtotal. Write your code below this line.

```

Write your code under the comment, and run the cell.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Doing it again** showed how to add many values with a
loop. The third question on the first page of this workshop has an
example: a name starts at `0`, and a line inside the loop adds one
value to it each time the loop repeats.

In this part you need only one list, so you do not need an index. A
`for` loop can give a name to each value of `costs` in turn.
```

```{hint}
:title: Hint: the shape of the code
1. Before the loop, give `subtotal` its first value: `subtotal = 0`.

2. Start the loop: `for cost in costs:`.

3. Inside the loop, give `subtotal` a new value that is its old value
   plus `cost`. The assignment has the name `subtotal` on both sides
   of the symbol `=`.

4. After the loop, print the subtotal with two decimal places.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: subtotal-not-started
:check: subtotal-sum
:expect: The name subtotal does not exist yet
```

````{attempt}
:id: subtotal-no-costs
:check: subtotal-sum
:expect: The list costs is not ready

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
```
````

````{attempt}
:id: subtotal-text
:check: subtotal-sum
:expect: must refer to a number

```{cell-insert}
:path: {{ notebook }}
:run: true
costs = []
for i in range(len(items)):
    costs.append(quantities[i] * prices[i])
subtotal = "28.00"
```
````

````{attempt}
:id: subtotal-zero
:check: subtotal-sum
:expect: The name subtotal still refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
subtotal = 0
for cost in costs:
    subtotal + cost
print(f"{subtotal:.2f}")
```
````

````{attempt}
:id: subtotal-last-cost
:check: subtotal-sum
:expect: which is the last value in the list costs

```{cell-insert}
:path: {{ notebook }}
:run: true
subtotal = 0
for cost in costs:
    subtotal = cost
print(f"{subtotal:.2f}")
```
````

````{attempt}
:id: subtotal-twice
:check: subtotal-sum
:expect: but the values in the list costs add up to 28.00

```{cell-insert}
:path: {{ notebook }}
:run: true
for cost in costs:
    subtotal = subtotal + cost
for cost in costs:
    subtotal = subtotal + cost
print(f"{subtotal:.2f}")
```
````

````{attempt}
:id: subtotal-other-way
:check: subtotal-sum
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
subtotal = 0
for i in range(len(costs)):
    subtotal = costs[i] + subtotal
print(f"{subtotal:.2f}")
```
````

````{hint}
:title: Show me a solution
:unlock: "subtotal-sum" in failed_checks or "subtotal-sum" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-subtotal-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [subtotal-solution]
:run: true
subtotal = 0
for cost in costs:
    subtotal = subtotal + cost
print(f"{subtotal:.2f}")
```
````

```{verify}
:id: subtotal-sum
:label: The name subtotal refers to the sum of the costs
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed subtotal; cell-executed subtotal-solution
if not (isinstance(globals().get("costs"), list) and len(costs) > 0 and all(isinstance(number, (int, float)) for number in costs)):
    print("The list costs is not ready. It must exist, and it must hold one number for each item. Return to the page Part 1: the cost of each item, and make its check pass. You can use the solution on that page. Then return to this page and run your cell again.")
elif "subtotal" not in globals():
    print("The name subtotal does not exist yet. Write your code under the comment in the new cell. Begin with a line that gives the name subtotal the value 0, and add each cost to it in a loop. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif not isinstance(subtotal, (int, float)):
    print(f"The name subtotal must refer to a number, but it refers to the value {subtotal!r}. Keep the sum as a number, so that the next parts can calculate with it. Use an f-string only inside print(). Then run the cell again.")
elif abs(subtotal - sum(costs)) < 0.005:
    print(f"Correct. The name subtotal refers to the sum of the costs, which is {subtotal:.2f}.")
elif subtotal == 0:
    print("The name subtotal still refers to 0. The line inside the loop must give subtotal a new value: subtotal = subtotal + cost. An expression without an assignment calculates a value, and then Python forgets it. Then run the cell again.")
elif abs(subtotal - costs[-1]) < 0.005:
    print(f"The name subtotal refers to {subtotal:.2f}, which is the last value in the list costs. That happens when the line inside the loop replaces the old value: subtotal = cost. Add the cost to the old value: subtotal = subtotal + cost. Then run the cell again.")
else:
    print(f"The name subtotal refers to {subtotal:.2f}, but the values in the list costs add up to {sum(costs):.2f}. Check that the line subtotal = 0 is in the same cell as the loop, above it, and that the loop adds each cost one time. Then run the cell again.")
isinstance(globals().get("costs"), list) and len(costs) > 0 and all(isinstance(number, (int, float)) for number in costs) and isinstance(globals().get("subtotal"), (int, float)) and abs(subtotal - sum(costs)) < 0.005
```

## What you have now

The name `subtotal` refers to the number 28.0. You printed it with two
decimal places, but the value itself is still a number, and the next
part compares it with a limit.
