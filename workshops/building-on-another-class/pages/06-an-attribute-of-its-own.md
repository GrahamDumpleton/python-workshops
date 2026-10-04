---
title: An attribute of its own
requires: [verify:own-attribute, quiz:predict-no-super]
---

# An attribute of its own

A child class can hold data that its parent class does not hold. For
that, the child class needs a method `__init__` of its own, which
takes the extra value and keeps it in the object.

There is one thing to be careful about. A method `__init__` in the
child class replaces the method `__init__` of the parent class, in
the same way as `label` on the last page. So the `__init__` of the
parent class does not run any more, unless you ask for it. And that
method is the one that makes the attributes `date`, `description`,
`amount` and `category`.

You ask for it with this line:

```python
super().__init__(date, description, amount, category)
```

`super()` is a function that comes with Python. Inside a method, it
gives you the object in a form that uses the methods of the parent
class. So `super().__init__(...)` means: "call the method `__init__`
of my parent class, on this same object".

## Why it is done this way

You could write the four lines `self.date = date` and so on again, in
the child class. But then the same code exists two times. When the
class `Purchase` gets a fifth attribute later, the child class is
wrong until someone remembers to change it too. With
`super().__init__(...)`, the parent class does its own work, and the
child class adds only what is new.

Think of the form for a library card, and a second form for the
library card of a student. The second form says: "Fill in the normal
form first. Then write the name of your school here." The second form
does not repeat the boxes of the normal form.

## The code

Mariam agreed to pay for her phone for 24 months. Click the action
below. It adds a cell where the class `Subscription` has an attribute
of its own, `months`: the number of months that the subscription
runs. The cell runs at once.

```{attempt}
:id: own-attribute-not-run
:check: own-attribute
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-own-attribute
:title: Add a cell where Subscription has the attribute months, and run it
:path: {{ notebook }}
:tags: [own-attribute]
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def __init__(self, date, description, amount, category, months):
        super().__init__(date, description, amount, category)
        self.months = months

    def yearly_cost(self):
        return self.amount * 12

    def total_cost(self):
        return self.amount * self.months

    def label(self):
        return f"{self.description}: {self.amount} every month"

phone_plan = Subscription("2026-01-06", "Phone bill", Decimal("18.00"), "phone", 24)
print(phone_plan.description)
print(phone_plan.months)
print(phone_plan.total_cost())
```

The output is:

```
Phone bill
24
432.00
```

```{verify}
:id: own-attribute
:label: A subscription has the attribute months
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed own-attribute
if getattr(globals().get("phone_plan"), "months", None) == 24 and getattr(globals().get("phone_plan"), "description", None) == "Phone bill":
    print("The cell ran. The object phone_plan has the four attributes of a purchase, and the attribute months of its own.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
getattr(globals().get("phone_plan"), "months", None) == 24 and getattr(globals().get("phone_plan"), "description", None) == "Phone bill"
```

## What happened

Look at the method `__init__` of `Subscription`.

- The `def` line has six parameters: `self`, the four values of every
  purchase, and the new value `months`.

- The first line of the body is
  `super().__init__(date, description, amount, category)`. It calls
  the method `__init__` of `Purchase` and gives it the four values.
  That method makes the four attributes of the object. You do not
  write `self` between these parentheses: `super()` gives the object
  to the method for you.

- The second line of the body is `self.months = months`. It makes the
  attribute that only a subscription has.

The call `Subscription(...)` now needs five values. The fifth value,
`24`, is the number of months.

The method `total_cost()` is new too. It uses `self.amount`, which
the parent class made, and `self.months`, which the child class made.
Both are attributes of the same object. 24 months at `18.00` is
`432.00`.

## Predict

Look at this child class. Its method `__init__` does not have the
line with `super()`. Do not run the code.

```python
class Gift(Purchase):
    def __init__(self, date, description, amount, category, person):
        self.person = person

gift = Gift("2026-02-09", "Book", Decimal("13.99"), "hobbies", "Chidi")
print(gift.person)
print(gift.description)
```

```{quiz}
:id: predict-no-super
:title: A child class that does not call the parent
question: "What does this code show?"
options:
  - { text: "`Chidi` and then `Book`", explanation: "The attribute `description` is made by the method `__init__` of `Purchase`. The class `Gift` has its own `__init__`, which replaces that method and never calls it. So nothing makes the attribute `description`." }
  - { text: "`Chidi` and then an error message", correct: true }
  - { text: "An error message only, because `Gift(...)` cannot take five values", explanation: "The method `__init__` of `Gift` has the parameters for all five values, so Python makes the object. The problem comes later, when the code reads an attribute that nothing made." }
explanation: "The method `__init__` of `Gift` replaces the method `__init__` of `Purchase`. It keeps `person` in the object, so the first `print()` shows `Chidi`. It never calls the `__init__` of the parent class, so the object has no attribute `description`. The second `print()` stops with an `AttributeError`, which is the error for an attribute that an object does not have. On the next page you meet this mistake, and you repair it."
```
