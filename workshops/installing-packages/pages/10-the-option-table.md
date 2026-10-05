---
title: The option --table
requires: [verify:table-option-works, quiz:february-all]
---

# The option `--table`

The function `category_table` makes the table. Nothing shows it yet.
On this page you give the program a new option, `--table`, which shows
the table in place of the lines of the report.

## An option with no value

A **command line argument** is a word after the name of the program in
a command. An **option** is a command line argument that begins with
`--`. The program already has two options, `--month` and `--category`.
Each of them needs a value after it, such as `--month 2026-02`.

The option `--table` needs no value. It is there, or it is not there.
You add such an option with `action="store_true"`:

```python
parser.add_argument("--table", action="store_true", help="show the totals for each category as a table")
```

With `action="store_true"`, the module `argparse` gives `args.table`
the value `True` when the command holds `--table`, and the value
`False` when it does not. A switch on a wall is an everyday
comparison: it is on or off, and it needs nothing more.

## What the function `main` must do

The function `main` is in the file `cli.py` of the directory
`spending`. Change it in these ways:

- Add the option `--table` to the parser, with the line above, under
  the line that adds the option `--category`.

- Import the class `Console` from the module `rich.console`, and
  import the function `category_table` from the module `.report`, as
  the file already imports `report_lines`.

- At the end of `main`, use an `if` statement. When `args.table` is
  `True`, show the table with
  `Console().print(category_table(ledger))`. Else, show the lines of
  the report with the loop that is already there.

The name `ledger` refers to the purchases that `select()` chose, so
the table also follows the options `--month` and `--category`.

## Your task: add the option

The action below shows the file `cli.py` in the file browser.

```{file-browser-reveal}
:id: show-cli
:title: Show the file cli.py in the file browser
:path: spending/cli.py
```

Double-click the file `cli.py` to open it, make the changes, and save
the file: hold `Ctrl` and press `S`, or on a Mac hold `Cmd` and press
`S`.

Then look at the prompt. It must begin with `(.venv)`. Type this
command in the terminal, and press `Enter`:

```
python -m spending spending.csv --table
```

The terminal shows the table of the seven rows that the last page
listed, with the title `Spending` above it.

```{hint}
:title: Hint: where each change goes
The line `from rich.console import Console` goes with the line
`import argparse`, at the top of the file. The import of
`category_table` goes on the line that imports `report_lines`:
`from .report import category_table, report_lines`. The new
`add_argument` line goes above the line `args = parser.parse_args()`.
```

````{hint}
:title: Hint: the end of the function
The last lines of the function `main` have this shape. Replace each
`...` with the right code. Keep the four spaces at the start of each
line, since the lines are inside the function.

```python
    if ...:
        Console().print(...)
    else:
        for line in report_lines(ledger):
            print(line)
```
````

If the hints were not enough, the box below holds a solution. It
opens after the check below has run once.

```{attempt}
:id: option-missing
:check: table-option-works
:expect: The program did not accept the command
```

````{attempt}
:id: option-print
:check: table-option-works
:expect: shows the text <rich.table.Table object

```{file-write}
:path: spending/cli.py
:from: answers/cli-print.py
```
````

````{attempt}
:id: option-always
:check: table-option-works
:expect: with no option --table, must show the report as lines of text

```{file-write}
:path: spending/cli.py
:from: answers/cli-always.py
```
````

````{attempt}
:id: option-unfiltered
:check: table-option-works
:expect: must show the totals of February 2026 only

```{file-write}
:path: spending/cli.py
:from: answers/cli-unfiltered.py
```
````

````{attempt}
:id: option-no-import
:check: table-option-works
:expect: NameError: name 'Console' is not defined

```{file-write}
:path: spending/cli.py
:from: answers/cli-error.py
```
````

````{hint}
:title: Show me a solution
:unlock: "table-option-works" in failed_checks or "table-option-works" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes a solution to the file
`spending/cli.py`, and opens it in the editor. It replaces what the
file holds now. Compare it with your own code. The second action runs
the program with the option `--table`.

