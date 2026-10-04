---
title: "Part 5: months and the largest purchase"
requires: [verify:ledger-months]
---

# Part 5: months and the largest purchase

Mariam has two more questions. How much did she spend in each month?
And which purchase was the largest?

## The goal

Give the class `Ledger` two more methods. The method `total_by_month`
gives back a dictionary that holds one total for each month. The
method `largest` gives back the purchase that has the largest amount.

## What your code must do

- The method `total_by_month` has only the parameter `self`. It gives
  back a dictionary. Each key is a month, such as `"2026-01"`, and its
  value is the sum of the amounts of the purchases in that month. For a
  ledger that holds no purchases, it gives back an empty dictionary.

- A purchase knows its own month. You wrote the method `month` in part
  1, so the month of a purchase is `purchase.month()`, with the
  parentheses.

- The method `largest` has only the parameter `self`. It compares the
  amounts of the purchases in `self.purchases`. It gives back one
  `Purchase` object: the purchase that has the largest amount. It does
  not give back the amount alone. The ledger holds at least one
  purchase when this method is called.

- Both methods give the result back with `return`. They do not print
  it, and they do not change the list of purchases.

- After the line that makes the ledger again, the cell has four more
  lines. They call the two methods, and show the results:

  ```python
  month_totals = ledger.total_by_month()
  largest_purchase = ledger.largest()
  print(month_totals)
  print(largest_purchase)
  ```

For example, think of a ledger that holds these four purchases:

| date | description | amount | category |
|------|-------------|--------|----------|
| `2025-11-02` | `Tea` | `3.50` | `food` |
| `2025-12-09` | `Notebook` | `12.00` | `hobbies` |
| `2025-11-20` | `Tram ticket` | `2.10` | `transport` |
| `2025-12-05` | `Soup` | `4.25` | `food` |

For that ledger, `total_by_month()` must give back this dictionary:

```
{'2025-11': Decimal('5.60'), '2025-12': Decimal('16.25')}
```

And `largest()` must give back the second purchase:

```
Purchase(date='2025-12-09', description='Notebook', amount=Decimal('12.00'), category='hobbies')
```

The check uses ledgers in which one purchase is larger than every
other purchase. In Mariam's data, three purchases have the same
largest amount, because she paid the same rent in each month. Your
method may give back any one of the three.

When your code is correct, the output under the cell is:

```
{'2026-01': Decimal('917.20'), '2026-02': Decimal('942.34'), '2026-03': Decimal('975.25')}
Purchase(date='2026-01-01', description='Rent for January', amount=Decimal('650.00'), category='rent')
```

The second line can show the rent of February or of March, when your
method compares the amounts in another way.

## Where to write it

The action below adds the cell for this part. It holds the class
`Ledger` with the four methods that it has now. The two methods of
part 4 are complete in this cell, so you can continue also when you
did not finish that part.

```{cell-insert}
:id: insert-months
:title: Add a cell for part 5, with the class as it is now
:path: {{ notebook }}
:tags: [months]
:run: false
# Part 5: months and the largest purchase. This is the class Ledger as it is now.
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

    # Write the methods total_by_month and largest below this line.
    # Start each def line with four spaces.


# The class has changed, so this line makes the ledger again.
ledger = read_ledger("spending.csv")

# Write the four lines that use the two methods below this line.

```

Write the two methods on the empty lines under the comment inside the
class, and the four lines from the task at the end of the cell. Then
run the cell.

## If you need help

```{hint}
:title: Hint: what to look at
The method `total_by_month` is almost the same as the method
`total_by_category`, which is in the cell. Only the key is different.
The key is not `purchase.category`. It is the month of the purchase,
which the method `month` of the purchase gives back:
`purchase.month()`.

The workshop **Doing it again** showed how to find the largest value
of a list. A name starts with the first value of the list. A loop
visits every value, and an `if` tests whether that value is larger
than the largest until now. When it is, the name gets that value.

Here the list holds `Purchase` objects, and you need the whole object,
not only its amount. So the name refers to an object, and the `if`
compares two amounts: `if purchase.amount > result.amount:`.
```

