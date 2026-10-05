---
title: A function that returns the lines
requires: [verify:report-first]
---

# A function that returns the lines

Your program shows one line. A report on the spending of Mariam needs
more lines: the total, the total for each category, and more. You
could put a `print()` for each of them in `main`. This page shows a
better plan, and the reason for it.

## Make the lines in one place, show them in another

In the workshop **Your first function** you learned the difference
between `return` and `print()`. A function that calls `print()` shows
text to a person, and the code that called the function gets nothing.
A function that has a `return` line gives a value back to the code
that called it, and that code decides what to do with the value.

A report is text, and text can be used in more than one way. Today
you want to see it in the terminal. On another day you want to write
it to a file, or to check with other code that every line is correct.
If the function that makes the report also prints it, only the first
of these is possible.

So the program gets two functions, and each has one job:

- `report_lines(ledger)` makes the lines of the report. It returns
  them as a list of strings, with one string for each line. It prints
  nothing.

- `main()` gets the list, and prints each line.

You can compare this with a shop. One person writes the receipt, and
gives it to you. You decide what to do with it: you read it, you keep
it, or you give it to another person. A person who only reads the
prices to you, and writes nothing, is less useful.

## Your task

Change `spending.py` in two places.

**First**, write a new function `report_lines` between the function
`read_ledger` and the function `main`:

- It has one parameter, `ledger`, which is a `Ledger`.

- It returns a list of two strings. For the file of Mariam, the two
  strings are `"Purchases: 37"` and `"Total: 2834.79"`.

- The method `ledger.total()` returns the total of all the amounts.
  Show it with two digits after the point. In an f-string, you write
  `:.2f` after the value for this: `f"Total: {ledger.total():.2f}"`.

A function that builds a list of lines often has this form. It makes
a list with the name `lines`, it adds strings to the list with
`lines.append(...)`, and its last line is `return lines`.

**Second**, change the function `main`. Remove its `print()` line. In
its place, write a `for` loop over the list that
`report_lines(ledger)` returns. The loop prints each line.

Keep the call `main()` as the last line of the file. Leave two empty
lines between one function and the next. Python does not need them,
but Python programmers write them, and they make a file easier to
read.

Then save the file, and run the script: type `python spending.py` in
the terminal, and press `Enter`. When your code is correct, the
terminal shows:

```
Purchases: 37
Total: 2834.79
```

```{hint}
:title: "Hint: the function report_lines"
The first line of the function is `def report_lines(ledger):`.

The second line makes the list, with the first string already in it.
You wrote that string on the page before, inside `print()`:

`lines = [f"Purchases: {len(ledger.purchases)}"]`

The third line adds the second string to the list. It begins with
`lines.append(` and the task above gives the f-string.

The last line is `return lines`.
```

```{hint}
:title: "Hint: the loop in main"
The function `main` keeps its first line, which reads the file. Under
it, a loop takes each string of the list in turn:

`for line in report_lines(ledger):`

The line under the `for` line begins with eight spaces: four because
it is inside the function, and four more because it is inside the
loop. It prints the string: `print(line)`.
```

If the hints were not enough, the box below holds a solution. It opens
after the check below has run one time.

```{attempt}
:id: first-not-started
:check: report-first
:expect: The file has no function with the name report_lines yet
```

````{attempt}
:id: first-name-error
:check: report-first
:expect: NameError

```{file-write}
:path: spending.py
:from: answers/05-name-error.py
```
````

````{attempt}
:id: first-prints
:check: report-first
:expect: The function gave back None

```{file-write}
:path: spending.py
:from: answers/05-prints.py
```
````

````{attempt}
:id: first-string
:check: report-first
:expect: gave back a value of the type str

```{file-write}
:path: spending.py
:from: answers/05-string.py
```
````

````{attempt}
:id: first-no-label
:check: report-first
:expect: Your line is "19.75" and the correct line is "Total: 19.75"

```{file-write}
:path: spending.py
:from: answers/05-no-label.py
```
````

````{attempt}
:id: first-one-line
:check: report-first
:expect: Your list has 1 line and the correct list has 2 lines

```{file-write}
:path: spending.py
:from: answers/05-one-line.py
```
````

````{attempt}
:id: first-index-error
:check: report-first
:expect: The function stopped with IndexError

```{file-write}
:path: spending.py
:from: answers/05-index-error.py
```
````

````{attempt}
:id: first-old-main
:check: report-first
:expect: does not show them

```{file-write}
:path: spending.py
:from: answers/05-old-main.py
```
````

````{hint}
:title: Show me a solution
:unlock: "report-first" in failed_checks or "report-first" in passed_checks
:locked: Try the task first. This opens after the check below has run.
A working answer has these lines after the function `read_ledger`:

```python
def report_lines(ledger):
    lines = [f"Purchases: {len(ledger.purchases)}"]
    lines.append(f"Total: {ledger.total():.2f}")
    return lines


def main():
    ledger = read_ledger("spending.csv")
    for line in report_lines(ledger):
        print(line)


main()
```

The first action below replaces your file `spending.py` with a file
that holds a working answer. What you typed in the file is lost, so
compare your lines with the lines above first. The second action runs
the script.

```{file-write}
:id: first-solution
:title: Replace my spending.py with a working answer
:path: spending.py
:from: answers/05-solution.py
:open: true
```

```{execute}
:id: first-solution-run
:title: Run the script
:wait: prompt
python spending.py
```
````

```{verify}
:id: report-first
:label: report_lines returns two lines, and main shows them
:trigger: terminal-output "Total:"; file-saved spending.py; after:first-solution-run
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
assert found["function"], "The file has no function with the name report_lines yet. Write it above the function main. It begins with def report_lines(ledger): and the spelling must be the same. Then save the file."
small = found["small"]
made = "The check made a ledger with 3 purchases: Tea 3.50, Train ticket 12.00 and Soup 4.25. Then it called report_lines with that ledger."
if "error" in small:
    raise AssertionError(f"{made} The function stopped with {small['error']}. The function must use only its parameter ledger, and it must work for a ledger of every size. After you change the file, save it, and run the script again.")
if "lines" not in small and small["type"] == "NoneType":
    raise AssertionError(f"{made} The function gave back None. A function gives back None when it has no return line. Do not show the lines with print() inside report_lines. Put them in a list, and end the function with return lines. After you change the file, save it, and run the script again.")
if "lines" not in small:
    raise AssertionError(f"{made} The function gave back a value of the type {small['type']}. It must give back a list of strings, with one string for each line of the report. After you change the file, save it, and run the script again.")
want = ["Purchases: 3", "Total: 19.75"]
if small["lines"] != want:
    raise AssertionError(f"{made} {difference(small['lines'], want)} After you change the file, save it, and run the script again.")
lines = shown.rstrip("\n").split("\n") if shown.strip() else []
if lines != found["file"]:
    first = f"{count(lines)}, and the first line is {show(lines, 0)}" if lines else "nothing"
    raise AssertionError(f"The function report_lines gives the correct lines. But the command python spending.py does not show them: it showed {first}. Change the function main, so that it calls report_lines(ledger) and shows each line of the list with print(). After you change the file, save it, and run the script again.")
print("Correct. report_lines returns the lines, and main shows them:", " | ".join(lines))
```

The check does two things. It runs your script, as you do. It also
calls your function `report_lines` with a small ledger of its own, and
looks at the list that the function returns. The check can do the
second thing only because the function returns the lines. This is the
reason for the plan of this page.
