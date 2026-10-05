---
title: The code in the notebook
requires: [verify:code-defined, verify:first-total]
---

# The code in the notebook

Before you move code into a file, you need code to move. On this page
the notebook gets the code of the spending tracker, in four cells.

You do not need to understand every line of this code to do this
workshop. It is enough to know what the pieces are, and that they
work together.

## The imports

The first cell holds three `import` lines. The code of the other
cells uses three things from modules that come with Python:

- `csv`, a module that reads files in which each line holds values
  with commas between them

- `dataclass`, which makes Python write some methods of a class for
  you

- `Decimal`, a type of number that is exact, which is what money
  needs

```{cell-insert}
:id: insert-imports
:title: Add a cell with the three import lines, and run it
:path: {{ notebook }}
:tags: [imports]
:run: true
import csv
from dataclasses import dataclass
from decimal import Decimal
```

## One purchase

The second cell holds the class `Purchase`. A **class** is a
description of a new type of value. An **object** is a value made
from a class. One object of the class `Purchase` is one thing that
Mariam bought. It holds the date, the description, the amount and the
category of that purchase.

The class has one **method**, which is a function that belongs to a
value. The method `month()` returns the first seven characters of the
date, such as `"2026-01"`.

```{cell-insert}
:id: insert-purchase
:title: Add a cell with the class Purchase, and run it
:path: {{ notebook }}
:tags: [purchase]
:run: true
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]
```

## Many purchases

The third cell holds the class `Ledger`. A **ledger** is a book in
which a person writes down every amount of money that they spend. An
object of the class `Ledger` holds a list of purchases. Its methods
answer questions about them: the total, the total for each category,
the total for each month, and the largest purchase.

```{cell-insert}
:id: insert-ledger
:title: Add a cell with the class Ledger, and run it
:path: {{ notebook }}
:tags: [ledger]
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = Decimal("0")
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), Decimal("0")) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result
```

## A function that reads the file

The fourth cell holds the function `read_ledger`. A **directory** is
a place that holds files. The directory of this workshop holds your
notebook and a file, `spending.csv`, with the 37 purchases of Mariam. The
function reads that file. It makes one `Purchase` object for each
line, puts all of them in a new `Ledger` object, and returns the
ledger.

```{attempt}
:id: code-not-defined
:check: code-defined
:expect: The four cells have not all run yet
```

```{cell-insert}
:id: insert-reader
:title: Add a cell with the function read_ledger, and run it
:path: {{ notebook }}
:tags: [reader]
:run: true
def read_ledger(filename):
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            ledger.add(purchase)
    return ledger
```

The four cells show nothing. Each of them only defines something:
Python records the classes and the function, and waits for code that
uses them.

```{verify}
:id: code-defined
:label: The notebook knows Purchase, Ledger and read_ledger
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed reader
if isinstance(globals().get("Purchase"), type) and isinstance(globals().get("Ledger"), type) and callable(globals().get("read_ledger")):
    print("The four cells ran. The notebook now knows the classes Purchase and Ledger, and the function read_ledger.")
else:
    print("The four cells have not all run yet. Click the four actions above, from the first to the last, to add the cells and run them.")
isinstance(globals().get("Purchase"), type) and isinstance(globals().get("Ledger"), type) and callable(globals().get("read_ledger"))
```

## Use the code

The next cell uses the three pieces together. It reads the file,
counts the purchases, and adds up the amounts.

```{attempt}
:id: total-not-shown
:check: first-total
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-first-total
:title: Add a cell that reads the file and shows the total, and run it
:path: {{ notebook }}
:tags: [first-total]
:run: true
first_ledger = read_ledger("spending.csv")
print(len(first_ledger.purchases))
print(first_ledger.total())
```

The output is:

```
37
2834.79
```

Mariam made 37 purchases, and she spent 2834.79 in the three months.

```{verify}
:id: first-total
:label: The code read the 37 purchases
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed first-total
if type(globals().get("first_ledger")).__name__ == "Ledger" and len(getattr(globals().get("first_ledger"), "purchases", [])) == 37:
    print("The cell ran. The function read_ledger read the 37 purchases of the file spending.csv into a ledger.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("first_ledger")).__name__ == "Ledger" and len(getattr(globals().get("first_ledger"), "purchases", [])) == 37
```

The program works. But all of it is inside this one notebook. The
next page explains why that is a problem.
