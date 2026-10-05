---
title: Options for the report
requires: [verify:options-work]
---

# Options for the report

This is the last step. The program gets two options, `--month` and
`--category`, and `main()` gives their values to your method
`select()`. Then one command asks for the report that Mariam wants:

```
python spending.py spending.csv --month 2026-02 --category food
```

## Why the two parts fit together

An option that the command does not give has the value `None`. Your
method `select()` treats `None` as "every month" or "every
category". So `main()` does not need an `if` block. It gives
`args.month` and `args.category` to `select()` in every case, and
the method does the right thing.

This was the reason for the default value `None` on the page before
this one.

## Your task

Change the function `main()` in the file `spending.py`.

- Add the option `--month` to the parser. Give it a help text, in
  your own words.

- Add the option `--category` to the parser. Give it a help text, in
  your own words.

- After `read_ledger()` has made the ledger, call its method
  `select()` with `month=args.month` and `category=args.category`.
  Give the ledger that `select()` returns to `report_lines()`.

When your program works, these are the results:

| The command | The first line of the report |
|------|------|
| `python spending.py spending.csv` | `Purchases: 37` |
| `python spending.py spending.csv --month 2026-02` | `Purchases: 12` |
| `python spending.py spending.csv --category food` | `Purchases: 17` |
| `python spending.py spending.csv --month 2026-02 --category food` | `Purchases: 6` |

Save the file when you have changed it: hold `Ctrl` and press `S`,
or on a Mac hold `Cmd` and press `S`. Then run the program. Click in
the terminal, type the command, and press `Enter`:

```
python spending.py spending.csv --month 2026-02 --category food
```

When your program works, the terminal shows:

```
Purchases: 6
Total: 199.85

Total for each category:
  food: 199.85

Total for each month:
  2026-02: 199.85

Largest purchase: 2026-02-28 Supermarket 71.20
```

```{hint}
:title: Hint: the options
An option is added in the same way as `--greeting` in the script
`greet.py`: `parser.add_argument("--month", help="...")`. Put the
two new lines under the line that adds `filename`, and above the
line that calls `parse_args()`.
```

```{hint}
:title: Hint: the call of select
The line `ledger = read_ledger(args.filename)` makes a ledger of
every purchase. Add one line under it, which makes the name `ledger`
refer to the ledger of the selected purchases:

`ledger = ledger.select(month=args.month, category=args.category)`

You can also write both calls in one line:
`ledger = read_ledger(args.filename).select(month=args.month, category=args.category)`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the message first.

A message that begins with `usage` and says `unrecognized arguments`
comes from the parser. It means that the parser does not know the
option. Check the spelling in `add_argument()`, and check that the
name begins with `--`.

An `AttributeError` that names `Namespace` means that `args` has no
attribute with that name. The attribute has the name of the option
with no `--`: `args.month` and `args.category`.
```

If the hints were not enough, the box below holds a solution. It
opens after you have saved the file, or after you have clicked
`Check`.

```{attempt}
:id: options-not-started
:check: options-work
:expect: The check ran python spending.py spending.csv --month 2026-02. Your program did not accept this command
```

````{attempt}
:id: options-no-file
:check: options-work
:expect: There is no file spending.py in your work directory

```{file-delete}
:path: spending.py
```
````

````{attempt}
:id: options-unused
:check: options-work
:expect: The first line of the report must be Purchases: 12, and your program showed: Purchases: 37. Give args.month to the method select() as month

```{file-write}
:path: spending.py
:from: answers/options-unused.py
```
````

````{attempt}
:id: options-month-only
:check: options-work
:expect: The check ran python spending.py spending.csv --category food. Your program did not accept this command

```{file-write}
:path: spending.py
:from: answers/options-month-only.py
```
````

````{attempt}
:id: options-category-ignored
:check: options-work
:expect: The first line of the report must be Purchases: 17, and your program showed: Purchases: 37. Give args.category to the method select() as category

```{file-write}
:path: spending.py
:from: answers/options-category-ignored.py
```
````

