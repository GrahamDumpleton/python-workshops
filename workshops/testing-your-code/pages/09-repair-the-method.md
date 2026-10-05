---
title: Repair the method
requires: [verify:total-repaired]
---

# Repair the method

The failure told you where the mistake is. Now repair it, and let the
tests tell you that the repair worked.

## Your task

In the file `spending/models.py`, change the line in the method
`total` back to:

```python
        result = Decimal("0")
```

Save the file. Then type `python -m pytest` in the terminal again and
press `Enter`. The last line must say `3 passed`, with no `failed`.

This is how programmers work with tests every day. They change the
code, they run the tests, and they read the last line. When it says
that every test passed, they continue. When a test fails, they read
the failure before they do anything else.

```{attempt}
:id: total-still-broken
:check: total-repaired
:expect: The method total() still gives a wrong total
```

````{hint}
:title: Show me a solution
:unlock: "total-repaired" in failed_checks or "total-repaired" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below changes the line in `spending/models.py` back
and saves the file. The second action runs the tests.

```{editor-replace}
:id: repair-total
:title: Make the total start at 0 again
:path: spending/models.py
:match: result = Decimal("1")
result = Decimal("0")
```

```{execute}
:id: repaired-run
:title: Run the tests
:wait: prompt
python -m pytest
```
````

```{verify}
:id: total-repaired
:label: total() is correct again, and every test passes
:trigger: file-saved spending/models.py; after:repaired-run
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
    raise AssertionError(f"Python stopped with an error when it read spending/models.py. The line in the method total must be result = Decimal(\"0\"), with eight spaces before it. The last line of the error is: {errors[-1] if errors else '(no message)'}")
assert run.stdout.split() == ["15.50", "0"], "The method total() still gives a wrong total. In spending/models.py, change the line in the method total back to result = Decimal(\"0\"). Then save the file: hold Ctrl and press S, or on a Mac hold Cmd and press S."
tests = subprocess.run([".venv/bin/python", "-m", "pytest", "-q", "-p", "no:cacheprovider", "--rootdir=.", "tests"], capture_output=True, text=True, timeout=60, stdin=subprocess.DEVNULL, env=plain)
lines = [line.strip() for line in tests.stdout.splitlines() if line.strip()]
assert tests.returncode == 0, f"The method total() is correct again, but a test still fails. Type python -m pytest in the terminal, and read the failure. The last line of pytest is: {lines[-1] if lines else '(nothing)'}"
print("Correct. The method total() is correct again, and every test passes.")
```

## What happened

You made a mistake on purpose, and two tests found it in less than a
second. You did not have to run the program, or read a report and
compare numbers by eye. A test that finds a mistake you made by
accident works in the same way.
