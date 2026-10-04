---
title: Text that describes an object
requires: [verify:shop-repr-ran, verify:repr-method, verify:january-list-ran]
---

# Text that describes an object

A class can say what text describes each of its objects. It says
this with a special method that has the name `__repr__`. The name is
short for "representation": a text that represents the object.

The method `__repr__` has one parameter, `self`, and it returns a
string. You never call it yourself. Python calls it each time it
needs a text for the object: when you print the object, when you
print a list that holds the object, and when the object is the last
line of a cell.

This is the label on the box. You write the label one time, in the
class, and every object of the class has it.

## An example

Click the action below. It adds a cell with a small class, `Shop`,
that has the method `__repr__`. A shop has two attributes: its name
and its town.

```{attempt}
:id: shop-repr-not-run
:check: shop-repr-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-shop-repr
:title: Add a cell that defines a class with the method __repr__, and run it
:path: {{ notebook }}
:tags: [shop-repr]
:run: true
class Shop:
    def __init__(self, name, town):
        self.name = name
        self.town = town

    def __repr__(self):
        return f"Shop(name={self.name!r}, town={self.town!r})"

market = Shop("Green Market", "Nairobi")
print(market)
```

The output is:

```
Shop(name='Green Market', town='Nairobi')
```

```{verify}
:id: shop-repr-ran
:label: The cell defined the class Shop and printed one object
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shop-repr
if isinstance(globals().get("Shop"), type) and getattr(globals().get("market"), "town", None) == "Nairobi":
    print("The cell ran. Python called the method __repr__ of the object, and print() showed the string that the method returned.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("Shop"), type) and getattr(globals().get("market"), "town", None) == "Nairobi"
```

The text now says which shop this is. Here is what happened.

1. `print(market)` needed a text for the object `market`.

2. Python called the method `__repr__`, with `market` as `self`.

3. The method returned a string, and `print()` showed that string.

The method builds the string with an f-string. An f-string is a
string that begins with the letter `f`, and Python replaces each
part between braces with a value.

There is one new piece of syntax: the `!r` after each name.
`{self.name!r}` puts the value in the text in the form that you
write in code, so a string gets its quotes: `'Green Market'`.
`{self.name}`, without `!r`, puts only the characters in the text:
`Green Market`.

The quotes are useful. They show that the value is a string, and
they show where the string begins and ends.

Programmers write the text of `__repr__` so that it looks like the
code that makes the object: the name of the class, and then each
attribute with its value, between parentheses. A person who reads
this text knows the class and every value.

The method must return the string. It must not print it. Python
takes the return value and decides what to do with it.

Python has a second special method for text, `__str__`, for text
that is written for the user of a program. When a class has no
`__str__`, `print()` uses `__repr__`. These workshops write
`__repr__` only.

## Your task

Write the method `__repr__` for the class `Purchase`.

- The method has one parameter, `self`.

- It returns a string that holds the name of the class and the four
  attributes with their values, in this order: `date`, `description`,
  `amount`, `category`.

- Each value is in the form that you write in code, so use `!r` for
  each one.

For the winter coat that Mariam bought on 2026-01-17, the string
must be exactly this:

```
Purchase(date='2026-01-17', description='Winter coat', amount=Decimal('74.90'), category='clothes')
```

The amount is a `Decimal`, and the form of a `Decimal` that you
write in code is `Decimal('74.90')`. The `!r` gives you that form.
You do not need to write the word `Decimal` in your f-string.

Click the action below. It adds a cell that holds the whole class,
with a comment at the place for your method. Under the class, the
cell makes one object and prints it.

```{cell-insert}
:id: insert-repr-method
:title: Add a cell that holds the class Purchase, for my method
:path: {{ notebook }}
:tags: [repr-method]
:run: false
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def month(self):
        return self.date[:7]

    # Write the method __repr__ on the empty line below this comment.

winter_coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
print(winter_coat)
```

Click on the empty line under the comment, and type your method.
The `def` line begins with four spaces, so that the method is inside
the class. The line under it begins with eight spaces. Then run the
cell: hold `Shift` and press `Enter`.

The cell makes the object `winter_coat` after the class, and this
has a reason. Each time the cell runs, Python makes a new class with
the name `Purchase`. An object that was made before, such as
`bread`, still belongs to the old class, and the old class does not
have your method. So always make the objects again after you change
a class.

```{hint}
:title: Hint: the shape of the method
Look at the method `__repr__` of the class `Shop` in the cell above.
Your method has the same shape. It has two lines: the line
`def __repr__(self):` and a line that returns one f-string.

The name has two underscores before `repr` and two underscores after
it.
```

