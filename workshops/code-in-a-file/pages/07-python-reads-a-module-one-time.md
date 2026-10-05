---
title: Python reads a module one time
requires: [verify:ledger-in-file, quiz:predict-second-import, verify:ledger-in-notebook]
---

# Python reads a module one time

On this page you put the second class into the file. Then something
happens that surprises almost everybody who writes a module for the
first time. It is the most important thing in this workshop.

## Copy the class Ledger into the file

Copy the class `Ledger` from the notebook into the file `spending.py`,
in the same way as you copied the class `Purchase`:

1. In the notebook, click on the code of the cell that begins with
   `class Ledger:`.

2. Select all the code of the cell: hold `Ctrl` and press `A`. On a
   Mac, use `Cmd` in place of `Ctrl`.

3. Copy the code: hold `Ctrl` and press `C`.

4. Click in the editor, at the end of the last line of the file, and
   press `Enter` two times to make empty lines.

5. Paste the code: hold `Ctrl` and press `V`.

6. Save the file: hold `Ctrl` and press `S`.

The line `class Ledger:` must begin at the left edge of the editor,
with no spaces before it.

```{hint}
:title: Hint: the check says that the file has no class Ledger
The check reads the file on the disk. If the tab of the file shows a
dot in place of the cross, the file is not saved. Click in the editor, then
hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and press `S`.
```

```{hint}
:title: Hint: Python cannot read the file
Look at the line `class Ledger:` in the editor. If there are spaces
before the word `class`, remove them. Every line of the class must
have the same spaces before it as the line has in the cell of the
notebook. If you are not sure, remove the class from the file, and
copy and paste the whole cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have saved the file, or after you have clicked `Check`.

```{attempt}
:id: ledger-not-copied
:check: ledger-in-file
:expect: has no class with the name Ledger yet
```

````{attempt}
:id: ledger-bad-spaces
:check: ledger-in-file
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
```
````

````{attempt}
:id: ledger-part-only
:check: ledger-in-file
:expect: Probably a part of the class is missing

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
```
````

````{hint}
:title: Show me a solution
:unlock: "ledger-in-file" in failed_checks or "ledger-in-file" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes the file `spending.py` with the class `Ledger`
under the class `Purchase`, and saves it. It replaces what your file
holds now.

```{file-write}
:id: ledger-solution
:title: Write the file spending.py with the class Ledger in it
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
```
````

```{verify}
:id: ledger-in-file
:label: The file spending.py holds the class Ledger
:trigger: file-saved spending.py; after:ledger-solution
import os, subprocess, sys
from pathlib import Path

assert Path("spending.py").exists(), "There is no file spending.py in the directory of this workshop. Go back to the page Why a file, and click the action that creates the file."
program = '''
import sys, traceback
from decimal import Decimal
try:
    import spending
except BaseException as error:
    print("CHECK error", traceback.format_exception_only(error)[-1].strip())
    sys.exit()
if not isinstance(getattr(spending, "Ledger", None), type):
    print("CHECK missing")
    sys.exit()
try:
    book = spending.Ledger()
    book.add(spending.Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
    book.add(spending.Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport"))
    book.add(spending.Purchase("2026-02-02", "Bread", Decimal("3.10"), "food"))
    good = (
        book.total() == Decimal("12.30")
        and book.total_by_category() == dict(food=Decimal("9.50"), transport=Decimal("2.80"))
        and book.total_by_month() == dict([("2026-01", Decimal("9.20")), ("2026-02", Decimal("3.10"))])
        and book.largest().description == "Bread and milk"
    )
except BaseException as error:
    print("CHECK broken")
    sys.exit()
print("CHECK ok" if good else "CHECK broken")
'''
try:
    run = subprocess.run([sys.executable, "-c", program], capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL, env={**os.environ, "PYTHON_COLORS": "0"})
except subprocess.TimeoutExpired:
    raise AssertionError("The import of the module spending did not end after 10 seconds. The file must hold only the docstring, the import lines and the two classes. Remove any other code, and save the file.") from None
found = [line for line in run.stdout.splitlines() if line.startswith("CHECK ")]
result = found[-1].split(" ", 2) if found else ["CHECK", "error", "Python stopped before the check could import the module."]
assert result[1] != "error", f"Python cannot read the file spending.py. Look at the class that you pasted. The line class Ledger: must begin at the left edge, with no spaces before it, and the import lines and the class Purchase must still be above it. Correct the file, and save it. The last line of the error is: {result[2]}"
assert result[1] != "missing", "The file spending.py has no class with the name Ledger yet. Copy the cell that begins with class Ledger: and paste it at the end of the file. Then save the file: hold Ctrl and press S, or on a Mac hold Cmd and press S. A dot on the tab of the file means that the file is not saved."
assert result[1] != "broken", "The file spending.py has a class Ledger. The check made a ledger from it, added three purchases, and asked for the total, the total for each category, the total for each month and the largest purchase. One of the answers was wrong or stopped with an error. Probably a part of the class is missing. Remove the class Ledger from the file, copy the whole cell again, paste it, and save the file."
print("Correct. The file spending.py holds the class Ledger. The check made a ledger from it and added three purchases, and total() gave 12.30.")
```

## Predict what the notebook does

The file on the disk now holds the two classes. Your notebook
imported the module earlier, when the file held only the class
`Purchase`.

Now a cell of the notebook runs these lines:

```python
import spending

