---
title: A class and an object
requires: [verify:class-defined, verify:coat-made, verify:type-shown]
---

# A class and an object

A class is a description of a new type of value. An object is a value
made from a class. On this page you see both. The class is short, and
the next page explains its lines one by one. For now, look at its
form.

```python
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category
```

The first line has three parts:

1. The word `class`. It tells Python that the description of a new
   type begins here.

2. The name of the class, `Purchase`. You choose the name. The name
   of a class begins with a capital letter. This is how a reader can
   tell a class from a function or from any other name.

3. A colon, `:`.

The lines under the first line belong to the class. Each of them
begins with four spaces, in the same way as the body of a function.

Inside the class there is a function, with the name `__init__`. It
has four names after `self`: `date`, `description`, `amount` and
`category`. These are the four things that every purchase holds.

Click the action below. It adds a cell with the class, and runs it.

```{attempt}
:id: class-not-defined
:check: class-defined
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-class
:title: Add a cell that defines the class Purchase, and run it
:path: {{ notebook }}
:tags: [class]
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category
```

The cell shows nothing. A cell that defines a class is like a cell
that defines a function: Python records the description, and makes
nothing yet. The empty form now exists, and nobody has completed one.

```{verify}
:id: class-defined
:label: Python knows the class Purchase
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed class
if isinstance(globals().get("Purchase"), type):
    print("The cell ran. Python now knows the class Purchase. No object exists yet.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("Purchase"), type)
```

## Make an object

To make an object, you write the name of the class and a pair of
parentheses, like a call of a function. Between the parentheses you
give the four values, in the order of the names in the class: the
date, the description, the amount and the category.

```python
coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
```

This line makes one object and makes the name `coat` refer to it. The
object holds the four values.

Each value that an object holds has a name. To read one, you write
the name of the object, a dot, and the name of the value:
`coat.description`. There are no parentheses and no quotes.

```{attempt}
:id: coat-not-made
:check: coat-made
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-coat
:title: Add a cell that makes an object and reads two of its values, and run it
:path: {{ notebook }}
:tags: [coat]
:run: true
coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
print(coat.description)
print(coat.amount)
```

The output is:

```
Winter coat
74.90
```

```{verify}
:id: coat-made
:label: The name coat refers to an object of the class Purchase
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed coat
if type(globals().get("coat")).__name__ == "Purchase":
    print("The cell ran. The name coat refers to an object of the class Purchase, and the object holds four values.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("coat")).__name__ == "Purchase"
```

## What happened

Python read `Purchase(...)` and made a new, empty object. Then it ran
the function `__init__` inside the class, which stored the four
values in the object. Then the name `coat` was made to refer to the
object.

The purchase is now one thing. You can give it to a function, or put
it in a list, as one value. Its four parts go with it.

## The type of the object

The function `type()` gives the type of a value. For example,
`type(5)` is the type of integers, and Python shows it as
`<class 'int'>`. Click the action below to ask for the type of `coat`,
and then to show `coat` itself.

```{attempt}
:id: type-not-shown
:check: type-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-type
:title: Add a cell that shows the type of the object and the object, and run it
:path: {{ notebook }}
:tags: [type]
:run: true
print(type(coat))
print(coat)
```

The output looks like this:

```
<class '__main__.Purchase'>
<__main__.Purchase object at 0x...>
```

```{verify}
:id: type-shown
:label: The cell that shows the type has run
:substrate: contents
:trigger: cell-executed type
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} type
```

The first line says that the type of `coat` is your class, `Purchase`.
The word `__main__` is the name that Python gives to the place where
your notebook's code runs. You can ignore it.

The second line is what `print()` shows for an object when the class
does not say what to show. It names the class, and then a number that
begins with `0x`. The number is different each time, so your output
has other characters in place of the three dots. This line does not
tell you which purchase it is. The next workshop, **Objects that
explain themselves**, changes that.

Programmers also say **instance** for an object: `coat` is an
instance of the class `Purchase`. Python's documentation and some
error messages use that word. These workshops say "object".
