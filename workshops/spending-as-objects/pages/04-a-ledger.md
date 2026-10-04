---
title: "Part 2: a ledger"
requires: [verify:ledger-class]
---

# Part 2: a ledger

One `Purchase` object is one purchase. Mariam has 37 of them, and the
program needs one place that holds them all.

## The goal

Write a class named `Ledger`. One object of this class holds a list of
purchases, and it has a method that adds one purchase to that list.

A ledger is not a purchase. A ledger has purchases. This is
**composition**: an object that holds other objects as attributes. In
the later parts, you give the ledger more methods, and each method
answers one question about the purchases that the ledger holds.

## What your code must do

- The class is named `Ledger`. You write it by hand, with a method
  `__init__` of your own, and without the line `@dataclass`. A ledger
  is not made from values that you give to it. Every new ledger starts
  empty.

- The method `__init__` has only the parameter `self`. Python calls
  this method each time a ledger is made. The method gives the new
  object one attribute, named `purchases`, which is an empty list. So
  `Ledger()` makes a ledger that holds no purchases.

- Each ledger has a list of its own. A purchase that is added to one
  ledger does not appear in another ledger.

- The class has a method named `add`. It has two parameters: `self`
  and `purchase`. It appends the purchase to the list of that ledger.
  It gives nothing back.

- After the class, the cell has four more lines. They make one ledger,
  add two purchases to it, and show how many purchases the ledger
  holds:

  ```python
  small_ledger = Ledger()
  small_ledger.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
  small_ledger.add(Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport"))
  print(len(small_ledger.purchases))
  ```

When your code is correct, the output under the cell is:

```
2
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-ledger
:title: Add a cell for part 2
:path: {{ notebook }}
:tags: [ledger]
:run: false
# Part 2: a ledger. Write your code below this line.

```

Write your code under the comment, and run the cell. The check makes
two ledgers of its own from your class, and adds purchases to one of
them.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Your first class** showed a class that is written by
hand. The method `__init__` is written inside the class, and its first
parameter is `self`. A line such as `self.amount = amount` gives the
new object an attribute. The name before the `=` begins with `self.`
and that makes it an attribute of the object. A name without `self.`
is a local name, and it is lost when the method ends.

Here the attribute does not get its value from a parameter. It always
starts as an empty list, which is written `[]`.

The workshop **Keeping a list** showed how to add a value to the end
of a list: `items.append(value)`. Inside a method of the ledger, the
list is `self.purchases`.
```

```{hint}
:title: Hint: the shape of the code
1. Start the class: `class Ledger:`. There is no line `@dataclass`
   above it.

2. Under it, with four spaces before `def`, start the first method:
   `def __init__(self):`. The name has two underscores on each side.

3. The body of that method has one line, which starts with eight
   spaces: `self.purchases = []`.

4. Leave one empty line. Then start the second method, with four
   spaces before `def`: `def add(self, purchase):`.

5. The body of that method has one line, which starts with eight
   spaces: `self.purchases.append(purchase)`.

6. After the class, at the left side of the cell, write the four lines
   from the task.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

A `NameError` that names `Purchase` or `Decimal` means that the cell
of part 1 has not run. Return to the page **Part 1: a purchase**, and
run your cell there again, or use the solution of that page.

An `AttributeError` that says that a `Ledger` object has no attribute
`purchases` means that `__init__` did not give the object that
attribute. Check the spelling of `__init__`, with two underscores on
each side, and check that its body is `self.purchases = []`.

A `TypeError` that says that `add()` takes 1 positional argument but 2
were given means that the method has no parameter `self`. Write
`def add(self, purchase):`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: ledger-not-started
:check: ledger-class
:expect: The class Ledger does not exist yet
```

````{attempt}
:id: ledger-not-a-class
:check: ledger-class
:expect: The name Ledger is not a class

```{cell-insert}
:path: {{ notebook }}
:run: true
Ledger = []
```
````

````{attempt}
:id: ledger-init-parameter
:check: ledger-class
:expect: The check could not make a ledger with Ledger()

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self, purchases):
        self.purchases = purchases

    def add(self, purchase):
        self.purchases.append(purchase)
```
````

````{attempt}
:id: ledger-init-stops
:check: ledger-class
:expect: Python stopped with an error of the type NameError when the check made a ledger

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = purchases

    def add(self, purchase):
        self.purchases.append(purchase)
