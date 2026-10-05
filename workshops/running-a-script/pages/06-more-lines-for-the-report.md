---
title: More lines for the report
requires: [verify:report-sections]
---

# More lines for the report

The plan of the page before now helps you. To make the report longer,
you change only the function `report_lines`. The function `main` stays
as it is, because it prints every line of the list, however many lines
the list has.

On this page you add two parts to the report: the total for each
category, and the total for each month. This page has no new idea. It
uses what you know about dictionaries and loops.

## What the class `Ledger` gives you

The class `Ledger` already has a method for each part:

- `ledger.total_by_category()` returns a dictionary. Each key is a
  category, such as `"food"`, and its value is the total of the
  amounts in that category.

- `ledger.total_by_month()` returns a dictionary. Each key is a month,
  such as `"2026-01"`, and its value is the total of the amounts in
  that month.

To use every pair of a dictionary in a loop, you use its method
`.items()`. It gives each
key together with its value, and a `for` loop can give a name to each
of the two:

```python
for category, amount in ledger.total_by_category().items():
```

In the block under this line, `category` is the key and `amount` is
its value.

## Your task

When your code is correct, the command `python spending.py` shows
this:

```
Purchases: 37
Total: 2834.79

Total for each category:
  rent: 1950.00
  food: 445.60
  transport: 181.30
  phone: 54.00
  hobbies: 63.49
  clothes: 140.40

Total for each month:
  2026-01: 917.20
  2026-02: 942.34
  2026-03: 975.25
```

The first two lines exist already. In the function `report_lines`, add
the other lines to the list, between the line that adds the total and
the line `return lines`:

- An empty line of the report is an empty string in the list:
  `lines.append("")`. The report has one empty line before each of the
  two new parts.

- The line `Total for each category:` and the line
  `Total for each month:` are strings with no value in them.

- A line for one category begins with two spaces. Then come the
  category, a colon, one space, and the amount with two digits after
  the point. As an f-string: `f"  {category}: {amount:.2f}"`. A line
  for one month has the same form.

- The categories and the months come in the order in which the
  dictionary holds them. Do not sort them.

Then save the file, and run the script: type `python spending.py` in
the terminal, and press `Enter`.

```{hint}
:title: "Hint: the lines for the categories"
The part for the categories needs four lines of code:

1. `lines.append("")` adds the empty line.

2. `lines.append("Total for each category:")` adds the line of text.

3. The `for` line from this page begins the loop over the
   dictionary.

4. Under the `for` line, with eight spaces before it, one line adds
   the string for one category:
   `lines.append(f"  {category}: {amount:.2f}")`.
```

```{hint}
:title: "Hint: the lines for the months"
The part for the months is the same four lines, with three changes.
The text is `"Total for each month:"`. The loop is over
`ledger.total_by_month().items()`. A good name for the key is
`month`, so the `for` line is
`for month, amount in ledger.total_by_month().items():` and the
f-string is `f"  {month}: {amount:.2f}"`.

After the loop, the line `return lines` begins with four spaces, so
that it is not inside the loop.
```

If the hints were not enough, the box below holds a solution. It opens
after the check below has run one time.

```{attempt}
:id: sections-not-started
:check: report-sections
:expect: Your list has 2 lines and the correct list has 10 lines
```

````{attempt}
:id: sections-no-function
:check: report-sections
:expect: The file has no function with the name report_lines

```{file-write}
:path: spending.py
:from: answers/04-solution.py
```
````

````{attempt}
:id: sections-no-spaces
:check: report-sections
:expect: Only the spaces at the start of a line differ

```{file-write}
:path: spending.py
:from: answers/06-no-spaces.py
```
````

````{attempt}
:id: sections-no-empty-line
:check: report-sections
:expect: Your line is "Total for each category:" and the correct line is an empty line

```{file-write}
:path: spending.py
:from: answers/06-no-empty-line.py
```
````

