---
title: A bug is not bad data
requires: [quiz:predict-hidden, verify:hidden-ran, verify:bug-found]
---

# A bug is not bad data

A program can go wrong for two different reasons, and they need
different answers.

- **The data is wrong.** A person typed a word where a number
  belongs. The code is correct. The program must handle this, because
  it will happen again with other data.

- **The code is wrong.** A name has a spelling mistake, or an index
  is the wrong one. A mistake in the code of a program is called a
  **bug**. A bug must be corrected. It must never be handled, because
  to handle it is to hide it.

When a bug causes an exception, the error message is useful to you.
It tells you where the mistake is. This is why an `except` line names
the type of exception that you expect from the data. Every other
exception still stops the program and shows its message.

Think of a smoke alarm in a kitchen. It is loud and it is not
pleasant, but nobody removes it for that reason. It tells you about a
fire while the fire is still small.

## An except line with no type

Python lets you write an `except` line with no type:

```python
except:
```

This line handles every exception, of every type. It looks
convenient, because you do not need to know which types can happen.
The cell below shows why it is a bad idea.

Look at this cell. Do not run it yet. It is the program from the last
page, with two changes. The `except` line has no type. And the line
that calls `float()` has a spelling mistake: it says `feilds` where
it must say `fields`. This is a bug.

```python
hidden_total = 0
hidden_bad = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(feilds[2])
            hidden_total = hidden_total + amount
        except:
            hidden_bad = hidden_bad + 1
print(f"Total: {hidden_total:.2f}")
print(f"Rows that cannot be read: {hidden_bad}")
```

The name `feilds` does not exist, so the line with `float()` causes a
`NameError` in every pass of the loop. The file has 40 rows after the
header.

```{quiz}
:id: predict-hidden
:type: text
:title: Predict the number of rows
question: "What number does the last line of the cell show, after the words `Rows that cannot be read:`?"
answer: "40"
wrong:
  - { text: "3", explanation: "`3` is the answer of the correct program. In this cell, the line with `float()` goes wrong for every row, and the `except` line handles every type of exception." }
  - { text: "0", explanation: "The `except` block adds `1` each time an exception happens in the `try` block. The `NameError` happens for every row." }
  - { text: "41", explanation: "The file has 41 lines, but `file.readline()` reads the header before the loop starts. The loop runs for the other lines." }
  - { text: "37", explanation: "`37` is the number of rows that the correct program can read. In this cell, the line with `float()` goes wrong for every row." }
  - { text: "1", explanation: "The exception does not stop the loop, because the `except` line handles it. The same exception then happens again for the next row, and for every row after it." }
otherwise: "The `NameError` happens in every pass of the loop, and the `except` line with no type handles it every time. How many rows does the loop read?"
explanation: "The `NameError` happens for each of the 40 rows. The `except` line with no type handles every one of them, so the cell counts 40 rows that cannot be read, and the total is `0.00`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: hidden-not-run
:check: hidden-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-hidden
:title: Add the cell that hides a bug, and run it
:path: {{ notebook }}
:tags: [hidden]
:run: true
hidden_total = 0
hidden_bad = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(feilds[2])
            hidden_total = hidden_total + amount
        except:
            hidden_bad = hidden_bad + 1
print(f"Total: {hidden_total:.2f}")
print(f"Rows that cannot be read: {hidden_bad}")
```

The output is:

```
Total: 0.00
Rows that cannot be read: 40
```

```{verify}
:id: hidden-ran
:label: The cell that hides a bug has run
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed hidden
if globals().get("hidden_bad") == 40:
    print("The cell ran. It counted all 40 rows as rows that cannot be read, and it showed no error message.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("hidden_bad") == 40
```

## What happened

The output is wrong, and nothing tells you why. There is no error
message. The program blames the data: it says that Mariam typed 40
rows that cannot be read. But the data is not the problem. The code
has a bug, and the `except` line with no type hid it.

Here the wrong result is not hard to see, because the total is
`0.00`. In a larger program, a hidden bug can give a result that
looks correct and is wrong.

So the rule is: **always name the type of exception in an `except`
line.** Name only the types that the data can cause. For this
program, those are `ValueError` and `IndexError`.

## Your task

The action below adds the same program in a new cell, with other
names for the two totals. The action does not run the cell.

```{cell-insert}
:id: insert-find-bug
:title: Add the cell that I will correct, without running it
:path: {{ notebook }}
:tags: [find-bug]
:run: false
checked_total = 0
checked_bad = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(feilds[2])
            checked_total = checked_total + amount
        except:
            checked_bad = checked_bad + 1
print(f"Total: {checked_total:.2f}")
print(f"Rows that cannot be read: {checked_bad}")
```

Do these three things, in this order:

