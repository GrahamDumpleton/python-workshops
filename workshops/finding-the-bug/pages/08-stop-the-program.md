---
title: Stop the program and look
requires: [verify:breakpoint-added, quiz:month-shown, verify:program-continued]
---

# Stop the program and look

A **debugger** is a program that runs your program one line at a
time. It stops your program at a place that you choose. While the
program is stopped, you can ask for the value of any name, as many
times as you like. Then you let the program run the next line, and
you look again.

With a `print()` line, you decide what to show before the program
runs. If the answer gives you a new question, you change the file and
run the program again. With a debugger, you ask the new question at
once, in the same run.

Think of a video that you pause. While it is paused, you can look at
one picture for as long as you need. Then you let it continue.

Python comes with a debugger. Its name is `pdb`. To use it, you add
one line to your program: `breakpoint()`. This is a function that
comes with Python. When Python reaches the line, it stops the program
there, and starts the debugger. Programmers call a place where a
debugger stops a program a **breakpoint**.

## The third bug

Run `python -m spending spending.csv` in the terminal, and look at
the end of the report:

```
Total for each month:
  2026: 2834.79
```

The data has purchases in three months. So the correct report has
three lines here, for `2026-01`, `2026-02` and `2026-03`. The program
shows one line, for the whole year.

These numbers come from the method `total_by_month` of the ledger, in
lines 37 to 41 of `spending/models.py`:

```python
    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), Decimal("0")) + purchase.amount
        return totals
```

This method has the same form as the method that you repaired, and it
adds the amounts correctly. The keys of its dictionary come from
`purchase.month()`. You stop the program inside this method, and
look.

## Your task

Open `spending/models.py` in the editor, if it is not open. Add the
line `breakpoint()` as the first line of the body of the method
`total_by_month`, above the line `totals = {}`. The new line begins
with 8 spaces, the same number as the line under it:

```python
    def total_by_month(self):
        breakpoint()
        totals = {}
```

Then save the file: hold `Ctrl` and press `S`, or `Cmd` and `S` on a
Mac. Do not run the program yet.

````{hint}
:title: Open the file for me
```{file-open}
:id: open-models-breakpoint
:title: Open spending/models.py at line 37
:path: spending/models.py
:line: 37
```
````

```{hint}
:title: "Hint: where the line goes"
Click at the end of line 37, which is `def total_by_month(self):`,
and press `Enter`. The editor starts a new line with 8 spaces. Type
`breakpoint()` there. The line has no text between the parentheses.

Put the line above the loop, and not inside it. A breakpoint inside
the loop stops the program one time for each of the 37 purchases.
```

If the hint was not enough, the box below holds a solution. It opens
after the check below has run one time.

```{attempt}
:id: breakpoint-missing
:check: breakpoint-added
:expect: It did not stop, so Python did not meet a breakpoint() line
```

````{attempt}
:id: breakpoint-in-loop
:check: breakpoint-added
:expect: The program stopped again

```{editor-insert}
:path: spending/models.py
:regex: true
:match: ^            totals\[purchase\.month\(\)\] = .*$
            breakpoint()
```
````

````{attempt}
:id: breakpoint-other-method
:check: breakpoint-added
:expect: The program must stop in the method total_by_month

```{file-write}
:path: spending/models.py
:from: solutions/models-2.py
```

```{editor-insert}
:path: spending/models.py
:regex: true
:match: ^    def total_by_category\(self\):$
:position: after
        breakpoint()
```
````

````{attempt}
:id: breakpoint-wrong-spaces
:check: breakpoint-added
:expect: The line breakpoint() must begin with 8 spaces

```{file-write}
:path: spending/models.py
:from: solutions/models-2.py
```

```{editor-insert}
:path: spending/models.py
:regex: true
:match: ^    def total_by_month\(self\):$
:position: after
          breakpoint()
```
````

````{hint}
:title: Show me a solution
:unlock: "breakpoint-added" in failed_checks or "breakpoint-added" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes the file `spending/models.py` again, with the
line `breakpoint()` at the start of the method `total_by_month`, and
saves it. Other changes that you made to the file are lost.

```{file-write}
:id: breakpoint-solution
:title: Write spending/models.py with the breakpoint() line in it
:path: spending/models.py
:from: solutions/models-2-breakpoint.py
:open: true
```
````

```{verify}
:id: breakpoint-added
:label: The program stops one time, in the method total_by_month
:trigger: after:breakpoint-solution; file-saved spending/models.py
import os, re, subprocess, sys

command = "python -m spending spending.csv"
try:
    done = subprocess.run(
        [sys.executable, "-m", "spending", "spending.csv"], input="c\n",
        capture_output=True, text=True, timeout=10,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError(f"The check ran {command} and the program did not end after 10 seconds. Look for a loop that never ends in the code that you changed.") from None
stops = re.findall(r"> .*\((\d+)\)(\w+)\(\)$", done.stdout, flags=re.MULTILINE)
if not stops and done.returncode != 0:
    last = (done.stderr.strip().splitlines() or ["(no message)"])[-1]
    if last.startswith(("IndentationError", "TabError")):
        raise AssertionError(f"Python cannot read spending/models.py, because the spaces at the start of a line are wrong. The line breakpoint() must begin with 8 spaces, the same number as the line under it. The check ran {command} and the last line of the error is: {last}")
    raise AssertionError(f"Python stopped with an error. Run the command in the terminal, and read the traceback from the last line. The check ran {command} and the last line of the error is: {last}")
assert stops, f"The check ran {command} and the program ran to its end. It did not stop, so Python did not meet a breakpoint() line. Add the line breakpoint() as the first line of the body of the method total_by_month in spending/models.py. Then save the file: hold Ctrl and press S, or Cmd and S on a Mac."
assert stops[0][1] == "total_by_month", f"The program must stop in the method total_by_month. Move the line breakpoint() into that method, as the first line of its body, and save the file. The check ran {command} and the program stopped in: {stops[0][1]}"
assert len(stops) == 1, f"The check ran {command} and gave the debugger the command c one time. The program stopped again. This happens when the line breakpoint() is inside the loop, or when the file has more than one breakpoint() line. Keep one breakpoint() line, as the first line of the body of the method total_by_month, above the loop. Then save the file."
print(f"Correct. The check ran {command} and the program stopped one time, at line {stops[0][0]} of spending/models.py, in the method total_by_month.")
```

