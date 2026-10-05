---
title: Repair the third bug
requires: [verify:third-bug-repaired]
---

# Repair the third bug

The debugger showed you the cause of the third bug. Line 15 of
`spending/models.py` is the body of the method `month` of the class
`Purchase`:

```python
    def month(self):
        return self.date[:4]
```

The slice `[:4]` gives the first four characters of the date, which
are the year. You tried `self.date[:7]` in the debugger, and it gave
the year and the month.

## Your task

Do these three things in `spending/models.py`:

1. Change line 15, so that the method `month` returns the first
   seven characters of the date.

2. Remove the line `breakpoint()` from the method `total_by_month`.
   A program that still has a `breakpoint()` line in it stops in the
   debugger each time that someone runs it.

3. Save the file: hold `Ctrl` and press `S`, or `Cmd` and `S` on a
   Mac.

Then run `python -m spending spending.csv` in the terminal. When the
bug is repaired, the program does not stop, and it shows this report:

```
Purchases: 37
Total: 2834.79

Total for each category:
  rent: 1950.00
  food: 445.60
  transport: 181.30
  phone: 54.00
  hobbies: 63.49
  clothes: 140.40

Total for each month:
  2026-01: 917.20
  2026-02: 942.34
  2026-03: 975.25

Largest purchase: 2026-01-01 Rent for January 650.00
```

This is the report from the start of the workshop. Compare the two,
line by line.

````{hint}
:title: Open the file for me
```{file-open}
:id: open-models-third
:title: Open spending/models.py at line 15
:path: spending/models.py
:line: 15
```
````

````{hint}
:title: "Hint: how to correct it"
The correct line 15 is this. Keep the eight spaces at the start of
the line.

```python
        return self.date[:7]
```

The line `breakpoint()` is the first line of the body of the method
`total_by_month`, near the end of the file. Select the whole line and
remove it, so that the line `totals = {}` comes directly under
`def total_by_month(self):`.
````

```{hint}
:title: "Hint: when the terminal shows (Pdb)"
If the terminal shows the `(Pdb)` prompt when you run the program,
the line `breakpoint()` is still in the file, or the file is not
saved. Type `c` and press `Enter` to let the program run to its end.
Then remove the line, save the file, and run the program again.
```

If the hints were not enough, the box below holds a solution. It
opens after the check below has run one time.

```{attempt}
:id: third-bug-untouched
:check: third-bug-repaired
:expect: The totals for each month are still wrong
```

````{attempt}
:id: third-bug-breakpoint-left
:check: third-bug-repaired
:expect: but a breakpoint() line is still in the program

```{editor-replace}
:path: spending/models.py
:match: return self.date[:4]
return self.date[:7]
```
````

````{attempt}
:id: third-bug-print-left
:check: third-bug-repaired
:expect: but the program shows a line that is not a line of the report

```{editor-replace}
:path: spending/models.py
:match: breakpoint()
print("debug:", len(self.purchases))
```
````

````{attempt}
:id: third-bug-other-part-wrong
:check: third-bug-repaired
:expect: but another part of the report is wrong

```{file-write}
:path: spending/models.py
:from: solutions/models-3.py
```

```{editor-replace}
:path: spending/models.py
:match: totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + purchase.amount
totals[purchase.category] = purchase.amount
```
````

````{hint}
:title: Show me a solution
:unlock: "third-bug-repaired" in failed_checks or "third-bug-repaired" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The correct method `month` is this:

```python
    def month(self):
        return self.date[:7]
```

The first action below writes the file `spending/models.py` again,
with all three bugs repaired and with no `breakpoint()` line, and
saves it. Other changes that you made to the file are lost. The
second action runs the program.

```{file-write}
:id: third-bug-solution
:title: Write spending/models.py with the third bug repaired
:path: spending/models.py
:from: solutions/models-3.py
:open: true
```

```{execute}
:id: run-after-third
:title: Run the program
:wait: prompt
python -m spending spending.csv
```
````

