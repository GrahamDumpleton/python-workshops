---
title: What you have learned
---

# What you have learned

You wrote tests for the spending tracker. You ran them with one
command, broke the program on purpose, read what the tests showed,
and repaired it. Then you wrote tests from a goal.

## The ideas

- A **test** is code that checks other code. It prepares values, runs
  the code that it tests, and compares the result with the correct
  result, which you work out yourself.

- The value of a test comes later. When you change the program, the
  tests tell you at once what the change broke.

- A line that begins with `assert` does nothing when its expression is
  `True`. When the expression is `False`, Python stops with an
  `AssertionError`.

- **pytest** is a package that finds the tests of a project, runs
  them all, and reports. It belongs in the environment of the
  project, and in the file `requirements.txt`.

- pytest runs each function whose name begins with `test_`, in each
  file whose name begins with `test_`. The tests usually live in a
  directory with the name `tests`.

- A function such as `make_ledger()` prepares values for several
  tests. Its name does not begin with `test_`, so pytest does not run
  it as a test.

- When a test fails, pytest shows the comparison with each side
  replaced by its value. The left side is what your code gave, and the
  right side is the correct result that you wrote.

- Test the edges as well as the ordinary case: an empty ledger, a
  month with no purchases.

- A good test passes when the code is correct, and fails when the
  code has a mistake.

## The commands and the code

| Command or code | What it does |
|------|------|
| `assert purchase.month() == "2026-01"` | stops the program with an `AssertionError` when the comparison is `False` |
| `python -m pip install -r requirements.txt pytest` | installs the packages that the file names, and the package `pytest` |
| `mkdir tests` | makes a directory with the name `tests` |
| `def test_total_adds_up_every_amount():` | begins a test that pytest finds by its name |
| `python -m pytest` | runs every test of the project |

## The tests that you wrote

The file `tests/test_models.py` tests the classes of
`spending/models.py`: `month()`, `total()` for a ledger with purchases
and for an empty ledger, and `select()` with a month and with a
category. The file `tests/test_report.py` tests that `report_lines`
gives one line for an empty ledger.

## What comes next

The spending tracker is now a package, a file of requirements and a
directory of tests. The next workshop, **A proper project**, gives
the project one file that describes all of it, so that the project
can be installed like any other package.

Click `Finish` at the bottom of this panel.
