---
title: A test for the empty report
requires: [verify:report-test]
---

# A test for the empty report

The file `spending/report.py` holds the function `report_lines(ledger)`.
It returns the lines of the report as a list of strings. For a ledger
with purchases, the list holds the number of purchases, the total,
the totals for each category and each month, and the largest
purchase.

A ledger with no purchases is an edge. It has no largest purchase, so
the function cannot make every line. For this case it returns a list
with one line only:

```python
["Purchases: 0"]
```

This happens, for example, when you choose a month that has no
purchases with the option `--month`. A program that works for the
ordinary case can break here: a change that forgets this case
stops the program with an `IndexError`.

## Your task

Make a second test file, `tests/test_report.py`, beside
`tests/test_models.py`, with a test for this edge. The tests of
`spending/report.py` go in their own file, in the same way as the
tests of `spending/models.py`.

The test checks that `report_lines` of a new, empty `Ledger()` returns
exactly the list `["Purchases: 0"]`.

The file needs two `import` lines: one for `Ledger` from
`spending.models`, and one for `report_lines` from `spending.report`.

Make the file in the file browser, inside the directory `tests`, as
on the page **Your first test file**. Save it, and run
`python -m pytest` in the terminal. pytest now runs the tests of both
files.

```{file-browser-reveal}
:id: show-tests-directory
:title: Show the directory tests in the file browser
:path: tests/test_models.py
```

```{hint}
:title: "Hint: the import lines"
The two lines are:

`from spending.models import Ledger`

`from spending.report import report_lines`
```

```{hint}
:title: "Hint: the test"
The test is one function whose name begins with `test_`, with one
line in its body. That line compares `report_lines(Ledger())` with
the list `["Purchases: 0"]`, with `==` and `assert`.
```

If the hints were not enough, the box below holds a solution. It
opens after the check below has run one time.

```{attempt}
:id: report-test-missing
:check: report-test
:expect: There is no file test_report.py in the directory tests yet
```

````{attempt}
:id: report-test-outside
:check: report-test
:expect: is in your work directory, and it must be inside the directory tests

```{file-write}
:path: test_report.py
def test_nothing():
    pass
```
````

````{attempt}
:id: report-test-not-empty
:check: report-test
:expect: Your test passes even when report_lines() stops with an IndexError

```{file-delete}
:path: test_report.py
```

```{file-write}
:path: tests/test_report.py
from decimal import Decimal

from spending.models import Ledger, Purchase
from spending.report import report_lines


def test_report_of_one_purchase():
    ledger = Ledger()
    ledger.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
    assert report_lines(ledger)[0] == "Purchases: 1"
```
````

````{attempt}
:id: report-test-no-assert
:check: report-test
:expect: Your test passes even when report_lines() gives wrong lines for an empty ledger

```{file-write}
:path: tests/test_report.py
from spending.models import Ledger
from spending.report import report_lines


def test_report_of_an_empty_ledger_has_one_line():
    report_lines(Ledger())
```
````

````{attempt}
:id: report-test-wrong-value
:check: report-test
:expect: Your test fails, but the function report_lines() of the program is correct

```{file-write}
:path: tests/test_report.py
from spending.models import Ledger
from spending.report import report_lines


def test_report_of_an_empty_ledger_has_one_line():
    assert report_lines(Ledger()) == ["Purchases: 0", "Total: 0.00"]
```
````

````{attempt}
:id: report-test-only-length
:check: report-test
:expect: Your test passes even when report_lines() gives wrong lines for an empty ledger

```{file-write}
:path: tests/test_report.py
from spending.models import Ledger
from spending.report import report_lines


def test_report_of_an_empty_ledger_has_one_line():
    assert len(report_lines(Ledger())) > 0
```
````

````{hint}
:title: Show me a solution
:unlock: "report-test" in failed_checks or "report-test" in passed_checks
:locked: Try the task first. This opens after the check below has run.
A working file `tests/test_report.py` is this:

```python
from spending.models import Ledger
from spending.report import report_lines


def test_report_of_an_empty_ledger_has_one_line():
    assert report_lines(Ledger()) == ["Purchases: 0"]
```

The first action below writes the file and opens it in the editor. It
replaces what the file holds now. The second action runs the tests.

```{file-write}
:id: report-test-solution
:title: Write a solution to tests/test_report.py
:path: tests/test_report.py
:from: solutions/test_report.py
:open: true
```

```{execute}
:id: report-test-run
:title: Run the tests
:wait: prompt
python -m pytest
```
````

```{verify}
:id: report-test
:label: tests/test_report.py finds a wrong report for an empty ledger
:trigger: file-saved tests/test_report.py; after:report-test-run
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
if not Path("tests/test_report.py").exists():
    if Path("test_report.py").exists():
        raise AssertionError("The file test_report.py is in your work directory, and it must be inside the directory tests. In the file browser, drag the file onto the directory tests.")
    raise AssertionError("There is no file test_report.py in the directory tests yet. Make the file in the file browser, inside the directory tests, write the test in it, and save it.")
passed = judge_correct("tests/test_report.py", "the function report_lines()")
code, last, error = run_tests("tests/test_report.py", "import spending.report as r\noriginal = r.report_lines\ndef broken(ledger):\n    ledger.largest()\n    return original(ledger)\nr.report_lines = broken")
assert code != 0, "Your test passes even when report_lines() stops with an IndexError for an empty ledger. Your test must call report_lines(Ledger()), with a new empty Ledger. Then save the file."
code, last, error = run_tests("tests/test_report.py", "import spending.report as r\noriginal = r.report_lines\nr.report_lines = lambda ledger: original(ledger) if ledger.purchases else original(ledger) + ['Total: 0.00']")
assert code != 0, "Your test passes even when report_lines() gives wrong lines for an empty ledger. The check changed report_lines() so that it gives two lines for an empty ledger, and your test still passed. Compare the whole list with ==, with the list that holds the one string Purchases: 0. Then save the file."
print(f"Correct. Your test passes ({passed}). It fails when report_lines() stops with an error for an empty ledger, and when it gives the wrong lines.")
```

## What you have now

Your project has two test files now. Run all their tests with one
command, `python -m pytest`, after every change that you make to the
spending tracker.
