---
title: Attributes
requires: [verify:cinema-changed, verify:rice-made]
---

# Attributes

An **attribute** is a value that belongs to an object, and it has a
name. You write the object, a dot, and the name of the attribute:
`coat.amount`. An object of the class `Purchase` has four attributes:
`date`, `description`, `amount` and `category`. The method `__init__`
made them, with the lines that begin with `self.`.

You can use an attribute in every place where you can use a value: in
`print()`, in an expression, in a comparison.

## Why an attribute can change

Data is sometimes wrong, or it changes. Mariam types a description,
and later she wants a better one. An object is not fixed after it is
made: you can change an attribute, and the object stays the same
object.

In the comparison with a paper form, you correct one space of a form
that is already completed. You do not need to complete a new form.

To change an attribute, you assign to it. The line has the object,
the dot and the name on the left of the `=`, and the new value on the
right:

```python
cinema.description = "Cinema with Chidi"
```

Click the action below. It adds a cell that makes an object, shows
its description, changes the description, and shows it again.

```{attempt}
:id: cinema-not-changed
:check: cinema-changed
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-cinema
:title: Add a cell that changes an attribute, and run it
:path: {{ notebook }}
:tags: [cinema]
:run: true
cinema = Purchase("2026-01-10", "Cinema ticket", Decimal("9.50"), "hobbies")
print(cinema.description)
cinema.description = "Cinema with Chidi"
print(cinema.description)
print(cinema.amount)
```

The output is:

```
Cinema ticket
Cinema with Chidi
9.50
```

```{verify}
:id: cinema-changed
:label: The description of the object cinema has changed
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed cinema
if getattr(globals().get("cinema"), "description", None) == "Cinema with Chidi":
    print("The cell ran. The attribute description of cinema has a new value, and the other three attributes are as they were.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
getattr(globals().get("cinema"), "description", None) == "Cinema with Chidi"
```

## What happened

The first line made the object. The method `__init__` gave the
attribute `description` the value `"Cinema ticket"`.

The third line assigned a new value to `cinema.description`. Python
did not make a new object. It changed one attribute of the object
that exists. The last line shows that the attribute `amount` did not
change.

## Two things to know

When you read an attribute that the object does not have, Python
stops with an `AttributeError`. For example, `print(cinema.ammount)`,
with the letter `m` two times, gives this last line:

```
AttributeError: 'Purchase' object has no attribute 'ammount'
```

When you assign to a name that the object does not have, Python shows
no error message. It makes a new attribute with that name. So the
line `cinema.ammount = Decimal("8.00")` does not change the amount.
Check the spelling of the name when you change an attribute.

## Your task

Now you make an object and change it. The purchase is this line of
Mariam's file:

```
2026-01-15,Rice and beans,14.30,food
```

Write three lines:

1. Make an object of the class `Purchase` for this purchase, and give
   it the name `rice`. The amount is a `Decimal`, made from the string
   `"14.30"`.

2. Mariam reads the receipt again. The amount was 15.30. Change the
   attribute `amount` of `rice` to `Decimal("15.30")`.

3. Show the amount: `print(rice.amount)`.

When your code is correct, the output under the cell is:

```
15.30
```

The action below adds a new cell for your code.

```{cell-insert}
:id: insert-rice
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [rice]
:run: false
# Write your three lines below this one.

```

Click on the empty line under the comment, and type your three lines.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to make the object
Look at the first line of the cell above, which makes `cinema`. Your
first line has the same form, with the name `rice` and the four
values of the new purchase, in this order: the date, the description,
the amount and the category. The date, the description and the
category are strings, so they have quotes.
```

```{hint}
:title: Hint: how to change the amount
The first line is
`rice = Purchase("2026-01-15", "Rice and beans", Decimal("14.30"), "food")`.

The second line assigns to the attribute. It begins with
`rice.amount =`, and the new value is on the right.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: rice-not-started
:check: rice-made
:expect: The name rice does not exist yet
```

````{attempt}
:id: rice-not-an-object
:check: rice-made
:expect: is not an object of the class Purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
rice = ["2026-01-15", "Rice and beans", Decimal("15.30"), "food"]
```
````

````{attempt}
:id: rice-wrong-order
:check: rice-made
:expect: Check the order of the four values

```{cell-insert}
:path: {{ notebook }}
:run: true
rice = Purchase("Rice and beans", "2026-01-15", Decimal("14.30"), "food")
rice.amount = Decimal("15.30")
```
````

````{attempt}
:id: rice-float
:check: rice-made
:expect: is a value of the type float

```{cell-insert}
:path: {{ notebook }}
:run: true
rice = Purchase("2026-01-15", "Rice and beans", 14.30, "food")
rice.amount = 15.30
```
````

````{attempt}
:id: rice-not-changed
:check: rice-made
:expect: rice.amount is still 14.30

```{cell-insert}
:path: {{ notebook }}
:run: true
rice = Purchase("2026-01-15", "Rice and beans", Decimal("14.30"), "food")
rice.ammount = Decimal("15.30")
```
````

````{attempt}
:id: rice-wrong-amount
:check: rice-made
:expect: rice.amount is 15.03 but it must be 15.30

```{cell-insert}
:path: {{ notebook }}
:run: true
rice = Purchase("2026-01-15", "Rice and beans", Decimal("14.30"), "food")
rice.amount = Decimal("15.03")
```
````

````{hint}
:title: Show me a solution
:unlock: "rice-made" in failed_checks or "rice-made" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-rice-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [rice-solution]
:run: true
rice = Purchase("2026-01-15", "Rice and beans", Decimal("14.30"), "food")
rice.amount = Decimal("15.30")
print(rice.amount)
```
````

```{verify}
:id: rice-made
:label: The object rice has the new amount
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rice; cell-executed rice-solution
def _workshop_check():
    from decimal import Decimal
    if "rice" not in globals():
        print("The name rice does not exist yet. Write your three lines under the comment in the new cell. The first line begins with rice = Purchase( and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    rice = globals()["rice"]
    if type(rice).__name__ != "Purchase":
        print(f"The name rice refers to a value of the type {type(rice).__name__}. That is not an object of the class Purchase. Make the object with Purchase and four values between parentheses. Then run the cell again.")
        return False
    found = (getattr(rice, "date", None), getattr(rice, "description", None), getattr(rice, "category", None))
    if found != ("2026-01-15", "Rice and beans", "food"):
        print(f"The date, the description and the category of rice are {found[0]!r}, {found[1]!r} and {found[2]!r}. They must be '2026-01-15', 'Rice and beans' and 'food'. Check the order of the four values between the parentheses, and check every letter. Then run the cell again.")
        return False
    amount = getattr(rice, "amount", None)
    if not isinstance(amount, Decimal):
        print(f"rice.amount is {amount!r}, which is a value of the type {type(amount).__name__}. An amount of money must be a Decimal, made from a string: Decimal(\"15.30\"). Then run the cell again.")
        return False
    if amount == Decimal("14.30"):
        print("rice.amount is still 14.30. Change it with an assignment: rice.amount = Decimal(\"15.30\"). Check the spelling of the name after the dot, because Python makes a new attribute when the name is new. Then run the cell again.")
        return False
    if amount != Decimal("15.30"):
        print(f"rice.amount is {amount} but it must be 15.30. Correct the new amount, and run the cell again.")
        return False
    print("Correct. You made the object rice, and you changed its attribute amount from 14.30 to 15.30.")
    return True
globals().pop("_workshop_check")()
```

You made an object of your own and changed one of its attributes. The
name `rice` still refers to the same object. Only the value of its
attribute `amount` is different.