```{hint}
:title: Hint: the f-string
The f-string begins with the name of the class and an opening
parenthesis, and it ends with a closing parenthesis. Here is the
line with the first two attributes only:

`return f"Purchase(date={self.date!r}, description={self.description!r})"`

Add `amount` and `category` in the same way, before the closing
parenthesis. Put a comma and one space between the attributes.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

An `IndentationError` means that the spaces at the start of a line
are wrong. The `def` line begins with four spaces, and the `return`
line begins with eight spaces.

An `AttributeError` means that the object does not have an attribute
with that name. Check the spelling of each name after `self.`.

A `TypeError` whose message has the words `returned non-string`
means that the method does not return a string. The line must begin with the
word `return`, and then the f-string.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: repr-not-started
:check: repr-method
:expect: has no method __repr__ yet
```

````{attempt}
:id: repr-no-class
:check: repr-method
:expect: The class Purchase does not exist

```{cell-insert}
:path: {{ notebook }}
:run: true
del Purchase
```
````

````{attempt}
:id: repr-not-a-class
:check: repr-method
:expect: its value is not a class

```{cell-insert}
:path: {{ notebook }}
:run: true
Purchase = "Winter coat"
```
````

````{attempt}
:id: repr-dataclass
:check: repr-method
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
:id: repr-init-changed
:check: repr-method
:expect: must keep its four parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount):
        self.date = date
        self.description = description
        self.amount = amount

    def __repr__(self):
        return f"Purchase(date={self.date!r})"
```
````

````{attempt}
:id: repr-init-stops
:check: repr-method
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

    def __repr__(self):
        return f"Purchase(date={self.date!r})"
```
````

````{attempt}
:id: repr-no-self
:check: repr-method
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __repr__():
        return "Purchase()"
```
````

````{attempt}
:id: repr-stops
:check: repr-method
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

    def __repr__(self):
        return f"Purchase(date={self.date!r}, description={self.descripton!r}, amount={self.amount!r}, category={self.category!r})"
```
````

````{attempt}
:id: repr-prints
:check: repr-method
:expect: shows the text with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __repr__(self):
        print(f"Purchase(date={self.date!r}, description={self.description!r}, amount={self.amount!r}, category={self.category!r})")
```
````

````{attempt}
:id: repr-no-return
:check: repr-method
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

    def __repr__(self):
        text = f"Purchase(date={self.date!r}, description={self.description!r}, amount={self.amount!r}, category={self.category!r})"
```
````

````{attempt}
:id: repr-not-a-string
:check: repr-method
:expect: which is not a string

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __repr__(self):
        return self.amount
```
````

````{attempt}
:id: repr-no-quotes
:check: repr-method
:expect: The values have no quotes

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __repr__(self):
        return f"Purchase(date={self.date}, description={self.description}, amount={self.amount}, category={self.category})"
```
````

````{attempt}
:id: repr-fixed
:check: repr-method
:expect: the same text for every purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __repr__(self):
        return "Purchase(date='2026-01-17', description='Winter coat', amount=Decimal('74.90'), category='clothes')"
```
````

````{attempt}
:id: repr-partly-fixed
:check: repr-method
:expect: Build the text from the four attributes of self

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __repr__(self):
        return f"Purchase(date='2026-01-17', description='Winter coat', amount={self.amount!r}, category={self.category!r})"
```
````

````{attempt}
:id: repr-other-text
:check: repr-method
:expect: Compare the two texts character by character

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, date, description, amount, category):
        self.date = date
        self.description = description
        self.amount = amount
        self.category = category

    def __repr__(self):
        return f"Purchase(date={self.date!r}, description={self.description!r}, amount={self.amount!r})"
```
````

````{attempt}
:id: repr-quotes-by-hand
:check: repr-method
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

    def __repr__(self):
        text = "Purchase(date='" + self.date + "', description='" + self.description + "', "
        text = text + f"amount={self.amount!r}, category='{self.category}')"
        return text
```
````

````{hint}
:title: Show me a solution
:unlock: "repr-method" in failed_checks or "repr-method" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds
the whole class with a working method, and the action runs it.
Compare it with your own cell.

```{cell-insert}
:id: insert-repr-method-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [repr-method-solution]
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

winter_coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
print(winter_coat)
```
````