```{file-write}
:id: cli-solution
:title: Write a solution to spending/cli.py
:path: spending/cli.py
:from: answers/cli-solution.py
:open: true
```

```{execute}
:id: run-table
:title: Run the program with the option --table
:wait: prompt
python -m spending spending.csv --table
```
````

```{verify}
:id: table-option-works
:label: The option --table shows the table
:trigger: file-saved spending/cli.py; terminal-output "Spending"
import os, subprocess
from pathlib import Path

assert Path(".venv/bin/python").exists(), "There is no environment .venv in your work directory. Make it and activate it, then run python -m pip install -r requirements.txt."
plain = {name: value for name, value in os.environ.items() if name not in ("FORCE_COLOR", "CLICOLOR_FORCE")}
plain.update({"NO_COLOR": "1", "PYTHON_COLORS": "0", "COLUMNS": "80"})


def run(*words):
    command = "python -m spending " + " ".join(words)
    try:
        done = subprocess.run(
            [".venv/bin/python", "-m", "spending", *words],
            capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL, env=plain,
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The command {command} did not end after 30 seconds. Look for a loop that never ends.") from None
    last = (done.stderr.strip().splitlines() or ["(nothing)"])[-1]
    if done.returncode == 2 and "--table" in words:
        raise AssertionError(f"The program did not accept the command {command}. The last line of the error is: {last}. Add the option with parser.add_argument(\"--table\", action=\"store_true\", help=...), and save the file cli.py.")
    if done.returncode != 0 and last.startswith("NameError"):
        raise AssertionError(f"Python stopped with an error when it ran {command}. The last line of the error is: {last}. A module must import each name that it uses. Check that cli.py imports Console from rich.console, and category_table from .report. Then save the file.")
    if done.returncode != 0:
        raise AssertionError(f"Python stopped with an error when it ran {command}. The last line of the error is: {last}. Read the line of the file that the error names, correct it, and save the file.")
    return command, done.stdout


command, shown = run("spending.csv", "--table")
if "<rich.table.Table object" in shown:
    raise AssertionError(f"The command {command} shows the text <rich.table.Table object at 0x...>, and not the table. The function print() shows only the default text of an object. Show the table with Console().print(...), and save the file cli.py.")
if "Purchases: 37" in shown:
    raise AssertionError(f"The command {command} shows the report as lines of text, and not the table. Use args.table in an if statement: when it is True, show the table, and else show the lines. Save the file cli.py.")
if "Category" not in shown or "2834.79" not in shown:
    raise AssertionError(f"The command {command} must show the table of the totals for each category, with the row All and the total 2834.79. Use Console().print(category_table(ledger)), and save the file cli.py.")
command, shown = run("spending.csv")
if not shown.startswith("Purchases: 37"):
    raise AssertionError(f"The command {command}, with no option --table, must show the report as lines of text, as it did before. Its first line must be Purchases: 37. Put the loop over report_lines(ledger) in the else part of the if statement, and save the file cli.py.")
command, shown = run("spending.csv", "--month", "2026-02", "--table")
if "942.34" not in shown:
    raise AssertionError(f"The command {command} must show the totals of February 2026 only, so the row All must show 942.34. Give category_table the name ledger, which refers to the purchases that select() chose, and save the file cli.py.")
print("Correct. The option --table shows the table, and the program without it shows the lines as before.")
```

## The table of one month

The options work together. Type this command in the terminal, and
press `Enter`:

```
python -m spending spending.csv --month 2026-02 --table
```

````{hint}
:title: Run the command for me

```{execute}
:id: run-february
:title: Show the table of February 2026
:wait: prompt
python -m spending spending.csv --month 2026-02 --table
```
````

```{quiz}
:id: february-all
:title: The total of one month
:type: text
question: "What does the row `All` of this table show in the column `Total`?"
answer: "942.34"
wrong:
  - { text: "2834.79", explanation: "That is the total of all three months. Check that the command holds `--month 2026-02`, and look at the new table." }
otherwise: "Look at the last row of the new table, the row `All`. Type the number in its second column."
explanation: "The purchases of February 2026 cost `942.34` together. The function `select()` chose those purchases, and `category_table` made the table from them."
```
