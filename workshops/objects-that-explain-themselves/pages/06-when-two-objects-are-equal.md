---
title: When two objects are equal
requires: [verify:shop-eq-ran, verify:eq-method]
---

# When two objects are equal

A class can say when two of its objects are equal. It says this with
a special method that has the name `__eq__`. The name is short for
"equal".

The method `__eq__` has two parameters: `self` and `other`. When
Python reads `a == b`, it calls the method with the object on the
left, `a`, as `self`, and the object on the right, `b`, as `other`.
The method returns `True` when the two objects are equal, and
`False` when they are not. The result of `a == b` is that return
value.

As with `__repr__`, you never call this method yourself. You write
`==`, and Python calls the method.

Think of the two paper forms again. To decide whether two forms say
the same thing, a person needs a rule: which boxes to compare. The
method `__eq__` is that rule, written in code.

## An example

Click the action below. It adds a cell that defines the class `Shop`
again, now with the method `__eq__`. Two shops are equal when they
have the same name and the same town.

```{attempt}
:id: shop-eq-not-run
:check: shop-eq-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-shop-eq
:title: Add a cell that defines a class with the method __eq__, and run it
:path: {{ notebook }}
:tags: [shop-eq]
:run: true
class Shop:
    def __init__(self, name, town):
        self.name = name
        self.town = town

    def __repr__(self):
        return f"Shop(name={self.name!r}, town={self.town!r})"

    def __eq__(self, other):
        return self.name == other.name and self.town == other.town

first_shop = Shop("Green Market", "Nairobi")
second_shop = Shop("Green Market", "Nairobi")
third_shop = Shop("Green Market", "Mombasa")
print(first_shop == second_shop)
print(first_shop == third_shop)
print(first_shop is second_shop)
```

The output is:

```
True
False
False
```

```{verify}
:id: shop-eq-ran
:label: The cell defined the class Shop with the method __eq__
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shop-eq
if getattr(globals().get("first_shop"), "town", None) == "Nairobi" and getattr(globals().get("third_shop"), "town", None) == "Mombasa":
    print("The cell ran. Python called the method __eq__ for each == in the cell.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
getattr(globals().get("first_shop"), "town", None) == "Nairobi" and getattr(globals().get("third_shop"), "town", None) == "Mombasa"
```

Read the output line by line.

1. `first_shop == second_shop` is `True`. Python called `__eq__`
   with `first_shop` as `self` and `second_shop` as `other`. Both
   names are equal and both towns are equal, so the method returned
   `True`.

2. `first_shop == third_shop` is `False`. The names are equal, but
   the towns are different. The word `and` gives `True` only when
   both comparisons are `True`.

3. `first_shop is second_shop` is `False`. The method `__eq__`
   changes what `==` does. It does not change `is`. The two names
   still refer to two objects.

The method compares the attributes one by one. Each attribute here
is a string, and Python already knows how to compare two strings.

This method expects that `other` is also a `Shop`. That is enough
for this workshop.

## Your task

Write the method `__eq__` for the class `Purchase`.

- The method has two parameters, `self` and `other`.

- It returns `True` when all four attributes of `self` are equal to
  the same attributes of `other`: `date`, `description`, `amount`
  and `category`.

- It returns `False` when one or more of the four attributes are
  different.

| The two purchases | The result of `==` |
|-------------------|--------------------|
| the same date, description, amount and category | `True` |
| the same date, amount and category, but another description | `False` |

Click the action below. It adds a cell that holds the whole class,
with the method `__repr__` already written, and with a comment at the
place for your method. Under the class, the cell makes three objects
and compares them.

```{cell-insert}
:id: insert-eq-method
:title: Add a cell that holds the class Purchase, for my method
:path: {{ notebook }}
:tags: [eq-method]
:run: false
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def month(self):
        return self.date[:7]

    def __repr__(self):
        return f"Purchase(date={self.date!r}, description={self.description!r}, amount={self.amount!r}, category={self.category!r})"

    # Write the method __eq__ on the empty line below this comment.

first_coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
second_coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
bus_fare = Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport")
print(first_coat == second_coat)
print(first_coat == bus_fare)
```

Click on the empty line under the comment, and type your method. The
`def` line begins with four spaces, and the lines under it begin
with eight spaces. Then run the cell: hold `Shift` and press
`Enter`.

When your method is correct, the output under the cell is:

```
True
False
```

Before you write the method, the output is `False` two times.

The cell makes the objects again after the class, because an object
that was made before belongs to the old class, which does not have
your method.

```{hint}
:title: Hint: the shape of the method
Look at the method `__eq__` of the class `Shop` in the cell above.
Your method has the same shape. The first line is
`def __eq__(self, other):`. The body is one `return` line.
```

