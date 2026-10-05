---
title: A ledger with no purchases
requires: [verify:report-complete]
---

# A ledger with no purchases

The report needs one more line, for the largest purchase. This line
causes a problem, and the problem is the idea of this page: a
function must also work when its data is empty.

## Why an empty ledger matters

The file of Mariam has 37 purchases, so your program always has data.
But think about a person who starts a new file today, with no
purchases in it yet. And in the next workshop, your program learns to
report on one month only. A month can have no purchases at all. In
both cases, `report_lines` gets a ledger whose list of purchases is
empty.

You can compare this with a form at an office. A good form also works
for a person who has nothing to write in one of its parts. A bad form
cannot be completed by that person.

Most of your function already works for an empty ledger. A loop over
an empty dictionary runs zero times, and the total of no amounts is
`0`. The new line is different. It uses the method
`ledger.largest()`, and the first line of that method is:

```python
result = self.purchases[0]
```

An empty list has no item at index `0`. So for an empty ledger, Python
stops at this line with an `IndexError`.

## A test for an empty list

The function can test for the empty list before it uses the list. You
know one way to write the test: `if len(ledger.purchases) == 0:`.

Python programmers often write the same test in a shorter way:

```python
if not ledger.purchases:
    return lines
```

This works because of a rule that is new to you. In an `if` line, an
empty list counts as `False`, and a list with one item or more counts
as `True`. So `not ledger.purchases` is `True` when the list is empty.
You can use either of the two ways. Both do the same thing.

The line `return lines` under the test ends the function at once. The
lines of the function after it do not run. A function can have more
than one `return` line, and the first one that Python reaches ends the
function.

## Your task

Change the function `report_lines` in two places.

**First**, add the largest purchase to the end of the report, before
the last line `return lines`. The report gets one more empty line, and
then this line:

```
Largest purchase: 2026-01-01 Rent for January 650.00
```

The method `ledger.largest()` returns the `Purchase` with the largest
amount. Give that object a name, `largest`. The line of the report
holds its attributes `date` and `description`, and its attribute
`amount` with two digits after the point, with one space between them.

**Second**, make the function work for a ledger with no purchases. For
such a ledger, the function returns a list with one line only:
`"Purchases: 0"`. So the test for an empty list goes straight after
the line that makes the list `lines`, and before the line that adds
the total.

Then save the file, and run the script: type `python spending.py` in
the terminal, and press `Enter`. The terminal shows the report as on
the page before, and then these two lines, of which the first is
empty:

```

Largest purchase: 2026-01-01 Rent for January 650.00
```

Your own run uses the file of Mariam, so it does not show you if the
second change is correct. The check below tells you: it calls your
function with a ledger that holds no purchases.

```{hint}
:title: "Hint: the line for the largest purchase"
You need three lines of code before the last `return lines`:

1. `lines.append("")` adds the empty line.

2. `largest = ledger.largest()` gives the object a name.

3. One line adds the string. The f-string begins with
   `f"Largest purchase: {largest.date} ` and it continues with
   `{largest.description}` and `{largest.amount:.2f}`.
```

```{hint}
:title: "Hint: the ledger with no purchases"
The first line of the function makes the list:

`lines = [f"Purchases: {len(ledger.purchases)}"]`

Put the two lines of the test directly under it:

`if not ledger.purchases:` and, under it with eight spaces,
`return lines`.