````{attempt}
:id: options-either
:check: options-work
:expect: The first line of the report must be Purchases: 6, and your program showed: Purchases: 12. When the command gives both options

```{file-write}
:path: spending.py
:from: answers/options-either.py
```
````

````{attempt}
:id: options-zero
:check: options-work
:expect: The first line of the report must be Purchases: 37, and your program showed: Purchases: 0. With no option

```{file-write}
:path: spending.py
:from: answers/options-zero.py
```
````

````{attempt}
:id: options-error
:check: options-work
:expect: Python stopped with an error. The last line of the error is: AttributeError

```{file-write}
:path: spending.py
:from: answers/options-error.py
```
````

````{hint}
:title: Show me a solution
:unlock: "options-work" in failed_checks or "options-work" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes the whole file `spending.py` again,
with a working function `main()`. It replaces what the file holds
now. The second action runs the program. Compare the function with
your own.

The new function is:

```python
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

```{file-write}
:id: options-solution
:title: Write a solution to spending.py
:path: spending.py
:from: answers/options-solution.py
:open: true
```

```{execute}
:id: options-run
:wait: prompt
python spending.py spending.csv --month 2026-02 --category food
```
````

```{verify}
:id: options-work
:label: spending.py reports on one month, on one category, or on both
:trigger: file-saved spending.py; after:options-run
import os, subprocess, sys
from pathlib import Path

assert Path("spending.py").exists(), "There is no file spending.py in your work directory. Open the box with the title Show me a solution on this page. Its first action writes the file again."

cases = [
    ([], "Purchases: 37", "With no option, the report must hold every purchase. An option that the command does not give has the value None, and select() must then leave nothing out."),
    (["--month", "2026-02"], "Purchases: 12", "Give args.month to the method select() as month."),
    (["--category", "food"], "Purchases: 17", "Give args.category to the method select() as category."),
    (["--month", "2026-02", "--category", "food"], "Purchases: 6", "When the command gives both options, give both values to one call of select()."),
    (["--category", "rent", "--month", "2026-03"], "Purchases: 1", "When the command gives both options, give both values to one call of select()."),
]
for words, wanted, advice in cases:
    command = " ".join(["python", "spending.py", "spending.csv", *words])
    try:
        run = subprocess.run(
            [sys.executable, "spending.py", "spending.csv", *words],
            capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The check ran {command} and your program did not end after 5 seconds. Look for a loop that never ends.") from None
    last = (run.stderr.strip().splitlines() or ["no message"])[-1]
    first = (run.stdout.strip().splitlines() or ["no text"])[0]
    assert run.returncode != 2, f"The check ran {command}. Your program did not accept this command. Add each option to the parser, with parser.add_argument(\"--month\") and parser.add_argument(\"--category\"). Save the file after you change it. Your program said: {last}"
    assert run.returncode == 0, f"The check ran {command} and Python stopped with an error. The last line of the error is: {last}"
    assert first == wanted, f"The check ran {command}. The first line of the report must be {wanted}, and your program showed: {first}. {advice} Save the file after you change it."
print("Correct. Your program reports on 37 purchases with no option, on 12 with --month 2026-02, on 17 with --category food, and on 6 with both.")
```

## The program explains itself

You did not write any help text for the whole program, but it has
one. Try the command `python spending.py --help`. With the solution
of this page, the terminal shows:

```
usage: spending.py [-h] [--month MONTH] [--category CATEGORY] filename

Report on the purchases in a CSV file.

positional arguments:
  filename             the CSV file that holds the purchases

options:
  -h, --help           show this help message and exit
  --month MONTH        report on one month only, for example 2026-02
  --category CATEGORY  report on one category only, for example food
```

Your descriptions are in your own words, so your help text can
differ in those places.

An option whose value fits no purchase gives a short report, with no
error. For example, `python spending.py spending.csv --month 2027-01`
shows one line, `Purchases: 0`, because no purchase is in that
month.
