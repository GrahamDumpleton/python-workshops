---
title: Another notebook
requires: [verify:report-created, verify:report-shown]
---

# Another notebook

At the start of this workshop, the problem was this: a second
notebook cannot use the cells of the first notebook. Now the code is
in a file. On this page a second notebook uses it.

This page needs the complete file `spending.py` from the page before.
If your file is not complete, go back one page and open the solution
of part 1.

## A new notebook

Click the action below. It creates a second notebook, with the name
`report.ipynb`, and opens it as a new tab beside your first notebook.

```{notebook-create}
:id: create-report
:title: Create a second notebook and open it
:path: report.ipynb
:open: true
- markdown: |
    # Spending for each category

    This is a second notebook. It has no cell that defines a class or a function.
```

```{verify}
:id: report-created
:label: The second notebook exists
:substrate: contents
:trigger: after:create-report
:message: The second notebook does not exist yet. Click the action above to create it.
exists report.ipynb
```

The new notebook has a kernel of its own. That kernel is a new
Python, so it knows nothing about the names of your first notebook.

## Use the module

The action below adds one cell to the new notebook. The cell gets the
function `read_ledger` from your module, reads the purchases, and
shows the total for each category. The method `total_by_category()`
of the ledger returns a dictionary, with a category as each key and
the total of that category as the value.

```{attempt}
:id: report-not-shown
:check: report-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-report
:title: Add a cell that shows the total for each category, and run it
:path: report.ipynb
:tags: [report]
:run: true
from spending import read_ledger

ledger = read_ledger("spending.csv")
totals = ledger.total_by_category()
for category in totals:
    print(category, totals[category])
```

The output is:

```
rent 1950.00
food 445.60
transport 181.30
phone 54.00
hobbies 63.49
clothes 140.40
```

```{verify}
:id: report-shown
:label: The second notebook used your module
:substrate: learner-kernel
:path: report.ipynb
:trigger: cell-executed report
if type(globals().get("ledger")).__module__ == "spending" and len(globals().get("totals", [])) == 6:
    print("The cell ran. The second notebook read the 37 purchases with the code of your module, and showed the total of the six categories.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("ledger")).__module__ == "spending" and len(globals().get("totals", [])) == 6
```

## What happened

The second notebook holds six lines of code. It has no class and no
function of its own. The line `from spending import read_ledger` made
Python read the file `spending.py`, and all the code came from there:
the function, the two classes, and the `import` lines that they need.

Both notebooks now use one copy of the code. When you correct a
mistake in the file, you correct it for both. Remember to restart the
kernel of each notebook after you change the file.

Python found the file because it is in the same directory as the
notebooks. A later workshop, **Where imports come from**, explains
where Python looks for a module.

## The complete file

This is the file that you built. In the next workshops it grows into
a program that runs in the terminal.

```python
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

import csv
from dataclasses import dataclass
from decimal import Decimal


@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]


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


def read_ledger(filename):
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            ledger.add(purchase)
    return ledger
```
