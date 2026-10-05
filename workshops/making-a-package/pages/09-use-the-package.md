---
title: Use the package in another program
requires: [verify:largest-works]
---

# Use the package in another program

A package is not only a program that you run. It is also code that
another program can import. On this page you write a small program of
your own that uses the package.

## What a program outside the package writes

A program outside the package imports a module of the package by its
full name. The program `food_total.py` does this:

```python
from spending.storage import read_ledger
```

Here the dot is between two names: the package and the module. This
import is not a relative import. A relative import begins with a dot,
and only a module inside a package may use one. A program outside the
package has no package of its own, so it writes the name of the
package.

One more thing is useful to know. The line `import spending` alone
runs only the file `__init__.py` of the package. It does not read the
other modules. So a program names the module that it needs, as
`food_total.py` does with `spending.storage`.

## Your task

Write a program that shows the largest purchase in the file
`spending.csv`.

- The program is a new file with the name `largest.py`. The file is in
  your work directory, beside `spending.csv` and `food_total.py`. It is
  not inside the directory `spending`.

- The program imports the function `read_ledger` from the module
  `storage` of the package `spending`.

- It calls `read_ledger("spending.csv")`, which returns a `Ledger`
  object.

- It calls the method `largest()` of that ledger. The method takes no
  arguments, and it returns the purchase with the largest amount. A
  purchase has the attributes `date`, `description`, `amount` and
  `category`.

- It shows the date, the description and the amount of that purchase
  on one line, with one space between them.

For the file `spending.csv`, the program must show this line:

```
2026-01-01 Rent for January 650.00
```

The file browser shows the directory `spending`, and your new file
must not go there. The action below shows your work directory in the
file browser.

```{file-browser-reveal}
:id: show-work-directory
:title: Show my work directory in the file browser
:path: spending.csv
```

Now make the file `largest.py` in the file browser, open it, write the
program, and save it. Then run it. Type this command in the terminal,
and press `Enter`:

```
python largest.py
```

```{hint}
:title: Hint: how to begin
Open `food_total.py` and read it. Your program begins with the same
two lines: the import, and the call of `read_ledger`.
```

```{hint}
:title: Hint: the largest purchase
Call the method on the ledger, and give the result a name:
`purchase = ledger.largest()`. Then `purchase.date` is the date of
that purchase, and the other two attributes are read in the same way.
```

```{hint}
:title: Hint: one line with spaces
When you give `print()` several values with commas between them, it
shows them on one line with one space between them.
```

```{attempt}
:id: largest-not-made
:check: largest-works
:expect: There is no file largest.py in your work directory yet
```

````{attempt}
:id: largest-inside
:check: largest-works
:expect: The file largest.py is inside the directory spending

```{file-write}
:path: spending/largest.py
from spending.storage import read_ledger
```
````

````{attempt}
:id: largest-empty
:check: largest-works
:expect: and it showed nothing

```{file-delete}
:path: spending/largest.py
```

```{file-write}
:path: largest.py
from spending.storage import read_ledger

ledger = read_ledger("spending.csv")
purchase = ledger.largest()
```
````

````{attempt}
:id: largest-error
:check: largest-works
:expect: The last line of the error is: AttributeError

```{file-write}
:path: largest.py
import spending

ledger = spending.storage.read_ledger("spending.csv")
purchase = ledger.largest()
print(purchase.date, purchase.description, purchase.amount)
```
````

````{attempt}
:id: largest-other-line
:check: largest-works
:expect: Your program showed Rent for January 650.00 and it must show 2026-01-01 Rent for January 650.00

```{file-write}
:path: largest.py
from spending.storage import read_ledger

ledger = read_ledger("spending.csv")
purchase = ledger.largest()
print(purchase.description, purchase.amount)
```
````

````{attempt}
:id: largest-fixed-text
:check: largest-works
:expect: with another file of purchases

```{file-write}
:path: largest.py
print("2026-01-01 Rent for January 650.00")
```
````

````{hint}
:title: Show me a solution
:unlock: "largest-works" in failed_checks or "largest-works" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action writes a working program in the file `largest.py`
and opens it. The second action runs it. Compare the program with
your own.

```{file-write}
:id: largest-solution
:title: Write the file largest.py
:path: largest.py
:open: true
from spending.storage import read_ledger

ledger = read_ledger("spending.csv")
purchase = ledger.largest()
print(purchase.date, purchase.description, purchase.amount)
```

```{execute}
:id: run-largest-solution
:title: Run the program
:wait: prompt
python largest.py
```
````

```{verify}
:id: largest-works
:label: The program largest.py shows the largest purchase
:trigger: file-saved largest.py; terminal-output "Rent for January"; after:run-largest-solution
import os, shutil, subprocess, sys
from pathlib import Path

def run_program(directory):
    try:
        return subprocess.run(
            [sys.executable, "largest.py"], cwd=directory,
            capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError("The check ran python largest.py, and the program did not end after 10 seconds. Look for a loop that never ends.") from None

if not Path("largest.py").exists():
    if Path("spending/largest.py").exists():
        raise AssertionError("The file largest.py is inside the directory spending. It must be in your work directory, beside spending.csv. Move it with this command in the terminal: mv spending/largest.py largest.py")
    raise AssertionError("There is no file largest.py in your work directory yet. Make the file in the file browser, write the program, and save it.")
run = run_program(".")
if run.returncode != 0:
    last = run.stderr.strip().splitlines()[-1]
    raise AssertionError(f"Python stopped with an error when the check ran python largest.py. The last line of the error is: {last}. Run the program in the terminal to see the whole message, and read it from the last line upward. Correct the file, and save it.")
shown = run.stdout.strip()
expected = "2026-01-01 Rent for January 650.00"
assert shown, "The check ran python largest.py, and it showed nothing. Did you save the file? Use print() to show the date, the description and the amount of the purchase."
assert shown == expected, f"Your program showed {shown} and it must show {expected}. Show the attributes date, description and amount of the largest purchase, in that order, in one call of print() with commas between them. Then save the file."
copy = Path("_check_largest")
shutil.rmtree(copy, ignore_errors=True)
try:
    copy.mkdir()
    shutil.copy("largest.py", copy / "largest.py")
    shutil.copytree("spending", copy / "spending")
    (copy / "spending.csv").write_text("date,description,amount,category\n2025-11-02,Tea,3.50,food\n2025-11-20,Bicycle repair,48.00,transport\n2025-12-05,Soup,4.25,food\n")
    other = run_program(copy)
finally:
    shutil.rmtree(copy, ignore_errors=True)
other_shown = other.stdout.strip() if other.returncode == 0 else "an error"
other_expected = "2025-11-20 Bicycle repair 48.00"
assert other_shown == other_expected, f"Your program shows the right line for Mariam's purchases. But the check also ran it with another file of purchases, in which the largest purchase is a bicycle repair. Then the program showed {other_shown} and it must show {other_expected}. The program must read the file with read_ledger and call the method largest(). It must not show a fixed text. Change the file, and save it."
print("Your program shows:", shown)
```

## What happened

Your program is five lines long, and it holds no code that reads a
CSV file or compares amounts. That code is in the package. Your
program imported it and used it.

This is the second reason for a package. The first reason was to keep
the modules of one program together. The second reason is that other
programs can build on it. `food_total.py` and `largest.py` are two
programs that use one package.