```
````

````{attempt}
:id: ledger-local-name
:check: ledger-class
:expect: has no attribute named purchases

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)
```
````

````{attempt}
:id: ledger-not-a-list
:check: ledger-class
:expect: but it must be an empty list

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = 0

    def add(self, purchase):
        self.purchases = self.purchases + 1
```
````

````{attempt}
:id: ledger-shared-list
:check: ledger-class
:expect: Two ledgers share one list

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)
```
````

````{attempt}
:id: ledger-shared-default
:check: ledger-class
:expect: Two ledgers share one list

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self, purchases=[]):
        self.purchases = purchases

    def add(self, purchase):
        self.purchases.append(purchase)
```
````

````{attempt}
:id: ledger-no-add
:check: ledger-class
:expect: The class Ledger has no method named add yet

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []
```
````

````{attempt}
:id: ledger-add-no-self
:check: ledger-class
:expect: The method add must have exactly two parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(purchase):
        purchases.append(purchase)
```
````

````{attempt}
:id: ledger-add-no-self-dot
:check: ledger-class
:expect: The method add stopped because it uses a name that has no value

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        purchases.append(purchase)
```
````

````{attempt}
:id: ledger-add-stops
:check: ledger-class
:expect: The method add stopped with an error of the type TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases = self.purchases + purchase
```
````

````{attempt}
:id: ledger-add-nothing
:check: ledger-class
:expect: It holds 0 values

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        purchases = []
        purchases.append(purchase)
```
````

````{attempt}
:id: ledger-add-replaces
:check: ledger-class
:expect: It holds 1 value

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases = [purchase]
```
````

````{attempt}
:id: ledger-add-wrong-order
:check: ledger-class
:expect: It holds 2 values, but they are not those two purchases in that order

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.insert(0, purchase)
```
````

````{attempt}
:id: ledger-no-small
:check: ledger-class
:expect: The name small_ledger does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)
```
````

````{attempt}
:id: ledger-small-is-class
:check: ledger-class
:expect: does not refer to an object of the class Ledger

```{cell-insert}
:path: {{ notebook }}
:run: true
small_ledger = Ledger
```
````

````{attempt}
:id: ledger-small-one
:check: ledger-class
:expect: The ledger small_ledger holds 1 value

```{cell-insert}
:path: {{ notebook }}
:run: true
small_ledger = Ledger()
small_ledger.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
```
````

````{attempt}
:id: ledger-other-way
:check: ledger-class
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = list()

    def add(self, purchase):
        self.purchases = self.purchases + [purchase]
        return self

small_ledger = Ledger()
small_ledger.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
small_ledger.add(Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport"))
print(len(small_ledger.purchases))
```
````

````{hint}
:title: Show me a solution
:unlock: "ledger-class" in failed_checks or "ledger-class" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-ledger-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [ledger-solution]
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

