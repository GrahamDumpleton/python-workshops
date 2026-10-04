---
title: "Part 5: the total"
requires: [verify:total-amount]
---

# Part 5: the total

The last number on the receipt is the **total**: the amount that the
person must pay. This part is the shortest of the six.

## The goal

Give the name `total` to the amount to pay: the subtotal with the
discount subtracted.

## What your code must do

- It reads the names `subtotal` and `discount`.

- It gives the name `total` to the subtotal minus the discount. Use
  the two names in the calculation, and not the numbers.

- Its last line prints the total with two decimal places.

For example, with a subtotal of 40 and a discount of 4, the total is
36.

With the data in your notebook, the subtotal is 28.00 and the discount
is 2.80. When your code is correct, the output under the cell is:

```
25.20
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-total
:title: Add a cell for part 5
:path: {{ notebook }}
:tags: [total]
:run: false
# Part 5: the total. Write your code below this line.

```

Write your code under the comment, and run the cell.

## If you need help

```{hint}
:title: Hint: what to look at
This part needs no loop and no `if`. It needs one assignment, with a
calculation on its right side, and one `print()`.

The operator that subtracts one number from another is `-`.
```

```{hint}
:title: Hint: the shape of the code
Your code needs two lines.

1. An assignment that has the name `total` on the left of the symbol
   `=`. The right side is an expression with the names `subtotal` and
   `discount`, and the operator `-` between them.

2. The line that prints the total with two decimal places:
   `print(f"{total:.2f}")`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: total-not-started
:check: total-amount
:expect: The name total does not exist yet
```

````{attempt}
:id: total-no-discount
:check: total-amount
:expect: The names subtotal and discount are not ready

```{cell-insert}
:path: {{ notebook }}
:run: true
discount = "2.80"
```
````

````{attempt}
:id: total-text
:check: total-amount
:expect: must refer to a number

```{cell-insert}
:path: {{ notebook }}
:run: true
discount = subtotal * 0.10
total = f"{subtotal - discount:.2f}"
```
````

````{attempt}
:id: total-added
:check: total-amount
:expect: That happens when the discount is added

```{cell-insert}
:path: {{ notebook }}
:run: true
total = subtotal + discount
print(f"{total:.2f}")
```
````

````{attempt}
:id: total-same-as-subtotal
:check: total-amount
:expect: which is the same as the subtotal

```{cell-insert}
:path: {{ notebook }}
:run: true
total = subtotal
print(f"{total:.2f}")
```
````

````{attempt}
:id: total-other-value
:check: total-amount
:expect: but the subtotal minus the discount is 25.20

```{cell-insert}
:path: {{ notebook }}
:run: true
total = discount - subtotal
print(f"{total:.2f}")
```
````

````{attempt}
:id: total-other-way
:check: total-amount
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
total = subtotal
total = total - discount
print(f"{total:.2f}")
```
````

````{hint}
:title: Show me a solution
:unlock: "total-amount" in failed_checks or "total-amount" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-total-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [total-solution]
:run: true
total = subtotal - discount
print(f"{total:.2f}")
```
````

```{verify}
:id: total-amount
:label: The name total refers to the amount to pay
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed total; cell-executed total-solution
if not (isinstance(globals().get("subtotal"), (int, float)) and isinstance(globals().get("discount"), (int, float))):
    print("The names subtotal and discount are not ready. Both must exist, and both must refer to numbers. Return to the pages Part 3: the subtotal and Part 4: the discount, and make their checks pass. You can use the solutions on those pages. Then return to this page and run your cell again.")
elif "total" not in globals():
    print("The name total does not exist yet. Write your code under the comment in the new cell: an assignment that gives the name total to the subtotal minus the discount. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif not isinstance(total, (int, float)):
    print(f"The name total must refer to a number, but it refers to the value {total!r}. Keep the total as a number. Use an f-string only inside print(). Then run the cell again.")
elif abs(total - (subtotal - discount)) < 0.005:
    print(f"Correct. The subtotal is {subtotal:.2f} and the discount is {discount:.2f}, so the total is {total:.2f}.")
elif abs(total - (subtotal + discount)) < 0.005:
    print(f"The name total refers to {total:.2f}. That happens when the discount is added to the subtotal. A discount makes the amount smaller, so subtract it: total = subtotal - discount. Then run the cell again.")
elif abs(total - subtotal) < 0.005:
    print(f"The name total refers to {total:.2f}, which is the same as the subtotal. The discount of {discount:.2f} has not been subtracted. Use both names in the calculation: total = subtotal - discount. Then run the cell again.")
else:
    print(f"The name total refers to {total:.2f}, but the subtotal minus the discount is {subtotal - discount:.2f}. Calculate the total from the two names: total = subtotal - discount. Then run the cell again.")
isinstance(globals().get("subtotal"), (int, float)) and isinstance(globals().get("discount"), (int, float)) and isinstance(globals().get("total"), (int, float)) and abs(total - (subtotal - discount)) < 0.005
```

## What you have now

Your notebook now holds everything that the receipt shows: the list
`item_lines`, and the numbers `subtotal`, `discount` and `total`. The
last part joins them into the finished receipt.