## Run the program

Click in the terminal, type `python -m spending spending.csv` and
press `Enter`.

````{hint}
:title: Run the command for me
```{execute}
:id: run-to-breakpoint
:title: Run the program
:wait: 2s
python -m spending spending.csv
```
````

The program does not show the report. The terminal shows three lines.
Three dots stand here for the first part of the path, which is
different on every computer:

```
> .../spending/models.py(38)total_by_month()
-> breakpoint()
(Pdb)
```

- The first line says where the program is stopped: the file, the
  line number in parentheses, and the method.

- The second line begins with an arrow, `->`. It shows the line of
  code at which the program is stopped.

- `(Pdb)` is the prompt of the debugger. It shows that the debugger
  is ready for a command.

The program has not ended. It is stopped in the middle, and it waits
for you. While the last line of the terminal begins with `(Pdb)`,
what you type goes to the debugger, and not to the shell. Each
command of the debugger that you use here is one letter, and you
press `Enter` after it.

On this page, the actions below type each command for you, so that
you can watch what it does. Click them in order, and click each one
only while the terminal shows the `(Pdb)` prompt.

## Where am I: the command l

The command `l` is short for "list". It shows the lines of the file
round the place where the program is stopped.

```{execute}
:id: pdb-list
:title: List the code round the stopped line
:wait: 1s
l
```

The debugger shows about eleven lines, each with its line number. The
arrow `->` marks line 38, where the program is stopped.

## Run one line: the command n

The command `n` is short for "next". It runs one line of your
program, and stops again at the line after it.

```{execute}
:id: pdb-next-1
:title: Run one line
:wait: 1s
n
```

The arrow is now at `totals = {}`. The line with the arrow is always
the line that runs next. It has not run yet.

Run two more lines. Click each action one time.

```{execute}
:id: pdb-next-2
:title: Run one more line
:wait: 1s
n
```

```{execute}
:id: pdb-next-3
:title: Run one more line again
:wait: 1s
n
```

The program is now inside the loop, at line 41, in the first run of
the loop:

```
-> totals[purchase.month()] = totals.get(purchase.month(), Decimal("0")) + purchase.amount
```

## Look at a value: the command p

The command `p` is short for "print". After it you write a name, or
any expression, and the debugger shows its value.

```{execute}
:id: pdb-print-purchase
:title: Show the value of the name purchase
:wait: 1s
p purchase
```

The debugger shows the purchase that the loop holds now:

```
Purchase(date='2026-01-01', description='Rent for January', amount=Decimal('650.00'), category='rent')
```

It is the first purchase of the file, from January. Line 41 uses
`purchase.month()` as the key of the dictionary. For this purchase,
the key must be `'2026-01'`. Ask the debugger what it is.

```{execute}
:id: pdb-print-month
:title: Show what purchase.month() gives
:wait: 1s
p purchase.month()
```

```{quiz}
:id: month-shown
:title: What the debugger shows
:type: text
question: "What does the debugger show for `p purchase.month()`? Type it."
answer:
  - "'2026'"
  - "2026"
  - "\"2026\""
wrong:
  - { pattern: "['\"]?2026-01['\"]?", explanation: "`'2026-01'` is what a correct program gives. Look at the terminal: the line under `p purchase.month()` is shorter." }
  - { pattern: "['\"]?2026-01-01['\"]?", explanation: "`'2026-01-01'` is the whole date of the purchase. Look at the line under `p purchase.month()` in the terminal." }
otherwise: "Look at the terminal. The answer is the line directly under `(Pdb) p purchase.month()`."
explanation: "The method `month` gives `'2026'`, which is the year, where it must give `'2026-01'`. So every purchase gets the same key, and the report has one line for the whole year. The method `total_by_month` is correct. The bug is in the method `month`."
```

You asked two questions in one run of the program, and you did not
change the file between them.

## Let the program continue: the command c

The command `c` is short for "continue". The program runs on from the
place where it is stopped, until it ends or until it meets a
breakpoint again.

```{attempt}
:id: still-stopped
:check: program-continued
:expect: It is still stopped in the debugger
```

```{execute}
:id: pdb-continue
:title: Let the program continue
:wait: prompt
c
```

The program runs to its end and shows the report. The prompt of the
shell is back.

```{verify}
:id: program-continued
:label: The program has run to its end
:trigger: after:pdb-continue; terminal-output "Largest purchase"
import os, subprocess
found = subprocess.run(["pgrep", "-u", str(os.getuid()), "-f", "spending spending[.]csv"], capture_output=True, text=True)
assert found.returncode != 0, "The program has not ended. It is still stopped in the debugger. Click in the terminal, type c and press Enter."
print("Correct. The program ran to its end, and the shell is ready for a new command.")
```

## Two things to know

When you press `Enter` on an empty line at the `(Pdb)` prompt, the
debugger performs your last command again. This is useful with `n`.
It can also surprise you.

Never leave a program stopped and forget it. Before you type a
command for the shell, look at the last line of the terminal. If it
begins with `(Pdb)`, type `c` and press `Enter` first.

You know where the bug is now. On the next page you go inside the
method `month`, and you try the correction before you change the
file.