For an empty ledger, the list holds only `"Purchases: 0"` at that
moment, and the function returns it.
```

If the hints were not enough, the box below holds a solution. It opens
after the check below has run one time.

```{attempt}
:id: complete-not-started
:check: report-complete
:expect: Your list has 10 lines and the correct list has 12 lines
```

````{attempt}
:id: complete-no-function
:check: report-complete
:expect: The file has no function with the name report_lines

```{file-write}
:path: spending.py
:from: answers/04-solution.py
```
````

````{attempt}
:id: complete-no-date
:check: report-complete
:expect: Your line is "Largest purchase: Train ticket 12.00"

```{file-write}
:path: spending.py
:from: answers/07-no-date.py
```
````

````{attempt}
:id: complete-not-empty-safe
:check: report-complete
:expect: The method largest() cannot work when the list of purchases is empty

```{file-write}
:path: spending.py
:from: answers/07-not-empty-safe.py
```
````

````{attempt}
:id: complete-empty-total
:check: report-complete
:expect: The function gave back a list with 2 lines

```{file-write}
:path: spending.py
:from: answers/07-empty-total.py
```
````

````{attempt}
:id: complete-attribute-error
:check: report-complete
:expect: AttributeError

```{file-write}
:path: spending.py
:from: answers/07-name-error.py
```
````

````{attempt}
:id: complete-prints
:check: report-complete
:expect: The function gave back None

```{file-write}
:path: spending.py
:from: answers/07-prints.py
```
````

````{attempt}
:id: complete-index-error
:check: report-complete
:expect: it must work for a ledger of every size

```{file-write}
:path: spending.py
:from: answers/07-index-error.py
```
````

````{attempt}
:id: complete-old-main
:check: report-complete
:expect: does not show them

```{file-write}
:path: spending.py
:from: answers/07-old-main.py
```
````

````{attempt}
:id: complete-len-test
:check: report-complete
:result: pass

```{file-write}
:path: spending.py
:from: answers/07-len-test.py
```
````

````{hint}
:title: Show me a solution
:unlock: "report-complete" in failed_checks or "report-complete" in passed_checks
:locked: Try the task first. This opens after the check below has run.
A working answer has this function `report_lines`:

```python
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

The first action below replaces your file `spending.py` with a file
that holds a working answer. What you typed in the file is lost, so
compare your lines with the lines above first. The second action runs
the script.

```{file-write}
:id: complete-solution
:title: Replace my spending.py with a working answer
:path: spending.py
:from: answers/07-solution.py
:open: true
```

```{execute}
:id: complete-solution-run
:title: Run the script
:wait: prompt
python spending.py
```
````

