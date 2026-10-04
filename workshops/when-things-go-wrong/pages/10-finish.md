---
title: What you have learned
---

# What you have learned

You can now read an error message, and use it to find a mistake. You
caused five types of error on purpose, and you corrected every one of
them.

## The ideas

- An **error message** says what went wrong, and where. It is help
  from Python. Every programmer sees error messages every day.

- An error does not damage anything. You correct the mistake, and run
  the cell again.

- An error message has three parts: the type of the error, the line,
  and the message. Programmers also call an error message a
  **traceback**.

- Read the last line first. It holds the type and the message. Then
  find the line that Python marks, with the arrow `---->` or with the
  symbol `^`.

- The type of the error is often enough to find the mistake.

- Python finds a `SyntaxError` or an `IndentationError` when it reads
  the cell, so no line of the cell runs. It finds the other errors
  when it reaches the line, so the lines before the error run.

- When a cell has several mistakes, Python shows one error each time.
  Correct one mistake, and run the cell again.

## The errors

| Type of the error | What it means | An example that causes it |
|-------------------|---------------|---------------------------|
| `NameError` | a name has no value | `country = Kenya` |
| `TypeError` | a value has the wrong type for what the code does with it | `"Guests: " + 12` |
| `IndexError` | an index is outside the string | `"Python"[6]` |
| `SyntaxError` | Python cannot read the code | `print("Slices:" slices)` |
| `IndentationError` | the spaces at the start of a line are wrong | a line that starts with spaces |

## What comes next

Every program in these workshops so far performs the same lines each
time that it runs. The next workshop, **Making decisions**, shows how
a program chooses what to do: it performs some lines in one
situation, and other lines in another situation. That workshop also
uses indentation on purpose.

Click `Finish` at the bottom of this panel.
