---
title: Tests for the total
requires: [verify:total-tests]
---

# Tests for the total

The class `Ledger` holds a list of purchases in its attribute
`purchases`. Its method `add(purchase)` adds a purchase to the list,
and its method `total()` returns the total of all the amounts, as a
`Decimal`. On this page you write tests for `total()`.

## A function that prepares the values

Many tests need the same values. Here, several tests need a ledger
that holds a few purchases. You can write a function that makes such a
ledger, and call it from each test.

The name of this function does not begin with `test_`, so pytest does
not run it as a test. It is a helper: the tests call it.

## Your task

Change the file `tests/test_models.py` in three ways. Keep the test
that is already in it.

**First**, the tests need the class `Ledger`. Change the `import`
line so that it imports `Ledger` as well as `Purchase`:

```python
from spending.models import Ledger, Purchase
```

**Second**, under the `import` lines, write a function `make_ledger()`.
It has no parameters. It makes a new `Ledger`, adds these three
purchases to it with `add`, and returns the ledger:

| Date | Description | Amount | Category |
|------|------|------|------|
| `"2026-01-03"` | `"Bread and milk"` | `Decimal("6.40")` | `"food"` |
| `"2026-01-05"` | `"Bus ticket"` | `Decimal("2.80")` | `"transport"` |
| `"2026-02-02"` | `"Vegetables"` | `Decimal("9.10")` | `"food"` |

**Third**, at the end of the file, write two tests:

- `test_total_adds_up_every_amount` checks that the total of the
  ledger from `make_ledger()` is `Decimal("18.30")`. Work it out
  yourself: 6.40 + 2.80 + 9.10 = 18.30.

- `test_total_of_an_empty_ledger_is_zero` checks that the total of a
  new `Ledger()`, which holds no purchases, is `Decimal("0")`.

The second test is about a special case. Programmers test the
ordinary case, and also the edges: an empty list, a single item, the
first day of a month. Mistakes are often found at the edges.

Leave two empty lines between one function and the next. Save the
file. Then type `python -m pytest` in the terminal and press `Enter`.
When your tests are correct, the last line says `3 passed`.

```{hint}
:title: "Hint: the function make_ledger"
The first line is `def make_ledger():`. The body makes the ledger
with `ledger = Ledger()`. Then three lines each add one purchase, for
example:

`ledger.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))`

The last line is `return ledger`.
```

```{hint}
:title: "Hint: the two tests"
Each test is a function whose name begins with `test_`, with no
parameters. Its body can be one line with `assert`. The first test
compares `make_ledger().total()` with `Decimal("18.30")`, with `==`.
The second test compares `Ledger().total()` with `Decimal("0")`.
```

If the hints were not enough, the box below holds a solution. It
opens after the check below has run one time.

```{attempt}
:id: total-tests-none
:check: total-tests
:expect: Your tests pass even when the method total() is wrong
```

````{attempt}
:id: total-tests-no-ledger-import
:check: total-tests
:expect: Your test stopped with an error before it could compare the values. The error is: NameError

```{file-write}
:path: tests/test_models.py
from decimal import Decimal

from spending.models import Purchase


def test_month_is_the_first_seven_characters_of_the_date():
    purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
    assert purchase.month() == "2026-01"


def test_total_of_an_empty_ledger_is_zero():
    assert Ledger().total() == Decimal("0")
```
````

````{attempt}
:id: total-tests-wrong-value
:check: total-tests
:expect: Your test fails, but the method total() of the program is correct

```{file-write}
:path: tests/test_models.py
:from: solutions/test_models-2.py
```

```{editor-replace}
:path: tests/test_models.py
:match: Decimal("18.30")
Decimal("18.20")
```
````

````{attempt}
:id: total-tests-no-empty
:check: total-tests
:expect: No test finds a mistake in total() for an empty ledger

```{file-write}
:path: tests/test_models.py
:from: solutions/test_models-2.py
```

```{editor-replace}
:path: tests/test_models.py
:match: Ledger().total() == Decimal("0")
make_ledger().total() == Decimal("18.30")
```
````

````{hint}
:title: Show me a solution
:unlock: "total-tests" in failed_checks or "total-tests" in passed_checks
:locked: Try the task first. This opens after the check below has run.
A working file `tests/test_models.py` is this:

```python
from decimal import Decimal

from spending.models import Ledger, Purchase


def make_ledger():
    ledger = Ledger()
    ledger.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
    ledger.add(Purchase("2026-01-05", "Bus ticket", Decimal("2.80"), "transport"))
    ledger.add(Purchase("2026-02-02", "Vegetables", Decimal("9.10"), "food"))
    return ledger


def test_month_is_the_first_seven_characters_of_the_date():
    purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
    assert purchase.month() == "2026-01"


def test_total_adds_up_every_amount():
    assert make_ledger().total() == Decimal("18.30")


def test_total_of_an_empty_ledger_is_zero():
    assert Ledger().total() == Decimal("0")
```

