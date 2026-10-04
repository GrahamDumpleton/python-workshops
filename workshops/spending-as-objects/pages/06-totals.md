---
title: "Part 4: totals"
requires: [verify:ledger-totals]
---

# Part 4: totals

The ledger holds Mariam's 37 purchases. Now it can start to answer her
questions. The first two are: how much did she spend, and how much did
she spend in each category?

## The goal

Give the class `Ledger` two more methods. The method `total` gives
back the sum of the amounts of every purchase in the ledger. The
method `total_by_category` gives back a dictionary that holds one
total for each category.

In the workshop **Where the money went**, these were separate
functions, and each one needed the list of purchases as an argument.
A method does not need that argument. It reads the list of its own
ledger, which is `self.purchases`.

## A cell that holds the class

A method is written inside its class. So, from this part on, the cell
that you write in is not empty. It arrives with the class `Ledger` as
it is now, and with a comment that shows where the new methods go.
You do not change the methods that are already there.

The cell also has one line after the class, which makes the ledger
again. This line is important. When the cell runs, Python makes a new
class named `Ledger`. The ledger that you made in part 3 still belongs
to the old class, which does not have the new methods. So the cell
reads the file again, and the name `ledger` then refers to an object
of the new class.

## What your code must do

- The method `total` has only the parameter `self`. It adds up the
  amount of every purchase in the list `self.purchases`, and gives the
  sum back. The amount of a purchase is its attribute `amount`. For a
  ledger that holds no purchases, it gives back `0`.

- The method `total_by_category` has only the parameter `self`. It
  gives back a dictionary. Each key is a category, and its value is
  the sum of the amounts of the purchases in that category. A category
  that has no purchase is not a key. For a ledger that holds no
  purchases, it gives back an empty dictionary.

- Both methods give the result back with `return`. They do not print
  it.

- Both methods read the purchases from `self.purchases`, and not from
  the name `ledger`, so that they work for every ledger.

- After the line that makes the ledger again, the cell has four more
  lines. They call the two methods, and show the results:

  ```python
  spending_total = ledger.total()
  category_totals = ledger.total_by_category()
  print(spending_total)
  print(category_totals)
  ```

For example, think of a ledger that holds these four purchases:

| date | description | amount | category |
|------|-------------|--------|----------|
| `2025-11-02` | `Tea` | `3.50` | `food` |
| `2025-11-20` | `Tram ticket` | `2.10` | `transport` |
| `2025-12-05` | `Soup` | `4.25` | `food` |
| `2025-12-09` | `Notebook` | `12.00` | `hobbies` |

For that ledger, `total()` must give back `Decimal('21.85')`, and
`total_by_category()` must give back this dictionary:

```
{'food': Decimal('7.75'), 'transport': Decimal('2.10'), 'hobbies': Decimal('12.00')}
```

When your code is correct, the output under the cell is:

```
2834.79
{'rent': Decimal('1950.00'), 'food': Decimal('445.60'), 'transport': Decimal('181.30'), 'phone': Decimal('54.00'), 'hobbies': Decimal('63.49'), 'clothes': Decimal('140.40')}
```

## Where to write it

The action below adds the cell for this part.

```{cell-insert}
:id: insert-totals
:title: Add a cell for part 4, with the class as it is now
:path: {{ notebook }}
:tags: [totals]
:run: false
# Part 4: totals. This is the class Ledger as it is now.
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    # Write the methods total and total_by_category below this line.
    # Start each def line with four spaces.


# The class has changed, so this line makes the ledger again.
ledger = read_ledger("spending.csv")

# Write the four lines that use the two methods below this line.

```

Write the two methods on the empty lines under the first comment, and
the four lines from the task at the end of the cell. Then run the
cell. The check makes ledgers of its own from your class, and calls
your two methods for them.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Doing it again** showed how to add up a total with a
loop. A name starts at `0`, and each pass of the loop adds one value
to it. Here the loop is `for purchase in self.purchases:`, and the
value to add is `purchase.amount`.

The workshop **Looking things up** showed how to keep one total for
each key of a dictionary. The dictionary starts empty. For each value,
this line adds to the total of its key:
`totals[key] = totals.get(key, 0) + amount`. The method `get` gives
the total until now, or `0` when the key is not in the dictionary yet.
Here the key is `purchase.category`.

