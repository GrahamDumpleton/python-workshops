---
title: What you have learned
---

# What you have learned

You can now write a program that continues when its data has
mistakes, and that still stops when its own code has a mistake.

## The ideas

- An **exception** is an error that stops a program while it runs.
  `ValueError`, `IndexError` and `FileNotFoundError` are types of
  exception.

- To **handle** an exception means to give Python other lines to run
  when the exception happens, so that the program continues. The
  `try` block holds the lines that can go wrong. The `except` block
  holds the lines to run when they do.

- When an exception happens in a `try` block, Python leaves the block
  at once. The other lines of the `try` block do not run.

- An `except` line names the type of exception that it handles. It
  can name several types, in parentheses. An exception of another
  type is not handled, and it stops the program.

- A **bug** is a mistake in the code of a program. Wrong data is
  handled. A bug is corrected, and never handled.

- An `except` line with no type handles every exception, so it hides
  bugs. Always name the type.

- To **raise** an exception means to make an exception happen. Your
  own code does this with the word `raise`, when it finds a value
  that is wrong for your program.

- A program that skips rows says so. It counts the rows that it
  skipped, or it shows them.

## The code

| Code | What it does |
|------|--------------|
| `try:` | begins the block of lines that can go wrong |
| `except ValueError:` | begins the block that runs when a `ValueError` happens in the `try` block |
| `except (ValueError, IndexError):` | begins the block that runs when one of the two types happens |
| `except FileNotFoundError:` | begins the block that runs when `open()` does not find the file |
| `raise ValueError("The amount must not be less than 0.")` | makes a `ValueError` happen, with a message that you wrote |
| `header = file.readline()` | reads one line of a file, here the header |
| `return amounts, skipped` | in a function, gives two values back |

## What comes next

Your function `read_amounts()` reads the rows that are correct. The
rows that are untidy but can be repaired, with spaces around a field
or a category in capital letters, are the subject of a later
workshop, **Cleaning messy text**.

The next workshop is **The batteries included**. Python comes with a
large amount of code that other people wrote and that is ready for
you to use: code for mathematics, for random choices, for dates and
for counting. The workshop shows how to use that code in your
programs, and how to find what you need in the documentation.

Click `Finish` at the bottom of this panel.
