---
title: "Part 1: a purchase"
requires: [verify:purchase-class]
---

# Part 1: a purchase

From this page on, you write the code. Each page gives you one part of
the program: the goal, what the result must be, and a cell to write
in. No page gives you the code, but every page has hints.

## The goal

Write a class named `Purchase`. One object of this class is one
purchase: one row of Mariam's file. The object holds the four values
of the row, and it has one method, which gives the month of the
purchase.

In the workshop **Where the money went**, a purchase was a dictionary
with four keys. A class is better for three reasons. The four values
have fixed names, so a wrong name is found at once. `print()` shows a
purchase in a form that is clear to read. And the code that works on a
purchase, such as the code that finds its month, is inside the class,
with the data.

## What your code must do

- The cell starts with the two `import` lines of the cell on the page
  before:

  ```python
  from dataclasses import dataclass
  from decimal import Decimal
  ```

- The class is named `Purchase`, and it is a dataclass: the line
  `@dataclass` is directly above the line `class Purchase:`.

- The class has four fields, in this order: `date`, which is a `str`,
  `description`, which is a `str`, `amount`, which is a `Decimal`, and
  `category`, which is a `str`. So a purchase is made like this:
  `Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")`.

- The class has one method, named `month`. Its only parameter is
  `self`. It gives back the month of the purchase, which is the first
  seven characters of the date. For a purchase with the date
  `"2026-01-17"`, `month()` gives back the string `"2026-01"`.

- The method gives the month back with `return`. It does not print it.

- After the class, the cell has three more lines. They make one
  object from the purchase of `2026-01-03` in Mariam's file, and show
  the object and its month:

  ```python
  first_purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
  print(first_purchase)
  print(first_purchase.month())
  ```

When your code is correct, the output under the cell is:

```
Purchase(date='2026-01-03', description='Bread and milk', amount=Decimal('6.40'), category='food')
2026-01
```

You did not write the code that makes the first line of the output.
The line `@dataclass` made Python write the special method `__repr__`
for your class, and `print()` uses that method.

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-purchase
:title: Add a cell for part 1
:path: {{ notebook }}
:tags: [purchase]
:run: false
# Part 1: a purchase. Write your code below this line.

```

Click on the empty line under the comment, and write your code. Then
run the cell: hold `Shift` and press `Enter`. The check at the bottom
of this page runs each time you run the cell. It makes two purchases
of its own from your class, and it tells you what it found.

If you see an error message, or the check does not pass, change your
code and run the cell again. You can try as many times as you like.

## If you need help

```{hint}
:title: Hint: what to look at
The class `Bill` in the cell of the page before has the same shape as
the class that you write here:

- the line `@dataclass`, and under it the line that starts the class

- one line for each field, with four spaces at its start: the name of
  the field, a colon, and the type

- an empty line, and then a method. The line with `def` has four
  spaces at its start, and the body of the method has eight.

Your class has four fields, and `Bill` has two. Your method has only
the parameter `self`, and the method of `Bill` has one more.

The workshop **Working with text** showed how to take a part of a
string. For a string named `text`, the slice `text[:7]` gives its
first seven characters. Inside a method, the date of the purchase is
`self.date`.
```

```{hint}
:title: Hint: the shape of the code
1. Write the two `import` lines from the task.

2. Write `@dataclass` on a line of its own.

3. Directly under it, start the class: `class Purchase:`.

4. Under that line, write the four fields. Each line starts with four
   spaces: `date: str`, then `description: str`, then
   `amount: Decimal`, then `category: str`.

5. Leave one empty line. Then start the method, with four spaces
   before `def`: `def month(self):`.

6. The body of the method has one line, which starts with eight
   spaces. It gives back a slice of the date: `return self.date[:7]`.

7. After the class, at the left side of the cell, write the three
   lines from the task.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

A `NameError` that names `dataclass` or `Decimal` means that an
`import` line is missing. Write the two `import` lines from the task
as the first lines of the cell.

A `TypeError` with the words `Purchase() takes no arguments` means
that Python did not write the method `__init__` for the class. Check
that the line `@dataclass` is directly above the line
`class Purchase:`.

A `TypeError` that says that `month()` takes 0 positional arguments
but 1 was given means that the method has no parameter `self`. Write
`def month(self):`.

An `IndentationError` means that the spaces at the start of a line are
wrong. The fields and the line with `def` start with four spaces. The
body of the method starts with eight spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: purchase-not-started
:check: purchase-class
:expect: The class Purchase does not exist yet
```

````{attempt}
:id: purchase-not-a-class
:check: purchase-class
:expect: The name Purchase is not a class

```{cell-insert}
:path: {{ notebook }}
:run: true
Purchase = {"date": "2026-01-03", "description": "Bread and milk"}
```
````

````{attempt}
:id: purchase-no-decorator
:check: purchase-class
:expect: The most likely reason is that the line @dataclass is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]
```
````

