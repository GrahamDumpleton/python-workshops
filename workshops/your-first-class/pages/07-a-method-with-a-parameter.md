---
title: A method with a parameter
requires: [verify:large-shown, verify:more-method]
---

# A method with a parameter

A method can have more parameters after `self`. Each of them receives
an argument from the call, in the same way as the parameters of every
other function.

## Why a method needs a parameter

The methods `month` and `year` need only the object itself. Other
questions need one more value. "Is this purchase large?" has no
answer until someone says what "large" means. One person calls a
purchase large when it costs more than 50, and another person when it
costs more than 10. So the limit is a parameter, and each call gives
its own limit.

In the comparison with a paper form, the instruction on the form now
has an empty space of its own: "this purchase is large when the
amount is more than ...". The person who asks the question gives the
number.

## The method `is_large`

```python
    def is_large(self, limit):
        return self.amount > limit
```

The method has two parameters. The first is `self`, and Python gives
it the object. The second is `limit`, and the call gives it a value.
The body compares the attribute `amount` of the object with the
limit. A comparison gives `True` or `False`, and the method returns
that value.

The cell below holds the whole class, with the methods `month` and
`year` from the last page and the new method. It makes the objects
`coat` and `bus` again, because objects that were made before belong
to the old class and do not have the new method.

```{attempt}
:id: large-not-shown
:check: large-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-large
:title: Add a cell with the method is_large, and run it
:path: {{ notebook }}
:tags: [large]
:run: true
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

coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
bus = Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport")
coat_is_large = coat.is_large(50)
bus_is_large = bus.is_large(50)
print(coat_is_large)
print(bus_is_large)
```

The output is:

```
True
False
```

```{verify}
:id: large-shown
:label: The method is_large gave an answer for two purchases
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed large
if globals().get("coat_is_large") is True and globals().get("bus_is_large") is False:
    print("The cell ran. With the limit 50, the coat is large and the bus ticket is not.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("coat_is_large") is True and globals().get("bus_is_large") is False
```

## What happened

In the call `coat.is_large(50)`, the object before the dot, `coat`,
became `self`. The one argument between the parentheses, `50`, became
`limit`. The call has one argument, and the `def` line has two
parameters, because Python gives `self` for you.

The amount of the coat is 74.90, which is greater than 50, so the
method returned `True`. The amount of the bus ticket is 2.80, so the
same method returned `False` for the object `bus`. A `Decimal` can be
compared with an integer.

## Your task

The argument of a method can be any value. It can also be another
object of the same class. Write a method that compares two purchases.

- Its name is `costs_more_than`.

- It has two parameters: `self`, and then `other`. The parameter
  `other` receives a second object of the class `Purchase`.

- It returns `True` when the amount of this purchase is greater than
  the amount of the other purchase. In every other case it returns
  `False`.

Two examples, with the objects `coat` (74.90) and `bus` (2.80):

| Call | Return value |
|------|--------------|
| `coat.costs_more_than(bus)` | `True` |
| `bus.costs_more_than(coat)` | `False` |

The action below adds a cell that holds the whole class so far. A
comment at the end of the class marks the place for your method.

```{cell-insert}
:id: insert-more
:title: Add a cell with the class, for my method
:path: {{ notebook }}
:tags: [more]
:run: false
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

    # Write the method costs_more_than below this line. Begin its first line with four spaces.

```

Click on the empty line under the comment, and type your method. Then
run the cell: hold `Shift` and press `Enter`. The cell shows nothing,
because it only defines the class.

To see your method work, add the next cell and run it yourself. It
makes the two objects again, from your new class, and calls your
method two times. The output must be `True` and then `False`.

```{cell-insert}
:id: insert-try-more
:title: Add a cell that calls my method
:path: {{ notebook }}
:tags: [try-more]
:run: false
coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
bus = Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport")
print(coat.costs_more_than(bus))
print(bus.costs_more_than(coat))
```

```{hint}
:title: Hint: how to begin
Look at the method `is_large`, which is in the same cell. Your method
has the same form. Its first line is
`def costs_more_than(self, other):`, with four spaces before `def`.
```

```{hint}
:title: Hint: the body
Inside the method there are two objects. `self` is the purchase
before the dot in the call, and `other` is the purchase between the
parentheses. Each of them has an attribute `amount`. The body is one
line that returns a comparison of `self.amount` with `other.amount`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: more-not-started
:check: more-method
:expect: The class Purchase has no method with the name costs_more_than yet
```

````{attempt}
:id: more-outside
:check: more-method
:expect: but it is outside the class

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

def costs_more_than(self, other):
    return self.amount > other.amount
```
````

````{attempt}
:id: more-init-changed
:check: more-method
:expect: The check cannot make an object of your class with four values

```{cell-insert}
:path: {{ notebook }}
:run: true
class Purchase:
    def __init__(self, amount):
        self.amount = amount

    def costs_more_than(self, other):
        return self.amount > other.amount
```
````

````{attempt}
:id: more-no-self
:check: more-method
:expect: has only one parameter

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(other):
        return amount > other.amount
```
````

````{attempt}
:id: more-no-other
:check: more-method
:expect: has only one parameter

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self):
        return self.amount > 10
```
````

````{attempt}
:id: more-three-parameters
:check: more-method
:expect: has 3 parameters

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other, limit):
        return self.amount > other.amount
```
````

````{attempt}
:id: more-whole-object
:check: more-method
:expect: compares self.amount with other

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        return self.amount > other
```
````

````{attempt}
:id: more-error
:check: more-method
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

    def month(self):
        return self.date[:7]

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        return self.amount > other.price
```
````

