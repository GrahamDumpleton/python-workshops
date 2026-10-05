---
title: "Part 1: the classes"
requires: [quiz:which-imports, verify:models-work]
---

# Part 1: the classes

The file `models.py` is empty. In this part you fill it with the two
classes, `Purchase` and `Ledger`. Then `models.py` is a module that
any program can use.

## A module imports what it uses

Before you copy the code, there is one rule to learn. It is the most
important idea of this workshop.

Look at the top of `spending.py`. It has four `import` lines:

```python
import argparse
import csv
from dataclasses import dataclass
from decimal import Decimal
```

These four lines serve all the code in `spending.py`. They do not
serve any other file. Python reads each module by itself. A name
exists in a module only when that module makes the name, or imports
it.

So when you copy a class into a new file, the import lines do not
come with it. The new file needs import lines of its own, at its top.
It needs one for every name that its code uses, and for no other
name.

This rule exists so that you can read one module alone. Every name in
the file is made in the file or imported at its top, so you never
need to search other files to learn where a name comes from.

Click the tab `spending.py` in the editor, and read the two classes,
from line 9 to line 59. Look for the four imported names: `argparse`, `csv`,
`dataclass` and `Decimal`.

```{quiz}
:id: which-imports
:type: multi
:title: The names that the classes use
question: "Which of the four imported names do the classes `Purchase` and `Ledger` use? Choose every name that they use."
options:
  - { text: "`argparse`", explanation: "Only the function `main` uses `argparse`, to read the command line arguments." }
  - { text: "`dataclass`", correct: true }
  - { text: "`csv`", explanation: "Only the function `read_ledger` uses `csv`, to read the rows of the file." }
  - { text: "`Decimal`", correct: true }
explanation: "The line `@dataclass` above `class Purchase:` uses the name `dataclass`. The class `Ledger` uses `Decimal(\"0\")` as the start value of each total, and the class `Purchase` names `Decimal` as the type of `amount`. So `models.py` needs two import lines: `from dataclasses import dataclass` and `from decimal import Decimal`."
```

## The goal

Make `models.py` hold the two classes and the import lines that the
classes need.

## What your file must hold

- At the top, one import line for each name that the classes use.
  Copy these lines from the top of `spending.py`. Do not copy the
  import lines that the classes do not use.

- Under the import lines, the class `Purchase` and the class
  `Ledger`, exactly as they are in `spending.py`, from line 9 to line
  59. Line 9 is `@dataclass`, and it belongs to the class `Purchase`.

- Nothing else. The functions `read_ledger`, `report_lines` and
  `main` go into other modules, on the next pages.

The first line of `spending.py` is a docstring, which is a string
that says what the code is for. You can give `models.py` a docstring
of its own as its first line. The check does not look for one.

## How to copy code from one file to another

Copy the code. Do not remove it from `spending.py`. The old program
then stays complete while you build the new one.

1. Click the tab `spending.py` in the editor.

2. Click at the start of the first line that you want.

3. Hold the `Shift` key, and click at the end of the last line that
   you want. The editor marks all the text between the two places.

4. Copy the marked text: hold `Ctrl` and press `C`. On a Mac, hold
   `Cmd` and press `C`.

5. Click the tab `models.py`, and click in the file at the place
   where the code must go.

6. Paste the text: hold `Ctrl` and press `V`. On a Mac, hold `Cmd`
   and press `V`.

7. **Save** the file: hold `Ctrl` and press `S`. On a Mac, hold `Cmd`
   and press `S`. To save a file means to write the text that the
   editor shows to the file on the disk. Until you save, Python and
   the check see the old file. A dot on the tab of a file means that
   the file has changes that are not saved.

These keys copy text in the editor. In the terminal, `Ctrl` with `C`
does a different thing: it stops a program.

The check runs each time you save `models.py`.

## If you need help

```{hint}
:title: "Hint: what to look at"
Read the classes in `spending.py` line by line, and look for each of
the four imported names.

Line 9 is `@dataclass`. That line uses the name `dataclass`.

In the class `Ledger`, the method `total` begins with
`result = Decimal("0")`. That line uses the name `Decimal`.

Nothing between line 9 and line 59 uses the name `csv` or the name
`argparse`.
```

```{hint}
:title: "Hint: the shape of the file"
`models.py` has this shape:

1. The line `from dataclasses import dataclass`.

2. The line `from decimal import Decimal`.

3. Two empty lines.

4. Line 9 to line 59 of `spending.py`: from `@dataclass` to the line
   `return result` at the end of the method `select`.

The lines of a class begin with spaces. Keep those spaces exactly as
they are: Python uses them to know which lines belong to the class.

Save the file after you paste.
```

If the hints were not enough, the box below holds a solution. It
opens after you have saved `models.py`, or after you have clicked
`Check`.

```{attempt}
:id: models-empty
:check: models-work
:expect: models.py has no class with the name Purchase
```

````{attempt}
:id: models-from-spending
:check: models-work
:expect: models.py still imports from spending

```{file-write}
:path: models.py
from spending import Ledger, Purchase
```
````

````{attempt}
:id: models-no-dataclass
:check: models-work
:expect: the name dataclass is not known in models.py

```{file-write}
:path: models.py
from decimal import Decimal


@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]
```
````

````{attempt}
:id: models-no-decimal
:check: models-work
:expect: the name Decimal is not known in models.py

```{file-write}
:path: models.py
from dataclasses import dataclass


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
```
````

````{attempt}
:id: models-imports-itself
:check: models-work
:expect: models.py is imported again before Python has reached its end

```{file-write}
:path: models.py
from dataclasses import dataclass
from decimal import Decimal

