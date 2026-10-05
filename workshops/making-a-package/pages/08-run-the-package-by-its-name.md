---
title: Run the package by its name
requires: [verify:package-runs, quiz:march-total]
---

# Run the package by its name

Python can run a package as a program, by its name. On this page you
give the package the one file that this needs, and you run the
spending tracker with its new command.

## Running by name with `-m`

The command `python` can take `-m` as its first word. The letter is
short for "module". After `-m` you write a name, and not a path:

```
python -m spending spending.csv
```

With `-m`, Python looks for the name `spending` in the same way that
`import spending` does: in the directories of `sys.path`. Here the
first directory of that list is the directory that the
terminal is in. Python finds the package there. Because Python found
the package by its name, it knows the package of every module inside
it, and the relative imports work.

You have seen `-m` before if you did the workshop **Where imports
come from**: the command `python -m site` runs a module of the
standard library.

## The file `__main__.py`

A package holds several modules. Which of them does the command
`python -m spending` run? Python has a rule for this. It runs the
file with the name `__main__.py` inside the package.

You know the string `"__main__"`. It is the value of `__name__` in
the file that was started as the program. The file `__main__.py` uses
the same word for the same idea: it is the file that runs when the
package is started as a program.

Your package has no such file yet. See what Python says. Type this
command in the terminal, and press `Enter`:

```
python -m spending spending.csv
```

Python shows one line. It begins with the path of the program
`python`, which is different on every computer, and it ends with
these words:

```
No module named spending.__main__; 'spending' is a package and cannot be directly executed
```

Python found the package, and it looked for the module
`spending.__main__`, which is the file `spending/__main__.py`.

## Your task

Do two things.

**First, make the file `__main__.py` inside the directory
`spending`.** The action below shows that directory in the file
browser, because the file browser may show another place now.

```{file-browser-reveal}
:id: show-package-again
:title: Show the directory spending in the file browser
:path: spending/cli.py
```

Make the file in the way that you made `__init__.py`. Click the empty
space under the list of files with the right button of the mouse, and
click `New File` in the menu. Type the name `__main__.py` and press
`Enter`. Then double-click the file to open it.

The file needs two lines of code:

- a line that imports the function `main` from the module `cli` of
  this package, with a relative import

- a line that calls the function `main`

Save the file.

**Second, remove the last two lines of the file `spending/cli.py`.**
They are these lines:

```python
if __name__ == "__main__":
    main()
```

These lines started the program when the file was run as a script.
The file `cli.py` is not run as a script now. The package has one
place that starts the program, and that place is `__main__.py`.
Remove the two lines, so that the function `main` is the end of the
file, and save the file.

Then run the program with the new command, and click `Check` below.

```{hint}
:title: Hint: the import
The import has the form of the relative imports that you wrote on the
page before: the word `from`, a dot and the name of the module, the
word `import`, and the name to get. The module is `cli` and the name
is `main`.
```

```{hint}
:title: Hint: the call
A call is the name of the function and a pair of parentheses. The
function `main` takes no arguments, so the parentheses are empty.
The line begins at the left edge, with no spaces before it.
```

```{hint}
:title: Hint: the program shows nothing
If the command shows nothing and no error, the file `__main__.py`
imports the function but does not call it. A second reason can be
that the file is not saved.
```

```{attempt}
:id: main-not-made
:check: package-runs
:expect: There is no file __main__.py in the directory spending yet
```

````{attempt}
:id: main-outside
:check: package-runs
:expect: is in your work directory, and it must be inside the directory spending

```{file-write}
:path: __main__.py
from .cli import main

main()
```
````

````{attempt}
:id: main-untitled
:check: package-runs
:expect: still has the name untitled.txt

```{file-delete}
:path: __main__.py
```

```{file-write}
:path: spending/untitled.txt
from .cli import main

main()
```
````

````{attempt}
:id: main-no-call
:check: package-runs
:expect: and the program showed nothing

```{file-delete}
:path: spending/untitled.txt
```

```{file-write}
:path: spending/__main__.py
from .cli import main
```
````

````{attempt}
:id: main-no-dot
:check: package-runs
:expect: The last line of the error is: ModuleNotFoundError

```{file-write}
:path: spending/__main__.py
from cli import main

main()
```
````

````{attempt}
:id: main-other-output
:check: package-runs
:expect: The first two lines must be Purchases: 37 and Total: 2834.79

```{file-write}
:path: spending/__main__.py
print("Purchases: 0")
```
````

````{hint}
:title: Show me a solution
:unlock: "package-runs" in failed_checks or "package-runs" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action writes the file `__main__.py`. The second action
writes the file `cli.py` with its last two lines removed. The third
action runs the program.

```{file-write}
:id: main-solution
:title: Write the file spending/__main__.py
:path: spending/__main__.py
:open: true
"""Runs the spending tracker for the command python -m spending."""

from .cli import main

main()
```

