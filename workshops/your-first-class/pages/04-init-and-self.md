---
title: The method __init__ and self
requires: [verify:bus-made, verify:bread-made]
---

# The method `__init__` and `self`

The class on the last page holds one function. This page explains
that function line by line.

```python
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category
```

## A method

A **method** is a function that belongs to a value. You have called
methods for a long time: in `"tea".upper()`, the method `upper`
belongs to the string. A function that is written inside a class is a
method of every object of that class.

## The method `__init__`

The method `__init__` is the method that Python calls when an object
is made. You never call it by its name. You write
`Purchase("2026-01-17", ...)`, and Python calls `__init__` for you.
Its work is to put the first values into the new object. The name is
short for "initialise", which means "prepare for use".

The name has two underscores before `init` and two underscores after
it. Two underscores on each side mark a name that Python itself
calls. Methods with such names are **special methods**.

In the comparison with a paper form, `__init__` is the moment when
someone completes a new form. The class says which spaces the form
has, and `__init__` writes a value in each space.

## The name `self`

One class makes many objects. So the code of a method needs a name
for the one object that it is working on now. That name is `self`.

`self` is the name, inside a method, for the object that the method
was called on. It is the first parameter of every method. Python
gives it a value for you, so a call never has an argument for `self`.
The call `Purchase(...)` has four arguments, and `__init__` has five
parameters: `self` and four more.

In the comparison, `self` means "this form, the one in my hands now".

Now read the body. The line `self.date = date` has the same word on
both sides, with two different meanings:

- On the right, `date` is the parameter. It refers to the value that
  the call gave, such as `"2026-01-17"`. Like every parameter, it
  exists only while the method runs.

- On the left, `self.date` is a value that is kept inside the object,
  under the name `date`. It stays in the object after the method has
  ended.

So the line means: "keep the value of the parameter `date` in this
object, under the name `date`". The other three lines do the same for
the description, the amount and the category.

## Each object has its own values

Click the action below. It adds a cell that makes a second object,
for a bus ticket, and shows values of both objects.

```{attempt}
:id: bus-not-made
:check: bus-made
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-bus
:title: Add a cell that makes a second object, and run it
:path: {{ notebook }}
:tags: [bus]
:run: true
bus = Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport")
print(coat.description, coat.amount)
print(bus.description, bus.amount)
```

The output is:

```
Winter coat 74.90
Bus ticket 2.80
```

```{verify}
:id: bus-made
:label: The name bus refers to a second object of the class Purchase
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed bus
if type(globals().get("bus")).__name__ == "Purchase" and type(globals().get("coat")).__name__ == "Purchase":
    print("The cell ran. The names coat and bus refer to two objects of one class, and each object has its own values.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it. The cell also needs the object coat from the last page.")
type(globals().get("bus")).__name__ == "Purchase" and type(globals().get("coat")).__name__ == "Purchase"
```

Python ran `__init__` two times, one time for each object. The first
time, `self` was the object that `coat` now refers to. The second
time, `self` was the object that `bus` now refers to. The two objects
have the same four names inside them, and different values.

## Your task: a value is missing

A class finds a mistake when the object is made, and not later. The
cell below tries to make an object for the purchase
`2026-01-03,Bread and milk,6.40,food`. The call gives only three
values, because the amount is missing.

```{cell-insert}
:id: insert-bread
:title: Add the cell with the mistake
:path: {{ notebook }}
:tags: [bread]
:run: false
# The line below gives three values, but a purchase needs four.
bread = Purchase("2026-01-03", "Bread and milk", "food")
print(bread.amount)
```

First run the cell as it is: click on it, hold `Shift` and press
`Enter`. Python stops, and the last line of the error message is:

```
TypeError: Purchase.__init__() missing 1 required positional argument: 'category'
```

Read the message with care. It names the method `__init__`, which
shows that Python called it for you. It says that one argument is
missing. It names `category`, and not `amount`. Python connects the
arguments to the parameters by their position, so the third value,
`"food"`, went to the third parameter after `self`, which is `amount`.
Then no value was left for `category`.

Now correct the line. Add the amount, as a `Decimal`, in the correct
position. Then run the cell again. The output must be:

```
6.40
```

```{hint}
:title: Hint: where the amount goes
The order of the values is the order of the parameters of `__init__`
after `self`: the date, the description, the amount and the category.
The amount goes between `"Bread and milk"` and `"food"`.
```

```{hint}
:title: Hint: how to write the amount
An amount of money is a `Decimal`, made from a string:
`Decimal("6.40")`. Put a comma after it.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: bread-not-started
:check: bread-made
:expect: The name bread does not exist yet
```

````{attempt}
:id: bread-not-an-object
:check: bread-made
:expect: is not an object of the class Purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
bread = ["2026-01-03", "Bread and milk", Decimal("6.40"), "food"]
```
````

````{attempt}
:id: bread-amount-last
:check: bread-made
:expect: The values are in the wrong order

```{cell-insert}
:path: {{ notebook }}
:run: true
bread = Purchase("2026-01-03", "Bread and milk", "food", Decimal("6.40"))
```
````

````{attempt}
:id: bread-amount-float
:check: bread-made
:expect: is a value of the type float

```{cell-insert}
:path: {{ notebook }}
:run: true
bread = Purchase("2026-01-03", "Bread and milk", 6.40, "food")
```
````

````{attempt}
:id: bread-wrong-amount
:check: bread-made
:expect: bread.amount is 6.04 but it must be 6.40

```{cell-insert}
:path: {{ notebook }}
:run: true
bread = Purchase("2026-01-03", "Bread and milk", Decimal("6.04"), "food")
```
````

````{attempt}
:id: bread-wrong-text
:check: bread-made
:expect: Do not change the other three values

```{cell-insert}
:path: {{ notebook }}
:run: true
bread = Purchase("2026-01-03", "Bread", Decimal("6.40"), "food")
```
````

````{hint}
:title: Show me a solution
:unlock: "bread-made" in failed_checks or "bread-made" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-bread-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [bread-solution]
:run: true
bread = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
print(bread.amount)
```
````

```{verify}
:id: bread-made
:label: The object bread holds four correct values
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed bread; cell-executed bread-solution
def _workshop_check():
    from decimal import Decimal
    if "bread" not in globals():
        print("The name bread does not exist yet. Python stops with a TypeError until the call gives four values. Add the amount, Decimal(\"6.40\"), between the description and the category. Then hold Shift and press Enter to run the cell.")
        return False
    bread = globals()["bread"]
    if type(bread).__name__ != "Purchase":
        print(f"The name bread refers to a value of the type {type(bread).__name__}. That is not an object of the class Purchase. Make the object with Purchase and four values between parentheses. Then run the cell again.")
        return False
    amount = getattr(bread, "amount", None)
    category = getattr(bread, "category", None)
    if isinstance(category, Decimal) and not isinstance(amount, Decimal):
        print(f"The values are in the wrong order. bread.amount is {amount!r} and bread.category is {category}. Python connects the values to the parameters by their position, so the amount must be the third value, before the category. Then run the cell again.")
        return False
    if not isinstance(amount, Decimal):
        print(f"bread.amount is {amount!r}, which is a value of the type {type(amount).__name__}. An amount of money must be a Decimal, made from a string: Decimal(\"6.40\"). Then run the cell again.")
        return False
    if amount != Decimal("6.40"):
        print(f"bread.amount is {amount} but it must be 6.40. Correct the amount, and run the cell again.")
        return False
    found = (getattr(bread, "date", None), getattr(bread, "description", None), category)
    if found != ("2026-01-03", "Bread and milk", "food"):
        print(f"The amount is correct, but the date, the description and the category of bread are {found[0]!r}, {found[1]!r} and {found[2]!r}. They must be '2026-01-03', 'Bread and milk' and 'food'. Do not change the other three values. Then run the cell again.")
        return False
    print("Correct. The call now gives four values, and bread.amount is 6.40. Python found the missing value at the moment when the object was made.")
    return True
globals().pop("_workshop_check")()
```

With a dictionary, a missing key is found only when some later line
reads it. With a class, Python stops at the line that makes the
object, so the mistake is found where it was made.