```{verify}
:id: repr-method
:label: Your method __repr__ gives the text that describes a purchase
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed repr-method; cell-executed repr-method-solution
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
    if "__repr__" not in vars(cls):
        print("The class Purchase has no method __repr__ yet. Write the method under the comment in the new cell. Its first line is def __repr__(self): with four spaces before the word def, and with two underscores on each side of repr. Then hold Shift and press Enter to run the cell.")
        return False
    method = vars(cls)["__repr__"]
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
        count = 1
    if count != 1:
        found = "no parameter" if count == 0 else f"{count} parameters"
        print(f"The method __repr__ must have exactly one parameter, self, but it has {found}. Python gives the object to the parameter self. Make the first line of the method def __repr__(self): and run the cell again.")
        return False
    cases = [
        ("2026-01-17", "Winter coat", decimal.Decimal("74.90"), "clothes"),
        ("2026-01-05", "Bus ticket", decimal.Decimal("2.80"), "transport"),
    ]
    earlier = None
    for case in cases:
        made = f"Purchase({case[0]!r}, {case[1]!r}, {case[2]!r}, {case[3]!r})"
        expected = f"Purchase(date={case[0]!r}, description={case[1]!r}, amount={case[2]!r}, category={case[3]!r})"
        plain = f"Purchase(date={case[0]}, description={case[1]}, amount={case[2]}, category={case[3]})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                thing = cls(*case)
        except Exception as error:
            print(f"Python stopped with an error of the type {type(error).__name__} when the check made a purchase with {made}. The mistake is in the method __init__. Make it the same as the method __init__ in the first cell of your notebook, and run the cell again.")
            return False
        try:
            with contextlib.redirect_stdout(shown):
                result = method(thing)
        except Exception as error:
            print(f"The method __repr__ stopped with an error of the type {type(error).__name__} for the object {made}. An AttributeError means that a name after self. is not the name of an attribute: check the spelling of date, description, amount and category. Correct the method, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The method __repr__ shows the text with print(), but it does not return it. Python needs the string as the return value of the method. Replace print() in the method with the word return, and run the cell again.")
            return False
        if result is None:
            print("The method __repr__ gives None but it must give a string. A method with no return line gives None. Begin the line that has the f-string with the word return, and run the cell again.")
            return False
        if not isinstance(result, str):
            print(f"The method __repr__ returns {result!r}, which is not a string. The method must return a string, or Python stops with a TypeError when you print the object. Return one f-string that holds the four attributes, and run the cell again.")
            return False
        if result == plain:
            print(f"For the object {made}, your method gives {result} but it must give {expected}. The values have no quotes. Write !r after each name between the braces, in this way: " + "date={self.date!r}" + ". Then run the cell again.")
            return False
        if result != expected and earlier is None:
            print(f"For the object {made}, your method gives {result} but it must give {expected}. Compare the two texts character by character: the name of the class, the parentheses, the four names in the order date, description, amount, category, and a comma and one space between them. Then correct the method, and run the cell again.")
            return False
        if result != expected and result == earlier:
            print(f"Your method gives the same text for every purchase. For the object {made}, it gives {result}. The method must build the text from the attributes of self: self.date, self.description, self.amount and self.category. Then run the cell again.")
            return False
        if result != expected:
            print(f"For the object {made}, your method gives {result} but it must give {expected}. Build the text from the four attributes of self, each one with !r. Then run the cell again.")
            return False
        earlier = result
    print("Correct. Your method __repr__ returns a text that names the class and shows the four attributes with their values.")
    return True
globals().pop("_workshop_check")()
```

Your purchases now explain themselves. The same method also works
inside a list. Click the action below. It adds a cell that makes a
list of two purchases and prints the list.

```{attempt}
:id: january-list-not-run
:check: january-list-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-january-list
:title: Add a cell that prints a list of two purchases again, and run it
:path: {{ notebook }}
:tags: [january-list]
:run: true
january_list = [
    Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"),
    Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport"),
]
print(january_list)
```

```{verify}
:id: january-list-ran
:label: The cell printed a list of two purchases
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed january-list
if isinstance(globals().get("january_list"), list) and len(globals()["january_list"]) == 2:
    print("The cell ran. Python called the method __repr__ one time for each purchase in the list.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("january_list"), list) and len(globals()["january_list"]) == 2
```

When your class has the method `__repr__`, the output is one long
line, and the notebook may show it on several lines:

```
[Purchase(date='2026-01-03', description='Bread and milk', amount=Decimal('6.40'), category='food'), Purchase(date='2026-01-05', description='Bus ticket', amount=Decimal('2.80'), category='transport')]
```

Compare this with the list on the last page. Now you can see which
purchase is which.