1. Change the line `except:` so that it names the two types that the
   data can cause, `ValueError` and `IndexError`.

2. Run the cell. Python now shows an error message, because the
   `except` line no longer hides the bug. Read the last line of the
   message.

3. Correct the bug that the message tells you about. Then run the
   cell again.

When the cell is correct, the output is:

```
Total: 2834.79
Rows that cannot be read: 3
```

```{hint}
:title: Hint: the except line
Change the line `except:` to `except (ValueError, IndexError):`. Keep
the eight spaces at the start of the line. Then run the cell.
```

```{hint}
:title: Hint: the error message
The last line of the error message is
`NameError: name 'feilds' is not defined`. The arrow in the message is
near the line that uses this name. The letters `e` and `i` are in the
wrong order. Change `feilds` to `fields`, and run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run the cell, or after you have clicked `Check`.

```{attempt}
:id: bug-not-started
:check: bug-found
:expect: The names checked_total and checked_bad do not exist yet
```

````{attempt}
:id: bug-still-hidden
:check: bug-found
:expect: The bug is still hidden

```{cell-insert}
:path: {{ notebook }}
:run: true
checked_total = 0
checked_bad = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(feilds[2])
            checked_total = checked_total + amount
        except:
            checked_bad = checked_bad + 1
print(f"Total: {checked_total:.2f}")
print(f"Rows that cannot be read: {checked_bad}")
```
````

````{attempt}
:id: bug-in-view
:check: bug-found
:expect: Python now shows you the bug

```{cell-insert}
:path: {{ notebook }}
:run: true
checked_total = 0
checked_bad = 0
```
````

````{attempt}
:id: bug-wrong-count
:check: bug-found
:expect: but there are 3

```{cell-insert}
:path: {{ notebook }}
:run: true
checked_total = 0
checked_bad = 0
with open("spending-raw.csv") as file:
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(fields[2])
            checked_total = checked_total + amount
        except (ValueError, IndexError):
            checked_bad = checked_bad + 1
print(f"Total: {checked_total:.2f}")
print(f"Rows that cannot be read: {checked_bad}")
```
````

````{hint}
:title: Show me a solution
:unlock: "bug-found" in failed_checks or "bug-found" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-find-bug-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [find-bug-solution]
:run: true
checked_total = 0
checked_bad = 0
with open("spending-raw.csv") as file:
    header = file.readline()
    for line in file:
        fields = line.strip().split(",")
        try:
            amount = float(fields[2])
            checked_total = checked_total + amount
        except (ValueError, IndexError):
            checked_bad = checked_bad + 1
print(f"Total: {checked_total:.2f}")
print(f"Rows that cannot be read: {checked_bad}")
```
````

```{verify}
:id: bug-found
:label: The cell has no bug, and it counts the 3 rows that cannot be read
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed find-bug; cell-executed find-bug-solution
def _workshop_check():
    if "checked_total" not in globals() or "checked_bad" not in globals():
        print("The names checked_total and checked_bad do not exist yet. Click the action above that adds the cell. Change the except line, and then hold Shift and press Enter to run the cell.")
        return False
    total = globals()["checked_total"]
    bad = globals()["checked_bad"]
    if type(total) not in (int, float) or type(bad) is not int:
        print("The names checked_total and checked_bad must refer to numbers. Do not change the lines of the cell that give these names their values. Then run the cell again.")
        return False
    total = round(float(total), 2)
    if total == 2834.79 and bad == 3:
        print("Correct. The total is 2834.79, and 3 rows cannot be read. The except line that names its types showed you the bug, and you corrected the bug. Check that your except line names ValueError and IndexError, so that it does not hide the next bug.")
        return True
    if total == 0 and bad == 40:
        print("The cell counted all 40 rows as rows that cannot be read. The bug is still hidden, because the except line has no type and handles the NameError. Change that line to except (ValueError, IndexError): and run the cell again. Then Python shows you the bug.")
        return False
    if total == 0 and bad == 0:
        print("The cell stopped with an error at the first row. That is the right result for this step: Python now shows you the bug. Read the last line of the error message. It names a name that does not exist. Correct the spelling of that name in the try block, and run the cell again.")
        return False
    if total != 2834.79:
        print(f"The total is {total:.2f} but it must be 2834.79. Change only two lines of the cell: the except line, and the line with the spelling mistake. Then run the cell again.")
        return False
    print(f"The total is correct. The cell counted {bad} rows that cannot be read, but there are 3. Keep the line header = file.readline() before the loop, and keep the line checked_bad = checked_bad + 1 in the except block. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

## What happened

When the `except` line named its types, the `NameError` was no longer
handled. It stopped the program at the first row, and the error
message named the mistake. You then corrected the code.

Each kind of problem got the right answer. The three rows with wrong
data are handled and counted. The bug is corrected, not handled.
