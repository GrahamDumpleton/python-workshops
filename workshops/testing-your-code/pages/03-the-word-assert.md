---
title: The word assert
requires: [verify:check-month-runs, quiz:predict-assert, quiz:assert-last-line]
---

# The word assert

A test must compare a result with the correct result, and it must
make a noise when the two are different. Python has a word for this:
`assert`.

## What `assert` does

A line that begins with `assert` has an expression after the word.
Python works out the value of the expression.

- When the value is `True`, the line does nothing, and the program
  continues with the next line.

- When the value is `False`, Python stops the program with an
  exception of the type `AssertionError`. An **exception** is what
  Python calls an error that stops a program while it runs.

So `assert` means "this must be true here". You write in your code
what you are certain of, and Python tells you when it is not so.

Here is an example. It uses `==`, which compares two values and gives
`True` when they are equal:

```python
assert 2 + 2 == 4
```

This line does nothing, because `2 + 2 == 4` is `True`.

## Your task: a first check in a file

The spending tracker is in the directory `spending` in your work
directory. The file `spending/models.py` holds the class `Purchase`.
A purchase has a date, a description, an amount and a category. Its
method `month()` returns the first seven characters of the date: for
the date `"2026-01-03"` it returns `"2026-01"`.

Make a file with the name `check_month.py` in your work directory,
beside the file `spending.csv`. The action below shows your work
directory in the file browser, on the left side of the window.

```{file-browser-reveal}
:id: show-work-directory
:title: Show my work directory in the file browser
:path: spending.csv
```

1. In the file browser, click the empty space under the list of files
   with the right button of the mouse. Click `New File` in the menu.

2. Type the name `check_month.py` and press `Enter`.

3. Double-click the file to open it in the editor.

4. Type these lines in the editor:

   ```python
   from decimal import Decimal

   from spending.models import Purchase

   purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
   assert purchase.month() == "2026-01"
   print("The test passed.")
   ```

5. Save the file: hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
   press `S`.

6. Click in the terminal, type this command, and press `Enter`:

   ```
   python check_month.py
   ```

The first three lines import what the file needs. `Decimal` is a type
of number from the module `decimal` that is exact, which is why the
spending tracker uses it for money. The fourth line makes a purchase.
The fifth line is the check. The last line runs only when the check
did not stop the program, so the terminal shows:

```
The test passed.
```

```{hint}
:title: "Hint: I see an error message"
Read the last line of the message first.

A `ModuleNotFoundError` that names `spending` means that the file is
not in your work directory. It must be beside `spending.csv`, and not
inside the directory `spending`.

A `NameError` means that a name is spelled wrong, or that one of the
two `import` lines is missing.
```

If the hint was not enough, the box below holds a solution. It opens
after the check below has run one time.

```{attempt}
:id: check-month-missing
:check: check-month-runs
:expect: There is no file check_month.py in your work directory
```

````{attempt}
:id: check-month-empty
:check: check-month-runs
:expect: showed nothing

```{file-write}
:path: check_month.py
```
````

````{attempt}
:id: check-month-name-error
:check: check-month-runs
:expect: The last line of the error is: NameError

```{file-write}
:path: check_month.py
from spending.models import Purchase

purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
assert purchase.month() == "2026-01"
print("The test passed.")
```
````

````{attempt}
:id: check-month-assertion
:check: check-month-runs
:expect: The check in your file failed

```{file-write}
:path: check_month.py
from decimal import Decimal

from spending.models import Purchase

purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
assert purchase.month() == "2026-01-03"
print("The test passed.")
```
````

````{hint}
:title: Show me a solution
:unlock: "check-month-runs" in failed_checks or "check-month-runs" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes the file `check_month.py` with the six
lines above, and opens it in the editor. It replaces what the file
holds now. The second action runs the file.

```{file-write}
:id: check-month-solution
:title: Write a solution to check_month.py
:path: check_month.py
:from: solutions/check_month.py
:open: true
```

```{execute}
:id: check-month-solution-run
:title: Run the file
:wait: prompt
python check_month.py
```
````