```{verify}
:id: report-complete
:label: The report is complete, and works for a ledger with no purchases
:trigger: terminal-output "Largest purchase:"; file-saved spending.py; after:complete-solution-run
import json, os, shutil, subprocess, sys
from pathlib import Path

def run_python(arguments, where="."):
    try:
        run = subprocess.run([sys.executable, *arguments], cwd=where, capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL, env={**os.environ, "PYTHON_COLORS": "0", "PYTHONDONTWRITEBYTECODE": "1"})
    except subprocess.TimeoutExpired:
        raise AssertionError("Your program did not end after 5 seconds, so the check stopped it. Look for a loop that never ends. Correct the file spending.py, and save it.") from None
    if run.returncode != 0:
        errors = run.stderr.strip().splitlines()
        last = errors[-1] if errors else "(Python gave no message)"
        raise AssertionError(f"Python stopped with an error when the check ran your file spending.py. Type python spending.py in the terminal to see the whole error message. Correct the file, and save it. The last line of the error is: {last}") from None
    return run

def count(lines):
    return "1 line" if len(lines) == 1 else f"{len(lines)} lines"

def show(lines, index):
    if index >= len(lines):
        return "missing"
    return "an empty line" if lines[index] == "" else '"' + lines[index] + '"'

def difference(got, want):
    index = 0
    while index < len(got) and index < len(want) and got[index] == want[index]:
        index = index + 1
    return f"Your list has {count(got)} and the correct list has {count(want)}. The first difference is at line {index + 1}. Your line is {show(got, index)} and the correct line is {show(want, index)}."

PROBE = '''
import contextlib, io, json
from decimal import Decimal
with contextlib.redirect_stdout(io.StringIO()):
    import spending
function = getattr(spending, "report_lines", None)
def try_rows(rows):
    shown = io.StringIO()
    try:
        ledger = spending.Ledger()
        for row in rows:
            ledger.add(spending.Purchase(row[0], row[1], Decimal(row[2]), row[3]))
        with contextlib.redirect_stdout(shown):
            value = function(ledger)
    except Exception as error:
        return dict(error=type(error).__name__)
    if isinstance(value, list) and all(isinstance(item, str) for item in value):
        return dict(lines=value)
    return dict(type=type(value).__name__, printed=bool(shown.getvalue().strip()))
found = dict(function=callable(function))
if callable(function):
    found["small"] = try_rows([("2026-04-02", "Tea", "3.50", "food"), ("2026-04-09", "Train ticket", "12.00", "transport"), ("2026-05-01", "Soup", "4.25", "food")])
    found["empty"] = try_rows([])
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            found["file"] = function(spending.read_ledger("spending.csv"))
    except Exception:
        found["file"] = None
print(json.dumps(found, default=str))
'''

shown = run_python(["spending.py"]).stdout
found = json.loads(run_python(["-c", PROBE]).stdout)
assert found["function"], "The file has no function with the name report_lines. It begins with def report_lines(ledger): and it is above the function main. If you do not have it, open the solution of this page, which puts the whole file in place. After you change the file, save it, and run the script again."
small = found["small"]
empty = found["empty"]
made = "The check made a ledger with 3 purchases: Tea 3.50 on 2026-04-02, Train ticket 12.00 on 2026-04-09 and Soup 4.25 on 2026-05-01. Then it called report_lines with that ledger."
if "error" in small:
    raise AssertionError(f"{made} The function stopped with {small['error']}. The function must use only its parameter ledger, and it must work for a ledger of every size. After you change the file, save it, and run the script again.")
if "lines" not in small:
    kind = "None" if small["type"] == "NoneType" else f"a value of the type {small['type']}"
    raise AssertionError(f"{made} The function gave back {kind}. It must give back a list of strings. Add each new line to the list with lines.append(...), and keep return lines as the last line of the function. After you change the file, save it, and run the script again.")
want = ["Purchases: 3", "Total: 19.75", "", "Total for each category:", "  food: 7.75", "  transport: 12.00", "", "Total for each month:", "  2026-04: 15.50", "  2026-05: 4.25", "", "Largest purchase: 2026-04-09 Train ticket 12.00"]
if small["lines"] != want:
    raise AssertionError(f"{made} {difference(small['lines'], want)} After you change the file, save it, and run the script again.")
nothing = "The lines for a ledger with purchases are correct. Then the check made a ledger with no purchases, and called report_lines with it."
if "error" in empty:
    raise AssertionError(f"{nothing} The function stopped with {empty['error']}. The method largest() cannot work when the list of purchases is empty. Straight after the first line of the report, test for an empty list, and return the list of lines at once. After you change the file, save it, and run the script again.")
if empty.get("lines") != ["Purchases: 0"]:
    got = f"a list with {count(empty['lines'])}" if "lines" in empty else "a value that is not a list of strings"
    first = f", and the first line is {show(empty['lines'], 0)}" if empty.get("lines") else ""
    raise AssertionError(f"{nothing} The function gave back {got}{first}. It must give back a list with 1 line only, which is \"Purchases: 0\". Put the test for an empty list straight after the line that makes the list, before the line with the total. After you change the file, save it, and run the script again.")
lines = shown.rstrip("\n").split("\n") if shown.strip() else []
if lines != found["file"]:
    first = f"{count(lines)}, and the first line is {show(lines, 0)}" if lines else "nothing"
    raise AssertionError(f"The function report_lines gives the correct lines. But the command python spending.py does not show them: it showed {first}. The function main must call report_lines(ledger) and show each line of the list with print(). After you change the file, save it, and run the script again.")
print("Correct. The report is complete, and report_lines also works for a ledger with no purchases. The last line is:", lines[-1])
```

The report is complete. The function `report_lines` now gives a
correct answer for every ledger, also for one that holds nothing.
