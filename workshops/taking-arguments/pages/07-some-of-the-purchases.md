---
title: Some of the purchases
requires: [verify:try-made, verify:select-works]
---

# Some of the purchases

Mariam wants a report on one month, or on one category. The function
`report_lines()` already makes a report from a ledger. A **ledger**
is an object of the class `Ledger`, and it holds a list of purchases
in its attribute `purchases`. So the program needs one new thing: a
way to get a second ledger that holds only some of the purchases.
Then the report code does not change at all.

On this page you write that as a method of the class `Ledger`, with
the name `select`. A **method** is a function that belongs to a
value. You write it with `def` inside the class, and its first
parameter is `self`, the name for the object that the method was
called on.

## Two ideas that the method needs

The method has two more parameters, `month` and `category`. A call
may give one of them, or both, or none. Two ideas from earlier
workshops make this possible.

A parameter can have a **default value**: the value that it gets
when the call gives no argument for it. Here the default value of
both is `None`, the value that says "there is no value here":

```python
    def select(self, month=None, category=None):
```

Inside the method, `month is None` is `True` when the call did not
give a month. Then every purchase fits, whatever its month. When the
call did give a month, a purchase fits only if its own month is the
same. One line says both with `or`:

```python
month_fits = month is None or purchase.month() == month
```

The name `month_fits` then refers to `True` or to `False`. The
method `month()` of a purchase returns the year and the month of its
date, such as `"2026-02"`.

## Your task

Write the method `select` in the class `Ledger`, in the file
`spending.py`.

- Its parameters are `self`, `month` and `category`. The default
  value of `month` and of `category` is `None`.

- It returns a new `Ledger`. The new ledger holds each purchase of
  this ledger that fits the month and also fits the category.

- A purchase fits the month when `month` is `None`, or when
  `purchase.month()` is equal to `month`.

- A purchase fits the category when `category` is `None`, or when
  `purchase.category` is equal to `category`.

- It does not change the ledger that it was called on.

For a ledger with the 37 purchases of `spending.csv`, these are the
results:

| The call | How many purchases the new ledger holds |
|------|------|
| `ledger.select()` | 37 |
| `ledger.select(month="2026-02")` | 12 |
| `ledger.select(category="food")` | 17 |
| `ledger.select(month="2026-02", category="food")` | 6 |

Write the method under the method `largest`, which is the last
method of the class. The action below marks that method in the
editor. Leave one empty line between the two methods. The `def` line
begins with four spaces, because the method is inside the class.

```{file-open}
:id: show-program-again
:title: Show the file spending.py
:path: spending.py
```

```{editor-highlight}
:id: show-largest
:title: Mark the method largest in spending.py
:path: spending.py
:match: def largest(self):
:duration: 5s
```

## A script to try your method

The program does not call your method yet. That is the work of the
next page. To try the method now, use a second small script, which
imports your file. The line `from spending import read_ledger` gets
the function `read_ledger()` from your file `spending.py`, because a
file of Python code is a module that other code can import.

```{attempt}
:id: try-not-made
:check: try-made
:expect: The file try_select.py does not exist yet
```

```{file-write}
:id: write-try
:title: Make the file try_select.py
:path: try_select.py
from spending import read_ledger

ledger = read_ledger("spending.csv")
print(len(ledger.select().purchases))
print(len(ledger.select(month="2026-02").purchases))
print(len(ledger.select(category="food").purchases))
print(len(ledger.select(month="2026-02", category="food").purchases))
```

```{verify}
:id: try-made
:label: The file try_select.py exists
:substrate: contents
:trigger: after:write-try
:message: The file try_select.py does not exist yet. Click the action above to make it.
exists try_select.py
```

Each line with `print()` calls your method, and shows how many
purchases the new ledger holds. When you have written the method,
save `spending.py`: hold `Ctrl` and press `S`, or on a Mac hold
`Cmd` and press `S`. Then click in the terminal, type this command,
and press `Enter`:

```
python try_select.py
```

When your method works, the terminal shows:

```
37
12
17
6
```

```{hint}
:title: Hint: how to begin
The method has the same parts as the method `total_by_category`,
which is in the same class: a first line that makes an empty result,
a `for` loop over `self.purchases`, and a `return` line at the end.

Here the empty result is a new ledger: `result = Ledger()`. To put a
purchase in it, call its method `add`: `result.add(purchase)`.
```

```{hint}
:title: Hint: the body of the loop
Inside the loop, test whether the purchase fits. Two lines give
two booleans:

`month_fits = month is None or purchase.month() == month`

`category_fits = category is None or purchase.category == category`

Then add the purchase to the result only if both are `True`:
`if month_fits and category_fits:`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the message first.

An `AttributeError` that says that the object has no attribute
`select` means that the class has no method with that name. Check
the spelling. Check that the `def` line begins with four spaces.
Check that you saved the file.

A `TypeError` that says that the method takes 1 positional argument
means that `month` or `category` is missing between the parentheses
of the `def` line.

An `IndentationError` means that the spaces are wrong. The `def`
line needs four spaces, and the lines of its body need eight spaces
or more.
```

