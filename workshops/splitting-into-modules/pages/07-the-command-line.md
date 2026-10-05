---
title: "Part 4: the command line"
requires: [verify:main-works, quiz:read-new-program]
---

# Part 4: the command line

The last module is `main.py`. Its one job is the command line. It
gets the function `main`, and the two lines at the end of
`spending.py` that call `main()`.

`main.py` is the file that you run. It is a **script**: a file of
Python code that you run as a program, with `python` and the name of
the file. The other three modules are not run. They are imported.

## The goal

Make the file `main.py`, so that this command shows the report:

```
python main.py spending.csv
```

The options `--month` and `--category` must work as before.

## What your file must hold

- At the top, the import lines for every name that the code uses and
  does not make itself. Some names come from a module of Python, and
  some come from your own modules. Read the function, and decide
  which.

- Under the import lines, the function `main`, exactly as it is in
  `spending.py`, from line 90 to line 99.

- At the end, the two lines that call `main()` when the file is run,
  exactly as they are in `spending.py`, in line 102 and line 103:

  ```python
  if __name__ == "__main__":
      main()
  ```

- Nothing else. `main.py` imports `read_ledger` and `report_lines`.
  It does not hold a copy of them.

Make the file in the file browser, copy the code into it, write the
import lines, and save the file.

The check runs each time you save `main.py`. It runs your program
three times, with a small file of four purchases that it makes
itself.

## If you need help

```{hint}
:title: "Hint: what to look at"
Read the function `main` line by line, and make a list of every name that
the function does not make itself.

`parser`, `args`, `ledger` and `line` are made inside the function.
`print` is a function that Python always has ready.

Three names remain: `argparse`, `read_ledger` and `report_lines`.
Ask of each name: which module holds it now?

The function `main` never writes the name `Ledger` or `Purchase`. So
`main.py` needs no import from `models`.
```

```{hint}
:title: "Hint: the import lines"
`main.py` begins with three import lines:

1. `import argparse`, as in `spending.py`.

2. A line that takes `report_lines` from your module `report`. It has
   the same form as `from models import Ledger, Purchase`.

3. A line that takes `read_ledger` from your module `storage`.

To make the file: click the empty space in the file browser with the
right button of the mouse, click `New File`, type `main.py`, and
press `Enter`.
```

If the hints were not enough, the box below holds a solution. It
opens after you have saved `main.py`, or after you have clicked
`Check`.

```{attempt}
:id: main-missing
:check: main-works
:expect: There is no file with the name main.py yet
```

````{attempt}
:id: main-empty
:check: main-works
:expect: The program showed nothing

```{file-write}
:path: main.py
```
````

````{attempt}
:id: main-no-imports
:check: main-works
:expect: the name read_ledger is not known in main.py

```{file-write}
:path: main.py
import argparse


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

````{attempt}
:id: main-from-spending
:check: main-works
:expect: main.py still imports from spending

```{file-write}
:path: main.py
import argparse

from spending import read_ledger, report_lines


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

````{attempt}
:id: main-wrong-module
:check: main-works
:expect: main.py imports the name read_ledger from the module report, but report.py does not hold that name

```{file-write}
:path: main.py
import argparse

from report import read_ledger, report_lines


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

````{attempt}
:id: main-imports-itself
:check: main-works
:expect: main.py is imported again before Python has reached its end

```{file-write}
:path: main.py
import argparse

from main import main
from report import report_lines
from storage import read_ledger


def main():
    print("The report")


if __name__ == "__main__":
    main()
```
````

````{attempt}
:id: main-own-copy
:check: main-works
:expect: main.py holds its own copy of report_lines

```{file-write}
:path: main.py
import argparse

from storage import read_ledger


def report_lines(ledger):
    return [f"Purchases: {len(ledger.purchases)}"]


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

````{attempt}
:id: main-stops-itself
:check: main-works
:expect: The program stopped itself before it showed the report

```{file-write}
:path: main.py
import argparse

from report import report_lines
from storage import read_ledger


def main():
    parser = argparse.ArgumentParser(description="Report on the purchases in a CSV file.")
    parser.add_argument("filename", help="the CSV file that holds the purchases")
    parser.add_argument("year", help="the year of the report")
    args = parser.parse_args()

    ledger = read_ledger(args.filename)
    for line in report_lines(ledger):
        print(line)


if __name__ == "__main__":
    main()
```
````

````{attempt}
:id: main-changed
:check: main-works
:expect: Line 1 of the report was: Purchases: 4. It must be: Purchases: 2.

```{file-write}
:path: main.py
import argparse

from report import report_lines
from storage import read_ledger


def main():
    parser = argparse.ArgumentParser(description="Report on the purchases in a CSV file.")
    parser.add_argument("filename", help="the CSV file that holds the purchases")
    parser.add_argument("--month", help="report on one month only, for example 2026-02")
    parser.add_argument("--category", help="report on one category only, for example food")
    args = parser.parse_args()

    ledger = read_ledger(args.filename)
    for line in report_lines(ledger):
        print(line)


if __name__ == "__main__":
    main()
```
````

````{hint}
:title: Show me a solution
:unlock: "main-works" in failed_checks or "main-works" in passed_checks
:locked: Try the task first. This opens after the check below has run.

