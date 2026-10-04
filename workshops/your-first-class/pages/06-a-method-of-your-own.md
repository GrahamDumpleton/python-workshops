---
title: A method of your own
requires: [verify:month-shown, verify:year-method]
---

# A method of your own

A method is a function that belongs to a value. The class `Purchase`
has one method now, `__init__`, which Python calls for you. On this
page the class gets methods that you call yourself.

## Why a class has methods

The date of a purchase is a string such as `"2026-01-17"`. Its first
seven characters, `"2026-01"`, are the year and the month. The slice
`[:7]` gives them. A report of spending for each month needs this
value for every purchase.

You can write `coat.date[:7]` in every place that needs the month.
But then every place must know how the date is written. A method
puts that knowledge in one place, inside the class. Every other part
of the program asks the purchase for its month, with `coat.month()`.

In the comparison with a paper form, a method is an instruction that
is printed on the form: "to find the month, read the first seven
characters of the date". Every completed form carries the instruction,
and the instruction works with the values of that form.

## How a method is written

A method is written with `def`, like every function. Two things are
different:

- It is inside the class, so its `def` line begins with four spaces,
  and its body begins with eight spaces.

- Its first parameter is `self`, the name for the object that the
  method was called on. The body reads the attributes of that object
  through `self`.

```python
    def month(self):
        return self.date[:7]
```

When you run the cell of a class again, Python makes a new class with
the same name. Objects that were made before still belong to the old
class, so they do not have the new method. For this reason, the cell
below also makes the object `coat` again.

```{attempt}
:id: month-not-shown
:check: month-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-month
:title: Add a cell with the method month, and run it
:path: {{ notebook }}
:tags: [month]
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def month(self):
        return self.date[:7]

coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
coat_month = coat.month()
print(coat_month)
```

The output is:

```
2026-01
```

```{verify}
:id: month-shown
:label: The method month gave the month of the coat
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed month
if globals().get("coat_month") == "2026-01":
    print("The cell ran. The call coat.month() returned the string 2026-01.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("coat_month") == "2026-01"
```

## What happened

The call is `coat.month()`. It has the object, a dot, the name of the
method, and a pair of parentheses. The parentheses are empty.

Python called the method `month` and made `self` refer to the object
`coat`. The object before the dot becomes `self`. This is why the
call has no argument, and the `def` line has one parameter.

Inside the method, `self.date` is the attribute `date` of that
object, `"2026-01-17"`. The slice `[:7]` gives `"2026-01"`, and
`return` gives that string back to the cell.

## Your task

Write a second method for the class.

- Its name is `year`.

- It has one parameter, `self`.

- It returns the year of the purchase: the first four characters of
  the attribute `date`, as a string.

Two examples:

| The attribute `date` of the object | What the method `year` returns |
|------|------|
| `"2026-01-17"` | `"2026"` |
| `"2025-12-31"` | `"2025"` |

The action below adds a cell that holds the whole class so far. A
comment at the end of the class marks the place for your method.

```{cell-insert}
:id: insert-year
:title: Add a cell with the class, for my method
:path: {{ notebook }}
:tags: [year]
:run: false
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def month(self):
        return self.date[:7]

    # Write the method year below this line. Begin its first line with four spaces.

```

Click on the empty line under the comment, and type your method. The
`def` line begins with four spaces, so that the method is inside the
class. The line of the body begins with eight spaces. Then run the
cell: hold `Shift` and press `Enter`. The cell shows nothing, because
it only defines the class.

To see your method work, add the next cell and run it yourself. It
makes the object `coat` again, from your new class, and calls your
method. The output must be `2026`.

```{cell-insert}
:id: insert-try-year
:title: Add a cell that calls my method
:path: {{ notebook }}
:tags: [try-year]
:run: false
coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
print(coat.year())
```

```{hint}
:title: Hint: how to begin
Look at the method `month`, which is in the same cell. Your method
has the same form. Its first line is `def year(self):`, with four
spaces before `def`.
```

```{hint}
:title: Hint: the body
The body is one line, with eight spaces before it. It returns a slice
of `self.date`. The slice `[:7]` gives the first seven characters.
You need the first four characters.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first.

An `AttributeError` that says the object has no attribute `year`
means that the class has no method with that name. Check the spelling.
Check that the `def` line begins with four spaces. Check that you ran
the cell of the class after you typed the method.

A `TypeError` that says the method takes 0 arguments but 1 was given
means that `self` is missing between the parentheses of the `def`
line.

An `IndentationError` means that the spaces are wrong. The `def` line
needs four spaces, and the line under it needs eight spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: year-not-started
:check: year-method
:expect: The class Purchase has no method with the name year yet
```

````{attempt}
:id: year-outside
:check: year-method
:expect: but it is outside the class

```{cell-insert}
:path: {{ notebook }}
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
```
````