```{hint}
:title: Hint: the comparisons
The `return` line has four comparisons, one for each attribute, with
the word `and` between them. Here is the line with the first two
comparisons only:

`return self.date == other.date and self.description == other.description`

Add the comparisons for `amount` and `category` in the same way. The
line is long. That is not a mistake.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: eq-not-started
:check: eq-method
:expect: has no method __eq__ yet
```

````{attempt}
:id: eq-no-class
:check: eq-method
:expect: The class Purchase does not exist

```{cell-insert}
:path: {{ notebook }}
:run: true
del Purchase
```
````

````{attempt}
:id: eq-not-a-class
:check: eq-method
:expect: its value is not a class

```{cell-insert}
:path: {{ notebook }}
:run: true
Purchase = "Winter coat"
```
````

````{attempt}
:id: eq-dataclass
:check: eq-method
:expect: is a dataclass

```{cell-insert}
:path: {{ notebook }}
:run: true
from dataclasses import dataclass

@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str
```
````

````{attempt}
:id: eq-init-changed
:check: eq-method
:expect: must keep its four parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount):
        self.date = date
        self.description = description
        self.amount = amount

    def __eq__(self, other):
        return self.date == other.date
```
````

````{attempt}
:id: eq-init-stops
:check: eq-method
:expect: when the check made a purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amout
        self.category = category

    def __eq__(self, other):
        return self.date == other.date
```
````

````{attempt}
:id: eq-no-other
:check: eq-method
:expect: must have exactly two parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self):
        return True
```
````

````{attempt}
:id: eq-stops
:check: eq-method
:expect: stopped with an error of the type AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        return self.date == other.date and self.description == other.descripton
```
````

````{attempt}
:id: eq-prints
:check: eq-method
:expect: shows the result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        print(self.date == other.date and self.description == other.description and self.amount == other.amount and self.category == other.category)
```
````

````{attempt}
:id: eq-no-return
:check: eq-method
:expect: A method with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        equal = self.date == other.date and self.description == other.description
```
````

````{attempt}
:id: eq-not-a-boolean
:check: eq-method
:expect: but it must give True or False

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        return "equal"
```
````

````{attempt}
:id: eq-uses-is
:check: eq-method
:expect: gives False for two purchases that have the same four values

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        return self is other
```
````

````{attempt}
:id: eq-one-attribute
:check: eq-method
:expect: differ only in the date

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        return self.description == other.description
```
````

````{attempt}
:id: eq-three-attributes
:check: eq-method
:expect: differ only in the category

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        return self.date == other.date and self.description == other.description and self.amount == other.amount
```
````

````{attempt}
:id: eq-with-or
:check: eq-method
:expect: differ only in the date

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        return self.date == other.date or self.description == other.description or self.amount == other.amount or self.category == other.category
```
````

````{attempt}
:id: eq-stops-later
:check: eq-method
:expect: with a different date

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        if self.date != other.date:
            return Flase
        return self.description == other.description and self.amount == other.amount and self.category == other.category
```
````

````{attempt}
:id: eq-with-if
:check: eq-method
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __eq__(self, other):
        if self.date != other.date:
            return False
        if self.description != other.description:
            return False
        if self.amount != other.amount:
            return False
        return self.category == other.category
```
````

````{hint}
:title: Show me a solution
:unlock: "eq-method" in failed_checks or "eq-method" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds
the whole class with a working method, and the action runs it.
Compare it with your own cell.

The solution has parentheses around the four comparisons. Inside
parentheses, one expression can continue over several lines, so each
comparison has a line of its own.

```{cell-insert}
:id: insert-eq-method-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [eq-method-solution]
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def month(self):
        return self.date[:7]

    def __repr__(self):
        return f"Purchase(date={self.date!r}, description={self.description!r}, amount={self.amount!r}, category={self.category!r})"

    def __eq__(self, other):
        return (
            self.date == other.date
            and self.description == other.description
            and self.amount == other.amount
            and self.category == other.category
        )

