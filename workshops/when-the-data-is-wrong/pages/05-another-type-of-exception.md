---
title: Another type of exception
requires: [quiz:predict-haircut, verify:rows-skipped]
---

# Another type of exception

An `except` line names one type of exception, and it handles only
that type. An exception of another type is not handled. It stops the
program, as if the `try` and the `except` were not there.

This is useful. Different problems need different answers, and you
decide which problems your program is ready for. Think again of the
person who sorts letters. The separate box is for letters that have
no address. A parcel that is open and damaged is a different problem, and
it does not go in that box.

The spending file has two kinds of rows that cannot be read. You have
handled one kind. This page handles the other.

## The program with try and except

Here is the program that adds up the amounts, with a `try` block and
an `except` block inside the loop. It also counts the rows that it
cannot read.

```python
total_spent = 0
bad_rows = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(fields[2])
            total_spent = total_spent + amount
        except ValueError:
            bad_rows = bad_rows + 1
print(f"Total: {total_spent:.2f}")
print(f"Rows that cannot be read: {bad_rows}")
```

The `try` and `except` lines are inside the loop, so they begin with
eight spaces, and the lines of their blocks begin with twelve spaces.

The `try` block holds two lines. When `float()` causes a `ValueError`,
Python leaves the `try` block at once, so the line that adds to the
total does not run for that row. The `except` block adds `1` to
`bad_rows`. Then the loop continues with the next row.

## Predict what happens

The program now handles the row with the amount `unknown`. Later in
the file, at line 22, there is this row:

```
2026-02-13,Haircut
```

For this row, `fields` is the list `['2026-02-13', 'Haircut']`. It has
two items, so the largest index is `1`.

```{quiz}
:id: predict-haircut
:type: text
:case: false
:title: Predict the type of the exception
question: "For the row `2026-02-13,Haircut`, the program asks for `fields[2]`, but the list has only two items. What is the type of the exception that happens? You saw this type in the workshop **When things go wrong**. Type one word."
answer: "IndexError"
wrong:
  - { text: "ValueError", explanation: "A `ValueError` comes from `float()` when the string holds no number. Here Python never calls `float()`, because it cannot get the item `fields[2]` first. Which type of error means that an index is too large?" }
  - { text: "KeyError", explanation: "A `KeyError` comes from a dictionary that does not have the key. `fields` is a list. Which type of error means that an index of a list is too large?" }
  - { text: "NameError", explanation: "A `NameError` means that a name has no value. The name `fields` has a value. The problem is the index `2`, which is too large for a list of two items." }
  - { text: "Index", explanation: "That is the first part of the word. The full name of the type ends with `Error`." }
otherwise: "The index `2` is past the end of a list that has two items. The name of the type has the word `Index` in it, and ends with `Error`."
explanation: "An index past the end of a list gives an `IndexError`. The `except` line of the program names `ValueError`, so it does not handle an `IndexError`."
```

## See it stop

The action below adds the program to your notebook. The action does
not run the cell.

```{cell-insert}
:id: insert-skip-rows
:title: Add the cell that has try and except in the loop, without running it
:path: {{ notebook }}
:tags: [skip-rows]
:run: false
total_spent = 0
bad_rows = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(fields[2])
            total_spent = total_spent + amount
        except ValueError:
            bad_rows = bad_rows + 1
print(f"Total: {total_spent:.2f}")
print(f"Rows that cannot be read: {bad_rows}")
```

Run the cell: click inside it, hold `Shift` and press `Enter`.

Python shows an error message. The last line is:

```
IndexError: list index out of range
```

The program handled the row for the gift, and continued. Then it
reached the row for the haircut. The `IndexError` happened inside the
`try` block, but no `except` line names `IndexError`. So the exception
was not handled, and it stopped the program.

## Two types in one except line

One `except` line can name several types. You write the types in
parentheses, with a comma between them:

```python
except (ValueError, IndexError):
```

The block under this line runs when a `ValueError` happens in the
`try` block, and also when an `IndexError` happens there.

There is a second way, which you use when the two types need
different lines. You write one `except` block for each type, one
under the other. Python runs the first block whose type is the type
of the exception.

## Your task

Change the cell so that it also handles the `IndexError`. The row for
the haircut must be counted in `bad_rows`, in the same way as the two
rows that have a wrong amount.

When the cell is correct, the output is:

```
Total: 2834.79
Rows that cannot be read: 3
```

```{hint}
:title: Hint: which line do I change?
You change one line only: the line `except ValueError:`. It must name
the two types.
```

```{hint}
:title: Hint: the new line
Change the line to `except (ValueError, IndexError):`. Keep the eight
spaces at the start of the line, and the colon at the end. Then run
the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run the cell, or after you have clicked `Check`.

```{attempt}
:id: rows-not-started
:check: rows-skipped
:expect: The names total_spent and bad_rows do not exist yet
```

````{attempt}
:id: rows-stopped
:check: rows-skipped
:expect: The cell stopped at the row for the haircut

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = 1700.34
bad_rows = 1
```
````

