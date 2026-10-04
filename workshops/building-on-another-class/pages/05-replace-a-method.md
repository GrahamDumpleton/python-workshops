---
title: Replace a method
requires: [verify:replace-label, quiz:predict-mixed-list, verify:mixed-list-shown]
---

# Replace a method

A child class can also change what a method of its parent class does.
To do that, you write a method in the child class with the same name
as the method of the parent class. For objects of the child class,
the new method **replaces** the method of the parent class.

Programmers have a word for this: they say that the child class
"overrides" the method. These workshops say "replace".

## Why you would replace a method

The method `label()` of the class `Purchase` returns a text such as
`Phone bill: 18.00`. For a subscription, that text leaves something
out: the amount is paid every month. The label of a subscription must
say so. Every other purchase must keep the label that it has.

Think of a library where you can keep every book for three weeks. One
shelf, the shelf of new books, has its own rule: you can keep a new
book for one week. For a new book, the rule of the shelf is used. For
every other book, the rule of the library is used. Nobody changed the
rule of the library.

## The code

Click the action below. It adds a cell with the class `Subscription`
again. The class now has a method `label` of its own. The cell then
makes one object of each class, and shows the label of each.

```{attempt}
:id: replace-label-not-run
:check: replace-label
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-replace-label
:title: Add a cell where Subscription replaces the method label, and run it
:path: {{ notebook }}
:tags: [replace-label]
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        return self.amount * 12

    def label(self):
        return f"{self.description}: {self.amount} every month"

shoes = Purchase("2026-03-09", "Running shoes", Decimal("59.00"), "clothes")
phone_march = Subscription("2026-03-06", "Phone bill", Decimal("18.00"), "phone")
shoes_label = shoes.label()
phone_march_label = phone_march.label()
print(shoes_label)
print(phone_march_label)
```

The output is:

```
Running shoes: 59.00
Phone bill: 18.00 every month
```

```{verify}
:id: replace-label
:label: The class Subscription has a method label of its own
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed replace-label
if globals().get("shoes_label") == "Running shoes: 59.00" and globals().get("phone_march_label") == "Phone bill: 18.00 every month":
    print("The cell ran. The purchase uses the method label of the class Purchase, and the subscription uses the method label of the class Subscription.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("shoes_label") == "Running shoes: 59.00" and globals().get("phone_march_label") == "Phone bill: 18.00 every month"
```

## What happened

The two calls look the same: `shoes.label()` and
`phone_march.label()`. The results are different, because the two
objects were made from different classes.

1. The object `shoes` was made from the class `Purchase`. For
   `shoes.label()`, Python uses the method `label` of `Purchase`.

2. The object `phone_march` was made from the class `Subscription`.
   For `phone_march.label()`, Python looks in the class `Subscription`
   first. This time it finds a method `label` there, and it uses that
   one. Python does not look in the parent class, because it has
   already found the method.

So the rule from the page **A child class** has two parts. Python
looks for a method in the class of the object first. Only when the
method is not there does Python look in the parent class.

The class `Purchase` did not change. Its own method `label` is still
there, and every object of `Purchase` still uses it.

## Predict

The code that calls a method does not need to know which class an
object was made from. Look at this code. Do not run it yet.

```python
march = [
    Purchase("2026-03-15", "Taxi", Decimal("15.60"), "transport"),
    Subscription("2026-03-03", "Monthly bus pass", Decimal("42.00"), "transport"),
]
for item in march:
    print(item.label())
```

The list `march` holds two objects. The first object is a `Purchase`,
and the second object is a `Subscription`. The loop calls `label()`
on each one, so the code shows two lines.

```{quiz}
:id: predict-mixed-list
:type: text
:title: Predict the second line
question: "What is the second line that the notebook shows when this code runs?"
answer: "Monthly bus pass: 42.00 every month"
wrong:
  - { text: "Monthly bus pass: 42.00", explanation: "That is the text that the method `label` of `Purchase` gives. The second object is a `Subscription`, and the class `Subscription` has its own method `label`." }
  - { text: "Taxi: 15.60", explanation: "That is the first line. The question asks for the second line, which comes from the second object in the list." }
  - { text: "Taxi: 15.60 every month", explanation: "The taxi is the first object, and it is a `Purchase`. The question asks for the second line, which comes from the second object in the list." }
  - { text: "Monthly bus pass: 42.0 every month", explanation: "The words are correct. The amount is a `Decimal`, and a `Decimal` keeps its two digits after the point." }
otherwise: "The second object is a `Subscription`. Find the method `label` of the class `Subscription` in the cell above, and use the description and the amount of the second object."
explanation: "The loop calls `label()` on each object in turn. For each call, Python uses the method of the class that the object was made from. The first object is a `Purchase`, so the first line is `Taxi: 15.60`. The second object is a `Subscription`, so the second line is `Monthly bus pass: 42.00 every month`."
```

Run the code, and compare the output with your prediction.

```{attempt}
:id: mixed-list-not-shown
:check: mixed-list-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-mixed-list
:title: Add a cell that shows the label of each object in a list, and run it
:path: {{ notebook }}
:tags: [mixed-list]
:run: true
march = [
    Purchase("2026-03-15", "Taxi", Decimal("15.60"), "transport"),
    Subscription("2026-03-03", "Monthly bus pass", Decimal("42.00"), "transport"),
]
for item in march:
    print(item.label())
```

```{verify}
:id: mixed-list-shown
:label: The cell that shows the label of each object has run
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed mixed-list
if isinstance(globals().get("march"), list) and len(globals()["march"]) == 2:
    print("The cell ran. One loop showed the label of a purchase and the label of a subscription, and each object used the method of its own class.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("march"), list) and len(globals()["march"]) == 2
```

This is why replacing a method is useful. The loop is written one
time, and it works for every kind of purchase. When you add another
child class later, the loop does not change.