```{hint}
:title: Hint: the shape of the code
1. Under the comment inside the class, start the first method, with
   four spaces before `def`: `def total_by_month(self):`.

2. Its body is the body of `total_by_category`, with one change. Write
   `purchase.month()` in the two places where that method has
   `purchase.category`.

3. Leave one empty line, and start the second method:
   `def largest(self):`.

4. In its body, start with the first purchase of the list:
   `result = self.purchases[0]`.

5. Write a loop: `for purchase in self.purchases:`. Inside the loop,
   write an `if`: `if purchase.amount > result.amount:`. The block
   under the `if` has one line: `result = purchase`.

6. After the loop, with eight spaces at the start of the line, give
   the object back: `return result`.

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

A `TypeError` that names `method` means that the code uses a method as
if it was a value. The most likely reason is that the parentheses are
missing after `purchase.month`. Write `purchase.month()`.

A `TypeError` that says that `>` is not supported between a `Decimal`
and a `Purchase` means that the `if` compares an amount with a whole
object. Compare two amounts: `purchase.amount > result.amount`.

An `AttributeError` that says that a `Purchase` object has no
attribute `month` means that the class `Purchase` of part 1 has no
method `month`. Return to the page **Part 1: a purchase**, and use the
solution of that page.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: months-not-started
:check: ledger-months
:expect: The class Ledger has no method named total_by_month yet
```

````{attempt}
:id: months-no-add
:check: ledger-months
:expect: The check could not make a ledger of its own

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def total_by_month(self):
        return 0
```
````

````{attempt}
:id: months-no-self
:check: ledger-months
:expect: The method total_by_month does not have the right parameters

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

    def total_by_month():
        return 0
```
````

````{attempt}
:id: months-no-self-dot
:check: ledger-months
:expect: The method total_by_month stopped because it uses a name that has no value

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

    def total_by_month(self):
        totals = {}
        for purchase in purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals
```
````

````{attempt}
:id: months-not-called
:check: ledger-months
:expect: The method total_by_month stopped with an error of the type TypeError

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month] = totals.get(purchase.month, 0) + purchase.amount()
        return totals
```
````

````{attempt}
:id: months-prints
:check: ledger-months
:expect: The method total_by_month shows its result with print(), but it does not return it

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        print(totals)
```
````

````{attempt}
:id: months-none
:check: ledger-months
:expect: The method total_by_month gives back None

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
```
````

````{attempt}
:id: months-number
:check: ledger-months
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
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        return self.total()
```
````

````{attempt}
:id: months-whole-date
:check: ledger-months
:expect: The keys of that dictionary are whole dates

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.date] = totals.get(purchase.date, 0) + purchase.amount
        return totals
```
````

````{attempt}
:id: months-method-as-key
:check: ledger-months
:expect: The keys of that dictionary are methods

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month] = totals.get(purchase.month, 0) + purchase.amount
        return totals
```
````

````{attempt}
:id: months-by-category
:check: ledger-months
:expect: It must give back 2025-11 5.60, 2025-12 16.25

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

    def total_by_month(self):
        return self.total_by_category()
```
````

````{attempt}
:id: largest-missing
:check: ledger-months
:expect: The class Ledger has no method named largest yet

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals
```
````

````{attempt}
:id: largest-amount
:check: ledger-months
:expect: gives back the amount 12.00

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = 0
        for purchase in self.purchases:
            if purchase.amount > result:
                result = purchase.amount
        return result
```
````

````{attempt}
:id: largest-description
:check: ledger-months
:expect: but it must give back a Purchase object

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result.description
```
````

````{attempt}
:id: largest-first
:check: ledger-months
:expect: gives back the first purchase of the list

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                purchase = result
        return result
```
````

````{attempt}
:id: largest-last
:check: ledger-months
:expect: gives back the last purchase of the list

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        for purchase in self.purchases:
            result = purchase
        return result
```
````

````{attempt}
:id: largest-smallest
:check: ledger-months
:expect: gives back the purchase Tram ticket, whose amount is 2.10

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount < result.amount:
                result = purchase
        return result
```
````

````{attempt}
:id: months-no-names
:check: ledger-months
:expect: The name month_totals does not exist yet

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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

ledger = read_ledger("spending.csv")
```
````

````{attempt}
:id: months-wrong-month-totals
:check: ledger-months
:expect: The name month_totals does not refer to the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
month_totals = ledger.total_by_category()
```
````

