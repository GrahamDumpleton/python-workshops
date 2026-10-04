---
title: Python writes the methods
requires: [quiz:predict-dataclass-equal, verify:dataclass-ran]
---

# Python writes the methods

The three special methods of your class follow a pattern. When you
know the names of the attributes, you know what `__init__`,
`__repr__` and `__eq__` must say. Work that follows a pattern is
work that a program can do.

Python comes with a module that does this work. A module is a file
of Python code that someone has already written. The name of this
module is `dataclasses`. A **dataclass** is a class whose main
purpose is to hold data, and for which Python writes the three
special methods.

To make a dataclass, you do three things.

1. You get the name `dataclass` from the module, with the line
   `from dataclasses import dataclass`. You need this line one time
   in a notebook.

2. You write the line `@dataclass` directly above the line that
   begins with `class`.

3. Inside the class, you write one line for each attribute: the name
   of the attribute, a colon, and the type of its value. Such a line
   is called a **field**. For example, the line `date: str` is a
   field with the name `date`.

## A decorator

The line `@dataclass` is a decorator. A **decorator** is a line that
begins with `@`, written above a class or a function, that changes
it.

Here, the decorator changes the class `Purchase`. Python first makes
the class as you wrote it. Then the decorator reads the fields, and
adds the methods `__init__`, `__repr__` and `__eq__` to the class.

Python has other decorators, and a programmer can write new ones.
These workshops do not show how. For now you need to know only what
a line that begins with `@` means: something changes the class or
the function under it.

## The class Purchase as a dataclass

Here is the class `Purchase` again, written as a dataclass. It has
the four fields, and the method `month()`. It has no method
`__init__`, no method `__repr__` and no method `__eq__`.

```python
from dataclasses import dataclass

@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]
```

In a field, `str` is the name that Python has for the type of a
string, and `Decimal` is the type of an exact number. The next page
says more about this part of the line.

The cell that you are going to run makes two purchases with the same
values, and compares them:

```python
rent = Purchase("2026-02-01", "Rent for February", Decimal("650.00"), "rent")
same_rent = Purchase("2026-02-01", "Rent for February", Decimal("650.00"), "rent")
print(rent == same_rent)
```

```{quiz}
:id: predict-dataclass-equal
:type: text
:title: Predict the result
question: "The class is a dataclass, and nobody wrote a method `__eq__` by hand. What does `print(rent == same_rent)` show?"
answer: "True"
wrong:
  - { text: "False", explanation: "That is the answer for a class with no method `__eq__`. But the decorator `@dataclass` adds a method `__eq__` to the class. The method compares all the fields." }
  - { pattern: "true|TRUE", explanation: "The answer is correct. Python writes this value with a capital letter: `True`." }
otherwise: "The operator `==` gives a boolean, so the answer is `True` or `False`. Think about what the decorator adds to the class."
explanation: "The answer is `True`. The decorator `@dataclass` added a method `__eq__` to the class. That method compares the four fields of the two objects, as the method that you wrote by hand did."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: dataclass-not-run
:check: dataclass-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-dataclass
:title: Add a cell that defines the class Purchase as a dataclass, and run it
:path: {{ notebook }}
:tags: [dataclass]
:run: true
from dataclasses import dataclass

@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]

rent = Purchase("2026-02-01", "Rent for February", Decimal("650.00"), "rent")
same_rent = Purchase("2026-02-01", "Rent for February", Decimal("650.00"), "rent")
print(rent)
print(rent == same_rent)
print(rent is same_rent)
print(rent.month())
```

The output is:

```
Purchase(date='2026-02-01', description='Rent for February', amount=Decimal('650.00'), category='rent')
True
False
2026-02
```

```{verify}
:id: dataclass-ran
:label: The cell defined the class Purchase as a dataclass
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed dataclass
if getattr(globals().get("rent"), "description", None) == "Rent for February" and hasattr(type(globals()["rent"]), "__dataclass_fields__") and "same_rent" in globals():
    print("The cell ran. The class Purchase is now a dataclass, and Python wrote its three special methods.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
getattr(globals().get("rent"), "description", None) == "Rent for February" and hasattr(type(globals()["rent"]), "__dataclass_fields__") and "same_rent" in globals()
```

Read the output line by line.

1. `Purchase("2026-02-01", ...)` made an object, so the class has a
   method `__init__`. The decorator wrote it. Its parameters are the
   fields, in the order in which the class lists them. That is why
   the order of the four lines is important.

2. `print(rent)` shows a text of the same form as the text of your
   own `__repr__`: the name of the class, and each field with its
   value. The decorator wrote the method `__repr__`.

3. `rent == same_rent` is `True`. The decorator wrote the method
   `__eq__`, and that method compares all four fields.

4. `rent is same_rent` is `False`. A dataclass does not change `is`.
   The two names still refer to two objects.

5. `rent.month()` gives `2026-02`. A dataclass is still a class. You
   write a method of your own in it in the same way as before, with
   `self` as its first parameter.

Compare this class with the class in your cell on the last page. The
class that you wrote by hand needs three special methods. The
dataclass needs none, and it does the same things.

You wrote `__repr__` and `__eq__` by hand first for a reason. You
now know what the decorator writes, so you understand what a
dataclass does.
And when a class needs another text or another rule for `==`, you
know how to write the method yourself.
