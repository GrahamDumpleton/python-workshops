---
title: Move the last piece
requires: [verify:reader-in-file, verify:reader-used]
---

# Move the last piece

One piece of the program is still only in the notebook: the function
`read_ledger`. On this page you move it into the file, restart the
kernel yourself, and then write a cell that uses the function from
the module. The page gives you less help than the pages before.

## Part 1: copy the function into the file

Copy the function `read_ledger` from the notebook into the file
`spending.py`.

- The function is in the cell that begins with
  `def read_ledger(filename):`.

- Paste it at the end of the file, under the class `Ledger`, with two
  empty lines above it.

- The line `def read_ledger(filename):` must begin at the left edge
  of the editor, with no spaces before it. The function is not a part
  of the class `Ledger`.

- Save the file.

The function uses the module `csv`. On an earlier page you copied the
line `import csv` to the top of the file, so the module already has
what the function needs.

```{hint}
:title: Hint: the steps to copy and paste
Click on the code of the cell, then hold `Ctrl` and press `A` to
select all the code of the cell. Hold `Ctrl` and press `C` to copy it.
Click in the editor at the end of the last line of the file, and
press `Enter` three times. Hold `Ctrl` and press `V` to paste. Hold
`Ctrl` and press `S` to save. On a Mac, use `Cmd` in place of `Ctrl`.
```

```{hint}
:title: Hint: the function is inside the class
After you press `Enter` at the end of the class, the editor begins the
new line with spaces, because the line above has spaces. If your
pasted `def` line has spaces before it, click before the word `def`
and remove them. Then look at the lines under
it: each must have the same spaces as in the cell of the notebook. If
you are not sure, remove the function from the file, remove the
spaces on the empty line, and paste again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have saved the file, or after you have clicked `Check`.

```{attempt}
:id: reader-not-copied
:check: reader-in-file
:expect: has no function with the name read_ledger yet
```

````{attempt}
:id: reader-bad-spaces
:check: reader-in-file
:expect: Python cannot read the file spending.py

```{file-write}
:path: spending.py
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
    return ledger
```
````

````{attempt}
:id: reader-no-csv
:check: reader-in-file
:expect: NameError: name 'csv' is not defined

```{file-write}
:path: spending.py
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

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
````

````{attempt}
:id: reader-early-return
:check: reader-in-file
:expect: The ledgers that came back were not right

```{file-write}
:path: spending.py
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
````

````{hint}
:title: Show me a solution
:unlock: "reader-in-file" in failed_checks or "reader-in-file" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes the complete file `spending.py`, with the
function `read_ledger` at the end, and saves it. It replaces what
your file holds now.

```{file-write}
:id: reader-solution
:title: Write the complete file spending.py
:path: spending.py
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
````

```{verify}
:id: reader-in-file
:label: The file spending.py holds the function read_ledger
:trigger: file-saved spending.py; after:reader-solution
import os, subprocess, sys
from pathlib import Path

assert Path("spending.py").exists(), "There is no file spending.py in the directory of this workshop. Go back to the page Why a file, and click the action that creates the file."
program = """
import os, sys, traceback
from decimal import Decimal
try:
    import spending
except BaseException as error:
    print("CHECK error", traceback.format_exception_only(error)[-1].strip())
    sys.exit()
function = getattr(spending, "read_ledger", None)
if not callable(function):
    print("CHECK missing")
    sys.exit()
name = "_check_ledger.csv"
try:
    with open(name, "w", newline="") as file:
        print("date,description,amount,category", file=file)
        print("2026-04-02,Tea,3.20,food", file=file)
        print("2026-04-03,Tram ticket,1.90,transport", file=file)
    small = function(name)
    full = function("spending.csv")
    good = (
        len(small.purchases) == 2
        and small.total() == Decimal("5.10")
        and len(full.purchases) == 37
        and full.total() == Decimal("2834.79")
    )
except NameError as error:
    print("CHECK name", traceback.format_exception_only(error)[-1].strip())
    sys.exit()
except BaseException as error:
    print("CHECK wrong")
    sys.exit()
finally:
    if os.path.exists(name):
        os.remove(name)
print("CHECK ok" if good else "CHECK wrong")
"""
try:
    run = subprocess.run([sys.executable, "-c", program], capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL, env={**os.environ, "PYTHON_COLORS": "0"})
except subprocess.TimeoutExpired:
    raise AssertionError("The check imported the module spending and called read_ledger, and that did not end after 10 seconds. The file must hold only the docstring, the import lines, the two classes and the function. Remove any other code, and save the file.") from None
finally:
    if os.path.exists("_check_ledger.csv"):
        os.remove("_check_ledger.csv")
found = [line for line in run.stdout.splitlines() if line.startswith("CHECK ")]
result = found[-1].split(" ", 2) if found else ["CHECK", "error", "Python stopped before the check could import the module."]
assert result[1] != "error", f"Python cannot read the file spending.py. Look at the function that you pasted. The line def read_ledger(filename): must begin at the left edge, with no spaces before it, and the lines under it must have the same spaces as in the cell of the notebook. Correct the file, and save it. The last line of the error is: {result[2]}"
assert result[1] != "missing", "The module spending has no function with the name read_ledger yet. Copy the cell that begins with def read_ledger(filename): and paste it at the end of the file. The def line must begin at the left edge, so that the function is not inside the class Ledger. Then save the file: hold Ctrl and press S, or on a Mac hold Cmd and press S."
assert result[1] != "name", f"The check called read_ledger from your module, and Python stopped. The function uses a name that the file does not import. A module needs import lines of its own. The top of the file must hold the three lines import csv, from dataclasses import dataclass and from decimal import Decimal. Add the line that is missing, and save the file. The last line of the error is: {result[2]}"
assert result[1] != "wrong", "The check called read_ledger from your module two times: with the file spending.csv, and with a small file of its own that holds two purchases. The ledgers that came back were not right. Probably a line of the function is missing, or the spaces at the start of a line changed. Remove the function from the file, copy the whole cell again, paste it, and save the file."
print("Correct. The check imported your module in a new Python and called read_ledger. For the file spending.csv it returned a ledger of 37 purchases with the total 2834.79.")
```

