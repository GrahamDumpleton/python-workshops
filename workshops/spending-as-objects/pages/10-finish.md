---
title: What you have learned
---

# What you have learned

You have built a complete program from classes of your own. Nobody
gave you the new code: you had a goal for each part, and you wrote the
lines yourself. Your program reads two files, and it writes a report
that answers Mariam's questions:

- She spent 2834.79 in the three months. She spent the most on rent,
  1950.00, and then on food, 445.60.

- She spent 917.20 in January, 942.34 in February and 975.25 in March.

- Her largest purchase was the rent, 650.00 in each month.

- She was over her budget for clothes in January and in March, for
  food in February, and for transport in March.

## The ideas

- A class describes a new type of value. `Purchase` describes one
  purchase, and `Ledger` describes a book of purchases. The program
  then works with purchases and ledgers, and not with loose strings,
  numbers and dictionaries.

- A dataclass is a good choice for a class that mainly holds values.
  You write the fields, and Python writes the special methods
  `__init__`, `__repr__` and `__eq__`.

- A class that you write by hand, with a method `__init__` of your own,
  is a good choice when a new object must start in a special way. Every
  new ledger starts with a new empty list of its own.

- An object can hold other objects. A ledger has purchases. This is
  composition.

- A method reads the data of its own object through `self`, so the
  code that calls it does not give that data again. Compare
  `ledger.total()` with a function that needs the list of purchases as
  an argument.

- A method can call the other methods of the same object, with
  `self` and a dot. The method `report` used every other method.

- An object knows things about itself. The ledger asks each purchase
  for its month with `purchase.month()`, and it does not need to know
  how the purchase finds it.

- When a class changes, the objects that were made before still belong
  to the old class. Make the objects again.

## The code

| Code | What it does |
|------|--------------|
| `@dataclass` | makes Python write `__init__`, `__repr__` and `__eq__` for the class under it |
| `amount: Decimal` | says that each object has an attribute `amount`, which should be a `Decimal` |
| `def month(self):` | starts a method, whose first parameter is the object itself |
| `return self.date[:7]` | gives back the first seven characters of the date of this object |
| `def __init__(self):` | starts the method that Python calls when an object is made |
| `self.purchases = []` | gives the new object an empty list of its own |
| `self.purchases.append(purchase)` | adds a purchase to the list of this ledger |
| `for row in csv.DictReader(file):` | gives each row of a CSV file as a dictionary |
| `Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])` | makes one object from the values of a row |
| `totals[key] = totals.get(key, 0) + purchase.amount` | adds an amount to the total of a key |
| `if purchase.amount > result.amount:` | tests whether this purchase is larger than the largest until now |
| `budgets = json.load(file)` | reads the value that a JSON file holds |
| `self.over_budget(month, budgets)` | calls another method of the same object |
| `file.write(line + "\n")` | writes one line to a file |

## What comes next

The set **Your own types in Python** is now complete. You can write a
class, give it attributes and methods, let Python write the special
methods with `@dataclass`, build one class on another class, and build
a program from objects that hold other objects.

Until now, all your code was in the cells of a notebook. The next set
of workshops, **From a Python notebook to a program**, moves your code
into files that you run yourself, as programs are usually run. It
begins with the workshop **Files, editors and terminals**.

That set needs a **terminal**, which is a window in which you type
commands for the computer. The site that runs in your web browser, with
nothing to install, has no terminal that can run Python. So the next
set does not run on that site. It runs in JupyterLab only. If the
address of this page begins with `grahamdumpleton.github.io`, you are
on that site, and you need one of these three ways to open JupyterLab:

- [Binder](https://mybinder.org/v2/gh/GrahamDumpleton/python-workshops/main?urlpath=lab)
  is free, and you need no account. A session can take a few minutes
  to start. It is temporary: when it ends, everything that you did in
  it is deleted, so finish a workshop in the session in which you
  started it.

- [A codespace](https://codespaces.new/GrahamDumpleton/python-workshops?quickstart=1)
  needs a GitHub account, and it keeps your work between visits. It
  uses your monthly Codespaces allowance while it runs.

- Your own computer. You need to install Python and one more tool. The
  section
  [Run locally](https://github.com/GrahamDumpleton/python-workshops#run-locally)
  of the page of these workshops says how.

In each of them, the list of workshops shows every set, and you choose
**Files, editors and terminals** there. If you already work on Binder,
in a codespace or on your own computer, you can continue where you
are.

Click `Finish` at the bottom of this panel.
