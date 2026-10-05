---
title: Look inside with print()
requires: [verify:print-added, quiz:second-debug-line]
---

# Look inside with print()

A program in a terminal shows only what it prints. While it runs, you
cannot see the values that its names refer to. The most direct way to
see them is to add a `print()` line to the program, at the place that
you have doubts about. The line shows the values at that moment, each
time that Python reaches it.

This is the oldest way to find a bug, and programmers of every level
use it every day. It needs no new tool. It answers one question: what
does the program really do here? Very often the answer is different
from what you thought it did.

Think of a cook who tastes the soup while it cooks. The cook does not
wait until the meal is on the table to find that something is wrong.

## The method

Open `spending/models.py` in the editor, if it is not open, and find
lines 31 to 35:

```python
    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = purchase.amount
        return totals
```

The method makes a dictionary with the name `totals`. Each key is a
category, such as `"rent"`. The value for a key is meant to be the
total of that category. The loop looks at every purchase, one after
another, and line 34 gives the category of the purchase a value in
the dictionary.

Maybe you already see the mistake. Add the `print()` line all the
same. In a larger program you will not see the mistake by reading,
and this page is about the way to find it.

````{hint}
:title: Open the file for me
```{file-open}
:id: open-models-print
:title: Open spending/models.py at line 34
:path: spending/models.py
:line: 34
```
````

## Your task

Add one new line under line 34, inside the loop:

```python
            print("debug:", purchase.amount, totals[purchase.category])
```

The line begins with 12 spaces, the same number as line 34, so that
it belongs to the loop. It shows three things each time that the loop
runs:

- The text `debug:`. It marks the line, so that you can tell it from
  the lines of the report, and find it again later.

- `purchase.amount`, the amount of this purchase.

- `totals[purchase.category]`, the value that the dictionary now
  holds for the category of this purchase.

Then save the file: hold `Ctrl` and press `S`, or `Cmd` and `S` on a
Mac. Then run the program for the category `rent`. Click in the
terminal, type this command, and press `Enter`:

```
python -m spending spending.csv --category rent
```

````{hint}
:title: "Hint: where the line goes"
After your change, lines 31 to 36 look like this:

```python
    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = purchase.amount
            print("debug:", purchase.amount, totals[purchase.category])
        return totals
```
````

```{hint}
:title: "Hint: when Python shows an error"
If Python shows an `IndentationError`, the spaces at the start of your
new line are wrong. Click at the end of line 34 and press `Enter`.
The editor then starts the new line with the same 12 spaces. Type the
`print()` line there.

If the terminal shows the report and no line that begins with
`debug:`, the file is not saved. Look at the tab of the file. A dot
in place of the `x` means that the file has changes that are not
saved.
```

If the hints were not enough, the box below holds a solution. It
opens after the check below has run one time.

```{attempt}
:id: print-missing
:check: print-added
:expect: the program shows only the lines of the report
```

````{attempt}
:id: print-outside-loop
:check: print-added
:expect: so your print() line is outside the loop

```{editor-insert}
:path: spending/models.py
:regex: true
:match: ^        return totals$
        print("debug:", len(totals))
```
````

````{attempt}
:id: print-wrong-spaces
:check: print-added
:expect: because the spaces at the start of a line are wrong

```{editor-insert}
:path: spending/models.py
:regex: true
:match: ^        print\("debug:", len\(totals\)\)$
              print("debug:", purchase.amount)
```
````

````{hint}
:title: Show me a solution
:unlock: "print-added" in failed_checks or "print-added" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes the file `spending/models.py` again,
with the `print()` line under line 34, and saves it. Other changes
that you made to the file are lost. The second action runs the
program for the category `rent`.

```{file-write}
:id: print-solution
:title: Write spending/models.py with the print() line in it
:path: spending/models.py
:from: solutions/models-1-print.py
:open: true
```

```{execute}
:id: run-with-print
:title: Run the program for the category rent
:wait: prompt
python -m spending spending.csv --category rent
```
````

```{verify}
:id: print-added
:label: Your print() line runs each time that the loop runs
:trigger: after:run-with-print; file-saved spending/models.py; terminal-output "debug:"
import os, re, subprocess, sys

command = "python -m spending spending.csv --category rent"
try:
    done = subprocess.run(
        [sys.executable, "-m", "spending", "spending.csv", "--category", "rent"],
        capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0", "PYTHONBREAKPOINT": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError(f"The check ran {command} and the program did not end after 10 seconds. Look for a loop that never ends in the code that you changed.") from None
if done.returncode != 0:
    last = (done.stderr.strip().splitlines() or ["(no message)"])[-1]
    if last.startswith(("IndentationError", "TabError")):
        raise AssertionError(f"Python cannot read spending/models.py, because the spaces at the start of a line are wrong. The print() line must begin with 12 spaces, the same number as the line above it. The check ran {command} and the last line of the error is: {last}")
    raise AssertionError(f"Python stopped with an error. Run the command in the terminal, and read the traceback from the last line. The check ran {command} and the last line of the error is: {last}")
report = re.compile(r"Purchases: \d+|Total: \d+\.\d\d|Total for each (category|month):|  \S+: \d+\.\d\d|Largest purchase: .*|")
extra = [line for line in done.stdout.splitlines() if not report.fullmatch(line)]
assert extra, f"The check ran {command} and the program shows only the lines of the report. So no print() line of yours ran. Add the print() line under line 34 of spending/models.py, inside the loop. Then save the file: hold Ctrl and press S, or Cmd and S on a Mac."
assert len(extra) >= 3, f"The check ran {command}. The loop looks at three purchases, so a print() line inside the loop shows three lines. Your program shows fewer, so your print() line is outside the loop. It must begin with 12 spaces, the same number as line 34 above it. The number of lines that it showed is: {len(extra)}"
print(f"Correct. The check ran {command} and your print() line ran {len(extra)} times. The first line that it showed is: {extra[0]}")
```

## What the lines say

The terminal shows three new lines, and then the report:

```
debug: 650.00 650.00
debug: 650.00 650.00
debug: 650.00 650.00
Purchases: 3
Total: 1950.00
```

The three new lines come before the report. The reason is that the
program first makes all the lines of the report, and shows them only
at the end. Your `print()` line runs while the lines are made.

Each `debug:` line is one run of the loop, for one purchase of rent.
The first number is the amount of the purchase. The second number is
the value that the dictionary holds for `rent` after line 34 ran. It
is meant to be the total of the rent so far.

```{quiz}
:id: second-debug-line
:title: What a correct program shows
:type: text
question: "Think of a program with no bug. After the second purchase of rent, what is the total of the rent so far? Type the number that such a program shows at the end of the second `debug:` line."
answer:
  - "1300.00"
  - "1300"
  - "1300.0"
wrong:
  - { pattern: "650(\\.0+)?", explanation: "650.00 is what your program shows, and that is the bug. After two purchases of 650.00, the total so far is larger." }
  - { pattern: "1950(\\.0+)?", explanation: "1950.00 is the total after the third purchase. The question is about the second `debug:` line, after two purchases." }
otherwise: "After the first purchase, the total is 650.00. The second purchase is 650.00 too. Add the two numbers."
explanation: "A correct program shows 650.00, then 1300.00, then 1950.00: the total grows with each purchase. Your program shows 650.00 three times. So the total does not grow. Line 34 does not add the amount to the total. It replaces the total with the amount."
```

You did not need to guess. The program showed you what it does. On
the next page you repair line 34.
