---
title: "Part 4: the discount"
requires: [verify:discount-rule]
---

# Part 4: the discount

A **discount** is an amount that a shop subtracts from the amount that
you must pay. This shop gives a discount to people who buy a lot.

## The goal

Give the name `discount` to the amount of the discount. The shop has
this rule:

- When the subtotal is over 25, the discount is 10 percent of the
  subtotal.

- Otherwise, the discount is 0.

## What your code must do

- It reads the name `subtotal`.

- It decides with `if` and `else` which of the two cases is true.

- It gives the name `discount` to a number in both cases. The name
  must exist after the cell has run, also when there is no discount.

- Its last line prints the discount with two decimal places.

"Over 25" means larger than 25. A subtotal of exactly 25 gives no
discount.

To calculate 10 percent of a number, multiply the number by `0.10`.
For example, 10 percent of 40 is 40 multiplied by 0.10, which is 4.

With the data in your notebook, the subtotal is 28.00. That is over
25, so the discount is 10 percent of 28.00. When your code is correct,
the output under the cell is:

```
2.80
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-discount
:title: Add a cell for part 4
:path: {{ notebook }}
:tags: [discount]
:run: false
# Part 4: the discount. Write your code below this line.

```

Write your code under the comment, and run the cell.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Making decisions** taught `if` and `else`. The first
question on the first page of this workshop has an example.

An `if` line holds a comparison and ends with a colon. The block under
it runs only when the comparison is `True`. The block under `else:`
runs only when the comparison is `False`. The lines of each block
start with four spaces.

The comparison operator for "larger than" is `>`.
```

```{hint}
:title: Hint: the shape of the code
Your code needs five lines.

1. The `if` line compares the subtotal with the limit:
   `if subtotal > 25:`.

2. The block under it has one line, which starts with four spaces. It
   is an assignment that gives the name `discount` to the subtotal
   multiplied by `0.10`.

3. The line `else:` starts at the left side of the cell.

4. The block under it has one line: `discount = 0`.

5. After the `else` block, at the left side of the cell, print the
   discount with two decimal places: `print(f"{discount:.2f}")`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: discount-not-started
:check: discount-rule
:expect: The name discount does not exist yet
```

````{attempt}
:id: discount-no-subtotal
:check: discount-rule
:expect: The name subtotal is not ready

```{cell-insert}
:path: {{ notebook }}
:run: true
subtotal = "28.00"
```
````

````{attempt}
:id: discount-under-limit
:check: discount-rule
:expect: is not over 25, so the discount must be 0

```{cell-insert}
:path: {{ notebook }}
:run: true
subtotal = 20.75
discount = subtotal * 0.10
print(f"{discount:.2f}")
```
````

````{attempt}
:id: discount-under-limit-correct
:check: discount-rule
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
subtotal = 20.75
if subtotal > 25:
    discount = subtotal * 0.10
else:
    discount = 0
print(f"{discount:.2f}")
```
````

````{attempt}
:id: discount-text
:check: discount-rule
:expect: must refer to a number

```{cell-insert}
:path: {{ notebook }}
:run: true
subtotal = 0
for cost in costs:
    subtotal = subtotal + cost
discount = f"{subtotal * 0.10:.2f}"
```
````

````{attempt}
:id: discount-wrong-comparison
:check: discount-rule
:expect: is over 25, so there must be a discount

```{cell-insert}
:path: {{ notebook }}
:run: true
if subtotal < 25:
    discount = subtotal * 0.10
else:
    discount = 0
print(f"{discount:.2f}")
```
````

````{attempt}
:id: discount-amount-left
:check: discount-rule
:expect: That is the amount that is left

```{cell-insert}
:path: {{ notebook }}
:run: true
if subtotal > 25:
    discount = subtotal * 0.90
else:
    discount = 0
print(f"{discount:.2f}")
```
````

````{attempt}
:id: discount-percentage
:check: discount-rule
:expect: That is the percentage, and not the amount