book = spending.Ledger()
```

```{quiz}
:id: predict-second-import
:title: Predict what the second import does
question: "What happens when the cell runs?"
options:
  - { text: "The cell makes an empty ledger, because `import spending` reads the file again", explanation: "This is what almost everybody expects. But Python does not read the file again. Read the explanation of the correct answer when you find it." }
  - { text: "Python stops with an `AttributeError`, because the module in the notebook has no `Ledger`", correct: true }
  - { text: "Python stops with a `NameError`, because the notebook does not know the name `spending`", explanation: "The notebook knows the name `spending`. It imported the module on an earlier page." }
explanation: "Python reads the file of a module one time: at the first `import` that works. It keeps the module that it made. A later `import spending` gives the notebook that same module again, and does not look at the file. The module that the notebook has was made before the class `Ledger` was in the file, so it has no `Ledger`. An `AttributeError` is the error for a name after a dot that the value before the dot does not have."
```

## See it happen

The action below adds a cell that makes a ledger with the class of
the module, adds two purchases, and shows the total. The cell has its
own `import` lines, so that it works by itself. The action does not
run the cell, because the cell stops with an error.

```{cell-insert}
:id: insert-book
:title: Add a cell that makes a ledger with the class of the module, without running it
:path: {{ notebook }}
:tags: [book]
:run: false
from decimal import Decimal

import spending

book = spending.Ledger()
book.add(spending.Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
book.add(spending.Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport"))
print(book.total())
```

Run the cell: click inside it, hold `Shift` and press `Enter`. The
last line of the error message is:

```
AttributeError: module 'spending' has no attribute 'Ledger'
```

The class is in the file. You saved the file, and the check above
found the class. But the notebook says that the module has no
`Ledger`.

## Why this happens

To import a module costs time: Python must find the file, read it and
run every line of it. A large program imports the same module in many
places. So Python does the work one time. After the first `import`
that works, Python keeps the module, and every later `import` of the
same name gives back the module that it kept.

This is like a photocopy of a page. You made the copy this morning.
When somebody changes the page this afternoon, your copy does not
change. Your notebook holds a copy of the module from the moment of
the first import. The file changed after that moment.

On the page before this one, a second run of `import spending` did
read the file again. That was a different situation: the first import
had stopped with an error, so Python had kept nothing.

## Restart the kernel

The **kernel** is the program that runs the cells of your notebook.
Each notebook has a kernel of its own. The kernel is a running
Python: it remembers every name that the cells made and every module
that they imported. It is the kernel that holds the old copy of your
module.

To **restart the kernel** is to stop that Python and start a new one.
The new kernel remembers nothing: no names, and no modules. The cells
of your notebook and their outputs stay on the screen as they are.
Only the memory behind them is empty. The first `import spending`
that runs in the new kernel reads the file from the disk, as it is
now.

```{attempt}
:id: book-old-module
:check: ledger-in-notebook
:expect: The notebook still holds the old copy of your module
```

Click the action below to restart the kernel of your notebook.

```{kernel-restart}
:id: restart-kernel
:title: Restart the kernel of my notebook
:path: {{ notebook }}
```

```{attempt}
:id: book-not-run
:check: ledger-in-notebook
:expect: The cell has not run in the new kernel yet
```

Now run the same cell again, the cell that begins with
`from decimal import Decimal`. Click inside it, hold `Shift` and
press `Enter`. You can also click the action below, which runs it for
you.

```{cell-run}
:id: run-book
:title: Run the cell that makes the ledger for me
:path: {{ notebook }}
:cell: book
```

This time the output is:

```
9.20
```

You did not change the cell. The same lines gave an error before the
restart and the right answer after it. The new kernel read the file
as it is now, with the class `Ledger` in it.

```{verify}
:id: ledger-in-notebook
:label: Your notebook uses the new code of the module
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed book
def _workshop_check():
    import sys
    module = sys.modules.get("spending")
    if module is not None and not hasattr(module, "Ledger"):
        print("The notebook still holds the old copy of your module, from before the class Ledger was in the file. Restart the kernel: click the action above with the title Restart the kernel of my notebook. Then run the cell that makes the ledger again.")
        return False
    book = globals().get("book")
    if type(book).__name__ != "Ledger" or type(book).__module__ != "spending":
        print("The cell has not run in the new kernel yet. Click inside the cell that begins with from decimal import Decimal, hold Shift and press Enter. If the cell shows an AttributeError, save the file spending.py, restart the kernel with the action above, and run the cell again.")
        return False
    print("Correct. After the restart, the kernel read the file again. The name book refers to a ledger made with the class Ledger of your module.")
    return True
globals().pop("_workshop_check")()
```

## What to remember

When you change the file of a module and save it, a notebook that
imported the module before does not see the change. Restart the
kernel of the notebook. Then run the cells that you need again,
beginning with the `import`.

After a restart, the new kernel does not know the names from your
earlier cells. A cell that uses one of them stops with a `NameError`
until you run the cell that makes the name. This is why the cell on
this page has its own `import` lines.