````{attempt}
:id: rows-not-counted
:check: rows-skipped
:expect: but it does not count that row

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = 0
bad_rows = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        if len(fields) == 4:
            try:
                amount = float(fields[2])
                total_spent = total_spent + amount
            except ValueError:
                bad_rows = bad_rows + 1
print(f"Total: {total_spent:.2f}")
print(f"Rows that cannot be read: {bad_rows}")
```
````

````{attempt}
:id: rows-with-header
:check: rows-skipped
:expect: The header is not a purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = 0
bad_rows = 0
with open("spending-raw.csv") as file:
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(fields[2])
            total_spent = total_spent + amount
        except (ValueError, IndexError):
            bad_rows = bad_rows + 1
print(f"Total: {total_spent:.2f}")
print(f"Rows that cannot be read: {bad_rows}")
```
````

````{attempt}
:id: rows-wrong-total
:check: rows-skipped
:expect: but it must be 2834.79

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = 0
bad_rows = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(fields[2])
            total_spent = amount
        except (ValueError, IndexError):
            bad_rows = bad_rows + 1
print(f"Total: {total_spent:.2f}")
print(f"Rows that cannot be read: {bad_rows}")
```
````

````{attempt}
:id: rows-two-blocks
:check: rows-skipped
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
total_spent = 0
bad_rows = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(fields[2])
            total_spent = total_spent + amount
        except ValueError:
            bad_rows = bad_rows + 1
        except IndexError:
            bad_rows = bad_rows + 1
print(f"Total: {total_spent:.2f}")
print(f"Rows that cannot be read: {bad_rows}")
```
````

````{hint}
:title: Show me a solution
:unlock: "rows-skipped" in failed_checks or "rows-skipped" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-skip-rows-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [skip-rows-solution]
:run: true
total_spent = 0
bad_rows = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(fields[2])
            total_spent = total_spent + amount
        except (ValueError, IndexError):
            bad_rows = bad_rows + 1
print(f"Total: {total_spent:.2f}")
print(f"Rows that cannot be read: {bad_rows}")
```
````

```{verify}
:id: rows-skipped
:label: The cell adds up 37 rows and counts the 3 rows that cannot be read
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed skip-rows; cell-executed skip-rows-solution
def _workshop_check():
    if "total_spent" not in globals() or "bad_rows" not in globals():
        print("The names total_spent and bad_rows do not exist yet. Click the action above that adds the cell. Then click inside the cell, hold Shift and press Enter to run it.")
        return False
    total = globals()["total_spent"]
    bad = globals()["bad_rows"]
    if type(total) not in (int, float) or type(bad) is not int:
        print("The names total_spent and bad_rows must refer to numbers. Do not change the lines of the cell that give these names their values. Change only the except line. Then run the cell again.")
        return False
    total = round(float(total), 2)
    if total == 2834.79 and bad == 3:
        print("Correct. The total is 2834.79, and the cell counted the 3 rows that cannot be read. The program handles the two types of exception and reads the whole file.")
        return True
    if bad == 1:
        print("The cell stopped at the row for the haircut, after it counted 1 row that cannot be read. The except line names only ValueError, so the IndexError is not handled. Change that line so that it names the two types: except (ValueError, IndexError): Then run the cell again.")
        return False
    if total == 2834.79 and bad == 2:
        print("The total is correct, so the program no longer stops at the row for the haircut, but it does not count that row. bad_rows is 2 and it must be 3. Let the except block handle the IndexError too, so that it adds 1 for that row: except (ValueError, IndexError): Then run the cell again.")
        return False
    if total == 2834.79 and bad == 4:
        print("The cell counted 4 rows that cannot be read, but there are 3. The fourth is the header of the file. The header is not a purchase. Keep the line header = file.readline() before the loop, so that the loop starts at the second line of the file. Then run the cell again.")
        return False
    if total != 2834.79:
        print(f"The total is {total:.2f} but it must be 2834.79. The try block must hold the two lines from the cell that the action added: the line that calls float(), and the line total_spent = total_spent + amount. Then run the cell again.")
        return False
    print(f"The cell counted {bad} rows that cannot be read, but there are 3. The except block must hold one line, bad_rows = bad_rows + 1, and the except line must name ValueError and IndexError. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

## What happened

The program now reads the whole file. It adds 37 amounts, and it
counts the 3 rows that it cannot read:

| Line of the file | The row | The exception |
|------------------|---------|---------------|
| 9 | `2026-01-14,Gift for Chidi,unknown,hobbies` | `ValueError`, from `float("unknown")` |
| 22 | `2026-02-13,Haircut` | `IndexError`, from `fields[2]` |
| 36 | `2026-03-16,Lunch,,food` | `ValueError`, from `float("")` |

Mariam gets a total, and she also learns that 3 rows need her
attention. A program must not skip rows without saying so. It counts
them, or it shows them.