````{attempt}
:id: year-init-changed
:check: year-method
:expect: The check cannot make an object of your class with four values

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date):
        self.date = date

    def year(self):
        return self.date[:4]
```
````

````{attempt}
:id: year-no-self
:check: year-method
:expect: has no parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def month(self):
        return self.date[:7]

    def year():
        return date[:4]
```
````

````{attempt}
:id: year-two-parameters
:check: year-method
:expect: has 2 parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def month(self):
        return self.date[:7]

    def year(self, date):
        return date[:4]
```
````

````{attempt}
:id: year-error
:check: year-method
:expect: stopped with an error of the type NameError

```{cell-insert}
:path: {{ notebook }}
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
        return date[:4]
```
````

````{attempt}
:id: year-prints
:check: year-method
:expect: shows the year with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
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
        print(self.date[:4])
```
````

````{attempt}
:id: year-no-return
:check: year-method
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

    def month(self):
        return self.date[:7]

    def year(self):
        text = self.date[:4]
```
````

````{attempt}
:id: year-wrong-slice
:check: year-method
:expect: year() gives '2026-01' but it must give '2026'

```{cell-insert}
:path: {{ notebook }}
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
        return self.date[:7]
```
````

````{attempt}
:id: year-fixed
:check: year-method
:expect: year() gives '2026' but it must give '2025'

```{cell-insert}
:path: {{ notebook }}
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
        return "2026"
```
````

````{hint}
:title: Show me a solution
:unlock: "year-method" in failed_checks or "year-method" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds the
whole class with a working method `year`, and two lines that use it.
The action runs the cell. Compare it with your own cell.

```{cell-insert}
:id: insert-year-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [year-solution]
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

coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
print(coat.year())
```
````

```{verify}
:id: year-method
:label: Your method year returns the year of a purchase
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed year; cell-executed try-year; cell-executed year-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    cls = globals().get("Purchase")
    method = getattr(cls, "year", None) if isinstance(cls, type) else None
    if method is None and callable(globals().get("year")):
        print("A function with the name year exists, but it is outside the class. Its def line probably begins without spaces. Give the def line four spaces and the line of the body eight spaces, so that the method is inside the class Purchase. Then run the cell again.")
        return False
    if not callable(method):
        print("The class Purchase has no method with the name year yet. Write the method under the comment at the end of the class. Its first line is def year(self): with four spaces before it. Then hold Shift and press Enter to run the cell.")
        return False
    try:
        count = len(inspect.signature(method).parameters)
    except (TypeError, ValueError):
        count = 1
    if count == 0:
        print("The method year has no parameter. Every method needs self as its first parameter, because Python gives the object to the method through it. Write def year(self): and read the date as self.date. Then run the cell again.")
        return False
    if count != 1:
        print(f"The method year has {count} parameters, but it needs only one, self. The date is already in the object, and the method reads it as self.date. Write def year(self): and run the cell again.")
        return False
    shown = io.StringIO()
    try:
        inspect.signature(cls).bind("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
        with contextlib.redirect_stdout(shown):
            first = cls("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
            second = cls("2025-12-31", "Calendar", Decimal("4.20"), "hobbies")
    except Exception:
        print("The check cannot make an object of your class with four values. The method __init__ must stay as the page gave it, with the parameters self, date, description, amount and category. Add the cell with the class again, and write your method in the new cell.")
        return False
    try:
        with contextlib.redirect_stdout(shown):
            first_year = first.year()
            second_year = second.year()
    except Exception as error:
        print(f"The method year stopped with an error of the type {type(error).__name__} when the check called it. Inside a method, an attribute is read through self, as in self.date. Correct the body of the method, and run the cell again.")
        return False
    if first_year is None and shown.getvalue().split() == ["2026", "2025"]:
        print("The method year shows the year with print(), but it does not return it. The code that calls the method needs the value. Replace print( ... ) with a return line. Then run the cell again.")
        return False
    if first_year is None:
        print("The method year returns nothing. A method with no return line gives None. The last line of the body must begin with return, and give the first four characters of self.date. Then run the cell again.")
        return False
    if first_year != "2026":
        print(f"For a purchase with the date 2026-01-17, year() gives {first_year!r} but it must give '2026'. Return the first four characters of self.date, as a string. The slice for that is [:4]. Then run the cell again.")
        return False
    if second_year != "2025":
        print(f"For a purchase with the date 2025-12-31, year() gives {second_year!r} but it must give '2025'. The method must read the date of its own object, self.date, and not use a fixed value. Then run the cell again.")
        return False
    print("Correct. For the dates 2026-01-17 and 2025-12-31, your method year returns '2026' and '2025'.")
    return True
globals().pop("_workshop_check")()
```

You wrote a method. Every object of the class `Purchase` that is made
from now on can give its year.
