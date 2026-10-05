---
title: Repair the first bug
requires: [verify:first-bug-repaired]
---

# Repair the first bug

The traceback gave you three facts: the file is `spending/models.py`,
the line is 27, and the error is an `AttributeError` for the name
`purchase`. Now you look at that line.

## Open the file

In the file browser at the left, double-click the directory
`spending`. Then double-click the file `models.py`. The file opens in
the editor.

The editor shows a number at the left of each line. Find line 27.

````{hint}
:title: Open the file for me
The action below opens the file `spending/models.py` in the editor,
at line 27.

```{file-open}
:id: open-models-first
:title: Open spending/models.py at line 27
:path: spending/models.py
:line: 27
```
````

Lines 25 to 29 are the method `total` of the class `Ledger`:

```python
    def total(self):
        result = Decimal("0")
        for purchase in self.purchase:
            result = result + purchase.amount
        return result
```

The method adds up the amounts of all the purchases. Inside a method,
`self` is the name for the object that the method was called on. Here
that object is the ledger. So `self.purchase` asks the ledger for an
attribute with the name `purchase`.

Now look at lines 19 and 20 of the same file. They are the method
`__init__`, which Python calls when a ledger is made:

```python
    def __init__(self):
        self.purchases = []
```

This is the only attribute that a ledger has. Compare its name with
the name in line 27, letter by letter.

## Your task

Correct line 27, so that the method `total` uses the attribute that
the ledger has. Then do these two things:

1. **Save** the file. To save is to write what the editor shows to
   the file on the disk. Hold `Ctrl` and press `S`. On a Mac, hold
   `Cmd` and press `S`. While a file has changes that are not saved,
   its tab shows a dot in place of the `x`.

2. Run the program again. Click in the terminal, type
   `python -m spending spending.csv` and press `Enter`.

Python reads the file from the disk, and not from the editor. If you
do not save, Python runs the old code, and the traceback is the same
as before.

When the bug is repaired, the program runs to its end and shows a
report. The second line of the report is `Total: 2834.79`.

```{hint}
:title: "Hint: what to look at"
The ledger has an attribute with the name `purchases`, with an `s` at
the end. Line 27 asks for `purchase`, with no `s`. The last line of
the traceback also said this: `Did you mean: 'purchases'?`
```

````{hint}
:title: "Hint: how to correct it"
Change line 27 to this line. Keep the eight spaces at the start of
the line.

```python
        for purchase in self.purchases:
```

Then save the file, and run `python -m spending spending.csv` in the
terminal.
````

If the hints were not enough, the box below holds a solution. It
opens after the check below has run one time.

```{attempt}
:id: first-bug-untouched
:check: first-bug-repaired
:expect: The program still stops with an AttributeError
```

````{attempt}
:id: first-bug-no-self
:check: first-bug-repaired
:expect: The program now stops with a different error

```{editor-replace}
:path: spending/models.py
:match: for purchase in self.purchase:
for purchase in purchases:
```
````

````{attempt}
:id: first-bug-part-of-list
:check: first-bug-repaired
:expect: but the total is wrong

```{editor-replace}
:path: spending/models.py
:match: for purchase in purchases:
for purchase in self.purchases[:3]:
```
````

````{hint}
:title: Show me a solution
:unlock: "first-bug-repaired" in failed_checks or "first-bug-repaired" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The correct method `total` is this. Only line 27 is different: it
reads `self.purchases`.

```python
    def total(self):
        result = Decimal("0")
        for purchase in self.purchases:
            result = result + purchase.amount
        return result
```

The first action below writes the file `spending/models.py` again,
with this bug repaired, and saves it. Other changes that you made to
the file are lost. The second action runs the program.

```{file-write}
:id: first-bug-solution
:title: Write spending/models.py with the first bug repaired
:path: spending/models.py
:from: solutions/models-1.py
:open: true
```

```{execute}
:id: run-after-first
:title: Run the program
:wait: prompt
python -m spending spending.csv
```
````

```{verify}
:id: first-bug-repaired
:label: The program runs to its end and shows the total 2834.79
:trigger: after:run-after-first; file-saved spending/models.py; terminal-output "Total: 2834.79"
import os, subprocess, sys

command = "python -m spending spending.csv"
try:
    done = subprocess.run(
        [sys.executable, "-m", "spending", "spending.csv"],
        capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0", "PYTHONBREAKPOINT": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError(f"The check ran {command} and the program did not end after 10 seconds. Look for a loop that never ends in the code that you changed.") from None
if done.returncode != 0:
    last = (done.stderr.strip().splitlines() or ["(no message)"])[-1]
    if last.startswith("AttributeError"):
        raise AssertionError(f"The program still stops with an AttributeError. Correct line 27 of spending/models.py. Then save the file: hold Ctrl and press S, or Cmd and S on a Mac. The check ran {command} and the last line of the error is: {last}")
    raise AssertionError(f"The program now stops with a different error. Run the command in the terminal, and read the traceback from the last line. It names the file and the line to look at. The check ran {command} and the last line of the error is: {last}")
lines = done.stdout.splitlines()
second = lines[1] if len(lines) > 1 else "(nothing)"
assert "Total: 2834.79" in lines, f"The program runs to its end now, but the total is wrong. The loop in the method total must use every purchase in self.purchases. The check ran {command}. The second line of the report must be Total: 2834.79 and it is: {second}"
print(f"Correct. The check ran {command} and the program ran to its end. The second line of the report is Total: 2834.79.")
```

## What happened

The program stopped because one name was typed without its last
letter. Python cannot know that `purchase` was meant to be
`purchases`. It can only say that the ledger has no attribute with
that name, and where it was when it found that.

You did not search the program. The traceback gave you the file and
the line, and the last line of the traceback gave you the reason.

The report now appears. On the next page you look at it with care,
because it is not correct yet.
