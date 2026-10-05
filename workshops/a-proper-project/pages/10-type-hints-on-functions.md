---
title: Type hints on functions
requires: [verify:hints-written]
---

# Type hints on functions

The third tool needs something from you first: type hints. On this
page you write them.

## What a type hint is

A **type hint** says what type a value should be. You met type hints
in the workshop **Objects that explain themselves**: the class
`Purchase` is a dataclass, and its fields are written with them.

```python
    date: str
    amount: Decimal
```

`amount: Decimal` says that the amount should be a `Decimal`. Python
itself does not check it. It runs the code in the same way with or
without the hint.

A function can have type hints too. A hint after a parameter says
what the function expects to get. A hint after `->`, before the colon
at the end of the `def` line, says what the function returns:

```python
def read_ledger(filename: str) -> Ledger:
```

This line says: the parameter `filename` should be a string, and the
function returns a `Ledger`.

## Why write them

A type hint is documentation. A person who reads the `def` line knows
what to give the function and what it returns, without reading the
body. And unlike a comment, a type hint is written in a form that a
program can read. On the next page, a program reads the hints and
checks the code against them.

## Your task: write three type hints

Add type hints to these three `def` lines. Change only the `def`
lines.

| File | Now | With the type hints |
|------|-----|---------------------|
| `src/spending/models.py` | `def month(self):` | `def month(self) -> str:` |
| `src/spending/models.py` | `def total(self):` | `def total(self) -> Decimal:` |
| `src/spending/storage.py` | `def read_ledger(filename):` | `def read_ledger(filename: str) -> Ledger:` |

`month` returns the first seven characters of the date, which is a
string. `total` returns the sum of the amounts, which is a `Decimal`.
The parameter `self` needs no hint: it is always the object that the
method was called on.

The names `Decimal` and `Ledger` must be known in the file. Both are:
`models.py` imports `Decimal` at its top, and `storage.py` imports
`Ledger`.

The actions below open the two files in the editor.

```{file-open}
:id: open-models
:title: Open src/spending/models.py
:path: src/spending/models.py
```

```{file-open}
:id: open-storage-again
:title: Open src/spending/storage.py
:path: src/spending/storage.py
```

Change the lines, and save each file: hold `Ctrl` and press `S`, or
`Cmd` and `S` on a Mac.

```{hint}
:title: Hint: where the arrow goes
The arrow `->` goes after the closing parenthesis, and the colon stays
at the very end of the line: `def month(self) -> str:`. The arrow is
two characters, a minus sign and the sign `>`.
```

```{hint}
:title: Hint: the hint of the parameter
The hint of a parameter goes directly after its name, with a colon
between them: `filename: str`. It is inside the parentheses.
```

```{attempt}
:id: hints-none
:check: hints-written
:expect: The method month has no type hint for the value that it returns yet
```

````{attempt}
:id: hints-two
:check: hints-written
:expect: The function read_ledger has no type hint for the parameter filename yet

```{editor-replace}
:path: src/spending/models.py
:match: def month(self):
def month(self) -> str:
```

```{editor-replace}
:path: src/spending/models.py
:match: def total(self):
def total(self) -> Decimal:
```
````

````{attempt}
:id: hints-wrong-type
:check: hints-written
:expect: The type hint for the parameter filename of read_ledger is int, and it must be str

```{editor-replace}
:path: src/spending/storage.py
:match: def read_ledger(filename):
def read_ledger(filename: int) -> Ledger:
```
````

````{attempt}
:id: hints-no-colon
:check: hints-written
:expect: Python cannot read your code

```{editor-replace}
:path: src/spending/storage.py
:match: def read_ledger(filename: int) -> Ledger:
def read_ledger(filename: str) -> Ledger
```
````

````{hint}
:title: Show me a solution
:unlock: "hints-written" in failed_checks or "hints-written" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The actions below write the two files with the three type hints in
them, and open them. Compare them with your own files.

```{file-write}
:id: hints-solution-models
:title: Write src/spending/models.py with the type hints
:path: src/spending/models.py
:from: answers/models.py
:open: true
```

```{file-write}
:id: hints-solution-storage
:title: Write src/spending/storage.py with the type hint
:path: src/spending/storage.py
:from: answers/storage.py
:open: true
```
````

```{verify}
:id: hints-written
:label: month, total and read_ledger have type hints
:trigger: file-saved src/spending/models.py; file-saved src/spending/storage.py; after:hints-solution-storage
import json, os, subprocess

code = "\n".join([
    "import annotationlib, json",
    "from spending.models import Ledger, Purchase",
    "from spending.storage import read_ledger",
    "found = {}",
    "for name, function in [('month', Purchase.month), ('total', Ledger.total), ('read_ledger', read_ledger)]:",
    "    found[name] = annotationlib.get_annotations(function, format=annotationlib.Format.STRING)",
    "print(json.dumps(found))",
])
run = subprocess.run(
    [".venv/bin/python", "-c", code],
    capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
    env={**os.environ, "PYTHON_COLORS": "0"},
)
if run.returncode != 0:
    last = (run.stderr.strip().splitlines() or ["(nothing)"])[-1]
    raise AssertionError(f"Python cannot read your code. The last line of the error is: {last}. Look at the def lines that you changed: each one must end with a colon. Then save the file.")
found = json.loads(run.stdout)
wanted = [
    ("method", "month", "return", "the value that it returns", "str"),
    ("method", "total", "return", "the value that it returns", "Decimal"),
    ("function", "read_ledger", "filename", "the parameter filename", "str"),
    ("function", "read_ledger", "return", "the value that it returns", "Ledger"),
]
for kind, name, key, what, expected in wanted:
    hint = found[name].get(key)
    if hint is None:
        raise AssertionError(f"The {kind} {name} has no type hint for {what} yet. Look at the table on the page, change the def line, and save the file.")
    if hint.replace(" ", "").split(".")[-1] != expected:
        raise AssertionError(f"The type hint for {what} of {name} is {hint}, and it must be {expected}. Change the def line, and save the file.")
print("The method month returns str, the method total returns Decimal, and the function read_ledger takes a str and returns a Ledger.")
```

## What happened

The program does the same as before. Type
`spending spending.csv` in the terminal, and the report is the same.
The hints are for people and for tools. Python does not use them when
it runs the code.
