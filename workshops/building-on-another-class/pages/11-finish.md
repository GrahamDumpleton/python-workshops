---
title: What you have learned
---

# What you have learned

You started with one class, `Purchase`. You built two child classes
on it, `Subscription` and `SharedPurchase`, and you did not copy a
single line of the parent class. Then you built a class `Receipt`
that holds objects of another class. You wrote two methods and a
function, and you repaired a child class that did not call the
method `__init__` of its parent class.

## The ideas

- **Inheritance** makes a new class from a class that already exists.
  The class that exists is the **parent class**, and the new class is
  the **child class**. Python's documentation says "base class" and
  "subclass" or "derived class".

- A child class has the attributes and the methods of its parent
  class. When Python does not find a method in the class of an
  object, it looks in the parent class.

- A child class can add a method. Only objects of the child class
  have it.

- A child class can **replace** a method: it has a method with the
  same name as a method of the parent class. Programmers say that it
  "overrides" the method. One loop can then call the method on
  objects of several classes, and each object uses the method of its
  own class.

- A child class with an attribute of its own has a method `__init__`
  of its own. The first line of that method calls
  `super().__init__(...)`, so that the parent class makes its
  attributes too.

- `isinstance()` tells you if an object was made from a class, or
  from a child class of that class.

- **Composition** means that an object holds other objects as its
  attributes.

- The rule: "is a" means inheritance, and "has a" means composition.
  When you are not sure, choose composition.

## The code

| Code | What it does |
|------|--------------|
| `class Subscription(Purchase):` | starts a child class of `Purchase` |
| `def yearly_cost(self):` inside the child class | adds a method that only the child class has |
| `def label(self):` inside the child class | replaces the method `label` of the parent class |
| `super().__init__(date, description, amount, category)` | calls the method `__init__` of the parent class on the same object |
| `self.months = months` | makes an attribute that only the child class has |
| `isinstance(phone_plan, Subscription)` | is `True` when the object was made from `Subscription`, or from a child class of it |
| `self.products = []` | gives each new object a list of its own, to hold other objects |
| `self.products.append(product)` | adds one object to that list |
| `receipt.products[0].name` | reads an attribute of an object that another object holds |

## What comes next

The next workshop, **Spending as objects**, is the last workshop of
**Your own types in Python**. In it, you build the spending tracker
again, and this time from classes. You write a class for one
purchase, and a class that holds all of Mariam's purchases, with
methods that give the totals and write the report. You get a goal for
each part, and you write the code yourself.

Click `Finish` at the bottom of this panel.
