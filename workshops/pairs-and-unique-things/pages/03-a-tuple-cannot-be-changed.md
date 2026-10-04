---
title: A tuple cannot be changed
requires: [quiz:predict-change, verify:opening]
---

# A tuple cannot be changed

A list can change. You can give an item of a list a new value, and you
can add an item with `append`. A tuple is different: after Python has
created a tuple, the tuple stays the same. No item can get a new
value, and no item can be added or removed.

This rule is useful. When values belong together, a change to one of
them is often a mistake. A date with a new month is a different date.
When you keep the date in a tuple, no line of your program can change
one part of it by accident. A reader of your program also learns
something from the parentheses: these values are one group, and the
group is fixed.

Think of a date that is printed on a ticket. You cannot change the
day on the ticket. If the date is wrong, you get a new ticket.

You know one value that behaves in the same way. A string cannot be
changed, and a method such as `upper` gives back a new string.

## What Python does

Look at this cell. Do not run it yet. The second line tries to give
the third item of the tuple a new value. With a list, this line would
work.

```python
opening = (2026, 3, 14)
opening[2] = 15
print(opening)
```

```{quiz}
:id: predict-change
:title: Predict what happens
question: "What happens when Python runs this cell?"
options:
  - { text: "The output is `(2026, 3, 15)`", explanation: "This would be the result with a list. A tuple cannot be changed, so Python stops at the second line." }
  - { text: "Python stops at the second line with an error message", correct: true }
  - { text: "The output is `(2026, 3, 14)`, because Python ignores the second line", explanation: "Python never ignores a line that it cannot perform. It stops at that line and shows an error message." }
explanation: "A tuple cannot be changed. Python stops at the second line, and shows an error message of the type `TypeError`."
```

The action below adds the cell to your notebook. The action does not
run the cell.

```{cell-insert}
:id: insert-opening
:title: Add the cell that tries to change a tuple, without running it
:path: {{ notebook }}
:tags: [opening]
:run: false
opening = (2026, 3, 14)
opening[2] = 15
print(opening)
```

Run the cell: click inside it, hold `Shift` and press `Enter`.

Python shows an error message. Read the last line of the message
first:

```
TypeError: 'tuple' object does not support item assignment
```

- `TypeError` is the type of the error. A `TypeError` means that a
  value of this type cannot do what the code asks.

- `'tuple' object does not support item assignment` says what the code
  asked. "Item assignment" means giving an item a new value. A tuple
  cannot do that.

Above that line, an arrow points at the second line of the cell, which
is the line where Python stopped.

## A new tuple instead

The name is not fixed, only the tuple. You can make the name refer to
a new tuple, with an assignment. That is the same as a new ticket with
the correct date.

## Your task

Correct the cell so that it runs without an error. Replace the second
line with an assignment that gives the name `opening` a new tuple, for
the date 2026-03-15. Then run the cell again.

When the cell is correct, the error message goes away, and the output
is:

```
(2026, 3, 15)
```

```{hint}
:title: Hint: what to write
The second line must not use an index. It is an assignment with the
name `opening` on the left side and a complete tuple of three items on
the right side.
```

```{hint}
:title: Hint: the line
Change the second line of the cell to `opening = (2026, 3, 15)`. Then
run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check`.

```{attempt}
:id: opening-not-started
:check: opening
:expect: The name opening does not exist yet
```

````{attempt}
:id: opening-not-fixed
:check: opening
:expect: The name opening still refers to the tuple (2026, 3, 14)

```{cell-insert}
:path: {{ notebook }}
:run: true
opening = (2026, 3, 14)
```
````

````{attempt}
:id: opening-a-list
:check: opening
:expect: The name opening now refers to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
opening = [2026, 3, 14]
opening[2] = 15
print(opening)
```
````

````{attempt}
:id: opening-wrong-date
:check: opening
:expect: but it must refer to the tuple (2026, 3, 15)

```{cell-insert}
:path: {{ notebook }}
:run: true
opening = (2026, 3, 14)
opening = (2026, 15, 3)
print(opening)
```
````

````{hint}
:title: Show me a solution
:unlock: "opening" in failed_checks or "opening" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-opening-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [opening-solution]
:run: true
opening = (2026, 3, 14)
opening = (2026, 3, 15)
print(opening)
```
````

```{verify}
:id: opening
:label: The name opening refers to a new tuple
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed opening; cell-executed opening-solution
if "opening" not in globals():
    print("The name opening does not exist yet. Click the action above to add the cell. Then click inside the cell, hold Shift and press Enter to run it.")
elif opening == (2026, 3, 15):
    print("Correct. The first tuple did not change. The name opening now refers to a new tuple, (2026, 3, 15).")
elif opening == (2026, 3, 14):
    print("The name opening still refers to the tuple (2026, 3, 14), because Python stopped at the second line. Replace the second line with an assignment that gives the name a new tuple: opening = (2026, 3, 15). Then run the cell again.")
elif isinstance(opening, list):
    print("The name opening now refers to a list. A list can be changed, so the error went away, but this task asks for a tuple. Use parentheses in the first line again, and replace the second line with opening = (2026, 3, 15). Then run the cell again.")
else:
    print(f"The name opening refers to {opening!r} but it must refer to the tuple (2026, 3, 15). The three items are the year 2026, the month 3 and the day 15, in this order. Then run the cell again.")
"opening" in globals() and opening == (2026, 3, 15)
```

If you leave the cell with the error in your notebook, it is not a
problem for the next pages. A cell that is correct is better, because
you can then run the whole notebook again from the top without a stop.
