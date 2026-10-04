---
title: A class and its objects
requires: [verify:purchase-class-ran]
---

# A class and its objects

This page says again what a class is, with one example. The rest of
the workshop builds on this example.

The **type** of a value is the kind of value that it is, such as a
string or a list. A **class** is a description of a new type of
value, written by you. It says what data each value of that type holds, and what each value
can do. An **object** is a value made from a class.

Think of an empty form and the forms that people have filled in. The
empty form is the class: it says which boxes exist. Each filled form
is an object: it has the same boxes, with its own values in them.

The example is one purchase from a list of spending. A purchase has
four pieces of data: the date, a description, the amount of money and
a category. Click the action below. It adds a cell that defines the
class `Purchase`, makes one object and uses it.

```{attempt}
:id: purchase-class-not-run
:check: purchase-class-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-purchase-class
:title: Add a cell that defines the class Purchase and makes one object, and run it
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

bread = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
print(bread.description)
print(bread.amount)
print(bread.month())
```

The output is:

```
Bread and milk
6.40
2026-01
```

```{verify}
:id: purchase-class-ran
:label: The cell defined the class Purchase and made one object
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed purchase-class
if isinstance(globals().get("Purchase"), type) and getattr(globals().get("bread"), "description", None) == "Bread and milk":
    print("The cell ran. Python knows the class Purchase, and the name bread refers to one object of that class.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("Purchase"), type) and getattr(globals().get("bread"), "description", None) == "Bread and milk"
```

Read the cell part by part.

1. `from decimal import Decimal` gets the name `Decimal` from the
   module `decimal`. A module is a file of Python code that someone
   has already written, and this one comes with Python. A `Decimal` is an exact
   number, and you make one from a string: `Decimal("6.40")`. These
   workshops keep every amount of money as a `Decimal`.

2. `class Purchase:` begins the class. The name of a class begins
   with a capital letter. The lines under it, which begin with
   spaces, belong to the class.

3. A **method** is a function that belongs to a value. A function
   that you write inside a class is a method of every object of that
   class. The first parameter of a method is `self`. Inside a method,
   `self` is the name for the object that the method was called on.

4. `__init__` is the method that Python calls when an object is made.
   The two underscores on each side mark a name that Python itself
   calls. A method with such a name is a **special method**: you
   write it, and Python decides when to call it.

5. An **attribute** is a value that belongs to an object, with a
   name. The line `self.date = date` gives the new object an
   attribute with the name `date`. The method `__init__` gives each
   object four attributes.

6. `Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")`
   makes an object. Python calls `__init__` with the new object as
   `self`, and with the four values. The name `bread` then refers to
   the object.

7. `bread.description` reads an attribute: a dot and the name, with
   no parentheses. `bread.month()` calls a method: a dot, the name,
   and parentheses. The method `month()` returns the first seven
   characters of the date, which are the year and the month.

Programmers also say **instance** for an object: `bread` is an
instance of the class `Purchase`. Python's documentation and some
error messages use that word. These workshops say "object".

The class works. But one thing about it is not good yet, and the
next page shows what it is.
