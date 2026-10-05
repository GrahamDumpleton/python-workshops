---
title: What you have learned
---

# What you have learned

The spending tracker had three bugs, and you found and repaired all
of them. Each one needed another way to look. The first stopped the
program, and the traceback named the file and the line. The second
gave a wrong number, and a `print()` line showed what the loop did.
The third was inside a function that another function called, and
the debugger took you there.

## The ideas

- A **bug** is a mistake in a program that makes it do the wrong
  thing. The work of finding bugs and repairing them is
  **debugging**.

- A **traceback** of a program in several files shows every step
  from the start of the program to the line where Python stopped.
  Each step names a file, a line number and a function. Read the
  last line first. Then read upward from the bottom.

- A program that runs to its end can still be wrong. Compare what it
  shows with what you know to be true.

- Make the problem small before you look for its cause.

- A `print()` line shows what a program does at one place while it
  runs. Mark what it shows with a word such as `debug:`, and remove
  the line when you have your answer.

- A **debugger** is a program that runs your program one line at a
  time. The debugger that comes with Python is `pdb`.

- A **breakpoint** is a place where the debugger stops a program.
  The line `breakpoint()` makes one. Remove the line when you have
  your answer.

- In the debugger you can try a correction with the real values of
  the program, before you change the file.

- Python reads a file from the disk. Save the file before you run
  the program again.

## The commands of the debugger

You type these at the `(Pdb)` prompt, and press `Enter`.

| Command | Short for | What it does |
|---------|-----------|--------------|
| `l` | list | shows the code round the line where the program is stopped |
| `p purchase.amount` | print | shows the value of an expression |
| `n` | next | runs one line, and any function that the line calls |
| `s` | step | runs one line, and goes inside a function that the line calls |
| `c` | continue | lets the program run on |
| `q` | quit | ends the program at once |

## A way of working

When a program does the wrong thing, these steps help:

1. Read what the program shows. If there is a traceback, read its
   last line, and then the step above it.

2. Say what the program must show, and how that differs from what it
   shows.

3. Make the problem small: less data, or one part of the program.

4. Look at what the program really does at the place that you have
   doubts about, with `print()` or with the debugger. Do not guess.

5. Change one thing. Run the program again.

6. Remove every `print()` line and every `breakpoint()` line that you
   added.

## The three lines that you repaired

All three bugs were in `spending/models.py`:

| Line | With the bug | Repaired |
|------|--------------|----------|
| 15 | `return self.date[:4]` | `return self.date[:7]` |
| 27 | `for purchase in self.purchase:` | `for purchase in self.purchases:` |
| 34 | `totals[purchase.category] = purchase.amount` | `totals[purchase.category] = totals.get(purchase.category, Decimal("0")) + purchase.amount` |

Each bug was small: a missing letter, a missing sum, a wrong number.
Most bugs are like this. The work is to find them, and you now have
three ways to do that.

## What comes next

The set **From a Python notebook to a program** is complete. You
began it with a notebook. You end it with a package of several
modules that you run in a terminal, with command line arguments, and
that you can repair when it goes wrong.

The next set of workshops is **Working like a Python developer**. Its
first workshop is **Why an environment**. It shows the problem that
appears when every project on a computer shares one Python, and the
later workshops show how programmers solve it, how they install code
that other people have written, and how they test their own code.

Click `Finish` at the bottom of this panel.