from models import Ledger, Purchase


@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str


class Ledger:
    def __init__(self):
        self.purchases = []
```
````

````{attempt}
:id: models-too-much
:check: models-work
:expect: models.py also holds the function read_ledger

```{file-write}
:path: models.py
import csv
from dataclasses import dataclass
from decimal import Decimal


@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str


class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)


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
:id: models-lost-spaces
:check: models-work
:expect: Python cannot read models.py

```{file-write}
:path: models.py
from dataclasses import dataclass
from decimal import Decimal


@dataclass
class Purchase:
date: str
description: str
amount: Decimal
category: str


class Ledger:
def __init__(self):
    self.purchases = []
```
````

````{attempt}
:id: models-changed
:check: models-work
:expect: do not work in the same way as the classes in spending.py

```{file-write}
:path: models.py
from dataclasses import dataclass
from decimal import Decimal


@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str


class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        return Decimal("0")
```
````

````{attempt}
:id: models-stops
:check: models-work
:expect: Python stopped with a TypeError in models.py

```{file-write}
:path: models.py
from dataclasses import dataclass
from decimal import Decimal


@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str


class Ledger:
    def __init__(self):
        self.purchases = []


first = Purchase("2026-01-01")
```
````

````{hint}
:title: Show me a solution
:unlock: "models-work" in failed_checks or "models-work" in passed_checks
:locked: Try the task first. This opens after the check below has run.

The action below writes a complete `models.py`. It replaces the text
that your file holds now, so read your own file first and compare.

```{file-write}
:id: models-solution
:title: Write a complete models.py and open it
:path: models.py
:open: true
"""The purchases of the spending tracker, and the ledger that holds them."""

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

    def select(self, month=None, category=None):
        result = Ledger()
        for purchase in self.purchases:
            month_fits = month is None or purchase.month() == month
            category_fits = category is None or purchase.category == category
            if month_fits and category_fits:
                result.add(purchase)
        return result
```
````

