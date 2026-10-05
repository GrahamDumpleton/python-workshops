---
title: "Part 2: the file reader"
requires: [quiz:predict-missing-import, verify:storage-works]
---

# Part 2: the file reader

The second module is `storage.py`. Its one job is to read the
purchases from a file, so it gets the function `read_ledger`. This
function makes a `Ledger` and many `Purchase` objects, and those two
classes are now in `models.py`. So `storage.py` must import from a
module that you wrote.

## Importing from your own module

You import from your own module in the same way as from a module of
Python:

```python
from models import Ledger, Purchase
```

This line tells Python to read the file `models.py`, and to make the
names `Ledger` and `Purchase` ready to use in the file that holds the
line. The name after `from` is the name of the file without `.py`.

Python looks for `models.py` in the same directory as the program
that you run. A **directory** is a place that holds files and other
directories. All your files are in one directory, so Python finds the
module. The next workshop explains where else Python looks.

The rule of the page before this one still holds: a module imports
every name that it uses. Read the function `read_ledger` in
`spending.py`, from line 62 to line 68:

```python
def read_ledger(filename):
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            ledger.add(purchase)
    return ledger
```

Imagine that `storage.py` holds this function and these two import
lines only:

```python
import csv
from decimal import Decimal
```

Another file then imports `read_ledger` from `storage`, and calls
`read_ledger("spending.csv")`.

```{quiz}
:id: predict-missing-import
:title: Predict what happens
question: "What happens when `read_ledger` runs?"
options:
  - { text: "It works, because the class `Ledger` exists in `models.py`, and Python searches the other files for it", explanation: "Python never searches other files for a name. A name exists in a module only when the module makes it or imports it." }
  - { text: "Python stops with a `NameError`, because the name `Ledger` is not known in `storage.py`", correct: true }
  - { text: "It works, because the file that calls `read_ledger` has imported `Ledger`", explanation: "An import in another file does not count. The function `read_ledger` belongs to `storage.py`, and it sees only the names of `storage.py`." }
explanation: "The second line of the function is `ledger = Ledger()`. Nothing in this `storage.py` makes or imports the name `Ledger`, so Python stops there with a `NameError`. Python shows this error only when the function runs, and not when it reads the file. That is why you run the program after every change to its imports."
```

## The goal

Make the file `storage.py`. It holds the function `read_ledger`, and
the import lines that the function needs.

## What your file must hold

- At the top, the import lines for every name that `read_ledger`
  uses. The function uses four names that it does not make itself.
  Two come from modules of Python, and two come from `models.py`.

- Under the import lines, the function `read_ledger`, exactly as it
  is in `spending.py`, from line 62 to line 68.

- Nothing else. Do not copy the classes into `storage.py`: they are
  in `models.py` already, and `storage.py` imports them.

## How to do it

1. Make the file in the file browser, as you made `models.py`: click
   the empty space under the names of the files with the right button
   of the mouse, click `New File`, type `storage.py`, and press
   `Enter`.

2. Double-click `storage.py` to open it in the editor.

3. Copy the function from `spending.py`, and paste it into
   `storage.py`.

4. Write the import lines above the function.

5. Save the file: hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
   press `S`.

The check runs each time you save `storage.py`. It calls your
function with a small file of four purchases that it makes itself.

## If you need help

```{hint}
:title: "Hint: what to look at"
Read the function line by line, and make a list of every name that the
function does not make itself.

`ledger`, `file`, `row` and `purchase` are made inside the function.
`filename` is its parameter. `open` is a function that Python always
has ready. These names need no import.

Four names remain: `Ledger`, `csv`, `Purchase` and `Decimal`. Each of
them needs an import.
```

```{hint}
:title: "Hint: the import lines"
`storage.py` begins with three import lines:

1. `import csv`, as in `spending.py`.

2. `from decimal import Decimal`, as in `spending.py`.

3. A new line that takes the two classes from your own module:
   `from models import Ledger, Purchase`.

Programmers put the imports from their own modules after the imports
from the modules of Python, with one empty line between the two
groups. Python does not need this order. It helps a person who reads
the file.
```

If the hints were not enough, the box below holds a solution. It
opens after you have saved `storage.py`, or after you have clicked
`Check`.

```{attempt}
:id: storage-missing
:check: storage-works
:expect: There is no file with the name storage.py yet
```

````{attempt}
:id: storage-empty
:check: storage-works
:expect: storage.py has no function with the name read_ledger

```{file-write}
:path: storage.py
```
````

````{attempt}
:id: storage-no-models-import
:check: storage-works
:expect: the name Ledger is not known in storage.py

```{file-write}
:path: storage.py
import csv
from decimal import Decimal


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
:id: storage-from-spending
:check: storage-works
:expect: storage.py still imports from spending

```{file-write}
:path: storage.py
import csv
from decimal import Decimal

from spending import Ledger, Purchase


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
:id: storage-wrong-module-name
:check: storage-works
:expect: storage.py imports a module with the name model, and Python cannot find a module with that name

