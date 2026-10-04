---
title: What you have learned
---

# What you have learned

You made a type of your own. A purchase is now one value that holds
its date, its description, its amount and its category, and that can
answer questions about itself. You made objects, changed one, wrote
two methods, and added up the amounts of a list of objects.

## The ideas

- A **class** is a description of a new type of value, written by
  you. It says what data each value of that type holds, and what each
  value can do. The name of a class begins with a capital letter.

- An **object** is a value made from a class. One class makes many
  objects. Programmers also say "instance".

- The method `__init__` is the method that Python calls when an
  object is made. It puts the first values into the object. Two
  underscores on each side mark a name that Python itself calls, and
  methods with such names are **special methods**.

- `self` is the name, inside a method, for the object that the method
  was called on. It is the first parameter of every method, and
  Python gives it a value for you.

- An **attribute** is a value that belongs to an object, and it has a
  name. You read it after a dot, and you change it with an
  assignment.

- A **method** is a function that belongs to a value. You write one
  with `def`, inside the class. It reads the attributes of its object
  through `self`.

- When you run the cell of a class again, Python makes a new class.
  Make the objects again after you change a class.

- A list can hold objects, and a loop can use the attributes and the
  methods of each of them.

## The code

| Code | What it does |
|------|--------------|
| `class Purchase:` | begins the description of a new type with the name `Purchase` |
| `def __init__(self, date, description, amount, category):` | begins the method that Python calls when an object is made |
| `self.date = date` | keeps the value of the parameter `date` in the object, as the attribute `date` |
| `coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")` | makes an object, and makes the name `coat` refer to it |
| `coat.amount` | reads the attribute `amount` of the object |
| `coat.amount = Decimal("70.00")` | changes the attribute `amount` of the object |
| `def month(self):` | begins a method that needs only the object |
| `coat.month()` | calls the method `month`, with `coat` as `self` |
| `def is_large(self, limit):` | begins a method that needs one more value |
| `coat.is_large(50)` | calls the method, with `coat` as `self` and `50` as `limit` |
| `type(coat)` | gives the type of the object, which is the class `Purchase` |
| `for purchase in purchases:` | runs a block one time for each object of a list |

## The class that you built

```python
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

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        return self.amount > other.amount
```

## What comes next

One thing about your objects is not good yet. When you show an object
with `print()`, Python shows text such as
`<__main__.Purchase object at 0x...>`, which does not say which
purchase it is. Also, two objects with the same four values are not
equal for Python.

The next workshop, **Objects that explain themselves**, solves both.
It shows how a class says what `print()` shows for its objects, and
when two of its objects are equal. Then it shows a way to let Python
write those methods for you.

Click `Finish` at the bottom of this panel.
