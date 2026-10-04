---
title: Add a method to the child class
requires: [verify:yearly-cost]
---

# Add a method to the child class

A child class can have methods that its parent class does not have.
You write such a method inside the child class, in the same way as
any other method: a `def` line with `self` as the first parameter,
and a body.

The new method belongs to the child class only. Objects of the child
class have the methods of the parent class and the new method.
Objects of the parent class do not get the new method.

For example, a method with the name `is_large` in the class
`Subscription` looks like this:

```python
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def is_large(self):
        return self.amount > 30
```

The method uses `self.amount`. The class `Subscription` does not make
that attribute itself. The method `__init__` of the parent class
makes it, and every method of the child class can read it.

## Your task

A subscription is paid every month, so it is useful to know what it
costs in one year. Write a method of the class `Subscription` with
the name `yearly_cost`. It has one parameter, `self`. It returns the
amount of the subscription multiplied by `12`.

| The subscription | The call | The return value |
|------------------|----------|------------------|
| Monthly bus pass, amount `42.00` | `bus_pass.yearly_cost()` | `504.00` |
| Phone bill, amount `18.00` | `phone.yearly_cost()` | `216.00` |

The method must return the value. It must not print it.

Click the action below. It adds a cell that holds the class
`Subscription`, with a comment that marks the place for your method.

```{cell-insert}
:id: insert-yearly-cost
:title: Add a cell with the class Subscription, for my method
:path: {{ notebook }}
:tags: [yearly-cost]
:run: false
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    # Write the method yearly_cost below this line.


bus_pass = Subscription("2026-01-12", "Monthly bus pass", Decimal("42.00"), "transport")
print(bus_pass.yearly_cost())
```

Click on the empty line under the comment, and type your method. The
method is inside the class, so its `def` line begins with four
spaces, and its body begins with eight spaces. Then run the cell:
hold `Shift` and press `Enter`.

The last two lines of the cell make a subscription and call your
method. The cell makes a new object because the cell makes the class
again. An object that was made before, such as `phone`, still belongs
to the old class, which does not have your method.

When your method is correct, the output under the cell is:

```
504.00
```

````{hint}
:title: Hint: the first line of the method
The `def` line begins with four spaces, because the method is inside
the class. It has the one parameter `self`:

```python
    def yearly_cost(self):
```
````

````{hint}
:title: Hint: the body
The body is one line that begins with eight spaces and with the word
`return`. Inside the method, the amount of the subscription is
`self.amount`:

```python
        return self.amount * 12
```
````

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: yearly-cost-not-started
:check: yearly-cost
:expect: has no method yearly_cost yet
```

````{attempt}
:id: yearly-cost-outside
:check: yearly-cost
:expect: is outside the class

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

def yearly_cost(self):
    return self.amount * 12
```
````

````{attempt}
:id: yearly-cost-no-parent
:check: yearly-cost
:expect: The check could not make a Subscription

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription:
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        return self.amount * 12
```
````

````{attempt}
:id: yearly-cost-no-self
:check: yearly-cost
:expect: has no parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost():
        return amount * 12
```
````

````{attempt}
:id: yearly-cost-two-parameters
:check: yearly-cost
:expect: must have one parameter only

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self, amount):
        return amount * 12
```
````

````{attempt}
:id: yearly-cost-stops
:check: yearly-cost
:expect: stopped with an AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        return self.amout * 12
```
````

````{attempt}
:id: yearly-cost-prints
:check: yearly-cost
:expect: shows the result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        print(self.amount * 12)
```
````

````{attempt}
:id: yearly-cost-no-return
:check: yearly-cost
:expect: gives nothing back

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        cost = self.amount * 12
```
````

````{attempt}
:id: yearly-cost-one-month
:check: yearly-cost
:expect: That is the cost of one month

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        return self.amount
```
````

````{attempt}
:id: yearly-cost-fixed
:check: yearly-cost
:expect: The method must calculate the result from self.amount

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        return Decimal("504.00")
```
````

````{attempt}
:id: yearly-cost-wrong
:check: yearly-cost
:expect: but it must give 504.00

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        return self.amount + 12
```
````

````{attempt}
:id: yearly-cost-other-way
:check: yearly-cost
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        months = 12
        cost = months * self.amount
        return cost
```
````

````{hint}
:title: Show me a solution
:unlock: "yearly-cost" in failed_checks or "yearly-cost" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds the
whole class with a working method, and the action runs it. Compare it
with your own cell.