```{cell-insert}
:path: {{ notebook }}
:run: true
if subtotal > 25:
    discount = 10
else:
    discount = 0
print(f"{discount:.2f}")
```
````

````{attempt}
:id: discount-other-amount
:check: discount-rule
:expect: but 10 percent of the subtotal is 2.80

```{cell-insert}
:path: {{ notebook }}
:run: true
if subtotal > 25:
    discount = subtotal * 0.20
else:
    discount = 0
print(f"{discount:.2f}")
```
````

````{attempt}
:id: discount-other-way
:check: discount-rule
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
discount = 0
if subtotal > 25:
    discount = subtotal / 10
print(f"{discount:.2f}")
```
````

````{hint}
:title: Show me a solution
:unlock: "discount-rule" in failed_checks or "discount-rule" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-discount-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [discount-solution]
:run: true
if subtotal > 25:
    discount = subtotal * 0.10
else:
    discount = 0
print(f"{discount:.2f}")
```
````

```{verify}
:id: discount-rule
:label: The name discount follows the rule of the shop
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed discount; cell-executed discount-solution
if not isinstance(globals().get("subtotal"), (int, float)):
    print("The name subtotal is not ready. It must exist, and it must refer to a number. Return to the page Part 3: the subtotal, and make its check pass. You can use the solution on that page. Then return to this page and run your cell again.")
elif "discount" not in globals():
    print("The name discount does not exist yet. Write your code under the comment in the new cell. Use if and else, and give the name discount a value in both blocks. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif not isinstance(discount, (int, float)):
    print(f"The name discount must refer to a number, but it refers to the value {discount!r}. Keep the discount as a number, so that the next part can calculate with it. Use an f-string only inside print(). Then run the cell again.")
elif subtotal <= 25 and abs(discount) < 0.005:
    print(f"Correct. The subtotal is {subtotal:.2f}, which is not over 25, so there is no discount.")
elif subtotal <= 25:
    print(f"The subtotal is {subtotal:.2f}, which is not over 25, so the discount must be 0. But the name discount refers to {discount:.2f}. Calculate the discount inside an if block that starts with the line if subtotal > 25: and give the discount the value 0 in the else block. Then run the cell again.")
elif abs(discount - subtotal * 0.10) < 0.005:
    print(f"Correct. The subtotal is {subtotal:.2f}, which is over 25, so the discount is 10 percent of it: {discount:.2f}.")
elif abs(discount) < 0.005:
    print(f"The subtotal is {subtotal:.2f}, which is over 25, so there must be a discount. But the name discount refers to 0. Check the comparison in your if line. It must be True when the subtotal is larger than 25: if subtotal > 25: and the block under that line must calculate the discount. Then run the cell again.")
elif abs(discount - subtotal * 0.90) < 0.005:
    print(f"The name discount refers to {discount:.2f}. That is the amount that is left after the discount is subtracted. The name discount must refer to the amount that is subtracted, which is 10 percent of the subtotal: subtotal * 0.10. Then run the cell again.")
elif abs(discount - 10) < 0.005 or abs(discount - 0.10) < 0.005:
    print(f"The name discount refers to {discount:.2f}. That is the percentage, and not the amount of the discount. Multiply the subtotal by 0.10 to calculate 10 percent of it: subtotal * 0.10. Then run the cell again.")
else:
    print(f"The name discount refers to {discount:.2f}, but 10 percent of the subtotal is {subtotal * 0.10:.2f}. Multiply the subtotal by 0.10 inside the if block: discount = subtotal * 0.10. Then run the cell again.")
isinstance(globals().get("subtotal"), (int, float)) and isinstance(globals().get("discount"), (int, float)) and ((subtotal <= 25 and abs(discount) < 0.005) or (subtotal > 25 and abs(discount - subtotal * 0.10) < 0.005))
```

## What you have now

The name `discount` refers to a number in every case. With the data in
your notebook it is 10 percent of the subtotal. On the last page of
this workshop you change the data, and see the other case.
