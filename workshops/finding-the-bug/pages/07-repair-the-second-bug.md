---
title: Repair the second bug
requires: [verify:second-bug-repaired]
---

# Repair the second bug

The `print()` line showed that the total of a category does not grow.
Line 34 of `spending/models.py` is the cause:

```python
            totals[purchase.category] = purchase.amount
```

This line gives the key `purchase.category` a new value, and the new
value is the amount of this purchase only. The value that the key had
before is lost. At the end of the loop, each category holds the
amount of its last purchase.

A total must grow. The new value must be the total that the category
has so far, plus the amount of this purchase.

There is one more thing to think about. The first time that the loop
meets a category, the dictionary has no key for it yet. The method
`.get()` of a dictionary solves this: `totals.get(key, start)` gives
the value for the key, or the value `start` when the dictionary does
not have the key.

The amounts are `Decimal` values, which are exact numbers that Python
uses here for money. So the start value is `Decimal("0")`.

## Your task

Do these three things in `spending/models.py`:

1. Change line 34, so that it adds the amount of the purchase to the
   total that the category has so far.

2. Remove the `print()` line that you added. It has done its work. A
   line that you add to find a bug must not stay in the program,
   because the people who use the program do not want to see it.

3. Save the file: hold `Ctrl` and press `S`, or `Cmd` and `S` on a
   Mac.

Then run `python -m spending spending.csv --category rent` in the
terminal. When the bug is repaired, the report shows
`rent: 1950.00`, and no line begins with `debug:`.

```{hint}
:title: "Hint: what to look at"
Three lines under this method, the method `total_by_month` does the
same work for the months. Its line that begins with `totals[` is
correct. Read it, and see how it uses `totals.get()`.
```

````{hint}
:title: "Hint: how to correct it"
The correct line 34 is this. Keep the 12 spaces at the start of the
line.

```python
            totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + purchase.amount
```

Read the right side from the left. `totals.get(purchase.category,
Decimal("0"))` is the total that the category has so far, or 0 when
this is its first purchase. Then `+ purchase.amount` adds the amount
of this purchase.

To remove the `print()` line, click in that line, select the whole
line, and press the `Delete` key or the `Backspace` key until the
line is gone.
````

If the hints were not enough, the box below holds a solution. It
opens after the check below has run one time.

```{attempt}
:id: second-bug-untouched
:check: second-bug-repaired
:expect: The total for rent still does not grow
```

````{attempt}
:id: second-bug-key-error
:check: second-bug-repaired
:expect: Python stopped with a KeyError

```{editor-replace}
:path: spending/models.py
:match: totals[purchase.category] = purchase.amount
totals[purchase.category] = totals[purchase.category] + purchase.amount
```
````

````{attempt}
:id: second-bug-adds-one
:check: second-bug-repaired
:expect: The total for rent is wrong

```{editor-replace}
:path: spending/models.py
:match: totals[purchase.category] = totals[purchase.category] + purchase.amount
totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + 1
```
````

````{attempt}
:id: second-bug-times-three
:check: second-bug-repaired
:expect: The total for food is wrong

```{editor-replace}
:path: spending/models.py
:match: totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + 1
totals[purchase.category] = purchase.amount * 3
```
````

````{attempt}
:id: second-bug-print-left
:check: second-bug-repaired
:expect: the program shows a line that is not a line of the report

```{editor-replace}
:path: spending/models.py
:match: totals[purchase.category] = purchase.amount * 3
totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + purchase.amount
```
````

````{attempt}
:id: second-bug-other-answer
:check: second-bug-repaired
:result: pass

```{file-write}
:path: spending/models.py
:from: solutions/models-2.py
```

```{editor-replace}
:path: spending/models.py
:match: totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + purchase.amount
totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
```
````

````{hint}
:title: Show me a solution
:unlock: "second-bug-repaired" in failed_checks or "second-bug-repaired" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The correct method `total_by_category` is this. Line 34 now adds the
amount to the total so far, and the `print()` line is gone.

```python
    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + purchase.amount
        return totals
```

The first action below writes the file `spending/models.py` again,
with this bug repaired and with no `print()` line, and saves it.
Other changes that you made to the file are lost. The second action
runs the program for the category `rent`.

```{file-write}
:id: second-bug-solution
:title: Write spending/models.py with the second bug repaired
:path: spending/models.py
:from: solutions/models-2.py
:open: true
```

```{execute}
:id: run-after-second
:title: Run the program for the category rent
:wait: prompt
python -m spending spending.csv --category rent
```
````

```{verify}
:id: second-bug-repaired
:label: The total for a category is correct, and no print() line is left
:trigger: after:run-after-second; file-saved spending/models.py; terminal-output "rent: 1950.00"
import os, re, subprocess, sys

def run(category):
    command = f"python -m spending spending.csv --category {category}"
    try:
        done = subprocess.run(
            [sys.executable, "-m", "spending", "spending.csv", "--category", category],
            capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0", "PYTHONBREAKPOINT": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The check ran {command} and the program did not end after 10 seconds. Look for a loop that never ends in the code that you changed.") from None
    if done.returncode != 0:
        last = (done.stderr.strip().splitlines() or ["(no message)"])[-1]
        if last.startswith("KeyError"):
            raise AssertionError(f"Python stopped with a KeyError. The first time that the loop meets a category, the dictionary has no total for it yet. Read the total with totals.get(purchase.category, Decimal(\"0\")), which gives 0 for a key that does not exist. The check ran {command} and the last line of the error is: {last}")
        raise AssertionError(f"Python stopped with an error. Run the command in the terminal, and read the traceback from the last line. The check ran {command} and the last line of the error is: {last}")
    return command, done.stdout.splitlines()

report = re.compile(r"Purchases: \d+|Total: \d+\.\d\d|Total for each (category|month):|  \S+: \d+\.\d\d|Largest purchase: .*|")
extra = []
for category, total in [("rent", "1950.00"), ("food", "445.60")]:
    command, lines = run(category)
    found = [line.strip() for line in lines if line.startswith(f"  {category}:")]
    shown = found[0] if found else "(no line for this category)"
    assert shown != "rent: 650.00", f"The total for rent still does not grow. The check ran {command} and the report shows rent: 650.00, but three purchases of 650.00 make 1950.00. Line 34 of spending/models.py must add the amount to the total that the category has so far. If you changed the line, save the file: hold Ctrl and press S, or Cmd and S on a Mac."
    assert shown == f"{category}: {total}", f"The total for {category} is wrong. Line 34 of spending/models.py must add the amount of the purchase to the total that the category has so far. The check ran {command}. The report must show {category}: {total} and it shows: {shown}"
    extra = extra + [line for line in lines if not report.fullmatch(line)]
assert not extra, f"The totals are correct now, but the program shows a line that is not a line of the report. Remove the print() line that you added to spending/models.py, and save the file. The check ran the program with --category rent and with --category food, and the first such line is: {extra[0]}"
print("Correct. The check ran python -m spending spending.csv --category rent and the report shows rent: 1950.00. It also ran the program with --category food, and the report shows food: 445.60. No print() line is left.")
```

## What happened

The program gave a wrong number and no error message. You found the
bug in four steps:

1. You compared the report with a fact that you knew: three months
   of rent make 1950.00.

2. You made the problem small, with the option `--category rent`.

3. You added a `print()` line at the place that you had doubts
   about, and the program showed you that the total did not grow.

4. You repaired the line, and you removed the `print()` line.

A `print()` line has two limits. You must change the file and run the
program again for each new question that you have. And you must
remember to remove every line that you added. The next page shows a
tool that lets you ask many questions in one run of the program.
