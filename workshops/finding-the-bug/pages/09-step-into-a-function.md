---
title: Go inside a function
requires: [quiz:slice-tried, verify:debugger-left]
---

# Go inside a function

The command `n` runs one whole line. When the line calls a function,
`n` runs the whole function too, and stops at the next line. You do
not see what happened inside the function.

The command `s` is short for "step". It also runs one line. But when
the line calls a function of yours, `s` goes inside that function,
and stops at its first line. So you can follow the program into the
code that a line calls.

Think of directions that say "take the bus to the station". With `n`,
you arrive at the station. With `s`, you get on the bus and see each
stop on the way.

On the last page, the debugger showed that `purchase.month()` gives a
wrong value. Now you go inside the method `month` to see why.

## Stop at the same place

The line `breakpoint()` is still in `spending/models.py`. Run the
program again. Click in the terminal, type
`python -m spending spending.csv` and press `Enter`.

The program stops at the breakpoint, and the terminal shows the
`(Pdb)` prompt. Now type `n` and press `Enter`. Do this three times,
as on the last page. After the third time, the arrow is at the line
that begins with `totals[purchase.month()]`.

````{hint}
:title: Do these steps for me
The first action runs the program. Each of the other three actions
types `n` one time. Click them in order.

```{execute}
:id: run-to-breakpoint-again
:title: Run the program
:wait: 2s
python -m spending spending.csv
```

```{execute}
:id: step-next-1
:title: Run one line
:wait: 1s
n
```

```{execute}
:id: step-next-2
:title: Run one more line
:wait: 1s
n
```

```{execute}
:id: step-next-3
:title: Run one more line again
:wait: 1s
n
```
````

## Go inside: the command s

The line with the arrow calls `purchase.month()`. The action below
types the command `s`. Click it only while the terminal shows the
`(Pdb)` prompt.

```{execute}
:id: pdb-step-in
:title: Go inside the function that the line calls
:wait: 1s
s
```

The terminal shows this. Three dots stand for the first part of the
path:

```
--Call--
> .../spending/models.py(14)month()
-> def month(self):
```

The word `--Call--` says that the program went inside a function. The
line under it says which one: the program is now at line 14 of
`models.py`, in the method `month`. Use `s` one more time, to go to
the first line of the body of the method.

```{execute}
:id: pdb-step-line
:title: Go to the next line inside the method
:wait: 1s
s
```

The arrow is now at the only line of the body:

```
-> return self.date[:4]
```

## Look at the values

Inside the method, `self` is the purchase. Look at its date.

```{execute}
:id: pdb-print-date
:title: Show the date of the purchase
:wait: 1s
p self.date
```

The debugger shows `'2026-01-01'`. The date is a string of ten
characters: four for the year, a hyphen, two for the month, a hyphen,
and two for the day.

The line with the arrow returns `self.date[:4]`. This is a slice: it
gives the first four characters of the string. Ask the debugger for
its value.

```{execute}
:id: pdb-print-slice-4
:title: Show the first four characters of the date
:wait: 1s
p self.date[:4]
```

The debugger shows `'2026'`. That is the year. The month of a
purchase needs the year, the hyphen and the two digits of the month,
such as `2026-01`. Count the characters: that is seven.

## Try the correction before you change the file

After `p` you can write any expression. So you can try a correction
in the debugger, with the real values of the program, before you
change the file.

```{execute}
:id: pdb-print-slice-7
:title: Show the first seven characters of the date
:wait: 1s
p self.date[:7]
```

```{quiz}
:id: slice-tried
:title: The correction, tried in the debugger
:type: text
question: "What does the debugger show for `p self.date[:7]`? Type it."
answer:
  - "'2026-01'"
  - "2026-01"
  - "\"2026-01\""
wrong:
  - { pattern: "['\"]?2026['\"]?", explanation: "`'2026'` is the answer to `p self.date[:4]`. Look at the last answer in the terminal, under `p self.date[:7]`." }
  - { pattern: "['\"]?2026-01-01['\"]?", explanation: "`'2026-01-01'` is the whole date. Look at the last answer in the terminal, under `p self.date[:7]`." }
otherwise: "Look at the terminal. The answer is the line directly under `(Pdb) p self.date[:7]`."
explanation: "`self.date[:7]` gives `'2026-01'`, the year and the month. So the number in line 15 must be 7, and not 4. You know that the correction works before you change the file."
```

## Leave the debugger: the command q

You have found the bug, and you do not need the rest of this run. The
command `q` is short for "quit". It ends the program at once, at the
place where it is stopped. The program does not show its report.

Because `q` ends the program, the debugger first asks if you are
sure. It shows this question:

```
Quitting pdb will kill the process. Quit anyway? [y/n]
```

"Kill the process" means "end the program that is running". You
answer with `y` for yes, or `n` for no.

```{attempt}
:id: still-in-debugger
:check: debugger-left
:expect: It is still stopped in the debugger
```

```{execute}
:id: pdb-quit
:title: Leave the debugger
:wait: 1s
q
```

```{execute}
:id: pdb-quit-yes
:title: Answer yes
:wait: prompt
y
```

The prompt of the shell is back.

```{verify}
:id: debugger-left
:label: The program has ended, and the shell is ready
:trigger: after:pdb-quit-yes
import os, subprocess
found = subprocess.run(["pgrep", "-u", str(os.getuid()), "-f", "spending spending[.]csv"], capture_output=True, text=True)
assert found.returncode != 0, "The program has not ended. It is still stopped in the debugger. Click in the terminal, type q and press Enter. Then type y and press Enter."
print("Correct. The program has ended, and the shell is ready for a new command.")
```

## The six commands

| Command | Short for | What it does |
|---------|-----------|--------------|
| `l` | list | shows the code round the line where the program is stopped |
| `p` and an expression | print | shows the value of the expression |
| `n` | next | runs one line, and any function that the line calls |
| `s` | step | runs one line, and goes inside a function that the line calls |
| `c` | continue | lets the program run on |
| `q` | quit | ends the program at once |

The debugger has many more commands. These six are enough for most
bugs.

On the next page you repair the method `month`, and you remove the
line `breakpoint()`.
