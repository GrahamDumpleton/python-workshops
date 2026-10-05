---
title: Use your module
requires: [verify:coat-made, verify:cinema-made]
---

# Use your module

Your notebook has imported the module `spending`. On this page the
notebook uses the class that is in the file.

## The name of the module, then a dot

After `import math`, you write `math.sqrt(16)` to use the function
`sqrt` of the module `math`: the name of the module, a dot, and the
name of the thing. Your module works in the same way. The class
`Purchase` of the module `spending` is written `spending.Purchase`.

You make an object from it as you make an object from any class: with
parentheses, and the four values between them.

```python
coat = spending.Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
```

Click the action below. The cell begins with `import spending`, so
that the cell works by itself. The notebook has already imported the
module, so this line changes nothing here.

```{attempt}
:id: coat-not-made
:check: coat-made
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-coat
:title: Add a cell that makes a purchase with the class of the module, and run it
:path: {{ notebook }}
:tags: [coat]
:run: true
import spending

coat = spending.Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
print(coat.month())
print(type(coat))
```

The output is:

```
2026-01
<class 'spending.Purchase'>
```

```{verify}
:id: coat-made
:label: The name coat refers to a purchase made with the class of the module
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed coat
if type(globals().get("coat")).__name__ == "Purchase" and type(globals().get("coat")).__module__ == "spending":
    print("The cell ran. The name coat refers to an object of the class Purchase of your module.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("coat")).__name__ == "Purchase" and type(globals().get("coat")).__module__ == "spending"
```

## What happened

Python looked for the name `Purchase` inside the module `spending`,
found the class that you pasted into the file, and made an object
from it. The method `month()` of that class gave `2026-01`.

The second line of the output is the type of the object. The function
`type()` gives the type of a value. Python shows this type as
`spending.Purchase`: the class `Purchase` of the module `spending`.
The code that made this object came from your file.

Your notebook has two classes with the name `Purchase` now. One is
the class of the cell, written `Purchase`. The other is the class of
the file, written `spending.Purchase`. They hold the same text, but
for Python they are two separate classes. The name of the module
before the dot says which one you mean.

## Your task

Write a cell that makes a second purchase with the class of the
module.

- Mariam bought a cinema ticket on 10 January 2026. The four values
  are the date `"2026-01-10"`, the description `"Cinema ticket"`, the
  amount `Decimal("9.50")` and the category `"hobbies"`.

- Make the object with `spending.Purchase`, and give it the name
  `cinema`.

- Show the month of the purchase with `print()`. The output must be
  `2026-01`.

```{cell-insert}
:id: insert-cinema
:title: Add an empty cell for my code
:path: {{ notebook }}
:tags: [cinema]
:run: false
# Write your two lines below this line.

```

Click on the empty line under the comment, and type your two lines.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell above yours, which makes the object `coat`. Your
first line has the same form. It begins with `cinema =`, and the four
values are those of the cinema ticket.
```

```{hint}
:title: Hint: the second line
The second line calls the method `month()` of your object, inside
`print()`. The cell above yours does the same for `coat`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: cinema-not-started
:check: cinema-made
:expect: The name cinema does not exist yet
```

````{attempt}
:id: cinema-notebook-class
:check: cinema-made
:expect: made from the class of the notebook cell

```{cell-insert}
:path: {{ notebook }}
:run: true
cinema = Purchase("2026-01-10", "Cinema ticket", Decimal("9.50"), "hobbies")
print(cinema.month())
```
````

````{attempt}
:id: cinema-not-an-object
:check: cinema-made
:expect: does not refer to a purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
cinema = spending.Purchase
print(cinema)
```
````

````{attempt}
:id: cinema-wrong-values
:check: cinema-made
:expect: do not hold the four values of the cinema ticket

```{cell-insert}
:path: {{ notebook }}
:run: true
cinema = spending.Purchase("2026-01-10", "Cinema ticket", Decimal("74.90"), "hobbies")
print(cinema.month())
```
````

````{hint}
:title: Show me a solution
:unlock: "cinema-made" in failed_checks or "cinema-made" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook, with a working
answer, and runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-cinema-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [cinema-solution]
:run: true
cinema = spending.Purchase("2026-01-10", "Cinema ticket", Decimal("9.50"), "hobbies")
print(cinema.month())
```
````

```{verify}
:id: cinema-made
:label: The name cinema refers to the purchase of the cinema ticket
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed cinema; cell-executed cinema-solution
def _workshop_check():
    if "cinema" not in globals():
        print("The name cinema does not exist yet. Write your two lines under the comment in the new cell. The first line begins with cinema = spending.Purchase( and gives the four values. Then hold Shift and press Enter to run the cell.")
        return False
    cinema = globals()["cinema"]
    if type(cinema).__name__ != "Purchase":
        print(f"The name cinema does not refer to a purchase. It refers to a value of the type {type(cinema).__name__}. Make the object with spending.Purchase, with parentheses after it and the four values between them. Then run the cell again.")
        return False
    if type(cinema).__module__ != "spending":
        print("The name cinema refers to a purchase, but the purchase was made from the class of the notebook cell. The class of your module has the name of the module and a dot before it. Write spending.Purchase in place of Purchase, and run the cell again.")
        return False
    try:
        amount = round(float(getattr(cinema, "amount", 0)), 2)
    except (TypeError, ValueError):
        amount = None
    found = (getattr(cinema, "date", None), getattr(cinema, "description", None), amount, getattr(cinema, "category", None))
    if found != ("2026-01-10", "Cinema ticket", 9.5, "hobbies"):
        print("The name cinema refers to a purchase of your module, but its attributes do not hold the four values of the cinema ticket. Give the values in this order: the date \"2026-01-10\", the description \"Cinema ticket\", the amount Decimal(\"9.50\") and the category \"hobbies\". Then run the cell again.")
        return False
    print("Correct. The name cinema refers to an object of the class Purchase of your module, and it holds the four values of the cinema ticket.")
    return True
globals().pop("_workshop_check")()
```

You used code from your own file in the notebook. The notebook did
not need the cell of the class for this: the code came from the
module.
