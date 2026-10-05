# Testing your code

The forty-first workshop of the course, and the fifth of the set
**Working like a Python developer**. It explains what a test is for:
a program changes many times, and a test tells you at once what a
change broke. It shows the word `assert` in a small file of its own.
Then the learner makes an environment, installs the package `pytest`
with `python -m pip install -r requirements.txt pytest`, adds `pytest`
to the file `requirements.txt`, and writes the test file
`tests/test_models.py` for the spending tracker, with functions whose
names begin with `test_`, run with `python -m pytest`. The learner
breaks the method `total()` on purpose, reads what pytest shows, and
repairs it. Last, the learner writes tests from a goal: two tests for
`select`, and a test in `tests/test_report.py` for the report of an
empty ledger. The checks test the learner's tests by running them
against the program with one mistake put in on purpose, so a test
passes the check when it finds that mistake.

Twenty-five minutes, in an editor and a terminal. It needs a
connection to the internet, because it installs the packages `rich`
and `pytest` from PyPI into a virtual environment inside the
workspace. It needs a terminal, so it runs in JupyterLab only.
