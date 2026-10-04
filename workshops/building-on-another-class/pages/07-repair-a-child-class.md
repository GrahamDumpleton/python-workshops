---
title: Repair a child class
requires: [verify:shared-repaired]
---

# Repair a child class

One parent class can have several child classes. On this page you
meet a second child class of `Purchase`, and it has a mistake. You
find the mistake and repair it.

On 2026-01-30, Mariam had coffee with two friends. The three people
paid for it together. The class `SharedPurchase` describes a purchase
like this one. It has one attribute of its own, `people`: the number
of people who pay. Its method `share()` returns the part that each
person pays, which is the amount divided by the number of people.

Click the action below. It adds a cell with the class, and does not
run it.

```{cell-insert}
:id: insert-shared-purchase
:title: Add a cell with the class SharedPurchase, which has a mistake
:path: {{ notebook }}
:tags: [shared-purchase]
:run: false
class SharedPurchase(Purchase):
    """A purchase that several people pay for together."""

    def __init__(self, date, description, amount, category, people):
        self.people = people

    def share(self):
        return self.amount / self.people

coffee = SharedPurchase("2026-01-30", "Coffee with friends", Decimal("7.20"), "food", 3)
print(coffee.people)
print(coffee.description)
print(coffee.share())
```

When this cell runs as it is, it shows `3`, and then it stops. The
last line of the error message is:

```
AttributeError: 'SharedPurchase' object has no attribute 'description'
```

An `AttributeError` is the error for an attribute that an object does
not have. The arrow in the error message points at the line
`print(coffee.description)`. You can run the cell to see the error
message yourself: hold `Shift` and press `Enter`.

## Your task

Change the method `__init__` of `SharedPurchase` so that a shared
purchase has the four attributes of every purchase, and also the
attribute `people`. Do not change the `def` line, and do not change
the lines under the class. Then run the cell.

When the class is correct, the output under the cell is:

```
3
Coffee with friends
2.40
```

```{hint}
:title: Hint: what is missing
The method `__init__` of `SharedPurchase` replaces the method
`__init__` of `Purchase`. So nothing makes the attributes `date`,
`description`, `amount` and `category`. Look at the method `__init__`
of `Subscription` on the last page. It has one line that this method
does not have.
```

````{hint}
:title: Hint: the line
Add one line to the body of `__init__`, above the line
`self.people = people`. The line begins with eight spaces. It calls
the method `__init__` of the parent class with the four values, and
without `self`:

```python
        super().__init__(date, description, amount, category)
```
````

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: shared-not-started
:check: shared-repaired
:expect: The class SharedPurchase does not exist yet
```

````{attempt}
:id: shared-unchanged
:check: shared-repaired
:expect: does not call that method yet

```{cell-insert}
:path: {{ notebook }}
:run: true
class SharedPurchase(Purchase):
    """A purchase that several people pay for together."""

    def __init__(self, date, description, amount, category, people):
        self.people = people

    def share(self):
        return self.amount / self.people
```
````

````{attempt}
:id: shared-no-values
:check: shared-repaired
:expect: stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
class SharedPurchase(Purchase):
    """A purchase that several people pay for together."""

    def __init__(self, date, description, amount, category, people):
        super().__init__()
        self.people = people

    def share(self):
        return self.amount / self.people
```
````

````{attempt}
:id: shared-wrong-order
:check: shared-repaired
:expect: in the same order

```{cell-insert}
:path: {{ notebook }}
:run: true
class SharedPurchase(Purchase):
    """A purchase that several people pay for together."""

    def __init__(self, date, description, amount, category, people):
        super().__init__(description, date, amount, category)
        self.people = people

    def share(self):
        return self.amount / self.people
```
````

````{attempt}
:id: shared-no-people
:check: shared-repaired
:expect: Keep the line self.people = people

```{cell-insert}
:path: {{ notebook }}
:run: true
class SharedPurchase(Purchase):
    """A purchase that several people pay for together."""

    def __init__(self, date, description, amount, category, people):
        super().__init__(date, description, amount, category)

    def share(self):
        return self.amount / self.people
```
````

````{attempt}
:id: shared-four-values
:check: shared-repaired
:expect: must take five values

