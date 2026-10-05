---
title: Read a failure
requires: [verify:total-broken, quiz:which-value]
---

# Read a failure

Your tests pass. That is good, but a test shows its value on the day
that it fails. On this page you break the method `total()` on
purpose, as a programmer could by mistake, and you read what pytest
shows.

## Your task: break the method

Open the file `spending/models.py`: in the file browser, double-click
the directory `spending`, then double-click the file `models.py`. If
the file browser does not show your work directory, click the action
below first.

```{file-browser-reveal}
:id: show-models
:title: Show spending/models.py in the file browser
:path: spending/models.py
```

Find the method `total`. It looks like this:

```python
    def total(self):
        result = Decimal("0")
        for purchase in self.purchases:
            result = result + purchase.amount
        return result
```

The total starts at `0`, and the loop adds each amount to it. Change
the line `result = Decimal("0")` so that the total starts at `1`:

```python
        result = Decimal("1")
```

Change only the `0` to `1`. Save the file. Then type
`python -m pytest` in the terminal and press `Enter`.

```{attempt}
:id: total-not-broken
:check: total-broken
:expect: The method total() still gives the correct total
```

````{hint}
:title: Make the change for me
:unlock: "total-broken" in failed_checks or "total-broken" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below changes the line in `spending/models.py` and
saves the file. The second action runs the tests.

```{editor-replace}
:id: break-total
:title: Make the total start at 1
:path: spending/models.py
:match: result = Decimal("0")
result = Decimal("1")
```

```{execute}
:id: broken-run
:title: Run the tests
:wait: prompt
python -m pytest
```
````

```{verify}
:id: total-broken
:label: total() is broken, and your tests show it
:trigger: file-saved spending/models.py; terminal-output "failed"; after:broken-run
import os, subprocess, sys
from pathlib import Path

PROBE = """
from decimal import Decimal
from spending.models import Ledger, Purchase
ledger = Ledger()
ledger.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
ledger.add(Purchase("2026-02-02", "Vegetables", Decimal("9.10"), "food"))
print(ledger.total(), Ledger().total())
"""
plain = {name: value for name, value in os.environ.items() if name not in ("FORCE_COLOR", "CLICOLOR_FORCE", "PYTEST_ADDOPTS")}
plain.update(PYTHON_COLORS="0", PY_COLORS="0", NO_COLOR="1", PYTHONDONTWRITEBYTECODE="1")
run = subprocess.run([sys.executable, "-c", PROBE], capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL, env=plain)
if run.returncode != 0:
    errors = run.stderr.strip().splitlines()
    raise AssertionError(f"Python stopped with an error when it read spending/models.py. Change only the 0 to 1 in the line result = Decimal(\"0\"), and keep everything else of the line. The last line of the error is: {errors[-1] if errors else '(no message)'}")
assert run.stdout.split() != ["15.50", "0"], "The method total() still gives the correct total. In spending/models.py, change the line result = Decimal(\"0\") in the method total to result = Decimal(\"1\"). Then save the file: hold Ctrl and press S, or on a Mac hold Cmd and press S."
tests = subprocess.run([".venv/bin/python", "-m", "pytest", "-q", "-p", "no:cacheprovider", "--rootdir=.", "tests"], capture_output=True, text=True, timeout=60, stdin=subprocess.DEVNULL, env=plain)
assert tests.returncode == 1, "The method total() is wrong now, but your tests did not fail. Go back one page: the tests there must compare make_ledger().total() with Decimal(\"18.30\") and Ledger().total() with Decimal(\"0\")."
print("Correct. The method total() is wrong now, and your tests fail. Read what pytest shows in the terminal.")
```

## What pytest shows

The line of dots now holds the letter `F` for each test that failed:

```
tests/test_models.py .FF
```

Under it, the part with the heading `FAILURES` has a section for each
test that failed. A section begins with the name of the test. Then it
shows the lines of the test, and a `>` marks the line that failed.
The lines that begin with `E` explain the failure. For the first test
the most important line is this:

```
E       AssertionError: assert Decimal('19.30') == Decimal('18.30')
```

pytest shows the comparison again, with each side replaced by its
value. The lines under it, which begin with `E` and a `+`, say where
each value came from. Some of them hold a number that begins with
`0x`, which is different every time and is not important.

At the end, a line begins with `FAILED` for each test that failed,
and the last line counts the results: `2 failed, 1 passed`.

```{quiz}
:id: which-value
:title: Which value came from the program
question: "The line is `assert Decimal('19.30') == Decimal('18.30')`. Which value did the method `total()` give?"
options:
  - { text: "`Decimal('18.30')`", explanation: "That is the value on the right side of `==` in your test: the correct result, which you worked out yourself and wrote in the test." }
  - { text: "`Decimal('19.30')`", correct: true }
  - { text: "`Decimal('1')`", explanation: "The total starts at 1 now, but then the loop adds the three amounts to it. pytest shows the value at the end." }
explanation: "Your test is `assert make_ledger().total() == Decimal(\"18.30\")`. The left side is the call of `total()`, so pytest shows its value there: `19.30`, which is 1 too many. The right side is the value that you wrote. When you read a failure, compare the two, and ask which part of the code can give the difference."
```

Look also at the second failed test, for the empty ledger. Its
line with `E` shows `Decimal('1') == Decimal('0')`. Two tests failed,
and both point at the same place: the value with which the total
starts. The test of `month()` still passes, so that method was not
touched. In a large program, this is how tests lead you to a mistake.