If the hints were not enough, the box below holds a solution. It
opens after you have saved the file, or after you have clicked
`Check`.

```{attempt}
:id: select-not-started
:check: select-works
:expect: The class Ledger has no method with the name select yet
```

````{attempt}
:id: select-no-file
:check: select-works
:expect: There is no file spending.py in your work directory

```{file-delete}
:path: spending.py
```
````

````{attempt}
:id: select-program-stops
:check: select-works
:expect: The check ran python spending.py spending.csv, and the program stopped

```{file-write}
:path: spending.py
:from: answers/filename-no-import.py
```
````

````{attempt}
:id: select-import
:check: select-works
:expect: the import stopped with SystemExit

```{file-write}
:path: spending.py
:from: answers/select-import.py
```
````

````{attempt}
:id: select-outside
:check: select-works
:expect: but it is outside the class Ledger

```{file-write}
:path: spending.py
:from: answers/select-outside.py
```
````

````{attempt}
:id: select-no-defaults
:check: select-works
:expect: The check cannot make the call ledger.select()

```{file-write}
:path: spending.py
:from: answers/select-no-defaults.py
```
````

````{attempt}
:id: select-error
:check: select-works
:expect: The call ledger.select() stopped with an error of the type AttributeError

```{file-write}
:path: spending.py
:from: answers/select-error.py
```
````

````{attempt}
:id: select-no-return
:check: select-works
:expect: A method with no return line gives None

```{file-write}
:path: spending.py
:from: answers/select-no-return.py
```
````

````{attempt}
:id: select-same
:check: select-works
:expect: gives back the same ledger that it was called on

```{file-write}
:path: spending.py
:from: answers/select-same.py
```
````

````{attempt}
:id: select-list
:check: select-works
:expect: gives a value of the type list and it must give a Ledger

```{file-write}
:path: spending.py
:from: answers/select-list.py
```
````

````{attempt}
:id: select-no-none
:check: select-works
:expect: The call ledger.select() gives a ledger of 0 purchases and it must give a ledger of 6 purchases

```{file-write}
:path: spending.py
:from: answers/select-no-none.py
```
````

````{attempt}
:id: select-month-only
:check: select-works
:expect: The call ledger.select(category="food") gives a ledger of 6 purchases and it must give a ledger of 4 purchases

```{file-write}
:path: spending.py
:from: answers/select-month-only.py
```
````

````{attempt}
:id: select-category-only
:check: select-works
:expect: The call ledger.select(month="2026-02") gives a ledger of 6 purchases and it must give a ledger of 3 purchases. Compare purchase.month() with month

```{file-write}
:path: spending.py
:from: answers/select-category-only.py
```
````

````{attempt}
:id: select-either
:check: select-works
:expect: The call ledger.select(month="2026-02", category="food") gives a ledger of 3 purchases and it must give a ledger of 2 purchases. When the call gives both values

```{file-write}
:path: spending.py
:from: answers/select-either.py
```
````

````{hint}
:title: Show me a solution
:unlock: "select-works" in failed_checks or "select-works" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes the whole file `spending.py` again,
with a working method `select`. It replaces what the file holds now.
The second action runs the script that tries the method. Compare the
method with your own.

The new method is:

```python
    def select(self, month=None, category=None):
        result = Ledger()
        for purchase in self.purchases:
            month_fits = month is None or purchase.month() == month
            category_fits = category is None or purchase.category == category
            if month_fits and category_fits:
                result.add(purchase)
        return result
```

```{file-write}
:id: select-solution
:title: Write a solution to spending.py
:path: spending.py
:from: answers/select-solution.py
:open: true
```

```{execute}
:id: select-run
:wait: prompt
python try_select.py
```
````