```{verify}
:id: third-bug-repaired
:label: The report is correct, and no breakpoint() or print() line is left
:trigger: after:run-after-third; file-saved spending/models.py; terminal-output "2026-03: 975.25"
import os, re, subprocess, sys

def run(*options, breakpoints="0"):
    command = " ".join(["python -m spending spending.csv", *options])
    try:
        done = subprocess.run(
            [sys.executable, "-m", "spending", "spending.csv", *options],
            capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0", "PYTHONBREAKPOINT": breakpoints},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The check ran {command} and the program did not end after 10 seconds. Look for a loop that never ends in the code that you changed.") from None
    if "(Pdb)" in done.stdout:
        raise AssertionError(f"The report is correct now, but a breakpoint() line is still in the program. The check ran {command} and the program stopped in the debugger. Remove the line breakpoint() from spending/models.py, and save the file: hold Ctrl and press S, or Cmd and S on a Mac.")
    if done.returncode != 0:
        last = (done.stderr.strip().splitlines() or ["(no message)"])[-1]
        raise AssertionError(f"Python stopped with an error. Run the command in the terminal, and read the traceback from the last line. The check ran {command} and the last line of the error is: {last}")
    return command, done.stdout.splitlines()

def months_of(lines):
    if "Total for each month:" not in lines:
        return []
    rest = lines[lines.index("Total for each month:") + 1:]
    return [line.strip() for line in rest[:rest.index("")]] if "" in rest else []

def compare(lines, wanted, command):
    months = months_of(lines) or ["(nothing)"]
    assert months == months_of(wanted), f"The totals for each month are still wrong. The method month in spending/models.py must return the first 7 characters of the date, such as 2026-01. If you changed the method, save the file: hold Ctrl and press S, or Cmd and S on a Mac. The check ran {command}. Under Total for each month, the first line must be {months_of(wanted)[0]} and it is: {months[0]}"
    report = re.compile(r"Purchases: \d+|Total: \d+\.\d\d|Total for each (category|month):|  \S+: \d+\.\d\d|Largest purchase: .*|")
    extra = [line for line in lines if not report.fullmatch(line)]
    assert not extra, f"The months are correct now, but the program shows a line that is not a line of the report. Remove the print() line that shows it from the program, and save the file. The check ran {command} and the line is: {extra[0]}"
    different = [line for line in lines if line not in wanted] or ["(a line is missing)"]
    assert lines == wanted, f"The months are correct now, but another part of the report is wrong. Run the command in the terminal, and compare the report with the report on this page. The check ran {command} and the first line that is wrong is: {different[0].strip()}"

full = ["Purchases: 37", "Total: 2834.79", "", "Total for each category:", "  rent: 1950.00", "  food: 445.60", "  transport: 181.30", "  phone: 54.00", "  hobbies: 63.49", "  clothes: 140.40", "", "Total for each month:", "  2026-01: 917.20", "  2026-02: 942.34", "  2026-03: 975.25", "", "Largest purchase: 2026-01-01 Rent for January 650.00"]
february = ["Purchases: 6", "Total: 199.85", "", "Total for each category:", "  food: 199.85", "", "Total for each month:", "  2026-02: 199.85", "", "Largest purchase: 2026-02-28 Supermarket 71.20"]
command, lines = run()
compare(lines, full, command)
command, lines = run("--month", "2026-02", "--category", "food")
compare(lines, february, command)
run(breakpoints="")
print("Correct. The check ran python -m spending spending.csv and the report shows a total for each of the three months. It also ran the program with --month 2026-02 --category food, and the report shows 6 purchases. No breakpoint() line and no print() line is left.")
```

## One more thing that the bug broke

The method `month` is also used by the option `--month`. While the
bug was there, the command below showed `Purchases: 0`, because no
purchase had the month `2026-02`. Run it now, if you want to see the
report for February:

```
python -m spending spending.csv --month 2026-02
```

One bug can break several parts of a program. When you repair a bug,
run the other parts of the program that use the same code.

The program is correct now. The last page lists what you have
learned.