````{attempt}
:id: sections-attribute-error
:check: report-sections
:expect: AttributeError

```{file-write}
:path: spending.py
:from: answers/06-name-error.py
```
````

````{attempt}
:id: sections-prints
:check: report-sections
:expect: The function gave back None

```{file-write}
:path: spending.py
:from: answers/06-prints.py
```
````

````{attempt}
:id: sections-index-error
:check: report-sections
:expect: The function stopped with IndexError

```{file-write}
:path: spending.py
:from: answers/06-index-error.py
```
````

````{attempt}
:id: sections-old-main
:check: report-sections
:expect: does not show them

```{file-write}
:path: spending.py
:from: answers/06-old-main.py
```
````

````{hint}
:title: Show me a solution
:unlock: "report-sections" in failed_checks or "report-sections" in passed_checks
:locked: Try the task first. This opens after the check below has run.
A working answer has this function `report_lines`:

```python
def report_lines(ledger):
    lines = [f"Purchases: {len(ledger.purchases)}"]
    lines.append(f"Total: {ledger.total():.2f}")
    lines.append("")
    lines.append("Total for each category:")
    for category, amount in ledger.total_by_category().items():
        lines.append(f"  {category}: {amount:.2f}")
    lines.append("")
    lines.append("Total for each month:")
    for month, amount in ledger.total_by_month().items():
        lines.append(f"  {month}: {amount:.2f}")
    return lines
```

The first action below replaces your file `spending.py` with a file
that holds a working answer. What you typed in the file is lost, so
compare your lines with the lines above first. The second action runs
the script.

```{file-write}
:id: sections-solution
:title: Replace my spending.py with a working answer
:path: spending.py
:from: answers/06-solution.py
:open: true
```

```{execute}
:id: sections-solution-run
:title: Run the script
:wait: prompt
python spending.py
```
````

```{verify}
:id: report-sections
:label: The report has a total for each category and for each month
:trigger: terminal-output "2026-03:"; file-saved spending.py; after:sections-solution-run
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
made = "The check made a ledger with 3 purchases: Tea 3.50 food, Train ticket 12.00 transport and Soup 4.25 food. The first two are in 2026-04 and the last is in 2026-05. Then it called report_lines with that ledger."
if "error" in small:
    raise AssertionError(f"{made} The function stopped with {small['error']}. The function must use only its parameter ledger, and it must work for a ledger of every size. After you change the file, save it, and run the script again.")
if "lines" not in small:
    kind = "None" if small["type"] == "NoneType" else f"a value of the type {small['type']}"
    raise AssertionError(f"{made} The function gave back {kind}. It must give back a list of strings. Add each new line to the list with lines.append(...), and keep return lines as the last line of the function. After you change the file, save it, and run the script again.")
want = ["Purchases: 3", "Total: 19.75", "", "Total for each category:", "  food: 7.75", "  transport: 12.00", "", "Total for each month:", "  2026-04: 15.50", "  2026-05: 4.25"]
if small["lines"] != want:
    spaces = [line.strip() for line in small["lines"]] == [line.strip() for line in want]
    advice = " Only the spaces at the start of a line differ. A line for one category or one month begins with two spaces." if spaces else ""
    raise AssertionError(f"{made} {difference(small['lines'], want)}{advice} After you change the file, save it, and run the script again.")
lines = shown.rstrip("\n").split("\n") if shown.strip() else []
if lines != found["file"]:
    first = f"{count(lines)}, and the first line is {show(lines, 0)}" if lines else "nothing"
    raise AssertionError(f"The function report_lines gives the correct lines. But the command python spending.py does not show them: it showed {first}. The function main must call report_lines(ledger) and show each line of the list with print(). After you change the file, save it, and run the script again.")
print(f"Correct. The report now has {count(lines)}, with a total for each category and for each month.")
```

You made the report three times as long, and you did not change one
line of `main`. Each of the two functions has one job, so a change to
one job is a change to one function.
