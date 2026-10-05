---
title: A module has its own imports
requires: [quiz:predict-import, verify:module-imports, verify:module-imported]
---

# A module has its own imports

The file `spending.py` holds the class `Purchase`. Now the notebook
can import the module. Before it does, think about what will happen.

The first lines of the class in the file are these:

```python
@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str
```

These lines use the names `dataclass` and `Decimal`. The notebook
knows both names, because its first cell ran these lines:

```python
import csv
from dataclasses import dataclass
from decimal import Decimal
```

The file `spending.py` does not hold these `import` lines.

```{quiz}
:id: predict-import
:title: Predict what the import does
question: "The notebook runs `import spending`. What happens?"
options:
  - { text: "The import works, because the notebook already knows the names `dataclass` and `Decimal`", explanation: "This is what many people expect. But a module cannot see the names of the notebook that imports it. Read the explanation of the correct answer when you find it." }
  - { text: "Python stops with a `NameError`, because the file does not know the name `dataclass`", correct: true }
  - { text: "The import works, and Python stops later, when a cell makes a purchase", explanation: "Python runs the lines of the file at the moment of the import. The line `@dataclass` is one of them, so Python needs the name `dataclass` at once." }
explanation: "When Python imports a module, it runs the lines of the file from the top. While it does that, it knows only the names that the file itself makes or imports. The names of the notebook do not count. The file has no line that imports `dataclass`, so Python stops with a `NameError`."
```

## See it happen

The action below adds a cell that imports your module. The action does
not run the cell, because the cell stops with an error.

```{cell-insert}
:id: insert-import-module
:title: Add a cell that imports the module, without running it
:path: {{ notebook }}
:tags: [import-module]
:run: false
import spending
```

Run the cell: click inside it, hold `Shift` and press `Enter`. The
error message ends like this:

```
File .../spending.py:3
      1 """The spending tracker: purchases, a ledger that holds them, and a file reader."""
----> 3 @dataclass
      4 class Purchase:
      5     date: str
      6     description: str

NameError: name 'dataclass' is not defined
```

The three dots stand for the place of the directory of this workshop,
which is different on each computer. The number of the line can also be
different, if the class begins on another line of your file.

Read the message from the last line, as always. The type of the error
is `NameError`, and the name that Python does not know is `dataclass`.

Now look at the lines above it. One thing is new here. The message
names a file, `spending.py`, and the arrow `---->` points at a line
of that file, not at a line of your cell. The mistake is in the file.

## Why this happens

A module is separate from the code that imports it. It cannot see the
names of the notebook. This is on purpose: a module must work in the
same way for every notebook and every program that imports it, and
those do not all have the same names.

So every module has `import` lines of its own, for everything that
its code uses. Programmers put them at the top of the file, under the
docstring. Python reads a file from the top, so an `import` line must
come before the first line that uses the name.

## Your task

Give the module its `import` lines.

1. Copy the three lines of the first cell of the notebook, the cell
   that begins with `import csv`.

2. Paste them into the file `spending.py`, on a line of their own
   between the docstring and the line `@dataclass`. To make an empty
   line there, click at the end of the docstring line and press
   `Enter`.

3. Save the file.

4. Run the cell that holds `import spending` again.

The class `Purchase` does not use the module `csv`. Copy that line
too: the function `read_ledger` uses it, and you move that function
into the file later.

When your file is correct, the cell shows nothing. An `import` that
works has no output.

You may ask why it helps to run the same cell again. The first import
stopped with an error, so Python did not keep the module. When the
cell runs again, Python reads the file again.

````{hint}
:title: Hint: what the file must look like
The file begins with the docstring. Under it are the three `import`
lines. Under them is the class.

```python
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

import csv
from dataclasses import dataclass
from decimal import Decimal


@dataclass
class Purchase:
```

Empty lines between the parts make the file easier to read. Python
ignores them.
````

```{hint}
:title: Hint: the cell still shows the NameError
The cell imports the file on the disk. Look at the tab of the file.
If it shows a dot in place of the cross, save the file: click in the
editor, hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and press `S`.
Then run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have saved the file, or after you have clicked `Check`.

```{attempt}
:id: imports-not-added
:check: module-imports
:expect: The file uses a name that it does not import
```

````{attempt}
:id: imports-below-class
:check: module-imports
:expect: NameError: name 'dataclass' is not defined

```{file-write}
:path: spending.py
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

