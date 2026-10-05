---
title: Your first test file
requires: [verify:tests-directory, verify:first-test, quiz:first-run]
---

# Your first test file

pytest finds tests by their names. You do not tell it where your tests
are. You put them where it looks, with names that it knows.

## Where pytest looks

When you run pytest in a directory, it follows three rules:

- It looks in that directory and in every directory inside it. Most
  projects keep their tests in a directory with the name `tests`.

- It reads each file whose name begins with `test_` and ends with
  `.py`. The tests of the classes in `spending/models.py` go in a file
  with the name `test_models.py`.

- In each such file, it runs each function whose name begins with
  `test_`. Each such function is one **test**. The rest of the name
  says what the test checks, in words, with underscores between them.

A test function has no parameters and returns nothing. It prepares
values, runs the code that it tests, and compares the result with
`assert`. When every `assert` of the function is true, the test
passes. When one is false, the test fails, and pytest continues with
the next test.

Your file `check_month.py` does not follow these rules, so pytest does
not read it.

## Step 1: make the directory

The command `mkdir` makes a directory. The name is short for "make
directory". After it, you write the name of the new directory.

Click in the terminal, type this command, and press `Enter`:

```
mkdir tests
```

```{attempt}
:id: tests-directory-missing
:check: tests-directory
:expect: There is no directory tests in your work directory yet
```

````{hint}
:title: Run the command for me
The action below types the command in the terminal and runs it.

```{execute}
:id: make-tests-directory
:title: Make the directory tests
:wait: prompt
mkdir tests
```
````

```{verify}
:id: tests-directory
:label: Your work directory holds the directory tests
:trigger: after:make-tests-directory; interval 3s
from pathlib import Path

assert Path("tests").is_dir(), "There is no directory tests in your work directory yet. Click in the terminal, type mkdir tests and press Enter. The name is tests, in small letters, with an s at the end."
print("Your work directory holds the directory tests.")
```

## Step 2: write the test

Make the file `test_models.py` inside the directory `tests`, and write
one test in it.

1. In the file browser on the left, double-click the directory
   `tests` to go inside it. If the file browser does not show your
   work directory, click the action below first.

2. Click the empty space under the list of files with the right
   button of the mouse. Click `New File` in the menu. Type the name
   `test_models.py` and press `Enter`.

3. Double-click the file to open it in the editor, and type these
   lines:

   ```python
   from decimal import Decimal

   from spending.models import Purchase


   def test_month_is_the_first_seven_characters_of_the_date():
       purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
       assert purchase.month() == "2026-01"
   ```

4. Save the file: hold `Ctrl` and press `S`, or on a Mac hold `Cmd`
   and press `S`.

```{file-browser-reveal}
:id: show-work-directory-tests
:title: Show my work directory in the file browser
:path: spending.csv
```

The check is the same as the check in `check_month.py`. Now it is
inside a function whose name begins with `test_`, and there is no
`print()`, because pytest reports for you.

```{hint}
:title: "Hint: the check says that the file is in the wrong place"
The file browser shows the name of the directory that it is in, above
the list of files. It must end with `tests` when you make the file.
If the file is in the wrong place, drag it with the mouse onto the
directory `tests` in the file browser.
```

If the hint was not enough, the box below holds a solution. It opens
after the check below has run one time.

```{attempt}
:id: first-test-missing
:check: first-test
:expect: There is no file test_models.py in the directory tests yet
```

````{attempt}
:id: first-test-outside
:check: first-test
:expect: is in your work directory, and it must be inside the directory tests

```{file-write}
:path: test_models.py
def test_nothing():
    pass
```
````

````{attempt}
:id: first-test-empty
:check: first-test
:expect: pytest found no tests in the file tests/test_models.py

```{file-delete}
:path: test_models.py
```

```{file-write}
:path: tests/test_models.py
```
````

````{attempt}
:id: first-test-name
:check: first-test
:expect: pytest found no tests in the file tests/test_models.py

```{file-write}
:path: tests/test_models.py
from decimal import Decimal

from spending.models import Purchase


def month_test():
    purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
    assert purchase.month() == "2026-01"
```
````