```{file-write}
:path: storage.py
import csv
from decimal import Decimal

from model import Ledger, Purchase


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
:id: storage-own-classes
:check: storage-works
:expect: storage.py holds its own copy of the class Purchase

```{file-write}
:path: storage.py
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
:id: storage-too-much
:check: storage-works
:expect: storage.py also holds the function report_lines

```{file-write}
:path: storage.py
import csv
from decimal import Decimal

from models import Ledger, Purchase


def read_ledger(filename):
    ledger = Ledger()
    with open(filename, newline="") as file:
        for row in csv.DictReader(file):
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
            ledger.add(purchase)
    return ledger


def report_lines(ledger):
    return [f"Purchases: {len(ledger.purchases)}"]
```
````

````{attempt}
:id: storage-changed
:check: storage-works
:expect: does not work in the same way as the function in spending.py

```{file-write}
:path: storage.py
import csv
from decimal import Decimal

from models import Ledger, Purchase


def read_ledger(filename):
    ledger = Ledger()
    return ledger
```
````

````{hint}
:title: Show me a solution
:unlock: "storage-works" in failed_checks
:locked: Try the task first. This opens after the check below has run.

The action below writes a complete `storage.py`. If you have made the
file already, it replaces the text that your file holds now, so read
your own file first and compare.

```{file-write}
:id: storage-solution
:title: Write a complete storage.py and open it
:path: storage.py
:open: true
"""Reading the purchases from a CSV file."""

import csv
from decimal import Decimal

from models import Ledger, Purchase


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
:id: storage-works
:label: storage.py reads a file with the classes of models.py
:trigger: file-saved storage.py; after:storage-solution
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
storage = load("storage")
if not callable(getattr(storage, "read_ledger", None)):
    finish(False, "storage.py has no function with the name read_ledger. Copy the function read_ledger from spending.py into storage.py. Then save storage.py. The check reads the file on the disk, and not the text in the editor.")
for name in ("Purchase", "Ledger"):
    if getattr(storage, name, getattr(models, name)) is not getattr(models, name):
        finish(False, f"storage.py holds its own copy of the class {name}. A class must be in one module only. With a copy, the program has two different classes with the same name. Remove the classes from storage.py, and import them with the line: from models import Ledger, Purchase")
for name, home in (("report_lines", "report.py"), ("main", "main.py")):
    if hasattr(storage, name):
        finish(False, f"storage.py also holds the function {name}. The one job of storage.py is to read the file of purchases. The function {name} belongs in {home}. Remove it from storage.py, and save the file.")
try:
    with contextlib.redirect_stdout(io.StringIO()):
        ledger = storage.read_ledger("_check_purchases.csv")
        found = [type(ledger) is models.Ledger, len(ledger.purchases), f"{ledger.total():.2f}", ledger.purchases[0].amount == Decimal("3.50")]
except NameError as error:
    finish(False, explain(error, "storage"))
except BaseException:
    found = None
if found != [True, 4, "21.85", True]:
    finish(False, "The function read_ledger in storage.py does not work in the same way as the function in spending.py. The check gave it a file of four purchases, and the ledger that came back was not right. Copy the function from spending.py again, without changes, and save storage.py.")
finish(True, "storage.py holds the function read_ledger, and it imports the names that the function uses. The check gave it a file of four purchases, and it gave back a Ledger with the total 21.85.")
'''

with open("_check_purchases.csv", "w", newline="") as file:
    file.write("date,description,amount,category\n2025-11-02,Tea,3.50,food\n2025-11-20,Tram ticket,2.10,transport\n2025-12-05,Soup,4.25,food\n2025-12-09,Notebook,12.00,hobbies\n")
try:
    try:
        run = subprocess.run(
            [sys.executable, "-c", driver],
            capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError("Python did not finish after 5 seconds when the check used your modules. Look in your files for a loop that never ends.") from None
finally:
    os.remove("_check_purchases.csv")
results = [line for line in run.stdout.splitlines() if line.startswith(("PASS|", "FAIL|"))]
assert results, "The check could not test your modules. Click Check again. If this message stays, open the solution on this page."
result, message = results[-1].split("|", 1)
assert result == "PASS", message
print(message)
```

## What happened

You now have two modules that work together. `storage.py` imports two
classes from `models.py`, and uses them.

The action below runs a short piece of code with `python -c`. The
code imports `read_ledger` from your module `storage`, reads the
purchases of Mariam, and prints their total.

```{execute}
:id: show-storage
:title: Read spending.csv with the module storage
:wait: prompt
python -c "from storage import read_ledger; print(read_ledger('spending.csv').total())"
```

The terminal shows `2834.79`, the total of the 37 purchases.

Look at what the code in this command does not do. It does not import
`models`. It uses only one name, `read_ledger`, so it imports only
that name. Python reads `models.py` when it reads `storage.py`,
because `storage.py` asks for it.