```{verify}
:id: check-month-runs
:label: check_month.py runs, and its check passes
:trigger: file-saved check_month.py; terminal-output "The test passed."; after:check-month-solution-run
import os, subprocess, sys
from pathlib import Path

if not Path("check_month.py").exists():
    if Path("spending/check_month.py").exists():
        raise AssertionError("The file check_month.py is inside the directory spending. It must be in your work directory, beside the file spending.csv. Click the action on this page that shows your work directory, and make the file there.")
    raise AssertionError("There is no file check_month.py in your work directory yet. Make the file in the file browser, type the lines of this page in it, and save it.")
try:
    run = subprocess.run(
        [sys.executable, "check_month.py"],
        capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError("Your file did not end after 10 seconds, so the check stopped it. The file needs no loop. Type the lines of this page again, and save the file.") from None
if run.returncode != 0:
    errors = run.stderr.strip().splitlines()
    last = errors[-1] if errors else "(Python gave no message)"
    if last.startswith("AssertionError"):
        raise AssertionError("The check in your file failed: Python stopped at the line with assert, with an AssertionError. The value after == must be what the method month() really gives for the date 2026-01-03, and that is the string 2026-01. Correct the line, save the file, and run it again.")
    raise AssertionError(f"Python stopped with an error when the check ran check_month.py. Type python check_month.py in the terminal to see the whole message. Correct the file, and save it. The last line of the error is: {last}")
shown = run.stdout.strip()
assert shown, "Your file ran, and it showed nothing. Did you save the file? Hold Ctrl and press S, or on a Mac hold Cmd and press S. The last line of the file must be the print() line."
assert shown == "The test passed.", f"Your file showed {shown} and it must show The test passed. Type the print() line as this page gives it, save the file, and run it again."
print("Correct. The check in check_month.py passed, and the file showed: The test passed.")
```

## When the check is not true

Now change the file so that the check is wrong on purpose. The
correct month is `"2026-01"`. Think about the file with `"2026-02"` in
the line with `assert`.

```{quiz}
:id: predict-assert
:title: A check that is not true
question: "The line is `assert purchase.month() == \"2026-02\"`. What happens when you run the file?"
options:
  - { text: "The terminal shows `The test passed.`, because the line with `assert` shows nothing", explanation: "The line shows nothing only when its expression is `True`. Here `purchase.month()` gives `\"2026-01\"`, so the comparison is `False`." }
  - { text: "Python stops the program with an `AssertionError`, and the line with `print()` does not run", correct: true }
  - { text: "Python changes the date of the purchase to `\"2026-02\"`", explanation: "`assert` never changes a value. It only checks one." }
explanation: "`purchase.month()` gives `\"2026-01\"`, so `purchase.month() == \"2026-02\"` is `False`. Python stops the program at that line with an `AssertionError`. The program never reaches the last line."
```

The action below makes the change in the editor, and saves the file.

```{editor-replace}
:id: make-check-wrong
:title: Change the month in the check to 2026-02
:path: check_month.py
:match: == "2026-01"
== "2026-02"
```

Run the file again: type `python check_month.py` in the terminal and
press `Enter`. The terminal shows a traceback, which is the message
that Python shows when an exception stops a program. Read it from the
last line.

````{hint}
:title: Run the command for me
The action below types the command in the terminal and runs it.

```{execute}
:id: run-wrong-check
:title: Run check_month.py
:wait: prompt
python check_month.py
```
````

```{quiz}
:id: assert-last-line
:title: The last line of the message
:type: text
:case: false
question: "What is the last line of the message in the terminal? Type the whole line."
answer: "AssertionError"
wrong:
  - { pattern: "the test passed\\.?", explanation: "That is what the file showed before the change. The action above saved the change, so the command shows a traceback now. Run the command again, and read its last line." }
otherwise: "Look at the last line that the command printed, directly above the prompt. It is one word, the name of a type of exception."
explanation: "The traceback names your file and the line with `assert`, and its last line is `AssertionError`. A plain `assert` does not say which values it compared. The tool on the next pages does: it shows the two values that were different."
```

You can leave the file as it is now. It is a first check, written by
hand. On the next pages you use a tool that finds and runs many such
checks for you.
