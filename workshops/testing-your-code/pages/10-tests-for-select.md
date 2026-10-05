---
title: Tests for select
requires: [verify:select-tests]
---

# Tests for select

From now on, the pages give you a goal, and you decide how to write
the tests. The check runs your tests against the program with a
mistake put in on purpose, as on the page about the total. Your tests
pass the check when they find the mistake.

## The method `select`

The method `select(month=None, category=None)` of a `Ledger` returns
a new `Ledger` that holds only some of the purchases:

- `select(month="2026-01")` keeps the purchases whose `month()` is
  `"2026-01"`.

- `select(category="food")` keeps the purchases whose category is
  `"food"`.

- With both, it keeps the purchases that fit both. With neither, it
  keeps every purchase.

The program uses it for the options `--month` and `--category` of the
command `python -m spending`.

## Your task

Add two tests to the end of `tests/test_models.py`:

1. A test that `select` with a month keeps only the purchases of that
   month.

2. A test that `select` with a category keeps only the purchases of
   that category.

Use the ledger from `make_ledger()`. Work out the correct result
yourself, from the table of its three purchases on the page **Tests
for the total**: which purchases are in the month `"2026-01"`, and
which are in the category `"food"`? Give each test a name that begins
with `test_` and says what it checks.

Save the file, and run `python -m pytest` in the terminal. Every test
must pass.

```{hint}
:title: "Hint: what to compare"
`select` returns a `Ledger`, and a `Ledger` cannot be compared with a
number. Compare something about it that you can work out: the number
of purchases that it holds, `len(selected.purchases)`, or its total,
`selected.total()`.
```

```{hint}
:title: "Hint: the correct results"
Two purchases are in the month `"2026-01"`: the bread and milk, and
the bus ticket. Two purchases are in the category `"food"`, with the
amounts 6.40 and 9.10, so their total is `Decimal("15.50")`. A test
can begin like this:

`selected = make_ledger().select(month="2026-01")`
```

If the hints were not enough, the box below holds a solution. It
opens after the check below has run one time.

```{attempt}
:id: select-tests-none
:check: select-tests
:expect: Your tests pass even when select() does not look at the month
```

````{attempt}
:id: select-tests-month-only
:check: select-tests
:expect: Your tests pass even when select() does not look at the category

```{editor-insert}
:path: tests/test_models.py


def test_select_keeps_one_month():
    selected = make_ledger().select(month="2026-01")
    assert len(selected.purchases) == 2
```
````

````{attempt}
:id: select-tests-wrong-value
:check: select-tests
:expect: Your test fails, but the method select() of the program is correct

```{editor-insert}
:path: tests/test_models.py


def test_select_keeps_one_category():
    selected = make_ledger().select(category="food")
    assert selected.total() == Decimal("9.10")
```
````

````{hint}
:title: Show me a solution
:unlock: "select-tests" in failed_checks or "select-tests" in passed_checks
:locked: Try the task first. This opens after the check below has run.
Two tests that do this work are these. They go at the end of the
file, after the tests of the total:

```python
def test_select_keeps_one_month():
    selected = make_ledger().select(month="2026-01")
    assert len(selected.purchases) == 2


def test_select_keeps_one_category():
    selected = make_ledger().select(category="food")
    assert selected.total() == Decimal("15.50")
```

The first action below replaces your file `tests/test_models.py` with
a file that holds the tests of the earlier pages and these two tests.
What you typed in the file is lost, so compare your lines with the
lines above first. The second action runs the tests.

```{file-write}
:id: select-tests-solution
:title: Replace my tests/test_models.py with a working answer
:path: tests/test_models.py
:from: solutions/test_models-3.py
:open: true
```

```{execute}
:id: select-tests-run
:title: Run the tests
:wait: prompt
python -m pytest
```
````

```{verify}
:id: select-tests
:label: Your tests find a select() that ignores the month or the category
:trigger: file-saved tests/test_models.py; after:select-tests-run
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
assert Path("tests/test_models.py").exists(), "There is no file tests/test_models.py. Go back to the page Your first test file, and make it."
passed = judge_correct("tests/test_models.py", "the method select()")
code, last, error = run_tests("tests/test_models.py", "import spending.models as m\noriginal = m.Ledger.select\nm.Ledger.select = lambda self, month=None, category=None: original(self, None, category)")
assert code != 0, "Your tests pass even when select() does not look at the month. The check changed select() so that it keeps the purchases of every month, and every test still passed. Write a test that calls select(month=\"2026-01\") on the ledger from make_ledger(), and checks what it keeps. Then save the file."
code, last, error = run_tests("tests/test_models.py", "import spending.models as m\noriginal = m.Ledger.select\nm.Ledger.select = lambda self, month=None, category=None: original(self, month, None)")
assert code != 0, "Your tests pass even when select() does not look at the category. The check changed select() so that it keeps the purchases of every category, and every test still passed. Write a test that calls select(category=\"food\") on the ledger from make_ledger(), and checks what it keeps. Then save the file."
print(f"Correct. Your tests pass ({passed}). They fail when select() does not look at the month, and when it does not look at the category.")
```
