---
title: A file that does not exist
requires: [quiz:predict-missing, verify:missing-handled]
---

# A file that does not exist

The data inside a file can be wrong. The file itself can also be the
problem: the program asks for a file, and no file has that name.
Perhaps a person typed the name with a mistake, or the file was moved
to another place.

Python cannot open a file that does not exist. `open()` causes an
exception of the type `FileNotFoundError`.

Mariam has no file for the year 2025. These two lines try to read
one:

```python
with open("spending-2025.csv") as file:
    old_text = file.read()
```

Python stops, and the last line of the error message is:

```
FileNotFoundError: [Errno 2] No such file or directory: 'spending-2025.csv'
```

The type is `FileNotFoundError`, and the message ends with the name
that Python looked for. The number after `Errno` is a number that the
computer gives to this problem. On your computer it can be a
different number, such as `44`. The number is not important.

A missing file is not a bug in the code. It is a problem that comes
from outside the program, in the same way as wrong data. So the
program can handle it, with `try` and `except`, and say something
useful to the person who uses it.

## Predict the output

Look at this cell. Do not run it yet. The file `spending-2025.csv`
does not exist.

```python
try:
    with open("spending-2025.csv") as file:
        old_text = file.read()
    print("The file was read.")
except FileNotFoundError:
    print("The file spending-2025.csv does not exist.")
missing_checked = True
print("The program continues.")
```

The whole `with` block is inside the `try` block, so its lines begin
with four more spaces.

```{quiz}
:id: predict-missing
:title: Predict the output
question: "What does the cell show?"
options:
  - { text: "`The file was read.` and then `The program continues.`", explanation: "The file does not exist, so `open()` causes a `FileNotFoundError`. Python leaves the `try` block at once, and the line that prints `The file was read.` does not run." }
  - { text: "`The file spending-2025.csv does not exist.` and then `The program continues.`", correct: true }
  - { text: "`The file spending-2025.csv does not exist.` and nothing more", explanation: "The `except` block handles the exception. After that the program continues with the lines under the two blocks, so the last line runs too." }
  - { text: "An error message with the type `FileNotFoundError`", explanation: "The `except` line names `FileNotFoundError`, which is the type of the exception that happens. So Python runs the `except` block, and shows no error message." }
explanation: "`open()` causes a `FileNotFoundError`. Python leaves the `try` block and runs the `except` block, which prints that the file does not exist. Then the program continues after the two blocks."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: missing-not-run
:check: missing-handled
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-missing
:title: Add the cell that asks for a file that does not exist, and run it
:path: {{ notebook }}
:tags: [missing]
:run: true
try:
    with open("spending-2025.csv") as file:
        old_text = file.read()
    print("The file was read.")
except FileNotFoundError:
    print("The file spending-2025.csv does not exist.")
missing_checked = True
print("The program continues.")
```

The output is:

```
The file spending-2025.csv does not exist.
The program continues.
```

```{verify}
:id: missing-handled
:label: The cell handled the file that does not exist
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed missing
if globals().get("missing_checked") == True:
    print("The cell ran. It handled the FileNotFoundError, and the program continued.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("missing_checked") == True
```

## What happened

`open()` caused a `FileNotFoundError` in the first line of the `try`
block. Python left the `try` block, so the two lines after it in that
block did not run. The `except` line names `FileNotFoundError`, so
Python ran its block. The person who uses the program reads a clear
sentence, and not an error message with many lines.

You now know three types of exception that come from the world
outside your code:

| Type | It happens when |
|------|-----------------|
| `ValueError` | a value has the right type but cannot be used, as in `float("unknown")` |
| `IndexError` | an index is past the end of a list, as in `fields[2]` for a row of two fields |
| `FileNotFoundError` | `open()` is given the name of a file that does not exist |

Each `except` line names the type that you expect in that place. An
`except ValueError:` line does not handle a missing file, and an
`except FileNotFoundError:` line does not handle a wrong amount.