````{attempt}
:id: first-test-no-import
:check: first-test
:expect: Your test stopped with an error before it could compare the values. The error is: NameError

```{file-write}
:path: tests/test_models.py
from spending.models import Purchase


def test_month_is_the_first_seven_characters_of_the_date():
    purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
    assert purchase.month() == "2026-01"
```
````

````{attempt}
:id: first-test-wrong-value
:check: first-test
:expect: Your test fails, but the method month() of the program is correct

```{file-write}
:path: tests/test_models.py
from decimal import Decimal

from spending.models import Purchase


def test_month_is_the_first_seven_characters_of_the_date():
    purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
    assert purchase.month() == "2026-02"
```
````

````{attempt}
:id: first-test-weak
:check: first-test
:expect: Your test passes even when the method month() is wrong

```{file-write}
:path: tests/test_models.py
from decimal import Decimal

from spending.models import Purchase


def test_month_is_the_first_seven_characters_of_the_date():
    purchase = Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food")
    assert purchase.month() != ""
```
````

````{hint}
:title: Show me a solution
:unlock: "first-test" in failed_checks or "first-test" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below makes the directory `tests` if it is not there.
The second action writes the file `tests/test_models.py` with the
lines above, and opens it in the editor. It replaces what the file
holds now.

```{directory-create}
:id: first-test-directory
:title: Make the directory tests
:path: tests
```

```{file-write}
:id: first-test-solution
:title: Write a solution to tests/test_models.py
:path: tests/test_models.py
:from: solutions/test_models-1.py
:open: true
```
````

```{verify}
:id: first-test
:label: tests/test_models.py holds a test of month() that passes
:trigger: file-saved tests/test_models.py; after:first-test-solution
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
if not Path("tests/test_models.py").exists():
    if Path("test_models.py").exists():
        raise AssertionError("The file test_models.py is in your work directory, and it must be inside the directory tests. In the file browser, drag the file onto the directory tests.")
    raise AssertionError("There is no file test_models.py in the directory tests yet. Make the file in the file browser, inside the directory tests, type the lines of this page in it, and save it.")
judge_correct("tests/test_models.py", "the method month()")
code, last, error = run_tests("tests/test_models.py", "import spending.models as m\nm.Purchase.month = lambda self: self.date[:4]")
assert code != 0, "Your test passes even when the method month() is wrong. The check changed month() so that it gives only the year, 2026, and your test still passed. The test must compare purchase.month() with the exact correct result, 2026-01, with ==. Correct the test, and save the file."
print("Correct. Your test passes, and it fails when the method month() gives a wrong result.")
```

## Step 3: run pytest

Now run every test of the project. The command is new, so the action
below runs it for you this time:

```{execute}
:id: first-pytest-run
:title: Run the tests
:wait: prompt
python -m pytest
```

With `-m`, Python runs the module `pytest` of your environment. You
always run pytest from your work directory, so that your tests can
import the package `spending` that is there.

The first lines name your computer, your Python and pytest, with
their versions, and the directory in which pytest started. Those
lines are different on every computer. Then pytest shows each test
file that it ran, with one dot for each test that passed:

```
tests/test_models.py .
```

The last line counts the results, and says how many seconds the tests
took.

```{quiz}
:id: first-run
:title: The last line
:type: text
question: "The last line holds a number and a word after it, and then the time. Type the number and the word."
answer:
  - { pattern: "\\d+\\s+passed", example: "1 passed" }
wrong:
  - { pattern: "\\d+", explanation: "That is the number. Type the word after it too." }
  - { pattern: "\\d+\\s+failed.*", explanation: "A test failed. Go back to Step 2: the check there shows what is wrong with the test." }
otherwise: "Look at the last line that `python -m pytest` printed. It looks like `= 1 passed in 0.01s =`. If the terminal shows `No module named pytest`, type `source .venv/bin/activate` and press `Enter`, and run the command again."
explanation: "`1 passed` means that pytest found one test and that it passed. You did not tell pytest the name of the file or of the function. It found them because their names begin with `test_`."
```