@dataclass
class Purchase:
    date: str
    description: str
    amount: Decimal
    category: str

    def month(self):
        return self.date[:7]

import csv
from dataclasses import dataclass
from decimal import Decimal
```
````

````{attempt}
:id: imports-cut-short
:check: module-imports
:expect: Python cannot read the file spending.py

```{file-write}
:path: spending.py
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

import csv
from dataclasses import
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
:id: imports-only
:check: module-imports
:expect: has no class with the name Purchase

```{file-write}
:path: spending.py
"""The spending tracker: purchases, a ledger that holds them, and a file reader."""

import csv
from dataclasses import dataclass
from decimal import Decimal
```
````

````{hint}
:title: Show me a solution
:unlock: "module-imports" in failed_checks or "module-imports" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes the file `spending.py` with the three `import`
lines above the class, and saves it. It replaces what your file holds
now. After it, run the cell that holds `import spending` again.

```{file-write}
:id: imports-solution
:title: Write the file spending.py with its import lines
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
```
````

```{verify}
:id: module-imports
:label: Python can import the module spending
:trigger: file-saved spending.py; after:imports-solution
import os, subprocess, sys
from pathlib import Path

assert Path("spending.py").exists(), "There is no file spending.py in the directory of this workshop. Go back to the page Why a file, and click the action that creates the file."
program = '''
import sys, traceback
from decimal import Decimal
try:
    import spending
except BaseException as error:
    print("CHECK error", type(error).__name__, traceback.format_exception_only(error)[-1].strip())
    sys.exit()
cls = getattr(spending, "Purchase", None)
if not isinstance(cls, type):
    print("CHECK missing")
    sys.exit()
try:
    month = cls("2026-01-17", "Winter coat", Decimal("74.90"), "clothes").month()
except BaseException as error:
    print("CHECK broken", type(error).__name__)
    sys.exit()
print("CHECK ok" if month == "2026-01" else "CHECK broken")
'''
try:
    run = subprocess.run([sys.executable, "-c", program], capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL, env={**os.environ, "PYTHON_COLORS": "0"})
except subprocess.TimeoutExpired:
    raise AssertionError("The import of the module spending did not end after 10 seconds. The file must hold only the docstring, the import lines and the class Purchase. Remove any other code, and save the file.") from None
found = [line for line in run.stdout.splitlines() if line.startswith("CHECK ")]
result = found[-1].split(" ", 3) if found else ["CHECK", "error", "Error", "Python stopped before the check could import the module."]
if result[1] == "error" and result[2] == "NameError":
    raise AssertionError(f"The check ran import spending in a new Python, and Python stopped. The file uses a name that it does not import. A module cannot see the names of the notebook, so it needs import lines of its own. Copy the three import lines of the first cell into the file, above the line @dataclass, and save the file. The last line of the error is: {result[3]}")
if result[1] == "error":
    raise AssertionError(f"Python cannot read the file spending.py. Compare the top of your file with the first hint on this page, correct the line, and save the file. The last line of the error is: {result[3]}")
assert result[1] != "missing", "Python can import the module, but the module has no class with the name Purchase. Go back one page and copy the class into the file again, under the import lines. Then save the file."
assert result[1] != "broken", "Python can import the module, but the check cannot make a purchase from its class Purchase and ask for its month. Open the solution above this check, and compare it with your file."
print("Correct. The check ran import spending in a new Python, with no notebook, and the import worked. The module has the import lines that it needs.")
```

The check above imports your file in a new Python of its own, so it
tells you about the file. The next check looks at your notebook. Run
the cell that holds `import spending` again, or click the action
below, which runs it for you.

```{attempt}
:id: module-not-imported
:check: module-imported
:expect: The notebook has not imported the module yet
```

```{cell-run}
:id: run-import-module
:title: Run the cell that holds import spending for me
:path: {{ notebook }}
:cell: import-module
```

```{verify}
:id: module-imported
:label: Your notebook has imported the module spending
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed import-module
def _workshop_check():
    import sys
    module = sys.modules.get("spending")
    if module is None or "spending" not in globals():
        print("The notebook has not imported the module yet. First make the check above this one pass. Then click inside the cell that holds import spending, hold Shift and press Enter.")
        return False
    print("Correct. The notebook imported your module. The cell showed nothing, because an import that works has no output.")
    return True
globals().pop("_workshop_check")()
```

Your notebook now has a module of your own. It holds one class. The
next page uses it.
