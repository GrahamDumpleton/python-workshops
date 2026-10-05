---
title: Relative imports
requires: [verify:imports-relative, quiz:food-total]
---

# Relative imports

A **relative import** is an import that begins with a dot. The dot
means "the package that this module is in". On this page you change
the imports of two modules into relative imports.

## Why relative imports exist

The module `storage` needs the module `models`. Both are in the same
package. A plain `from models import ...` does not find the file,
because Python looks for a plain name in the directories of
`sys.path`, and the package is not one of them.

A relative import does not use `sys.path`. It says where the module
is from the place of the file that holds the import:

```python
from .models import Ledger, Purchase
```

Read the dot as "from this package". The line means: from the module
`models` of this package, get the names `Ledger` and `Purchase`.

Think of how you tell a visitor where a neighbour lives. You can give
the full address, with the town and the street. Or you can say "the
house next to mine". The second way is shorter. It also stays correct
when the street gets a new name.

The full address works for a module too. The line
`from spending.models import Ledger, Purchase` gives the full name of
the module, and it is correct Python. Inside a package, programmers
often use the relative form, for two reasons. It shows the reader at
once that the module belongs to the same package. And it stays
correct when the package gets another name.

The dot is used only for the modules of your own package. The imports
of `csv`, `decimal` and `argparse` do not change. Those modules are
in the standard library, and Python finds them through `sys.path` as
before.

## Your task

Two modules of the package import other modules of the package.
Change those imports into relative imports.

- In the file `spending/storage.py`, one line imports from `models`.

- In the file `spending/cli.py`, one line imports from `report` and
  one line imports from `storage`.

In each of the three lines, write a dot directly before the name of
the module, with no space between the dot and the name. Change
nothing else.

To open a file, double-click its name in the file browser at the left
side of the window. The file browser shows the directory `spending`.
After you change a file, save it: hold `Ctrl` and press `S`, or `Cmd`
and `S` on a Mac. The check below runs each time that you save one of
the two files.

```{hint}
:title: Hint: where the lines are
In both files, the imports are near the top, under the docstring. The
lines to change begin with the word `from`, and the name after `from`
is `models`, `report` or `storage`.
```

```{hint}
:title: Hint: the form of the line
The line `from models import Ledger, Purchase` becomes
`from .models import Ledger, Purchase`. The only change is the dot.
The other two lines change in the same way.
```

```{attempt}
:id: imports-not-changed
:check: imports-relative
:expect: Python cannot find a module that the file spending/storage.py imports
```

````{attempt}
:id: imports-wrong-form
:check: imports-relative
:expect: Python stopped with an error when it read the file spending/storage.py

```{file-write}
:path: spending/storage.py
"""Reading the purchases from a CSV file."""

import csv
from decimal import Decimal

import .models


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
:id: imports-storage-only
:check: imports-relative
:expect: Python cannot find a module that the file spending/cli.py imports

```{file-write}
:path: spending/storage.py
"""Reading the purchases from a CSV file."""

import csv
from decimal import Decimal

from .models import Ledger, Purchase


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
:id: imports-full-names
:check: imports-relative
:result: pass

```{file-write}
:path: spending/storage.py
"""Reading the purchases from a CSV file."""

import csv
from decimal import Decimal

from spending.models import Ledger, Purchase


def read_ledger(filename):
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            ledger.add(purchase)
    return ledger
```

```{file-write}
:path: spending/cli.py
"""The command line of the spending tracker."""

import argparse

from spending.report import report_lines
from spending.storage import read_ledger


def main():
    parser = argparse.ArgumentParser(description="Report on the purchases in a CSV file.")
    parser.add_argument("filename", help="the CSV file that holds the purchases")
    parser.add_argument("--month", help="report on one month only, for example 2026-02")
    parser.add_argument("--category", help="report on one category only, for example food")
    args = parser.parse_args()

    ledger = read_ledger(args.filename).select(month=args.month, category=args.category)
    for line in report_lines(ledger):
        print(line)


if __name__ == "__main__":
    main()
```
````

````{hint}
:title: Show me a solution
:unlock: "imports-relative" in failed_checks or "imports-relative" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The two actions below write the two files with relative imports, and
open them in the editor. Compare the import lines with your own.

```{file-write}
:id: storage-solution
:title: Write spending/storage.py with a relative import
:path: spending/storage.py
:open: true
"""Reading the purchases from a CSV file."""

import csv
from decimal import Decimal

from .models import Ledger, Purchase


def read_ledger(filename):
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            ledger.add(purchase)
    return ledger
```

```{file-write}
:id: cli-solution
:title: Write spending/cli.py with relative imports
:path: spending/cli.py
:open: true
"""The command line of the spending tracker."""

import argparse

from .report import report_lines
from .storage import read_ledger


def main():
    parser = argparse.ArgumentParser(description="Report on the purchases in a CSV file.")
    parser.add_argument("filename", help="the CSV file that holds the purchases")
    parser.add_argument("--month", help="report on one month only, for example 2026-02")
    parser.add_argument("--category", help="report on one category only, for example food")
    args = parser.parse_args()

    ledger = read_ledger(args.filename).select(month=args.month, category=args.category)
    for line in report_lines(ledger):
        print(line)


if __name__ == "__main__":
    main()
```
````

```{verify}
:id: imports-relative
:label: The modules of the package find each other
:trigger: file-saved spending/storage.py; file-saved spending/cli.py; after:cli-solution
import os, subprocess, sys

for module, filename in [("spending.storage", "spending/storage.py"), ("spending.cli", "spending/cli.py")]:
    try:
        run = subprocess.run(
            [sys.executable, "-c", "import " + module],
            capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The check imported the file {filename}, and the import did not end after 10 seconds. Change only the import lines of the file, and save it.") from None
    if run.returncode != 0:
        last = run.stderr.strip().splitlines()[-1]
        if last.startswith("ModuleNotFoundError"):
            raise AssertionError(f"Python cannot find a module that the file {filename} imports. The last line of the error is: {last}. Check that the import has a dot directly before the name of the module, and that the name is spelled correctly. Then save the file.")
        raise AssertionError(f"Python stopped with an error when it read the file {filename}. The last line of the error is: {last}. A relative import has this form: from .models import Ledger, Purchase. Correct the line, and save the file.")
print("Python imported spending.storage and spending.cli from your work directory. Each module finds the other modules of the package.")
```

## See it work

The program `food_total.py` stopped with an error on the page before.
Run it again. Type this command in the terminal, and press `Enter`:

```
python food_total.py
```

```{quiz}
:id: food-total
:type: text
:case: false
question: "What does the terminal show now? Type the whole line."
answer:
  - { pattern: "Food:\\s*445\\.60", example: "Food: 445.60" }
wrong:
  - { text: "445.60", explanation: "That is the amount. The line also has a word before the amount. Type the whole line." }
  - { pattern: ".*ModuleNotFoundError.*", explanation: "Python still cannot find a module. Check that you saved both files, and that the check above has passed. Then run the command again." }
otherwise: "The line begins with the word `Food`, and it ends with an amount that has two decimal places."
explanation: "The program outside the package imported `spending.storage`. That module imported `.models` from its own package, and the import worked. Mariam spent 445.60 on food in the three months."
```

## What happened

You changed three lines, and one character in each line. Now each
module of the package says where its neighbours are: in the same
package. The place of the program that starts first no longer
matters for these imports.