````{attempt}
:id: months-no-largest-purchase
:check: ledger-months
:expect: The name largest_purchase does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
month_totals = ledger.total_by_month()
```
````

````{attempt}
:id: months-largest-not-called
:check: ledger-months
:expect: The name largest_purchase does not refer to the largest purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
largest_purchase = ledger.largest
```
````

````{attempt}
:id: months-other-way
:check: ledger-months
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
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            month = purchase.date[:7]
            if month not in totals:
                totals[month] = 0
            totals[month] += purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for index in range(len(self.purchases)):
            if self.purchases[index].amount >= result.amount:
                result = self.purchases[index]
        return result

ledger = read_ledger("spending.csv")
month_totals = ledger.total_by_month()
largest_purchase = ledger.largest()
print(largest_purchase)
```
````

````{hint}
:title: Show me a solution
:unlock: "ledger-months" in failed_checks or "ledger-months" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-months-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [months-solution]
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

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

# The class has changed, so this line makes the ledger again.
ledger = read_ledger("spending.csv")

month_totals = ledger.total_by_month()
largest_purchase = ledger.largest()
print(month_totals)
print(largest_purchase)
```
````

```{verify}
:id: ledger-months
:label: The ledger gives the total for each month and the largest purchase
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed months; cell-executed months-solution
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
    def text(value):
        if len(value) == 0:
            return "an empty dictionary"
        return ", ".join(f"{key} {amount:.2f}" if number(amount) is not None else f"{key} {amount!r}" for key, amount in value.items())
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
            print(f"The method {name} stopped with an error of the type {type(error).__name__} when the check called it for {about}. If the type is TypeError, check that the method calls purchase.month() with parentheses, that it reads purchase.amount without parentheses, and that it compares two amounts. Correct the method, and run the cell again.")
            return False, None
        if result is None and shown.getvalue().strip():
            print(f"The method {name} shows its result with print(), but it does not return it. The code that calls the method then receives None. Replace print() in the last line of the body with return. Then run the cell again.")
            return False, None
        if result is None:
            print(f"The method {name} gives back None. That happens when the body has no return line. After the loop, add a line that starts with eight spaces and begins with the word return. Then run the cell again.")
            return False, None
        return True, result
    tests = [
        ([("2025-11-02", "Tea", "3.50", "food"), ("2025-12-09", "Notebook", "12.00", "hobbies"), ("2025-11-20", "Tram ticket", "2.10", "transport"), ("2025-12-05", "Soup", "4.25", "food")], "a ledger that holds 4 purchases (2025-11-02 Tea 3.50, 2025-12-09 Notebook 12.00, 2025-11-20 Tram ticket 2.10, 2025-12-05 Soup 4.25)", {"2025-11": 5.6, "2025-12": 16.25}, 1),
        ([("2025-10-03", "Novel", "12.50", "books"), ("2025-10-12", "Concert", "15.00", "music"), ("2025-09-30", "Pencil", "1.20", "books")], "a ledger that holds 3 purchases (2025-10-03 Novel 12.50, 2025-10-12 Concert 15.00, 2025-09-30 Pencil 1.20)", {"2025-10": 27.5, "2025-09": 1.2}, 1),
        ([("2025-08-05", "Spade", "26.00", "garden"), ("2025-08-09", "Flower pots", "9.50", "garden"), ("2025-08-21", "Seeds", "3.20", "garden")], "a ledger that holds 3 purchases (2025-08-05 Spade 26.00, 2025-08-09 Flower pots 9.50, 2025-08-21 Seeds 3.20)", {"2025-08": 38.7}, 0),
        ([], "a ledger that holds no purchases", {}, None),
    ]
    if not isinstance(cls, type) or not isinstance(kind, type) or fresh(tests[0][0]) is None:
        print("The check could not make a ledger of its own with Ledger(), Purchase(...) and the method add. Your cell must keep the methods of the class Ledger as the action gave them, and the class Purchase of part 1 must exist. If those lines are lost, click the action that adds the cell for this part again, and write your methods in the new cell. Then run the cell again.")
        return False
    for rows, about, by_month, place in tests:
        fine, result = call("total_by_month", fresh(rows), about)
        if not fine:
            return False
        if not isinstance(result, dict):
            print(f"For {about}, the method total_by_month gives back {result!r}, but it must give back a dictionary. Start with an empty dictionary, add each amount to the total of its month, and give the dictionary back after the loop. Then run the cell again.")
            return False
        if len(rows) > 0 and all(callable(key) for key in result):
            print(f"For {about}, the method total_by_month gives back a dictionary with {len(result)} keys. The keys of that dictionary are methods, and not months. That happens when the parentheses are missing: purchase.month is the method, and purchase.month() calls the method and gives the month. Then run the cell again.")
            return False
        if len(rows) > 0 and sorted(str(key) for key in result) == sorted(row[0] for row in rows):
            print(f"For {about}, the method total_by_month gives back a dictionary with {len(result)} keys. The keys of that dictionary are whole dates, such as {rows[0][0]}. The key must be the month of the purchase, which is purchase.month(), and not purchase.date. Then run the cell again.")
            return False
        if not same(result, by_month):
            print(f"For {about}, the method total_by_month gives back {text(result)}. It must give back {text(by_month)}. Each key is purchase.month(), and the line that adds to the total of a key is: totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount. Then run the cell again.")
            return False
    for rows, about, by_month, place in tests:
        if place is None:
            continue
        target = fresh(rows)
        wanted = target.purchases[place]
        fine, result = call("largest", target, about)
        if not fine:
            return False
        if number(result) is not None and number(result) == float(rows[place][2]):
            print(f"For {about}, the method largest gives back the amount {result}. It must give back the whole Purchase object that has that amount, so that the code that calls the method can also read the date and the description. Keep the object in the name, and compare the amounts: if purchase.amount > result.amount: and under it result = purchase. Then run the cell again.")
            return False
        if not isinstance(result, kind):
            print(f"For {about}, the method largest gives back {result!r}, but it must give back a Purchase object: the purchase that has the largest amount. Start with result = self.purchases[0], and give back result after the loop. Then run the cell again.")
            return False
        if result is not wanted and result != wanted:
            if result is target.purchases[0]:
                where = "gives back the first purchase of the list"
            elif result is target.purchases[-1]:
                where = "gives back the last purchase of the list"
            else:
                where = "gives back another purchase"
            print(f"For {about}, the method largest {where}: it gives back the purchase {result.description}, whose amount is {result.amount}. It must give back the purchase {rows[place][1]}, whose amount is {rows[place][2]}. Inside the loop, test whether the amount of this purchase is larger than the largest until now, and keep this purchase only then: if purchase.amount > result.amount: and under it result = purchase. Then run the cell again.")
            return False
    if "month_totals" not in globals():
        print("The two methods are correct. The name month_totals does not exist yet. At the end of the cell, at the left side, add the four lines from the task. The first one is: month_totals = ledger.total_by_month(). Then run the cell again.")
        return False
    if not same(globals()["month_totals"], {"2026-01": 917.2, "2026-02": 942.34, "2026-03": 975.25}):
        print("The two methods are correct. The name month_totals does not refer to the dictionary of the totals of Mariam's three months. Call the method for the ledger that holds her purchases, with parentheses after its name: month_totals = ledger.total_by_month(). Then run the cell again.")
        return False
    if "largest_purchase" not in globals():
        print("The two methods and the name month_totals are correct. The name largest_purchase does not exist yet. Add the other lines from the task. The next one is: largest_purchase = ledger.largest(). Then run the cell again.")
        return False
    found = globals()["largest_purchase"]
    if not isinstance(found, kind) or number(getattr(found, "amount", None)) != 650.0 or getattr(found, "category", None) != "rent":
        print("The two methods and the name month_totals are correct. The name largest_purchase does not refer to the largest purchase of Mariam's ledger, which is a rent of 650.00. Call the method for the ledger that holds her purchases, with parentheses after its name: largest_purchase = ledger.largest(). Then run the cell again.")
        return False
    print(f"Correct. The method total_by_month gives one total for each of the three months, and the method largest gives the purchase {found.description}, whose amount is {found.amount}.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The ledger can answer four questions. Mariam spent 917.20 in January,
942.34 in February and 975.25 in March. Her largest purchase was the
rent, 650.00 in each month.

Look at what `print(largest_purchase)` shows. The method `largest`
gives back a whole `Purchase` object, and the object shows all its
values, because the class `Purchase` is a dataclass.