The file `spending.py` is now complete. It holds the whole program:
the `import` lines, the two classes and the function.

## Part 2: restart the kernel yourself

Your notebook imported the module before the function was in the
file. So the notebook holds an old copy of the module again, and you
must restart the kernel. This time, use the menu of JupyterLab, as
you will do in your own work:

1. Click on your notebook, so that JupyterLab knows which kernel you
   mean.

2. At the top of the window, open the menu `Kernel`.

3. Click `Restart Kernel...`.

4. JupyterLab asks if you are sure. Click the button `Restart`.

```{attempt}
:id: reader-old-module
:check: reader-used
:expect: The notebook still holds an old copy of your module
```

If you cannot find the menu, the action below does the same thing.

```{kernel-restart}
:id: restart-kernel-again
:title: Restart the kernel of my notebook for me
:path: {{ notebook }}
```

## Part 3: use the function from the module

Until now you used the module with the name of the module and a dot,
as in `spending.Purchase`. There is a second form of `import`, which
you saw in the workshop **The batteries included**:

```python
from spending import read_ledger
```

This line gets one name, `read_ledger`, from the module `spending`.
After it, you write `read_ledger(...)` with no module name and no dot
before it. Both forms read the same file. Use the first form when you
want the reader to see where a name comes from, and the second form
when you use a name many times.

Write a cell of three lines:

1. Get the function `read_ledger` from your module, with the second
   form of `import`.

2. Call the function with the file name `"spending.csv"`, and give
   the ledger that it returns the name `ledger`.

3. Show the total of the ledger with `print()`. The method that gives
   the total is `total()`.

The output must be:

```
2834.79
```

```{cell-insert}
:id: insert-use-reader
:title: Add an empty cell for my code
:path: {{ notebook }}
:tags: [use-reader]
:run: false
# Write your three lines below this line.

```

Click on the empty line under the comment, and type your three lines.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: the three lines
The first line is the `import` line that this page shows above. The
second line begins with `ledger =` and calls `read_ledger` with the
file name between the parentheses, in quotes. The third line is
`print(ledger.total())`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first.

An `ImportError` that says that Python cannot import the name
`read_ledger` means that the kernel holds an old copy of the module.
Check that the file is saved. Then restart the kernel, and run your
cell again.

A `NameError` for the name `read_ledger` means that the `import` line
is missing, or that it has not run.

A `FileNotFoundError` means that the file name is not right. The name
is `"spending.csv"`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: reader-not-used
:check: reader-used
:expect: The name read_ledger does not exist in the notebook yet
```

````{attempt}
:id: reader-of-the-notebook
:check: reader-used
:expect: refers to a function that a cell of the notebook defined

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_ledger(filename):
    return filename

ledger = read_ledger("spending.csv")
print(ledger)
```
````

````{attempt}
:id: reader-not-called
:check: reader-used
:expect: The name ledger does not refer to the ledger

```{cell-insert}
:path: {{ notebook }}
:run: true
from spending import read_ledger

ledger = read_ledger
print(ledger)
```
````

````{hint}
:title: Show me a solution
:unlock: "reader-used" in failed_checks or "reader-used" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook, with a working
answer, and runs it. Compare it with your own cell. If the new cell
shows an `ImportError`, restart the kernel with the action in part 2,
and run the new cell again.

```{cell-insert}
:id: insert-use-reader-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [use-reader-solution]
:run: true
from spending import read_ledger

ledger = read_ledger("spending.csv")
print(ledger.total())
```
````

```{verify}
:id: reader-used
:label: Your notebook reads the purchases with the function of the module
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed use-reader; cell-executed use-reader-solution
def _workshop_check():
    import sys
    module = sys.modules.get("spending")
    function = globals().get("read_ledger")
    if getattr(function, "__module__", None) != "spending" or not callable(function):
        if module is not None and not hasattr(module, "read_ledger"):
            print("The notebook still holds an old copy of your module, from before the function read_ledger was in the file. Check that the file spending.py is saved. Then restart the kernel: open the menu Kernel and click Restart Kernel, or click the action in part 2. Then run your cell again.")
        elif callable(function):
            print("The name read_ledger refers to a function that a cell of the notebook defined, and not to the function of your module. The first line of your cell must be from spending import read_ledger. Write that line, and run your cell again.")
        else:
            print("The name read_ledger does not exist in the notebook yet. Write your three lines under the comment in the new cell. The first line is from spending import read_ledger. Then hold Shift and press Enter to run the cell.")
        return False
    ledger = globals().get("ledger")
    if type(ledger).__name__ != "Ledger" or type(ledger).__module__ != "spending" or len(getattr(ledger, "purchases", [])) != 37:
        print("The name ledger does not refer to the ledger of the 37 purchases. The second line of your cell must call the function with the file name, and give the result the name ledger. Write ledger = read_ledger(\"spending.csv\") and run your cell again.")
        return False
    print("Correct. The notebook got the function read_ledger from your module, and the name ledger refers to a ledger of 37 purchases that the function read from spending.csv.")
    return True
globals().pop("_workshop_check")()
```

Look at what the new kernel needed to give this answer: one `import`
line. The cells with the classes and the function did not run in this
kernel. All the code came from the file.