small_ledger = Ledger()
small_ledger.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
small_ledger.add(Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport"))
print(len(small_ledger.purchases))
```
````

```{verify}
:id: ledger-class
:label: The class Ledger holds a list of purchases
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed ledger; cell-executed ledger-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    missing = object()
    if "Ledger" not in globals():
        print("The class Ledger does not exist yet. Write it under the comment in the new cell, and check the spelling of its name, which begins with a capital letter. Then hold Shift and press Enter to run the cell.")
        return False
    cls = globals()["Ledger"]
    if not isinstance(cls, type):
        print("The name Ledger is not a class. It refers to another kind of value. Start the class with the line class Ledger: and write the two methods under it. Then run the cell again.")
        return False
    try:
        inspect.signature(cls).bind()
    except (TypeError, ValueError):
        print("The check could not make a ledger with Ledger(). A ledger is made with no values, so the method __init__ must have exactly one parameter, which is self. The def line must be: def __init__(self): Then run the cell again.")
        return False
    ledgers = []
    for count in range(2):
        try:
            with contextlib.redirect_stdout(io.StringIO()):
                ledgers.append(cls())
        except Exception as error:
            print(f"Python stopped with an error of the type {type(error).__name__} when the check made a ledger with Ledger(). The body of the method __init__ needs only one line, which gives the new object an empty list: self.purchases = []. Then run the cell again.")
            return False
    first, second = ledgers
    start = getattr(first, "purchases", missing)
    if start is missing:
        print("The check made a ledger with Ledger(). That ledger has no attribute named purchases. Check the spelling of __init__, which has two underscores on each side. Check also that the name in its body begins with self and a dot, because a name without self is lost when the method ends: self.purchases = []. Then run the cell again.")
        return False
    if start is getattr(second, "purchases", missing) and isinstance(start, list):
        print("Two ledgers share one list. The check made two ledgers with Ledger(), and the attribute purchases of both refers to the same list, so a purchase that is added to one ledger appears in the other one too. Each ledger needs a new list of its own. Make the list inside __init__, which runs each time a ledger is made: def __init__(self): and under it self.purchases = []. Then run the cell again.")
        return False
    if not isinstance(start, list) or len(start) != 0:
        print(f"The check made a ledger with Ledger(). The attribute purchases of that new ledger is {start!r}, but it must be an empty list. The body of the method __init__ must be: self.purchases = []. Then run the cell again.")
        return False
    def make(values):
        try:
            with contextlib.redirect_stdout(io.StringIO()):
                return globals()["Purchase"](*values)
        except Exception:
            return values
    items = [make(("2025-11-02", "Tea", Decimal("3.50"), "food")), make(("2025-12-09", "Notebook", Decimal("12.00"), "hobbies"))]
    for item in items:
        method = getattr(first, "add", missing)
        if not callable(method):
            print("The class Ledger has no method named add yet. Inside the class, under the method __init__, leave one empty line. Then write def add(self, purchase): with four spaces before def, and write the body under it. Then run the cell again.")
            return False
        try:
            inspect.signature(method).bind(item)
        except (TypeError, ValueError):
            print("The method add must have exactly two parameters: self, and then the purchase to add. The def line must be: def add(self, purchase): When you call small_ledger.add(...), Python gives self the ledger that is before the dot. Then run the cell again.")
            return False
        try:
            with contextlib.redirect_stdout(io.StringIO()):
                method(item)
        except NameError:
            print("The method add stopped because it uses a name that has no value. Inside a method, the list of the ledger is self.purchases, and not purchases alone. The body of the method must be: self.purchases.append(purchase). Then run the cell again.")
            return False
        except Exception as error:
            print(f"The method add stopped with an error of the type {type(error).__name__} when the check added a purchase to a new ledger. The method must append the purchase to the list of the ledger: self.purchases.append(purchase). Correct the method, and run the cell again.")
            return False
    held = getattr(first, "purchases", missing)
    size = len(held) if isinstance(held, list) else 0
    if not (size == 2 and held[0] is items[0] and held[1] is items[1]):
        if size == 2:
            found = "It holds 2 values, but they are not those two purchases in that order."
        elif size == 1:
            found = "It holds 1 value."
        else:
            found = f"It holds {size} values."
        print(f"The check made a ledger and called add two times, with two different purchases. After that, the list purchases of the ledger must hold those two purchases, in the order in which they were added. {found} The method must append each purchase to the list of the ledger, and keep the purchases that are already in it: self.purchases.append(purchase). Then run the cell again.")
        return False
    if "small_ledger" not in globals():
        print("The class Ledger is correct. The name small_ledger does not exist yet. After the class, at the left side of the cell, add the four lines from the task. The first one is: small_ledger = Ledger(). Then run the cell again.")
        return False
    small = globals()["small_ledger"]
    if not isinstance(small, cls):
        print("The class Ledger is correct. The name small_ledger does not refer to an object of the class Ledger as it is now. After the class, in the same cell, make the object with this line, with the parentheses: small_ledger = Ledger(). Then run the whole cell again.")
        return False
    held = getattr(small, "purchases", None)
    size = len(held) if isinstance(held, list) else 0
    if size != 2 or [getattr(item, "description", None) for item in held] != ["Bread and milk", "Bus ticket"]:
        print(f"The class Ledger is correct. The ledger small_ledger holds {size} value{'' if size == 1 else 's'}, but it must hold exactly the two purchases of the task: Bread and milk, and then Bus ticket. After the line small_ledger = Ledger() write the two lines of the task that call small_ledger.add(...). Then run the whole cell again.")
        return False
    print("Correct. Every Ledger object starts with an empty list of its own, and the method add appends a purchase to that list. The ledger small_ledger holds 2 purchases.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

A `Ledger` object holds a list of `Purchase` objects in its attribute
`purchases`. You can loop over that list, and read the attributes of
each purchase: `for purchase in small_ledger.purchases:` and then
`purchase.amount`. In the next part, the purchases come from Mariam's
file.