A method is written like a function, but inside the class. The line
with `def` starts with four spaces, the body starts with eight spaces,
and the first parameter is `self`.
```

```{hint}
:title: Hint: the shape of the code
1. Under the comment inside the class, start the first method, with
   four spaces before `def`: `def total(self):`.

2. In its body, give a name its first value: `result = 0`. Then write
   a loop: `for purchase in self.purchases:`. The block of the loop
   has one line: `result = result + purchase.amount`.

3. After the loop, with eight spaces at the start of the line, give
   the sum back: `return result`.

4. Leave one empty line, and start the second method:
   `def total_by_category(self):`.

5. In its body, make an empty dictionary: `totals = {}`. Then write
   the same loop: `for purchase in self.purchases:`. The block of the
   loop has one line:
   `totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount`.

6. After the loop, with eight spaces at the start of the line, give
   the dictionary back: `return totals`.

7. At the end of the cell, at the left side, write the four lines from
   the task.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

A `NameError` that names `read_ledger` means that the cell of part 3
has not run. Return to the page **Part 3: read the file**, and run
your cell there again, or use the solution of that page.

A `NameError` that names `purchases` means that a method reads
`purchases` alone. Inside a method, write `self.purchases`.

An `AttributeError` that says that a `Ledger` object has no attribute
`total` means that Python did not find the method in the class. Check
the spelling of the name, and check that the line with `def` starts
with exactly four spaces, so that the method is inside the class.

A `TypeError` that says that `total()` takes 0 positional arguments
but 1 was given means that the method has no parameter `self`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: totals-not-started
:check: ledger-totals
:expect: The class Ledger has no method named total yet
```

````{attempt}
:id: totals-no-add
:check: ledger-totals
:expect: The check could not make a ledger of its own

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def total(self):
        return 0
```
````

````{attempt}
:id: totals-no-self
:check: ledger-totals
:expect: The method total does not have the right parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total():
        return 0
```
````

````{attempt}
:id: totals-no-self-dot
:check: ledger-totals
:expect: The method total stopped because it uses a name that has no value

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in purchases:
            result = result + purchase.amount
        return result
```
````

````{attempt}
:id: totals-stops
:check: ledger-totals
:expect: The method total stopped with an error of the type TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase
        return result
```
````

````{attempt}
:id: totals-prints
:check: ledger-totals
:expect: The method total shows its result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        print(result)
```
````

````{attempt}
:id: totals-none
:check: ledger-totals
:expect: The method total gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
```
````

````{attempt}
:id: totals-global-ledger
:check: ledger-totals
:expect: adds up the purchases of the name ledger

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in ledger.purchases:
            result = result + purchase.amount
        return result
```
````

````{attempt}
:id: totals-return-in-loop
:check: ledger-totals
:expect: That is the amount of the first purchase only

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
            return result
```
````

````{attempt}
:id: totals-counts
:check: ledger-totals
:expect: the method total gives back 4, but it must give back 21.85

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        return len(self.purchases)
```
````

````{attempt}
:id: totals-empty-stops
:check: ledger-totals
:expect: for a ledger that holds no purchases

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = self.purchases[0].amount
        for purchase in self.purchases[1:]:
            result = result + purchase.amount
        return result
```
````

````{attempt}
:id: totals-no-second-method
:check: ledger-totals
:expect: The class Ledger has no method named total_by_category yet

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result
```
````

````{attempt}
:id: totals-category-list
:check: ledger-totals
:expect: but it must give back a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        return [purchase.category for purchase in self.purchases]
```
````

````{attempt}
:id: totals-category-counts
:check: ledger-totals
:expect: holds the number of purchases in each category

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + 1
        return totals
```
````

````{attempt}
:id: totals-category-last
:check: ledger-totals
:expect: the method total_by_category gives back food 4.25, transport 2.10, hobbies 12.00

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = purchase.amount
        return totals
```
````

````{attempt}
:id: totals-no-names
:check: ledger-totals
:expect: The name spending_total does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

ledger = read_ledger("spending.csv")
```
````

````{attempt}
:id: totals-method-not-called
:check: ledger-totals
:expect: The name spending_total refers to a method

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = ledger.total
```
````

````{attempt}
:id: totals-wrong-total
:check: ledger-totals
:expect: but the total of Mariam's 37 purchases is 2834.79

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = Decimal("9.20")
```
````

````{attempt}
:id: totals-no-category-totals
:check: ledger-totals
:expect: The name category_totals does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = ledger.total()
```
````

````{attempt}
:id: totals-wrong-category-totals
:check: ledger-totals
:expect: The name category_totals does not refer to the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
category_totals = ledger.total_by_category
```
````

