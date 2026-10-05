---
title: "Part 3: the report"
requires: [quiz:predict-report-imports, verify:report-works]
---

# Part 3: the report

The third module is `report.py`. Its one job is to make the lines of
text of the report, so it gets the function `report_lines`.

## Which names does it use?

Use the rule again: a module imports every name that it uses, and no
other name. Read the function `report_lines` in `spending.py`, from
line 71 to line 87. It begins like this:

```python
def report_lines(ledger):
    lines = [f"Purchases: {len(ledger.purchases)}"]
    if not ledger.purchases:
        return lines
    lines.append(f"Total: {ledger.total():.2f}")
```

The function receives a ledger as its argument, and it calls the
methods of that ledger, such as `ledger.total()`.

```{quiz}
:id: predict-report-imports
:title: Predict the imports
question: "Which import lines does `report.py` need for this function?"
options:
  - { text: "`from models import Ledger`, because the function works with a ledger", explanation: "The function works with a ledger, but it never writes the name `Ledger`. It uses the name `ledger`, with a small letter, which is its own parameter." }
  - { text: "No import line", correct: true }
  - { text: "`from decimal import Decimal`, because the totals are `Decimal` values", explanation: "The totals are `Decimal` values, but the function never writes the name `Decimal`. It only formats the values that the ledger gives it." }
explanation: "`report_lines` uses its parameter `ledger`, names that it makes itself, such as `lines`, and the function `len`, which Python always has ready. It never writes the name of a class or of a module. A module needs an import for a name that its code writes. It needs no import for the type of a value that it only receives. So `report.py` needs no import line."
```

## The goal

Make the file `report.py`. It holds the function `report_lines`,
exactly as it is in `spending.py`, from line 71 to line 87, and
nothing else.

Make the file in the file browser, copy the function into it, and
save the file. The steps are the same as for `storage.py`.

The check runs each time you save `report.py`. It calls your function
with a ledger of four purchases, and with an empty ledger.

## If you need help

```{hint}
:title: "Hint: how to make the file"
Click the empty space under the names of the files in the file
browser with the right button of the mouse. Click `New File`, type
`report.py`, and press `Enter`. Then double-click `report.py` to open
it in the editor.
```

```{hint}
:title: "Hint: what to copy"
In `spending.py`, click at the start of line 71, which is
`def report_lines(ledger):`. Hold `Shift`, and click at the end of
line 87, which is `return lines`. Copy the marked text, paste it into
`report.py`, and save `report.py`.

The first line of the function has no spaces at its start. Every
other line of the function keeps its spaces.
```

If the hints were not enough, the box below holds a solution. It
opens after you have saved `report.py`, or after you have clicked
`Check`.

```{attempt}
:id: report-missing
:check: report-works
:expect: There is no file with the name report.py yet
```

````{attempt}
:id: report-empty
:check: report-works
:expect: report.py has no function with the name report_lines

```{file-write}
:path: report.py
```
````

````{attempt}
:id: report-from-spending
:check: report-works
:expect: report.py still imports from spending

```{file-write}
:path: report.py
from spending import report_lines
```
````

````{attempt}
:id: report-own-classes
:check: report-works
:expect: report.py holds its own copy of the class Purchase

```{file-write}
:path: report.py
from dataclasses import dataclass
from decimal import Decimal


@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str


def report_lines(ledger):
    lines = [f"Purchases: {len(ledger.purchases)}"]
    return lines
```
````

````{attempt}
:id: report-too-much
:check: report-works
:expect: report.py also holds the function main

```{file-write}
:path: report.py
def report_lines(ledger):
    lines = [f"Purchases: {len(ledger.purchases)}"]
    return lines


def main():
    print("The report")
```
````

````{attempt}
:id: report-changed
:check: report-works
:expect: does not work in the same way as the function in spending.py

```{file-write}
:path: report.py
def report_lines(ledger):
    lines = [f"Purchases: {len(ledger.purchases)}"]
    return lines
```
````

````{hint}
:title: Show me a solution
:unlock: "report-works" in failed_checks
:locked: Try the task first. This opens after the check below has run.

The action below writes a complete `report.py`. If you have made the
file already, it replaces the text that your file holds now, so read
your own file first and compare.

```{file-write}
:id: report-solution
:title: Write a complete report.py and open it
:path: report.py
:open: true
"""The lines of the spending report."""


def report_lines(ledger):
    lines = [f"Purchases: {len(ledger.purchases)}"]
    if not ledger.purchases:
        return lines
    lines.append(f"Total: {ledger.total():.2f}")
    lines.append("")
    lines.append("Total for each category:")
    for category, amount in ledger.total_by_category().items():
        lines.append(f"  {category}: {amount:.2f}")
    lines.append("")
    lines.append("Total for each month:")
    for month, amount in ledger.total_by_month().items():
        lines.append(f"  {month}: {amount:.2f}")
    lines.append("")
    largest = ledger.largest()
    lines.append(f"Largest purchase: {largest.date} {largest.description} {largest.amount:.2f}")
    return lines
```
````

```{verify}
:id: report-works
:label: report.py makes the lines of the report
:trigger: file-saved report.py; after:report-solution
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
report = load("report")
if not callable(getattr(report, "report_lines", None)):
    finish(False, "report.py has no function with the name report_lines. Copy the function report_lines from spending.py into report.py. Then save report.py. The check reads the file on the disk, and not the text in the editor.")
for name in ("Purchase", "Ledger"):
    if getattr(report, name, getattr(models, name)) is not getattr(models, name):
        finish(False, f"report.py holds its own copy of the class {name}. A class must be in one module only. Remove the classes from report.py, and save the file. The function report_lines works on the ledger that it receives, so report.py needs no class.")
for name, home in (("read_ledger", "storage.py"), ("main", "main.py")):
    if hasattr(report, name):
        finish(False, f"report.py also holds the function {name}. The one job of report.py is to make the lines of the report. The function {name} belongs in {home}. Remove it from report.py, and save the file.")
try:
    with contextlib.redirect_stdout(io.StringIO()):
        found = [list(report.report_lines(test_ledger(models))), list(report.report_lines(models.Ledger()))]
except BaseException:
    found = None
expected = ["Purchases: 4", "Total: 21.85", "", "Total for each category:", "  food: 7.75", "  transport: 2.10", "  hobbies: 12.00", "", "Total for each month:", "  2025-11: 5.60", "  2025-12: 16.25", "", "Largest purchase: 2025-12-09 Notebook 12.00"]
if found != [expected, ["Purchases: 0"]]:
    finish(False, "The function report_lines in report.py does not work in the same way as the function in spending.py. The check gave it a ledger of four purchases and an empty ledger, and the lines that came back were not right. Copy the function from spending.py again, without changes, and save report.py.")
finish(True, "report.py holds the function report_lines. The check gave it a ledger of four purchases, and it gave back the 13 lines of the report.")
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

`report.py` is the shortest of your modules, and it has no import
line. It can make a report for any object that has the methods of a
ledger.

A module without imports is the simplest kind to read and to test: it
depends on nothing. Three of the four modules are complete. On the
next page, you make the last one, which connects them.