```{file-write}
:id: cli-tidy-solution
:title: Write spending/cli.py with the last two lines removed
:path: spending/cli.py
:open: true
"""The command line of the spending tracker."""

import argparse

from .report import report_lines
from .storage import read_ledger


def main():
    parser = argparse.ArgumentParser(description="Report on the purchases in a CSV file.")
    parser.add_argument("filename", help="the CSV file that holds the purchases")
    parser.add_argument("--month", help="report on one month only, for example 2026-02")
    parser.add_argument("--category", help="report on one category only, for example food")
    args = parser.parse_args()

    ledger = read_ledger(args.filename).select(month=args.month, category=args.category)
    for line in report_lines(ledger):
        print(line)
```

```{execute}
:id: run-package-solution
:title: Run the package
:wait: prompt
python -m spending spending.csv
```
````

```{verify}
:id: package-runs
:label: The command python -m spending shows the report
:trigger: file-saved spending/__main__.py; terminal-output "Largest purchase"; after:run-package-solution
import os, subprocess, sys
from pathlib import Path

if not Path("spending/__main__.py").exists():
    if Path("__main__.py").exists():
        raise AssertionError("The file __main__.py is in your work directory, and it must be inside the directory spending. Move it with this command in the terminal: mv __main__.py spending/")
    if Path("spending/untitled.txt").exists():
        raise AssertionError("The new file still has the name untitled.txt. In the file browser, click the file with the right button of the mouse, and click Rename in the menu. Then type __main__.py and press Enter.")
    raise AssertionError("There is no file __main__.py in the directory spending yet. Make the file in the file browser. Check the name: two underscores, the word main, two underscores, and .py at the end.")
tries = [
    (["spending.csv"], "Purchases: 37", "Total: 2834.79"),
    (["spending.csv", "--month", "2026-02"], "Purchases: 12", "Total: 942.34"),
    (["spending.csv", "--category", "food"], "Purchases: 17", "Total: 445.60"),
]
for words, first, second in tries:
    command = "python -m spending " + " ".join(words)
    try:
        run = subprocess.run(
            [sys.executable, "-m", "spending", *words],
            capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The check ran {command}, and the program did not end after 10 seconds. Look for a loop that never ends.") from None
    if run.returncode != 0:
        last = run.stderr.strip().splitlines()[-1]
        raise AssertionError(f"Python stopped with an error when the check ran {command}. The last line of the error is: {last}. Check the two lines of spending/__main__.py: the import begins with from .cli and the call is main() with empty parentheses. Then save the file.")
    lines = run.stdout.splitlines()
    if not run.stdout.strip():
        raise AssertionError(f"The check ran {command}, and the program showed nothing. The file spending/__main__.py must call the function: write main() on a line of its own, with no spaces before it. Then save the file.")
    shown = " and ".join(lines[:2])
    assert lines[:2] == [first, second], f"The check ran {command}. The first two lines must be {first} and {second}, but the program showed {shown}. The file spending/__main__.py must only import the function main and call it. Change the file, and save it."
print("The check ran python -m spending three times: with spending.csv, with --month 2026-02 and with --category food. Each report was correct.")
```

## See it work

The words after the name of the package go to the program, as they
did before. Run the report for one month. Type this command in the
terminal, and press `Enter`:

```
python -m spending spending.csv --month 2026-03
```

```{quiz}
:id: march-total
:type: text
:case: false
question: "What is the second line of this report in the terminal? Type the whole line."
answer:
  - { pattern: "Total:\\s*975\\.25", example: "Total: 975.25" }
wrong:
  - { text: "975.25", explanation: "That is the amount. The line also has a word before the amount. Type the whole line." }
  - { pattern: "Purchases:.*", explanation: "That is the first line of the report. The second line is under it." }
  - { pattern: "Total:\\s*2834\\.79", explanation: "That is the total of all three months. Run the command with `--month 2026-03` at the end, and read the second line again." }
otherwise: "The second line of the report begins with the word `Total`."
explanation: "Mariam spent 975.25 in March 2026. The command line arguments `spending.csv` and `--month 2026-03` reached the function `main` in the same way as before. Only the start of the command changed, from `python main.py` to `python -m spending`."
```

## What happened

When you ran `python -m spending spending.csv`, Python did these
steps:

1. It looked for the name `spending` and found the package in your
   work directory.

2. It ran the file `spending/__init__.py`, as it does every time that
   a package is imported.

3. It ran the file `spending/__main__.py`.

4. The first line of that file imported `main` from the module `cli`
   of the package. The module `cli` imported `report` and `storage`,
   and `storage` imported `models`. Every one of these imports is
   relative, and every one worked, because Python knew the package.

5. The last line called `main()`, and the program showed the report.

One thing matters about the place. The command works when the
terminal is in the directory that holds the package, which is your
work directory. Python looks for the name `spending` there.