````{attempt}
:id: totals-other-way
:check: ledger-totals
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        amounts = [purchase.amount for purchase in self.purchases]
        result = Decimal("0")
        for amount in amounts:
            result += amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            if purchase.category in totals:
                totals[purchase.category] += purchase.amount
            else:
                totals[purchase.category] = purchase.amount
        return totals

ledger = read_ledger("spending.csv")
spending_total = ledger.total()
category_totals = ledger.total_by_category()
print(spending_total)
```
````

````{hint}
:title: Show me a solution
:unlock: "ledger-totals" in failed_checks or "ledger-totals" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-totals-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [totals-solution]
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

# The class has changed, so this line makes the ledger again.
ledger = read_ledger("spending.csv")

spending_total = ledger.total()
category_totals = ledger.total_by_category()
print(spending_total)
print(category_totals)
```
````

```{verify}
:id: ledger-totals
:label: The ledger gives its total and the total for each category
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed totals; cell-executed totals-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    missing = object()
    cls = globals().get("Ledger")
    kind = globals().get("Purchase")
    def fresh(rows):
        try:
            with contextlib.redirect_stdout(io.StringIO()):
                made = cls()
                for row in rows:
                    made.add(kind(row[0], row[1], Decimal(row[2]), row[3]))
                return made if len(made.purchases) == len(rows) else None
        except Exception:
            return None
    def number(value):
        try:
            return None if isinstance(value, (bool, str)) else round(float(value), 2)
        except Exception:
            return None
    def plain(value):
        return str(value) if number(value) is not None else repr(value)
    def text(value):
        if not isinstance(value, dict):
            return repr(value)
        if len(value) == 0:
            return "an empty dictionary"
        return ", ".join(f"{key} {amount}" if isinstance(amount, int) else f"{key} {amount:.2f}" if number(amount) is not None else f"{key} {amount!r}" for key, amount in value.items())
    def same(found, wanted):
        return isinstance(found, dict) and len(found) == len(wanted) and all(key in found and number(found[key]) == amount for key, amount in wanted.items())
    def call(name, target, about):
        method = getattr(target, name, missing)
        if not callable(method):
            print(f"The class Ledger has no method named {name} yet. Write it inside the class, under the comment, with four spaces before def: def {name}(self): Check the spelling of the name. Then run the cell again.")
            return False, None
        try:
            inspect.signature(method).bind()
        except (TypeError, ValueError):
            print(f"The method {name} does not have the right parameters. Its only parameter is self, so the def line must be: def {name}(self): When you call ledger.{name}(), Python gives self the ledger that is before the dot. Then run the cell again.")
            return False, None
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = method()
        except NameError:
            print(f"The method {name} stopped because it uses a name that has no value. Inside a method, the list of the ledger is self.purchases, and not purchases alone. Check also the spelling of each name in the body. Then run the cell again.")
            return False, None
        except Exception as error:
            print(f"The method {name} stopped with an error of the type {type(error).__name__} when the check called it for {about}. Call ledger.{name}() in a cell of your own, and read the last line of the error message. Correct the method, and run the cell again.")
            return False, None
        if result is None and shown.getvalue().strip():
            print(f"The method {name} shows its result with print(), but it does not return it. The code that calls the method then receives None. Replace print() in the last line of the body with return. Then run the cell again.")
            return False, None
        if result is None:
            print(f"The method {name} gives back None. That happens when the body has no return line. After the loop, add a line that starts with eight spaces and begins with the word return. Then run the cell again.")
            return False, None
        return True, result
    tests = [
        ([("2025-11-02", "Tea", "3.50", "food"), ("2025-11-20", "Tram ticket", "2.10", "transport"), ("2025-12-05", "Soup", "4.25", "food"), ("2025-12-09", "Notebook", "12.00", "hobbies")], "a ledger that holds 4 purchases (Tea 3.50 food, Tram ticket 2.10 transport, Soup 4.25 food, Notebook 12.00 hobbies)", 21.85, {"food": 7.75, "transport": 2.1, "hobbies": 12.0}, {"food": 2, "transport": 1, "hobbies": 1}),
        ([("2025-10-03", "Novel", "12.50", "books"), ("2025-10-12", "Concert", "15.00", "music")], "a ledger that holds 2 purchases (Novel 12.50 books, Concert 15.00 music)", 27.5, {"books": 12.5, "music": 15.0}, {"books": 1, "music": 1}),
        ([], "a ledger that holds no purchases", 0, {}, {}),
    ]
    if not isinstance(cls, type) or not isinstance(kind, type) or fresh(tests[0][0]) is None:
        print("The check could not make a ledger of its own with Ledger(), Purchase(...) and the method add. Your cell must keep the methods __init__ and add of the class Ledger as the action gave them, and the class Purchase of part 1 must exist. If those lines are lost, click the action that adds the cell for this part again, and write your methods in the new cell. Then run the cell again.")
        return False
    for rows, about, wanted, by_category, counts in tests:
        fine, result = call("total", fresh(rows), about)
        if not fine:
            return False
        if number(result) == 2834.79 and wanted != 2834.79:
            print(f"The method total adds up the purchases of the name ledger. The check called it for {about}, and it gave back 2834.79, which is the total of Mariam's purchases. A method must read the list of its own ledger: write self.purchases in the loop, and not ledger.purchases. Then run the cell again.")
            return False
        if len(rows) > 1 and number(result) == float(rows[0][2]):
            print(f"For {about}, the method total gives back {plain(result)}. That is the amount of the first purchase only. It happens when the return line is inside the loop, so the method stops in the first pass. The return line must start with eight spaces only. Then run the cell again.")
            return False
        if number(result) != wanted:
            print(f"For {about}, the method total gives back {plain(result)}, but it must give back {wanted}. Start a name at 0, add purchase.amount to it for every purchase in self.purchases, and give the name back after the loop. Then run the cell again.")
            return False
    for rows, about, wanted, by_category, counts in tests:
        fine, result = call("total_by_category", fresh(rows), about)
        if not fine:
            return False
        if not isinstance(result, dict):
            print(f"For {about}, the method total_by_category gives back {result!r}, but it must give back a dictionary. Start with an empty dictionary, totals = {chr(123)}{chr(125)}, add each amount to the total of its category, and give the dictionary back after the loop. Then run the cell again.")
            return False
        if len(rows) > 0 and same(result, counts) and not same(result, by_category):
            print(f"For {about}, the dictionary that total_by_category gives back holds the number of purchases in each category: {text(result)}. It must hold the sum of the amounts. In the line that adds to a total, add purchase.amount, and not 1. Then run the cell again.")
            return False
        if not same(result, by_category):
            print(f"For {about}, the method total_by_category gives back {text(result)}. It must give back {text(by_category)}. Each key is purchase.category, and the line that adds to the total of a key is: totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount. Then run the cell again.")
            return False
    if "spending_total" not in globals():
        print("The two methods are correct. The name spending_total does not exist yet. At the end of the cell, at the left side, add the four lines from the task. The first one is: spending_total = ledger.total(). Then run the cell again.")
        return False
    if callable(globals()["spending_total"]):
        print("The two methods are correct. The name spending_total refers to a method, and not to the value that the method gives back. Call the method, with parentheses after its name: spending_total = ledger.total(). Then run the cell again.")
        return False
    if number(globals()["spending_total"]) != 2834.79:
        print(f"The two methods are correct. The name spending_total refers to the value {plain(globals()['spending_total'])}, but the total of Mariam's 37 purchases is 2834.79. Call the method for the ledger that holds her purchases: spending_total = ledger.total(). Then run the cell again.")
        return False
    if "category_totals" not in globals():
        print("The two methods and the name spending_total are correct. The name category_totals does not exist yet. Add the other lines from the task. The next one is: category_totals = ledger.total_by_category(). Then run the cell again.")
        return False
    if not same(globals()["category_totals"], {"rent": 1950.0, "food": 445.6, "transport": 181.3, "phone": 54.0, "hobbies": 63.49, "clothes": 140.4}):
        print("The two methods and the name spending_total are correct. The name category_totals does not refer to the dictionary of the totals of Mariam's six categories. Call the method for the ledger that holds her purchases, with parentheses after its name: category_totals = ledger.total_by_category(). Then run the cell again.")
        return False
    print("Correct. The method total gives 2834.79 for Mariam's ledger, and the method total_by_category gives one total for each of her six categories.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The ledger can answer two questions. Mariam spent 2834.79 in the three
months. Most of it was rent, 1950.00, and then food, 445.60.

Look at the two calls: `ledger.total()` and
`ledger.total_by_category()`. You give them no list of purchases. The
ledger knows its own purchases.
