---
title: A program and a module in one file
requires: [verify:name-test]
---

# A program and a module in one file

Your file `spending.py` has two uses. As a script, it shows a report.
As a module, it gives the classes `Purchase` and `Ledger` and the
functions `read_ledger` and `report_lines` to other code. This page
shows that the two uses are in conflict now, and how one test solves
the conflict.

## The problem

In the workshop **Code in a file**, a notebook imported `spending` to
use the function `read_ledger`. Other code can do the same: a second
program, or code that checks that your functions are correct. That
code wants your functions. It does not want your report.

Click the action below. It imports your module, in the same way as
on the page before, and does nothing more.

```{execute}
:id: import-spending-before
:title: Import spending.py as a module
:wait: prompt
python -c "import spending"
```

The terminal shows the whole report. The code only imported the
module, and it did not ask for a report.

The reason is the last line of your file. To import a module, Python
runs every line of its file. The last line is the call `main()`, so
the report is printed at every import.

## The test

The call of `main()` must run when the file is the script, and must
not run when the file is imported. You know how the file can know which
case it is: the name `__name__`. So the end of the file becomes:

```python
if __name__ == "__main__":
    main()
```

Read it as a sentence: "If this file is the script that `python` was
asked to run, call `main`."

- With the command `python spending.py`, the name `__name__` refers to
  `"__main__"`. The comparison gives `True`, and `main()` runs.

- With `import spending`, the name `__name__` refers to `"spending"`.
  The comparison gives `False`, and Python does not run the line under
  the `if`. The classes and the functions are made as before, and
  nothing is shown.

You will see these two lines at the end of very many Python files.
They always mean the same thing.

## Your task

Click the action below to show `spending.py` in the editor again.

```{file-open}
:id: show-spending-test
:title: Show spending.py in the editor
:path: spending.py
```

Change the end of the file. In place of the last line, `main()`,
write the two lines of the test. The line `if __name__ == "__main__":`
begins with no spaces. The line `main()` under it begins with four
spaces. Save the file.

Then type these two commands in the terminal, one after the other,
and press `Enter` after each:

```
python spending.py
```

```
python -c "import spending"
```

When your code is correct, the first command shows the whole report,
and the second command shows nothing.

```{hint}
:title: "Hint: the first command shows nothing"
Check the line that begins with `if`, character by character:

- `__name__` has two underscores before `name` and two after it, and
  no quotes.

- `==` is two equals signs.

- `"__main__"` has two underscores before `main` and two after it,
  and it is inside quotes, because it is a string.

- The line ends with a colon.
```

```{hint}
:title: "Hint: the second command still shows the report"
Look at the end of the file. If a line `main()` with no spaces before
it is still there, Python runs it at every import. The only call of
`main()` must be the line under the `if`, with four spaces before it.

Also check that the file is saved. A dot on the tab of `spending.py`
means that it is not saved.
```

If the hints were not enough, the box below holds a solution. It opens
after the check below has run one time.

```{attempt}
:id: test-not-started
:check: name-test
:expect: A program that imports your module must show nothing
```

````{attempt}
:id: test-both-calls
:check: name-test
:expect: Remove every other call of main() from the end of the file

```{file-write}
:path: spending.py
:from: answers/09-both.py
```
````

````{attempt}
:id: test-wrong-text
:check: name-test
:expect: the command python spending.py also showed nothing

```{file-write}
:path: spending.py
:from: answers/09-wrong-text.py
```
````

````{attempt}
:id: test-name-error
:check: name-test
:expect: NameError

```{file-write}
:path: spending.py
:from: answers/09-name-error.py
```
````

````{attempt}
:id: test-other-text
:check: name-test
:expect: The line under the test must call main()

```{file-write}
:path: spending.py
:from: answers/09-other-text.py
```
````

````{hint}
:title: Show me a solution
:unlock: "name-test" in failed_checks or "name-test" in passed_checks
:locked: Try the task first. This opens after the check below has run.
A working answer has these lines at the end of the file, after the
function `main`:

```python
if __name__ == "__main__":
    main()
```

The first action below replaces your file `spending.py` with a file
that holds a working answer. What you typed in the file is lost, so
compare your lines with the lines above first. The other two actions
run the two commands.

```{file-write}
:id: test-solution
:title: Replace my spending.py with a working answer
:path: spending.py
:from: answers/09-solution.py
:open: true
```

```{execute}
:id: test-solution-run
:title: Run the file as a script
:wait: prompt
python spending.py
```

```{execute}
:id: test-solution-import
:title: Import the file as a module
:wait: prompt
python -c "import spending"
```
````

```{verify}
:id: name-test
:label: The script shows the report, and an import shows nothing
:trigger: terminal-output "Largest purchase:"; file-saved spending.py; after:test-solution-import
import json, os, shutil, subprocess, sys
from pathlib import Path

def run_python(arguments, where="."):
    try:
        run = subprocess.run([sys.executable, *arguments], cwd=where, capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL, env={**os.environ, "PYTHON_COLORS": "0", "PYTHONDONTWRITEBYTECODE": "1"})
    except subprocess.TimeoutExpired:
        raise AssertionError("Your program did not end after 5 seconds, so the check stopped it. Look for a loop that never ends. Correct the file spending.py, and save it.") from None
    if run.returncode != 0:
        errors = run.stderr.strip().splitlines()
        last = errors[-1] if errors else "(Python gave no message)"
        raise AssertionError(f"Python stopped with an error when the check ran your file spending.py. Type python spending.py in the terminal to see the whole error message. Correct the file, and save it. The last line of the error is: {last}") from None
    return run

shown = run_python(["spending.py"]).stdout
imported = run_python(["-c", "import spending"]).stdout
if imported.strip():
    raise AssertionError(f"The check ran the command python -c \"import spending\" and the command showed text. The first line is \"{imported.strip().splitlines()[0]}\". A program that imports your module must show nothing. Put the call of main() inside the test, under the line if __name__ == \"__main__\": and with four spaces before it. Remove every other call of main() from the end of the file. Then save the file.")
assert shown.strip(), "The module shows nothing when a program imports it, which is correct. But the command python spending.py also showed nothing. Look at the line that begins with if. The name is __name__ and the text is \"__main__\", each with two underscores before and two after. The text needs the quotes. After you change the file, save it, and run the script again."
report = run_python(["-c", "import spending\nfor line in spending.report_lines(spending.read_ledger('spending.csv')):\n    print(line)"]).stdout
assert shown == report, f"The command python spending.py must show the report, and the first line that it showed is \"{shown.strip().splitlines()[0]}\". The line under the test must call main(), and main must show each line of report_lines(ledger). After you change the file, save it, and run the script again."
print("Correct. python spending.py shows the report, and import spending shows nothing.")
```

The check runs the same two commands as you did. Your file is now a
program that you can run, and also a module that other code can
import with no surprise.