The action below writes a complete `main.py`. If you have made the
file already, it replaces the text that your file holds now, so read
your own file first and compare.

```{file-write}
:id: main-solution
:title: Write a complete main.py and open it
:path: main.py
:open: true
"""The command line of the spending tracker."""

import argparse

from report import report_lines
from storage import read_ledger


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
:id: main-works
:label: main.py runs the program from the four modules
:trigger: file-saved main.py; after:main-solution
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

for name in ("models", "storage", "report", "main"):
    need(name)
models = load("models")
storage = load("storage")
report = load("report")

def run(options):
    command = " ".join(["python main.py _check_purchases.csv"] + options)
    sys.argv = ["main.py", "_check_purchases.csv"] + options
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown), contextlib.redirect_stderr(io.StringIO()):
            names = runpy.run_path("main.py", run_name="__main__")
    except SystemExit:
        finish(False, f"The program stopped itself before it showed the report. The check ran: {command}. The function main in main.py must be the same as the function main in spending.py. Copy it again, without changes, and save main.py.")
    except BaseException as error:
        finish(False, explain(error, "main"))
    return command, names, shown.getvalue().splitlines()

command, names, lines = run([])
for name, home in (("Purchase", "models"), ("Ledger", "models"), ("read_ledger", "storage"), ("report_lines", "report")):
    if getattr(names.get(name), "__module__", None) == "__main__":
        finish(False, f"main.py holds its own copy of {name}. Code must be in one module only. Remove {name} from main.py. If main.py uses the name {name}, import it from {home}.")
if "main" not in names or not lines:
    finish(False, f"The check ran: {command}. The program showed nothing. main.py needs the function main. After the function, it needs the two lines that test __name__ and call main(). Copy all of this from the end of spending.py. Then save main.py. The check reads the file on the disk, and not the text in the editor.")
tests = [
    ([], ["Purchases: 4", "Total: 21.85", "", "Total for each category:", "  food: 7.75", "  transport: 2.10", "  hobbies: 12.00", "", "Total for each month:", "  2025-11: 5.60", "  2025-12: 16.25", "", "Largest purchase: 2025-12-09 Notebook 12.00"]),
    (["--category", "food"], ["Purchases: 2", "Total: 7.75", "", "Total for each category:", "  food: 7.75", "", "Total for each month:", "  2025-11: 3.50", "  2025-12: 4.25", "", "Largest purchase: 2025-12-05 Soup 4.25"]),
    (["--month", "2025-12"], ["Purchases: 2", "Total: 16.25", "", "Total for each category:", "  food: 4.25", "  hobbies: 12.00", "", "Total for each month:", "  2025-12: 16.25", "", "Largest purchase: 2025-12-09 Notebook 12.00"]),
]
for options, expected in tests:
    command, names, lines = run(options)
    if lines != expected:
        place = 0
        while place < len(lines) and place < len(expected) and lines[place] == expected[place]:
            place = place + 1
        was = lines[place] if place < len(lines) else "missing"
        must = expected[place] if place < len(expected) else "the end of the report"
        finish(False, f"The check ran: {command}. The report was not right. Line {place + 1} of the report was: {was}. It must be: {must}. The function main in main.py must be the same as the function main in spending.py. Copy it again, without changes, and save main.py.")
finish(True, "main.py runs the program from the four modules. The check ran it three times with a file of four purchases: with no option, with --category food, and with --month 2025-12. Each report was right.")
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

## Run the new program

The action below runs the new program with the same command line
arguments that you gave the old program at the start of this
workshop.

```{execute}
:id: run-new-program
:title: Run the new program for the food of February
:wait: prompt
python main.py spending.csv --month 2026-02 --category food
```

```{quiz}
:id: read-new-program
:type: text
:title: Read the terminal
question: "The second line of the report begins with `Total:`. Which number comes after it?"
answer: "199.85"
wrong:
  - { text: "6", explanation: "That is the number of purchases, from the first line of the report. The question asks for the number in the second line, after `Total:`." }
  - { text: "2834.79", explanation: "That is the total of all 37 purchases. This command has the options `--month 2026-02` and `--category food`. Read the second line that the terminal shows under the command." }
  - { text: "199,85", explanation: "That is the right amount. Python writes it with a point: `199.85`." }
  - { pattern: "Total: *199\\.85", explanation: "That is the right line. Type only the number that comes after `Total:`." }
otherwise: "Look in the terminal for the line that begins with `Total:`, under the command. Type the number that comes after it."
explanation: "The report is the same as the report of the old program: 6 purchases, with a total of 199.85. The split changed where the code is, and it did not change what the code does."
```

## How the modules depend on each other

Each import is a line from one module to another:

- `main.py` imports from `storage.py` and from `report.py`.

- `storage.py` imports from `models.py`.

- `models.py` and `report.py` import none of your modules.

All the imports go in one direction, from `main.py` down to
`models.py`. Keep it so. When two modules import each other, for
example when `models.py` imports from `storage.py` and `storage.py`
imports from `models.py`, Python can stop with an `ImportError`,
because it cannot finish reading one module before it needs the
other. Programmers call this a circular import. The usual repair is
to move the shared code into a module that imports neither of the
two.
