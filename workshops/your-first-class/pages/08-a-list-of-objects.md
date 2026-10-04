---
title: A list of objects
requires: [verify:purchases-made, verify:total-spent]
---

# A list of objects

An object is a value, so it can go in every place where a value can
go. A list can hold objects, in the same way as it holds numbers or
strings.

## Why a list of objects

Mariam has many purchases, and a program cannot have a name for each
one. With a list, the program keeps all the purchases under one name.
A `for` loop then does the same work for each of them.

In the comparison with a paper form, the list is a folder of completed
forms. To answer a question about all the purchases, you take the
forms from the folder one at a time.

In a `for` loop over a list of objects, the name of the loop refers
to one object in each pass. In the block, you use its attributes and
its methods:

```python
for purchase in purchases:
    print(purchase.month(), purchase.description, purchase.amount)
```

The cell below first holds the whole class, with the four methods of
this workshop, so that the list is made from a complete class. Then it
makes a list of five purchases of January, and shows a line for each
of them.

```{attempt}
:id: purchases-not-made
:check: purchases-made
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-purchases
:title: Add a cell that makes a list of five objects, and run it
:path: {{ notebook }}
:tags: [purchases]
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def month(self):
        return self.date[:7]

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        return self.amount > other.amount

purchases = [
    Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"),
    Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport"),
    Purchase("2026-01-06", "Phone bill", Decimal("18.00"), "phone"),
    Purchase("2026-01-10", "Cinema ticket", Decimal("9.50"), "hobbies"),
    Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes"),
]
for purchase in purchases:
    print(purchase.month(), purchase.description, purchase.amount)
```

The output is:

```
2026-01 Bread and milk 6.40
2026-01 Bus ticket 2.80
2026-01 Phone bill 18.00
2026-01 Cinema ticket 9.50
2026-01 Winter coat 74.90
```

```{verify}
:id: purchases-made
:label: The list purchases holds five objects
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed purchases
if isinstance(globals().get("purchases"), list) and len(globals().get("purchases")) == 5:
    print("The cell ran. The list purchases holds five objects of the class Purchase.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("purchases"), list) and len(globals().get("purchases")) == 5
```

## What happened

Each line between the square brackets makes one object, and the
object becomes an item of the list. The objects have no names of
their own. The list `purchases` holds all five.

The loop ran its block five times. In the first pass, `purchase`
referred to the object for the bread and milk. The call
`purchase.month()` gave `"2026-01"`, and `purchase.description` and
`purchase.amount` gave two of its attributes. In the next pass,
`purchase` referred to the object for the bus ticket, and the same
line showed the values of that object.

## Your task

Add up the amounts of the five purchases.

You know the pattern from the workshop **Doing it again**: a name for
the total starts at zero before the loop, and each pass of the loop
adds one amount to it. The amounts here are `Decimal` values, so the
total starts at `Decimal("0")`.

Write code that does this:

1. It makes the name `total_spent` refer to `Decimal("0")`.

2. It loops over the list `purchases`. In each pass, it adds the
   attribute `amount` of one purchase to `total_spent`.

3. After the loop, it shows the total: `print(total_spent)`. This
   line begins without spaces, because it is not part of the block of
   the loop.

When your code is correct, the output under the cell is:

```
111.60
```

The action below adds a new cell for your code.

```{cell-insert}
:id: insert-total
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [total]
:run: false
# Write your code below this line.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: the form of the code
Your code has four lines. The first line is
`total_spent = Decimal("0")`. The second line is the `for` line, which
is the same as the `for` line in the cell above. The third line is
the block of the loop, and begins with four spaces. The fourth line
is the `print()` line.
```

```{hint}
:title: Hint: the line in the loop
In each pass, the name `purchase` refers to one object, and its
amount is `purchase.amount`. The line in the block makes `total_spent`
refer to the old total plus that amount:
`total_spent = total_spent + purchase.amount`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first.

A `TypeError` that names `Purchase` means that the code adds the
whole object to the total. Add its amount: `purchase.amount`.

A `TypeError` that names `float` and `decimal.Decimal` means that the
total starts at `0.0`. Python does not add a float to a `Decimal`.
Start the total at `Decimal("0")`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: total-not-started
:check: total-spent
:expect: The name total_spent does not exist yet
```

````{attempt}
:id: total-not-a-number
:check: total-spent
:expect: which is not a number

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = "111.60"
```
````

````{attempt}
:id: total-zero
:check: total-spent
:expect: total_spent is still zero

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = Decimal("0")
for purchase in purchases:
    purchase.amount
print(total_spent)
```
````

````{attempt}
:id: total-last-only
:check: total-spent
:expect: is the amount of the last purchase only

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = Decimal("0")
for purchase in purchases:
    total_spent = purchase.amount
print(total_spent)
```
````

````{attempt}
:id: total-wrong
:check: total-spent
:expect: total_spent is 5.00 but the five amounts add up to 111.60

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = Decimal("0")
for purchase in purchases:
    total_spent = total_spent + 1
print(total_spent)
```
````

````{attempt}
:id: total-another-way
:check: total-spent
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = 0
for item in purchases:
    total_spent += item.amount
print(total_spent)
```
````

````{hint}
:title: Show me a solution
:unlock: "total-spent" in failed_checks or "total-spent" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-total-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [total-solution]
:run: true
total_spent = Decimal("0")
for purchase in purchases:
    total_spent = total_spent + purchase.amount
print(total_spent)
```
````

```{verify}
:id: total-spent
:label: The name total_spent holds the total of the five amounts
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed total; cell-executed total-solution
def _workshop_check():
    from decimal import Decimal
    if "total_spent" not in globals():
        print("The name total_spent does not exist yet. Write your code under the comment in the new cell. The first line is total_spent = Decimal(\"0\") and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    total = globals()["total_spent"]
    if isinstance(total, bool) or not isinstance(total, (int, float, Decimal)):
        print(f"total_spent is {total!r}, which is not a number. Start the total at Decimal(\"0\") and add purchase.amount to it in each pass of the loop. Then run the cell again.")
        return False
    total = round(float(total), 2)
    if total == 0:
        print("total_spent is still zero. The block of the loop must add an amount to the total in each pass: total_spent = total_spent + purchase.amount. Then run the cell again.")
        return False
    if total == 74.90:
        print("total_spent is 74.90, which is the amount of the last purchase only. The line in the loop replaces the total in each pass. It must add to the total: total_spent = total_spent + purchase.amount. Then run the cell again.")
        return False
    if total != 111.60:
        print(f"total_spent is {total:.2f} but the five amounts add up to 111.60. Start the total at Decimal(\"0\") before the loop, and add purchase.amount one time in each pass. Then run the cell again.")
        return False
    print("Correct. The five amounts add up to 111.60. Your loop read the attribute amount of each object in the list.")
    return True
globals().pop("_workshop_check")()
```

Your loop asked each object for its amount. The same pattern works
for 5 purchases and for 5000 purchases.