```{verify}
:id: models-work
:label: models.py holds the two classes and their imports
:trigger: file-saved models.py; after:models-solution
import os, subprocess, sys

driver = r'''
import contextlib, importlib, io, os, runpy, sys
from decimal import Decimal

sys.modules["spending"] = None
sys.dont_write_bytecode = True

def finish(passed, message):
    sys.__stdout__.write(("PASS|" if passed else "FAIL|") + message + "\n")
    sys.__stdout__.flush()
    os._exit(0)

def where(error, name):
    found = name + ".py"
    step = error.__traceback__
    while step is not None:
        filename = os.path.basename(step.tb_frame.f_code.co_filename)
        if filename in ("models.py", "storage.py", "report.py", "main.py"):
            found = filename
        step = step.tb_next
    return found

def explain(error, name):
    if isinstance(error, ModuleNotFoundError) and error.name == "spending":
        return f"{where(error, name)} still imports from spending. The file spending.py is the old program, and the new modules must not use it. Change that import line so that it names the new module that holds the code now. Then save the file."
    if isinstance(error, ModuleNotFoundError):
        return f"{where(error, name)} imports a module with the name {error.name}, and Python cannot find a module with that name. Read the import lines at the top of {where(error, name)}, and compare each name with the names of your files."
    if isinstance(error, ImportError) and error.name == name:
        return f"Python cannot finish reading {name}.py, because {name}.py is imported again before Python has reached its end. Look in {name}.py for a line that imports from {name}. A module never imports from itself, so remove that line. If there is no such line, {name}.py imports another module that imports {name}: remove that import."
    if isinstance(error, ImportError):
        wanted = getattr(error, "name_from", None) or "that it asks for"
        return f"{where(error, name)} imports the name {wanted} from the module {error.name}, but {error.name}.py does not hold that name. Check which of your modules holds it, and correct the import line. If {error.name}.py is not saved yet, save it."
    if isinstance(error, NameError):
        return f"Python stopped with a NameError: the name {error.name} is not known in {where(error, name)}. A module must import every name that it uses, at the top of its own file. An import in another file does not count. Add the import of {error.name} to {where(error, name)}, and save the file."
    if isinstance(error, SyntaxError):
        return f"Python cannot read {os.path.basename(error.filename or name + '.py')}: something near line {error.lineno} is not correct Python. Compare that part with spending.py. Each line that you copy must keep the spaces at its start."
    return f"Python stopped with a {type(error).__name__} in {where(error, name)}. Compare the code in that file with the same code in spending.py. The code that you copy must stay the same."

def need(name):
    if name + ".py" not in os.listdir("."):
        finish(False, f"There is no file with the name {name}.py yet. Make it in the file browser, beside spending.py, and save it.")

def load(name):
    need(name)
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            return importlib.import_module(name)
    except Exception as error:
        finish(False, explain(error, name))

def test_ledger(models):
    ledger = models.Ledger()
    ledger.add(models.Purchase("2025-11-02", "Tea", Decimal("3.50"), "food"))
    ledger.add(models.Purchase("2025-11-20", "Tram ticket", Decimal("2.10"), "transport"))
    ledger.add(models.Purchase("2025-12-05", "Soup", Decimal("4.25"), "food"))
    ledger.add(models.Purchase("2025-12-09", "Notebook", Decimal("12.00"), "hobbies"))
    return ledger

models = load("models")
for name in ("Purchase", "Ledger"):
    if not isinstance(getattr(models, name, None), type):
        finish(False, f"models.py has no class with the name {name}. Copy the classes Purchase and Ledger from spending.py into models.py. Then save models.py. The check reads the file on the disk, and not the text in the editor.")
for name, home in (("read_ledger", "storage.py"), ("report_lines", "report.py"), ("main", "main.py")):
    if hasattr(models, name):
        finish(False, f"models.py also holds the function {name}. The one job of models.py is to hold the two classes. The function {name} belongs in {home}. Remove it from models.py, and save the file.")
try:
    with contextlib.redirect_stdout(io.StringIO()):
        ledger = test_ledger(models)
        found = [f"{ledger.total():.2f}", f"{ledger.select(category='food').total():.2f}", f"{ledger.total_by_month()['2025-12']:.2f}", ledger.largest().description, len(ledger.select(month="2025-11").purchases)]
except NameError as error:
    finish(False, explain(error, "models"))
except BaseException:
    found = None
if found != ["21.85", "7.75", "16.25", "Notebook", 2]:
    finish(False, "The classes in models.py do not work in the same way as the classes in spending.py. The check made a ledger of four purchases, and its totals were not right. Copy the two classes from spending.py again, without changes, and save models.py.")
finish(True, "models.py holds the classes Purchase and Ledger, and it imports the names that they use. The check made a ledger of four purchases, and its total was 21.85.")
'''

try:
    run = subprocess.run(
        [sys.executable, "-c", driver],
        capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError("Python did not finish after 5 seconds when the check used your modules. Look in your files for a loop that never ends.") from None
results = [line for line in run.stdout.splitlines() if line.startswith(("PASS|", "FAIL|"))]
assert results, "The check could not test your modules. Click Check again. If this message stays, open the solution on this page."
result, message = results[-1].split("|", 1)
assert result == "PASS", message
print(message)
```

## What happened

`models.py` is now a module. It holds two classes, and it imports the
two names that the classes use. It does not import `csv` or
`argparse`, because nothing in it uses them.

The action below runs a short command. `python -c` runs the Python
code that is written after it, between the quotes. This code imports
your module and prints the class `Purchase`.

```{execute}
:id: show-models
:title: Import models and print the class Purchase
:wait: prompt
python -c "import models; print(models.Purchase)"
```

The terminal shows `<class 'models.Purchase'>`. The class now belongs
to the module `models`.

On the next page, you make the second module, which uses the first.