```{cell-insert}
:path: {{ notebook }}
:run: true
class SharedPurchase(Purchase):
    """A purchase that several people pay for together."""

    def __init__(self, date, description, amount, category):
        super().__init__(date, description, amount, category)
        self.people = 3

    def share(self):
        return self.amount / self.people
```
````

````{attempt}
:id: shared-other-way
:check: shared-repaired
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
class SharedPurchase(Purchase):
    """A purchase that several people pay for together."""

    def __init__(self, date, description, amount, category, people):
        self.people = people
        Purchase.__init__(self, date, description, amount, category)

    def share(self):
        return self.amount / self.people
```
````

````{hint}
:title: Show me a solution
:unlock: "shared-repaired" in failed_checks or "shared-repaired" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds the
whole class with the mistake repaired, and the action runs it. Compare
it with your own cell.

```{cell-insert}
:id: insert-shared-purchase-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [shared-purchase-solution]
:run: true
class SharedPurchase(Purchase):
    """A purchase that several people pay for together."""

    def __init__(self, date, description, amount, category, people):
        super().__init__(date, description, amount, category)
        self.people = people

    def share(self):
        return self.amount / self.people

coffee = SharedPurchase("2026-01-30", "Coffee with friends", Decimal("7.20"), "food", 3)
print(coffee.people)
print(coffee.description)
print(coffee.share())
```
````

```{verify}
:id: shared-repaired
:label: A shared purchase has the attributes of a purchase and the attribute people
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shared-purchase; cell-executed shared-purchase-solution
def _workshop_check():
    import contextlib, decimal, inspect, io
    cls = globals().get("SharedPurchase")
    if not isinstance(cls, type):
        print("The class SharedPurchase does not exist yet. Click the action above to add the cell. Repair the method __init__ in that cell. Then hold Shift and press Enter to run the cell.")
        return False
    names = ("date", "description", "amount", "category")
    five = ("2026-03-15", "Taxi", decimal.Decimal("15.60"), "transport", 4)
    try:
        inspect.signature(cls).bind(*five)
    except (TypeError, ValueError):
        print("SharedPurchase(...) must take five values: the date, the description, the amount, the category and the number of people. Keep the def line as it was given: def __init__(self, date, description, amount, category, people): Then run the cell again.")
        return False
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            thing = cls(*five)
    except Exception as error:
        kind = type(error).__name__
        article = "an" if kind[0] in "AEIOU" else "a"
        print(f"Making a SharedPurchase stopped with {article} {kind}. Look at the line with super(). It must give the four values to the method __init__ of the parent class, and it must not give self: super().__init__(date, description, amount, category). Correct the line, and run the cell again.")
        return False
    missing = object()
    absent = [name for name in names if getattr(thing, name, missing) is missing]
    if absent:
        print(f"A new SharedPurchase has no attribute {absent[0]}. The method __init__ of Purchase makes that attribute, and the method __init__ of SharedPurchase does not call that method yet. Add this line as the first line of the body: super().__init__(date, description, amount, category). Then run the cell again.")
        return False
    if getattr(thing, "people", missing) != 4:
        print("The check made a SharedPurchase for 4 people, but the attribute people of the object is not 4. Keep the line self.people = people in the method __init__, under the line with super(). Then run the cell again.")
        return False
    def show(value):
        return str(value) if isinstance(value, decimal.Decimal) else repr(value)
    for name, expected in zip(names, five):
        found = getattr(thing, name)
        if found != expected:
            print(f"The check made a SharedPurchase with the {name} {show(expected)}, but the attribute {name} of the object is {show(found)}. Give the four values to super().__init__ in the same order as the parameters: super().__init__(date, description, amount, category). Then run the cell again.")
            return False
    print("Correct. A shared purchase now has the four attributes that the class Purchase makes, and the attribute people that the class SharedPurchase makes.")
    return True
globals().pop("_workshop_check")()
```

## What you changed

The method `__init__` of the child class now does two things. First
it calls the method `__init__` of the parent class, which makes the
four attributes of every purchase. Then it makes the attribute that
only a shared purchase has.

Remember this pattern. When a child class has a method `__init__` of
its own, the first line of that method is nearly always
`super().__init__(...)`.

The classes `Subscription` and `SharedPurchase` are both child
classes of `Purchase`. They do not know about each other. A
subscription has no method `share()`, and a shared purchase has no
method `yearly_cost()`.
