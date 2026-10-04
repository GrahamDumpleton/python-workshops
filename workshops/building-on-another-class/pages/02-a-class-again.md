---
title: A class, again
requires: [verify:purchase-class]
---

# A class, again

This page says again what a class is. Every other page of this
workshop builds on the class that you make here.

A **class** is a description of a new type of value, written by you.
It says what data each value of that type holds, and what each value
can do. A value made from a class is an **object**.

Think of a paper form with empty boxes. The form is the class. Each
form that someone has filled in is an object. Every filled form has
the same boxes, but each one holds its own values.

Click the action below. It adds a cell with a class for one purchase,
and runs it.

```{attempt}
:id: purchase-class-not-run
:check: purchase-class
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-purchase-class
:title: Add a cell with the class Purchase, and run it
:path: {{ notebook }}
:tags: [purchase-class]
:run: true
from decimal import Decimal

class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def month(self):
        return self.date[:7]

    def label(self):
        return f"{self.description}: {self.amount}"

coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
print(coat.description)
print(coat.amount)
print(coat.month())
print(coat.label())
```

The output is:

```
Winter coat
74.90
2026-01
Winter coat: 74.90
```

```{verify}
:id: purchase-class
:label: The class Purchase exists, and the cell made one purchase
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed purchase-class
if isinstance(globals().get("Purchase"), type) and getattr(globals().get("coat"), "description", None) == "Winter coat":
    print("The cell ran. The class Purchase exists, and the name coat refers to one object of that class.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("Purchase"), type) and getattr(globals().get("coat"), "description", None) == "Winter coat"
```

## What the cell holds

Read the cell from the top.

- `from decimal import Decimal` gets the name `Decimal` from the
  module `decimal`, which comes with Python. A `Decimal` is an exact
  number, so these workshops use it for money. You make one from a
  string: `Decimal("74.90")`.

- `class Purchase:` starts the class. The name of a class begins with
  a capital letter. The lines under it, which begin with four spaces,
  belong to the class.

- Each `def` inside the class is a **method**: a function that
  belongs to a value. The first parameter of every method is `self`.
  Inside a method, `self` is the name for the object that the method
  was called on.

- The method `__init__` is the method that Python calls when an
  object is made. The two underscores on each side of the name mark a
  name that Python itself calls. Here, `__init__` takes the four
  values and keeps each one in the object.

- A value that belongs to an object, and has a name, is an
  **attribute**. The line `self.date = date` gives the object an
  attribute with the name `date`. A purchase has four attributes:
  `date`, `description`, `amount` and `category`.

- `Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")`
  makes an object. Python calls `__init__` with the new object as
  `self`, and with the four values.

- You read an attribute with a dot and no parentheses:
  `coat.description`. You call a method with a dot and parentheses:
  `coat.month()`.

The class has two methods that you use on the next pages. The method
`month()` returns the first seven characters of the date, which are
the year and the month. The method `label()` returns a short text
that describes the purchase.

## Written by hand

The workshop **Objects that explain themselves** showed the line
`@dataclass`. With that line above a class, Python writes the method
`__init__` for you. In this workshop, every class is written by hand,
with its own method `__init__`. The reason is that you need to see
this method on the page **An attribute of its own**, where the
`__init__` of one class calls the `__init__` of another class.