first_coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
second_coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
bus_fare = Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport")
print(first_coat == second_coat)
print(first_coat == bus_fare)
```
````

```{verify}
:id: eq-method
:label: Your method __eq__ says when two purchases are equal
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed eq-method; cell-executed eq-method-solution
def _workshop_check():
    import contextlib, dataclasses, decimal, inspect, io
    if "Purchase" not in globals():
        print("The class Purchase does not exist. Click the action on this page that adds the cell with the class Purchase. Write your method under the comment in that cell. Then hold Shift and press Enter to run the cell.")
        return False
    cls = globals()["Purchase"]
    if not isinstance(cls, type):
        print("The name Purchase exists, but its value is not a class. Run the cell on this page that begins with the line class Purchase: so that the name refers to the class again.")
        return False
    if dataclasses.is_dataclass(cls):
        print("The class Purchase that Python knows now is a dataclass, which comes from a later page of this workshop. This check is for the class that you write by hand. Run your cell on this page again, and then click Check.")
        return False
    if "__eq__" not in vars(cls):
        print("The class Purchase has no method __eq__ yet. Write the method under the comment in the new cell. Its first line is def __eq__(self, other): with four spaces before the word def, and with two underscores on each side of eq. Then hold Shift and press Enter to run the cell.")
        return False
    method = vars(cls)["__eq__"]
    try:
        inspect.signature(cls).bind("2026-01-05", "Bus ticket", decimal.Decimal("2.80"), "transport")
    except TypeError:
        print("The method __init__ of the class Purchase must keep its four parameters after self: date, description, amount and category. Do not change the method __init__. Make it the same as the method __init__ in the first cell of your notebook, and run the cell again.")
        return False
    except ValueError:
        pass
    try:
        count = len(inspect.signature(method).parameters)
    except (TypeError, ValueError):
        count = 2
    if count != 2:
        found = "no parameter" if count == 0 else "1 parameter" if count == 1 else f"{count} parameters"
        print(f"The method __eq__ must have exactly two parameters, self and other, but it has {found}. Python gives the object on the left of == to self, and the object on the right to other. Make the first line of the method def __eq__(self, other): and run the cell again.")
        return False
    base = ("2026-02-14", "Dinner at a restaurant", decimal.Decimal("36.50"), "food")
    changes = [
        ("date", ("2026-02-15", base[1], base[2], base[3])),
        ("description", (base[0], "Dinner with friends", base[2], base[3])),
        ("amount", (base[0], base[1], decimal.Decimal("36.60"), base[3])),
        ("category", (base[0], base[1], base[2], "hobbies")),
    ]
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown):
            left = cls(*base)
            right = cls(*base)
            others = [(name, cls(*values)) for name, values in changes]
    except Exception as error:
        print(f"Python stopped with an error of the type {type(error).__name__} when the check made a purchase. The mistake is in the method __init__. Make it the same as the method __init__ in the first cell of your notebook, and run the cell again.")
        return False
    try:
        with contextlib.redirect_stdout(shown):
            result = method(left, right)
    except Exception as error:
        print(f"The method __eq__ stopped with an error of the type {type(error).__name__} when the check compared two purchases. An AttributeError means that a name after self. or after other. is not the name of an attribute: check the spelling of date, description, amount and category. Correct the method, and run the cell again.")
        return False
    if result is None and shown.getvalue().strip():
        print("The method __eq__ shows the result with print(), but it does not return it. Python needs True or False as the return value of the method. Replace print() in the method with the word return, and run the cell again.")
        return False
    if result is None:
        print("The method __eq__ gives None but it must give True or False. A method with no return line gives None. Begin the line that compares the attributes with the word return, and run the cell again.")
        return False
    if not isinstance(result, bool):
        print(f"The method __eq__ gives {result!r} but it must give True or False. Return the result of the comparisons: self.date == other.date and the same for the other three attributes, with the word and between them. Then run the cell again.")
        return False
    if result is not True:
        print("The method __eq__ gives False for two purchases that have the same four values, but it must give True. Compare the attributes of self with the attributes of other, for example self.date == other.date. Do not compare the two objects with is or with ==. Then run the cell again.")
        return False
    for name, other in others:
        try:
            with contextlib.redirect_stdout(shown):
                result = method(left, other)
        except Exception as error:
            print(f"The method __eq__ stopped with an error of the type {type(error).__name__} when the check compared two purchases with a different {name}. Read the method again, correct it, and run the cell again.")
            return False
        if result is not False:
            print(f"The method __eq__ gives {result!r} for two purchases that differ only in the {name}, but it must give False. The method must compare all four attributes: date, description, amount and category. Write one comparison for each attribute, with the word and between them. Then run the cell again.")
            return False
    print("Correct. Your method __eq__ gives True for two purchases with the same four values, and False when one of the four values is different.")
    return True
globals().pop("_workshop_check")()
```

Your class now has three special methods: `__init__`, `__repr__` and
`__eq__`. Count the lines of the class in your cell. Most of them
repeat the names `date`, `description`, `amount` and `category`.
Each of the three methods names all four attributes.

Almost every class that holds data needs these same three methods.
The next page shows how Python can write them for you.