````{attempt}
:id: purchase-three-fields
:check: purchase-class
:expect: The check could not make a purchase from four values

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal

    def month(self):
        return self.date[:7]
```
````

````{attempt}
:id: purchase-init-stops
:check: purchase-class
:expect: Python stopped with an error of the type AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date.text
```
````

````{attempt}
:id: purchase-other-name
:check: purchase-class
:expect: That purchase has no attribute named description

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    text: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]
```
````

````{attempt}
:id: purchase-wrong-order
:check: purchase-class
:expect: The fields must be in this order

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    category: str
    amount: Decimal

    def month(self):
        return self.date[:7]
```
````

````{attempt}
:id: purchase-no-month
:check: purchase-class
:expect: The class Purchase has no method named month yet

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str
```
````

````{attempt}
:id: purchase-month-no-self
:check: purchase-class
:expect: The method month must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month():
        return date[:7]
```
````

````{attempt}
:id: purchase-month-no-self-dot
:check: purchase-class
:expect: uses a name that has no value

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return date[:7]
```
````

````{attempt}
:id: purchase-month-stops
:check: purchase-class
:expect: The method month stopped with an error of the type TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:"7"]
```
````

````{attempt}
:id: purchase-month-prints
:check: purchase-class
:expect: shows the month with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        print(self.date[:7])
```
````

````{attempt}
:id: purchase-month-none
:check: purchase-class
:expect: The method month gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        self.date[:7]
```
````

````{attempt}
:id: purchase-month-whole-date
:check: purchase-class
:expect: gives back the whole date

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date
```
````

````{attempt}
:id: purchase-month-fixed
:check: purchase-class
:expect: but it must give back '2025-11'

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return "2026-01"
```
````

````{attempt}
:id: purchase-not-equal
:check: purchase-class
:expect: Two purchases that hold the same four values are not equal

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
```
````

````{attempt}
:id: purchase-no-first
:check: purchase-class
:expect: The name first_purchase does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]
```
````

