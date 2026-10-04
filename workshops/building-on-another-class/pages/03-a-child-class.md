---
title: A child class
requires: [verify:child-class, quiz:predict-inherited-label, verify:inherited-label-shown]
---

# A child class

**Inheritance** is a way to make a new class from a class that
already exists. The new class starts with everything that the other
class has: the same attributes and the same methods. You then write
only the things that are different.

The class that already exists is the **parent class**. The new class
is the **child class**.

## Why inheritance exists

Mariam pays her phone bill every month. That payment is a purchase:
it has a date, a description, an amount and a category. But it is
also a special kind of purchase, because it repeats. You may want it
to do things that other purchases cannot do, such as give the cost
for a whole year.

Without inheritance, you have two choices, and both are bad. You can
copy the whole class `Purchase` and change the copy. Then the same
code exists two times, and a mistake that you correct in one copy
stays in the other copy. Or you can put everything in the class
`Purchase`. Then a winter coat also has a cost for a whole year,
which means nothing.

With inheritance, you write a small class that says: "this is a
purchase, with these differences".

Think of a bicycle and an electric bicycle. An electric bicycle is a
bicycle. Everything that is true of a bicycle is true of it: it has
two wheels, and you can ride it. It also has something more: a motor.
To describe an electric bicycle, you do not describe a bicycle again.
You say "a bicycle with a motor".

## The code

You put the name of the parent class in parentheses, after the name
of the child class:

```python
class Subscription(Purchase):
```

A **subscription** is something that you pay for again and again,
for example every month. Read the line as "a `Subscription` is a
`Purchase`".

Click the action below. It adds a cell with this child class, and
runs it.

```{attempt}
:id: child-class-not-run
:check: child-class
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-child-class
:title: Add a cell with the child class Subscription, and run it
:path: {{ notebook }}
:tags: [child-class]
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

phone = Subscription("2026-01-06", "Phone bill", Decimal("18.00"), "phone")
print(phone.description)
print(phone.amount)
print(phone.month())
```

The output is:

```
Phone bill
18.00
2026-01
```

```{verify}
:id: child-class
:label: The class Subscription exists, and the cell made one subscription
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed child-class
if isinstance(globals().get("Subscription"), type) and getattr(globals().get("phone"), "description", None) == "Phone bill":
    print("The cell ran. The class Subscription is a child class of Purchase, and the name phone refers to one subscription.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("Subscription"), type) and getattr(globals().get("phone"), "description", None) == "Phone bill"
```

## What happened

The class `Subscription` has two lines only. The second line is a
docstring: a text between three double quotes that describes the
class. A class needs at least one line under its first line, and here
the docstring is that line. The class has no method `__init__` and no
other method of its own.

But the cell made a `Subscription` with four values, read two
attributes, and called the method `month()`. All of that worked.

1. For `Subscription("2026-01-06", ...)`, Python looks for a method
   `__init__` in the class `Subscription`. There is none. So Python
   looks in the parent class, `Purchase`, and finds it there. That
   method gives the object its four attributes.

2. For `phone.month()`, Python looks for a method `month` in the class
   `Subscription`. There is none. So Python looks in the parent class
   again, and uses the method that it finds there.

This is the rule of inheritance: when the child class does not have a
method, Python uses the method of the parent class.

## Other words for the same things

The workshops say "parent class" and "child class". Python's
documentation says "base class" for the parent class, and "subclass"
or "derived class" for the child class. They mean the same things.

## Predict

The class `Purchase` also has the method `label()`. For the winter
coat, it returned `Winter coat: 74.90`. Look at this line. Do not run
it yet.

```python
print(phone.label())
```

```{quiz}
:id: predict-inherited-label
:type: text
:title: Predict the output
question: "What does the notebook show when this line runs?"
answer: "Phone bill: 18.00"
wrong:
  - { text: "Phone bill: 18.0", explanation: "The words are correct. The amount is a `Decimal`, and a `Decimal` keeps its two digits after the point." }
  - { text: "Phone bill 18.00", explanation: "The words and the number are correct. The method `label()` puts a colon after the description. Look at its `return` line on the last page." }
  - { text: "Winter coat: 74.90", explanation: "That is the label of the object `coat`. The method is called on the object `phone`, so `self` is `phone`." }
  - { pattern: ".*[Ee]rror.*", explanation: "There is no error. The class `Subscription` has no method `label`, so Python uses the method `label` of the parent class, `Purchase`." }
otherwise: "The class `Subscription` has no method `label`, so Python uses the one of the class `Purchase`. That method returns the description, a colon, a space and the amount. Use the description and the amount of the object `phone`."
explanation: "The class `Subscription` has no method `label`, so Python uses the method of the parent class. Inside the method, `self` is the object `phone`, so the text is `Phone bill: 18.00`."
```

Run the line, and compare the output with your prediction.

```{attempt}
:id: inherited-label-not-shown
:check: inherited-label-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-inherited-label
:title: Add a cell that shows the label of the subscription, and run it
:path: {{ notebook }}
:tags: [inherited-label]
:run: true
print(phone.label())
```

```{verify}
:id: inherited-label-shown
:label: The cell that shows the label of the subscription has run
:substrate: contents
:trigger: cell-executed inherited-label
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} inherited-label
```

A child class that adds nothing is not useful yet. On the next page,
you give `Subscription` a method that `Purchase` does not have.