```{verify}
:id: select-works
:label: The method select gives a new ledger with the right purchases
:trigger: file-saved spending.py; after:select-run
import json, os, subprocess, sys
from pathlib import Path

assert Path("spending.py").exists(), "There is no file spending.py in your work directory. Open the box with the title Show me a solution on this page. Its first action writes the file again."

PROBE = r'''
import contextlib, inspect, io, json
from decimal import Decimal

def finish(stage, **more):
    print("RESULT " + json.dumps(dict(stage=stage, **more)))
    raise SystemExit(0)

try:
    with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
        import spending
except BaseException as error:
    finish("import", error=type(error).__name__)

Ledger = getattr(spending, "Ledger", None)
Purchase = getattr(spending, "Purchase", None)
if getattr(Ledger, "select", None) is None or Purchase is None:
    finish("missing", outside=callable(getattr(spending, "select", None)))

rows = [
    ("2026-01-03", "Bread and milk", "6.40", "food"),
    ("2026-01-05", "Bus ticket", "2.80", "transport"),
    ("2026-02-04", "Monthly bus pass", "42.00", "transport"),
    ("2026-02-11", "Bread and cheese", "8.75", "food"),
    ("2026-02-17", "Vegetables", "10.40", "food"),
    ("2026-03-12", "Bread and milk", "6.40", "food"),
]
calls = [
    ("", dict(), [0, 1, 2, 3, 4, 5]),
    ('month="2026-02"', dict(month="2026-02"), [2, 3, 4]),
    ('category="food"', dict(category="food"), [0, 3, 4, 5]),
    ('month="2026-02", category="food"', dict(month="2026-02", category="food"), [3, 4]),
    ('month="2026-01", category="transport"', dict(month="2026-01", category="transport"), [1]),
]
for text, values, expected in calls:
    call = "ledger.select(" + text + ")"
    ledger = Ledger()
    for row in rows:
        ledger.add(Purchase(row[0], row[1], Decimal(row[2]), row[3]))
    try:
        inspect.signature(ledger.select).bind(**values)
    except (TypeError, ValueError):
        finish("signature", call=call)
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            result = ledger.select(**values)
    except Exception as error:
        finish("error", call=call, error=type(error).__name__)
    if result is None:
        finish("none", call=call)
    if result is ledger:
        finish("same", call=call)
    if not isinstance(result, Ledger):
        finish("type", call=call, type=type(result).__name__)
    wanted = [rows[index][0] + " " + rows[index][1] for index in expected]
    got = [str(getattr(p, "date", "?")) + " " + str(getattr(p, "description", "?")) for p in result.purchases]
    if got != wanted:
        finish("wrong", call=call, got=len(got), wanted=len(wanted))
finish("pass")
'''

def run_python(words, what):
    try:
        return subprocess.run(
            [sys.executable, *words],
            capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The check {what} and it did not end after 5 seconds. Look for a loop that never ends.") from None

run = run_python(["spending.py", "spending.csv"], "ran python spending.py spending.csv")
last = (run.stderr.strip().splitlines() or ["no message"])[-1]
assert run.returncode == 0, f"The check ran python spending.py spending.csv, and the program stopped. Correct the file and save it. To see the whole message, run the same command in the terminal. The last line that the program showed is: {last}"

run = run_python(["-c", PROBE], "called your method select")
lines = [line for line in run.stdout.splitlines() if line.startswith("RESULT ")]
found = json.loads(lines[-1][7:]) if lines else dict(stage="import", error="an error")
stage = found["stage"]
call = found.get("call", "")
ledger_note = "The check made a ledger of 6 purchases of its own. Three of them are in the month 2026-02, and four of them have the category food."

assert stage != "import", f"The check imported your file with import spending, and the import stopped with {found.get('error')}. A file that is imported must not run the program. Check that the last two lines of the file are still the test of __name__ and the call main()."
if stage == "missing" and found["outside"]:
    raise AssertionError("Your file has a function with the name select, but it is outside the class Ledger. A method is inside its class. Begin the def line with four spaces, and put the method under the method largest.")
assert stage != "missing", "The class Ledger has no method with the name select yet. Write it in spending.py, under the method largest, and save the file."
assert stage != "signature", f"The check cannot make the call {call}. The def line must be def select(self, month=None, category=None): so that a call can leave out month, or category, or both."
assert stage != "error", f"The call {call} stopped with an error of the type {found.get('error')}. {ledger_note} To see the whole message, run python try_select.py in the terminal. Look for a name that is spelled wrongly, or for a method that the value does not have."
assert stage != "none", f"The call {call} gives None. A method with no return line gives None. Make a new ledger with Ledger(), add the purchases that fit to it, and return it."
assert stage != "same", f"The call {call} gives back the same ledger that it was called on. The method must not change that ledger. Make a new ledger with Ledger(), add the purchases that fit to it, and return the new ledger."
assert stage != "type", f"The call {call} gives a value of the type {found.get('type')} and it must give a Ledger. Make a new ledger with Ledger(), add each purchase that fits with its method add(), and return the new ledger."
if stage == "wrong":
    got, wanted = found["got"], found["wanted"]
    if call == "ledger.select()":
        advice = "When month is None, every month fits. When category is None, every category fits. Test for None with is None."
    elif "month" in call and "category" in call:
        advice = "When the call gives both values, a purchase must fit the month and also fit the category."
    elif "month" in call:
        advice = "Compare purchase.month() with month."
    else:
        advice = "Compare purchase.category with category."
    raise AssertionError(f"{ledger_note} The call {call} gives a ledger of {got} purchases and it must give a ledger of {wanted} purchases. {advice} Save the file after you change it.")
print("Correct. The check called your method five times on a ledger of its own, and each call gave a new ledger with the right purchases.")
```

## What you wrote

Your method does not print anything, and it does not know about
command lines. It takes two values and returns a ledger. For that
reason, every part of the program can use it: the script
`try_select.py` used it, the check used it, and on the next page
`main()` uses it.

The new ledger is an object of the same class, so it has every
method of a ledger: `total()`, `total_by_category()` and the others.
The function `report_lines()` works on it with no change.