The first action below replaces your file `tests/test_models.py` with
this file. What you typed in the file is lost, so compare your lines
with the lines above first. The second action runs the tests.

```{file-write}
:id: total-tests-solution
:title: Replace my tests/test_models.py with a working answer
:path: tests/test_models.py
:from: solutions/test_models-2.py
:open: true
```

```{execute}
:id: total-tests-run
:title: Run the tests
:wait: prompt
python -m pytest
```
````

```{verify}
:id: total-tests
:label: Your tests find a wrong total, also for an empty ledger
:trigger: file-saved tests/test_models.py; after:total-tests-run
import os, re, subprocess
from pathlib import Path

def run_tests(target, patch=""):
    code = "import sys\n" + patch + "\nimport pytest\nsys.exit(pytest.main(['-q', '-p', 'no:cacheprovider', '--rootdir=.', '" + target + "']))\n"
    plain = {name: value for name, value in os.environ.items() if name not in ("FORCE_COLOR", "CLICOLOR_FORCE", "PYTEST_ADDOPTS")}
    plain.update(PYTHON_COLORS="0", PY_COLORS="0", NO_COLOR="1", PYTHONDONTWRITEBYTECODE="1")
    try:
        run = subprocess.run([".venv/bin/python", "-c", code], capture_output=True, text=True, timeout=60, stdin=subprocess.DEVNULL, env=plain)
    except subprocess.TimeoutExpired:
        raise AssertionError("The tests did not end after 60 seconds, so the check stopped them. Look for a loop that never ends in your tests.") from None
    if "No module named pytest" in run.stderr:
        raise AssertionError("The environment .venv has no pytest. Activate it with source .venv/bin/activate, and install the packages with python -m pip install -r requirements.txt pytest.")
    lines = [line.strip() for line in run.stdout.splitlines() if line.strip()]
    if not lines:
        errors = run.stderr.strip().splitlines()
        raise AssertionError(f"Python stopped with an error when the check read the program in the directory spending. The last line of the error is: {errors[-1] if errors else '(no message)'}")
    last = re.sub(r"\s+in [0-9.]+s.*$", "", lines[-1].strip("= "))
    errors = [line[1:].strip() for line in lines if re.match(r"E\s+\w*(Error|Exception)\b", line)]
    return run.returncode, last, errors[0] if errors else ""

def judge_correct(target, what):
    code, last, error = run_tests(target)
    if code == 5:
        raise AssertionError(f"pytest found no tests in the file {target}. A test is a function whose name begins with test_, and pytest runs only such functions. Check the def line of each test, and save the file.")
    if code == 1 and error and not error.startswith("AssertionError"):
        raise AssertionError(f"Your test stopped with an error before it could compare the values. The error is: {error}. Check the import lines at the top of the file and the spelling of each name. Then save the file.")
    if code == 1:
        raise AssertionError(f"Your test fails, but {what} of the program is correct. The value after == must be the correct result, which you work out yourself. pytest says: {last}. The line that shows the values is: {error}. Correct the test, and save the file.")
    if code != 0:
        raise AssertionError(f"pytest could not read the file {target}. Type python -m pytest in the terminal to see the whole message. The line that names the error is: {error or last}")
    return last
assert Path(".venv/bin/python").exists(), "There is no environment .venv in your work directory. Go back to the page An environment for the project, and make it."
assert Path("tests/test_models.py").exists(), "There is no file tests/test_models.py. Go back one page and make it."
passed = judge_correct("tests/test_models.py", "the method total()")
code, last, error = run_tests("tests/test_models.py", "import spending.models as m\noriginal = m.Ledger.total\nm.Ledger.total = lambda self: original(self) + 1 if self.purchases else original(self)")
assert code != 0, "Your tests pass even when the method total() is wrong. The check changed total() so that it adds 1 too many for a ledger that holds purchases, and every test still passed. Write the test test_total_adds_up_every_amount, which compares make_ledger().total() with Decimal(\"18.30\"). Then save the file."
code, last, error = run_tests("tests/test_models.py", "import spending.models as m\noriginal = m.Ledger.total\nm.Ledger.total = lambda self: original(self) if self.purchases else None")
assert code != 0, "No test finds a mistake in total() for an empty ledger. The check changed total() so that it gives None for a ledger with no purchases, and every test still passed. Write the test test_total_of_an_empty_ledger_is_zero, which compares Ledger().total() with Decimal(\"0\"). Then save the file."
print(f"Correct. Your tests pass ({passed}). They fail when total() adds wrongly, and when total() is wrong for an empty ledger.")
```

## What the check did

The check did not read the text of your tests. It ran them three
times: one time with the program as it is, and two times with a
mistake in `total()` that the check put in on purpose. A good test
passes when the code is correct, and fails when the code has a
mistake. Your tests did both.