````{attempt}
:id: purchase-first-not-object
:check: purchase-class
:expect: does not refer to an object of the class Purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
first_purchase = ("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
```
````

````{attempt}
:id: purchase-first-string-amount
:check: purchase-class
:expect: The amount of first_purchase is the string

```{cell-insert}
:path: {{ notebook }}
:run: true
first_purchase = Purchase("2026-01-03", "Bread and milk", "6.40", "food")
```
````

````{attempt}
:id: purchase-first-other-row
:check: purchase-class
:expect: The name first_purchase refers to the purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
first_purchase = Purchase("2026-01-01", "Rent for January", Decimal("650.00"), "rent")
```
````

````{attempt}
:id: purchase-by-hand
:check: purchase-class
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
        return self.date == other.date and self.description == other.description and self.amount == other.amount and self.category == other.category

    def month(self):
        year_and_month = self.date[0:7]
        return year_and_month

first_purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
print(first_purchase.month())
```
````

````{hint}
:title: Show me a solution
:unlock: "purchase-class" in failed_checks or "purchase-class" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-purchase-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [purchase-solution]
:run: true
from dataclasses import dataclass
from decimal import Decimal

@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]

first_purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
print(first_purchase)
print(first_purchase.month())
```
````

```{verify}
:id: purchase-class
:label: The class Purchase holds one purchase and gives its month
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed purchase; cell-executed purchase-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    missing = object()
    if "Purchase" not in globals():
        print("The class Purchase does not exist yet. Write it under the comment in the new cell, and check the spelling of its name, which begins with a capital letter. Then hold Shift and press Enter to run the cell.")
        return False
    cls = globals()["Purchase"]
    if not isinstance(cls, type):
        print("The name Purchase is not a class. It refers to another kind of value. Write the line @dataclass, and under it start the class with the line class Purchase: Then run the cell again.")
        return False
    names = ["date", "description", "amount", "category"]
    tests = [("2025-11-02", "Tea", Decimal("3.50"), "food"), ("2025-12-09", "Notebook", Decimal("12.00"), "hobbies")]
    calls = ["Purchase(\"2025-11-02\", \"Tea\", Decimal(\"3.50\"), \"food\")", "Purchase(\"2025-12-09\", \"Notebook\", Decimal(\"12.00\"), \"hobbies\")"]
    try:
        inspect.signature(cls).bind(*tests[0])
    except (TypeError, ValueError):
        if all(name in getattr(cls, "__annotations__", {}) for name in names):
            print("The class Purchase has the four fields, but Python did not write the method __init__ for it, so the check could not make a purchase from four values. The most likely reason is that the line @dataclass is missing. Write @dataclass on a line of its own, directly above the line class Purchase: Then run the cell again.")
        else:
            print(f"The check could not make a purchase from four values, with {calls[0]}. The class must have exactly four fields. Under the line class Purchase: write one line for each field, with four spaces at its start: date: str, then description: str, then amount: Decimal, then category: str. Then run the cell again.")
        return False
    made = []
    for values, call in zip(tests, calls):
        try:
            with contextlib.redirect_stdout(io.StringIO()):
                made.append(cls(*values))
        except Exception as error:
            print(f"Python stopped with an error of the type {type(error).__name__} when the check made a purchase with {call}. Run that line in a cell of your own, and read the last line of the error message. Correct the class, and run the cell again.")
            return False
    for thing, values, call in zip(made, tests, calls):
        for name, value in zip(names, values):
            found = getattr(thing, name, missing)
            if found is missing:
                print(f"The check made a purchase with {call}. That purchase has no attribute named {name}. The four fields of the class must have exactly these names: date, description, amount and category. Check the spelling of each one. Then run the cell again.")
                return False
            if found != value:
                print(f"The check made a purchase with {call}. The attribute {name} of that purchase is {found!r}, but it must be {value!r}. The fields must be in this order in the class: date, then description, then amount, then category. Then run the cell again.")
                return False
    results = []
    for thing, values in zip(made, tests):
        method = getattr(thing, "month", missing)
        if not callable(method):
            print("The class Purchase has no method named month yet. Inside the class, under the four fields, leave one empty line. Then write def month(self): with four spaces before def, and write the body under it. Then run the cell again.")
            return False
        try:
            inspect.signature(method).bind()
        except (TypeError, ValueError):
            print("The method month must have exactly one parameter, which is self. The def line must be: def month(self): When you call first_purchase.month(), Python gives self the object that is before the dot. Then run the cell again.")
            return False
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = method()
        except NameError:
            print("The method month stopped because it uses a name that has no value. Inside a method, the date of the purchase is self.date, and not date alone. The body of the method must be: return self.date[:7]. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The method month stopped with an error of the type {type(error).__name__} when the check called it for a purchase with the date {values[0]}. The method must give back the first seven characters of the date: return self.date[:7]. Correct the method, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The method month shows the month with print(), but it does not return it. The code that calls the method then receives None. Replace print() in the body with return, so that the method gives the month back: return self.date[:7]. Then run the cell again.")
            return False
        if result is None:
            print("The method month gives back None. That happens when the body has no return line. Start the last line of the body with the word return: return self.date[:7]. Then run the cell again.")
            return False
        if result == values[0]:
            print(f"The method month gives back the whole date, {result!r}. It must give back only the month, which is the first seven characters of the date. Use a slice: return self.date[:7]. Then run the cell again.")
            return False
        results.append(result)
    for result, values in zip(results, tests):
        if result != values[0][:7]:
            print(f"For a purchase with the date {values[0]}, the method month gives back {result!r}, but it must give back {values[0][:7]!r}. The method must read the date of its own purchase, and give back the first seven characters: return self.date[:7]. Then run the cell again.")
            return False
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            same = bool(cls(*tests[0]) == made[0])
    except Exception:
        same = False
    if not same:
        print("Two purchases that hold the same four values are not equal when the check compares them with ==. The line @dataclass makes Python write the special method __eq__, which compares the attributes. Write the class as a dataclass: the line @dataclass, the line class Purchase: and then the four fields. Then run the cell again.")
        return False
    if "first_purchase" not in globals():
        print("The class Purchase is correct. The name first_purchase does not exist yet. After the class, at the left side of the cell, add the three lines from the task. The first one is: first_purchase = Purchase(\"2026-01-03\", \"Bread and milk\", Decimal(\"6.40\"), \"food\"). Then run the cell again.")
        return False
    first = globals()["first_purchase"]
    if not isinstance(first, cls):
        print("The class Purchase is correct. The name first_purchase does not refer to an object of the class Purchase as it is now. After the class, in the same cell, make the object with this line: first_purchase = Purchase(\"2026-01-03\", \"Bread and milk\", Decimal(\"6.40\"), \"food\"). Then run the whole cell again.")
        return False
    if isinstance(getattr(first, "amount", None), str):
        print(f"The class Purchase is correct. The amount of first_purchase is the string {first.amount!r}, and a string cannot be added to a total. Make a Decimal value from the string: first_purchase = Purchase(\"2026-01-03\", \"Bread and milk\", Decimal(\"6.40\"), \"food\"). Then run the cell again.")
        return False
    try:
        right = first.date == "2026-01-03" and first.description == "Bread and milk" and round(float(first.amount), 2) == 6.4 and first.category == "food"
    except Exception:
        right = False
    if not right:
        print(f"The class Purchase is correct. The name first_purchase refers to the purchase {getattr(first, 'description', None)!r} of {getattr(first, 'date', None)!r}, but it must hold the purchase of 2026-01-03. Make it with this line: first_purchase = Purchase(\"2026-01-03\", \"Bread and milk\", Decimal(\"6.40\"), \"food\"). Then run the cell again.")
        return False
    print("Correct. The class Purchase makes a purchase from four values, and the method month gives back the month of the purchase. For first_purchase that is 2026-01.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

You have a new type of value. A `Purchase` object holds the four values
of one row under four fixed names, and it can tell you its month. The
other parts of the program use this class for every purchase.