```{cell-insert}
:id: insert-yearly-cost-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [yearly-cost-solution]
:run: true
class Subscription(Purchase):
    """A purchase that is paid again every month."""

    def yearly_cost(self):
        return self.amount * 12

bus_pass = Subscription("2026-01-12", "Monthly bus pass", Decimal("42.00"), "transport")
print(bus_pass.yearly_cost())
```
````

```{verify}
:id: yearly-cost
:label: Your method yearly_cost returns the cost of a subscription for one year
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed yearly-cost; cell-executed yearly-cost-solution
def _workshop_check():
    import contextlib, decimal, inspect, io
    cls = globals().get("Subscription")
    values = (("2026-01-12", "Monthly bus pass", decimal.Decimal("42.00"), "transport"), ("2026-01-06", "Phone bill", decimal.Decimal("18.00"), "phone"))
    made = []
    try:
        for four in values:
            inspect.signature(cls).bind(*four)
            with contextlib.redirect_stdout(io.StringIO()):
                made.append(cls(*four))
    except Exception:
        print("The check could not make a Subscription from the four values of a purchase. The first line of the class must be class Subscription(Purchase): with the name of the parent class in parentheses. On this page, the class has no method __init__ of its own. Correct the cell, and run it again.")
        return False
    method = getattr(cls, "yearly_cost", None)
    if not callable(method):
        if callable(globals().get("yearly_cost")):
            print("There is a function yearly_cost, but it is outside the class, so it is not a method of Subscription. A method is inside the class: its def line begins with four spaces, and its body begins with eight spaces. Add the spaces, and run the cell again.")
        else:
            print("The class Subscription has no method yearly_cost yet. Write the method under the comment in the new cell. Its first line is def yearly_cost(self): with four spaces before it. Then hold Shift and press Enter to run the cell.")
        return False
    try:
        count = len(inspect.signature(method).parameters)
    except (TypeError, ValueError):
        count = 1
    if count == 0:
        print("The method yearly_cost has no parameter. Every method needs self as its first parameter, because Python gives the object to the method as self. Write def yearly_cost(self): and use self.amount in the body. Then run the cell again.")
        return False
    if count > 1:
        print(f"The method yearly_cost has {count} parameters, but it must have one parameter only, which is self. The amount is not a parameter: the method reads it from the object, as self.amount. Write def yearly_cost(self): and run the cell again.")
        return False
    results = []
    printed = []
    for thing in made:
        output = io.StringIO()
        try:
            with contextlib.redirect_stdout(output):
                results.append(thing.yearly_cost())
        except Exception as error:
            kind = type(error).__name__
            article = "an" if kind[0] in "AEIOU" else "a"
            print(f"The call yearly_cost() on a subscription stopped with {article} {kind}. Read the last line of the error message under your cell. Inside the method, the amount is self.amount, with the same spelling as in the class Purchase. Correct the body, and run the cell again.")
            return False
        printed.append(output.getvalue().strip())
    def number(value):
        if isinstance(value, (int, float, decimal.Decimal)) and not isinstance(value, bool):
            return round(float(value), 2)
        return None
    def show(value):
        return str(value) if number(value) is not None else repr(value)
    first, second = number(results[0]), number(results[1])
    if first == 504.0 and second == 216.0:
        print("Correct. A bus pass of 42.00 costs 504.00 in one year, and a phone bill of 18.00 costs 216.00. Your method belongs to the child class Subscription only.")
        return True
    if results[0] is None and printed[0] in ("504.00", "504.0", "504"):
        print("The method yearly_cost shows the result with print(), but it does not return it. The code that calls the method receives nothing. Replace the print() line in the body with a line that begins with the word return: return self.amount * 12. Then run the cell again.")
        return False
    if results[0] is None:
        print("The call yearly_cost() gives nothing back. The body needs a line that begins with the word return, and then the value to give back: return self.amount * 12. Then run the cell again.")
        return False
    if first == 42.0:
        print("For a subscription with the amount 42.00, yearly_cost() gives 42.00. That is the cost of one month. Multiply the amount by 12: return self.amount * 12. Then run the cell again.")
        return False
    if first == 504.0:
        print(f"For a subscription with the amount 42.00, yearly_cost() gives 504.00, which is correct. But for the amount 18.00 it gives {show(results[1])} and it must give 216.00. The method must calculate the result from self.amount: return self.amount * 12. Then run the cell again.")
        return False
    print(f"For a subscription with the amount 42.00, yearly_cost() gives {show(results[0])} but it must give 504.00. Multiply the amount of the object by 12: return self.amount * 12. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

Your class `Subscription` now has four attributes and two methods
from its parent class, and one method of its own.