````{attempt}
:id: more-prints
:check: more-method
:expect: shows the result with print(), but it does not return it

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        print(self.amount > other.amount)
```
````

````{attempt}
:id: more-no-return
:check: more-method
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

    def month(self):
        return self.date[:7]

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        answer = self.amount > other.amount
```
````

````{attempt}
:id: more-reversed
:check: more-method
:expect: The comparison is in the wrong direction

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        return self.amount < other.amount
```
````

````{attempt}
:id: more-or-equal
:check: more-method
:expect: two purchases with the same amount

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        return self.amount >= other.amount
```
````

````{attempt}
:id: more-difference
:check: more-method
:expect: gives Decimal('72.10') but it must give True

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        return self.amount - other.amount
```
````

````{attempt}
:id: more-fixed
:check: more-method
:expect: gives True but it must give False

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

    def year(self):
        return self.date[:4]

    def is_large(self, limit):
        return self.amount > limit

    def costs_more_than(self, other):
        return True
```
````

````{hint}
:title: Show me a solution
:unlock: "more-method" in failed_checks or "more-method" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds the
whole class with a working method `costs_more_than`, and four lines
that use it. The action runs the cell. Compare it with your own cell.

```{cell-insert}
:id: insert-more-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [more-solution]
:run: true
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

coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
bus = Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport")
print(coat.costs_more_than(bus))
print(bus.costs_more_than(coat))
```
````

```{verify}
:id: more-method
:label: Your method costs_more_than compares two purchases
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed more; cell-executed try-more; cell-executed more-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    cls = globals().get("Purchase")
    method = getattr(cls, "costs_more_than", None) if isinstance(cls, type) else None
    if method is None and callable(globals().get("costs_more_than")):
        print("A function with the name costs_more_than exists, but it is outside the class. Its def line probably begins without spaces. Give the def line four spaces and the line of the body eight spaces, so that the method is inside the class Purchase. Then run the cell again.")
        return False
    if not callable(method):
        print("The class Purchase has no method with the name costs_more_than yet. Write the method under the comment at the end of the class. Its first line is def costs_more_than(self, other): with four spaces before it. Then hold Shift and press Enter to run the cell.")
        return False
    try:
        count = len(inspect.signature(method).parameters)
    except (TypeError, ValueError):
        count = 2
    if count < 2:
        print("The method costs_more_than has only one parameter, or none. It needs two: self, for the purchase before the dot, and other, for the purchase between the parentheses of the call. Write def costs_more_than(self, other): and run the cell again.")
        return False
    if count != 2:
        print(f"The method costs_more_than has {count} parameters, but it needs two: self and other. Write def costs_more_than(self, other): and run the cell again.")
        return False
    shown = io.StringIO()
    try:
        inspect.signature(cls).bind("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
        with contextlib.redirect_stdout(shown):
            high = cls("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
            low = cls("2026-01-05", "Bus ticket", Decimal("2.80"), "transport")
            same = cls("2026-02-07", "Shoes", Decimal("74.90"), "clothes")
    except Exception:
        print("The check cannot make an object of your class with four values. The method __init__ must stay as the page gave it, with the parameters self, date, description, amount and category. Add the cell with the class again, and write your method in the new cell.")
        return False
    try:
        with contextlib.redirect_stdout(shown):
            high_low = high.costs_more_than(low)
            low_high = low.costs_more_than(high)
            high_same = high.costs_more_than(same)
    except TypeError:
        print("The method costs_more_than stopped with an error of the type TypeError. This usually means that the body compares self.amount with other. The parameter other is a whole purchase, and Python cannot compare a number with a purchase. Compare self.amount with other.amount. Then run the cell again.")
        return False
    except Exception as error:
        print(f"The method costs_more_than stopped with an error of the type {type(error).__name__} when the check called it. Inside the method, read the two amounts as self.amount and other.amount. Correct the body of the method, and run the cell again.")
        return False
    if high_low is None and shown.getvalue().split() == ["True", "False", "False"]:
        print("The method costs_more_than shows the result with print(), but it does not return it. The code that calls the method needs the value. Replace print( ... ) with a return line. Then run the cell again.")
        return False
    if high_low is None:
        print("The method costs_more_than returns nothing. A method with no return line gives None. The last line of the body must begin with return, and give the result of the comparison. Then run the cell again.")
        return False
    if high_low is False and low_high is True:
        print("The comparison is in the wrong direction. For a purchase of 74.90 and another purchase of 2.80, the method gives False, and with the two purchases in the other order it gives True. The method must return True when self.amount is greater than other.amount. Then run the cell again.")
        return False
    if high_low is not True:
        print(f"For a purchase of 74.90 and another purchase of 2.80, the method gives {high_low!r} but it must give True. Return the result of the comparison of self.amount with other.amount, which is True or False. Then run the cell again.")
        return False
    if low_high is not False:
        print(f"For a purchase of 2.80 and another purchase of 74.90, the method gives {low_high!r} but it must give False. The method must compare the two amounts, self.amount and other.amount, and not return a fixed value. Then run the cell again.")
        return False
    if high_same is not False:
        print(f"For two purchases with the same amount, 74.90 and 74.90, the method gives {high_same!r} but it must give False. A purchase does not cost more than another purchase with the same amount. Use the operator > and not the operator >= in the comparison. Then run the cell again.")
        return False
    print("Correct. Your method costs_more_than returns True for 74.90 against 2.80, and False for 2.80 against 74.90 and for two equal amounts.")
    return True
globals().pop("_workshop_check")()
```

You wrote a method that works with two objects. Inside it, `self` is
one purchase and `other` is another purchase, and each has its own
attribute `amount`.
