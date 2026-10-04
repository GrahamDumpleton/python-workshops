---
title: What you have learned
---

# What you have learned

Your objects now explain themselves. You wrote the method that gives
the text for a purchase, and the method that says when two purchases
are equal. Then you let Python write both methods, and you wrote a
dataclass of your own.

## The ideas

- Python shows a text such as `<__main__.Purchase object at 0x...>`
  for an object of a class that does not say what text to show. The
  text names the class, but it does not show the values.

- A **special method** has a name with two underscores on each side.
  You write the method, and Python decides when to call it.

- The special method `__repr__` returns the text that describes an
  object. Python calls it when you print the object, or a list that
  holds the object.

- In an f-string, `!r` after a name puts the value in the text in
  the form that you write in code, so a string gets its quotes.

- Until a class says how to compare its objects, an object is equal
  only to itself, and `==` asks the same question as `is`.

- The special method `__eq__` says when two objects are equal.
  Python calls it for `==`, with the left object as `self` and the
  right object as `other`. It does not change `is`.

- A **dataclass** is a class whose main purpose is to hold data.
  Python writes the methods `__init__`, `__repr__` and `__eq__` for
  it.

- A **decorator** is a line that begins with `@`, written above a
  class or a function, that changes it. The decorator `@dataclass`
  adds the three special methods to the class.

- A **field** is a line in a dataclass that has a name, a colon and
  a type. The order of the fields is the order of the values when
  you make an object.

- A **type hint** is a note in the code that says what type a value
  should have. Python does not check it.

## The code

| Code | What it does |
|------|--------------|
| `def __repr__(self):` | begins the method that returns the text for an object |
| `f"Shop(name={self.name!r})"` | builds a text in which the value is written as in code |
| `def __eq__(self, other):` | begins the method that says when two objects are equal |
| `self.name == other.name and self.town == other.town` | is `True` when both attributes are equal |
| `a == b` | calls the method `__eq__` of `a`, with `b` as `other` |
| `a is b` | is `True` when the two names refer to one object |
| `from dataclasses import dataclass` | gets the decorator `dataclass` from the module `dataclasses` |
| `@dataclass` | above a class, makes Python write `__init__`, `__repr__` and `__eq__` |
| `amount: Decimal` | in a dataclass, is a field with the name `amount` and a type hint |

## What comes next

Your classes so far each stand alone. The next workshop, **Building
on another class**, shows how to make a new class from a class that
already exists, so that the new class has all the attributes and
methods of the first one and adds some of its own. It also shows a
second way to combine classes: an object that holds other objects.

Click `Finish` at the bottom of this panel.
