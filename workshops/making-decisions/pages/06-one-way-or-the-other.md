---
title: One way or the other
requires: [verify:ticket-ran, verify:seats-else]
---

# One way or the other

An `if` with its block does something or does nothing. Often a
program needs more: it must do one thing when the condition is `True`,
and a different thing when the condition is `False`. A cinema sells an
adult ticket to a person who is 18 or older, and a child ticket to
every other person. Each visitor gets exactly one of the two.

A road that divides in two is a good comparison. A traveller takes the
left road or the right road, and never both. In a program, each of the
possible ways is called a **branch**.

Python adds the second branch with the word `else`, which means "in
every other case".

## The code

```python
visitor_age = 15
if visitor_age >= 18:
    ticket_kind = "adult"
else:
    ticket_kind = "child"
print(ticket_kind)
```

- The line `else:` has no indentation. It begins at the same position
  as the `if` line that it belongs to, and it ends with `:`.

- `else` has no condition. It does not need one, because it takes
  every case that the `if` did not take.

- Under `else:` comes a second block, also indented by four spaces.
  Python performs the first block when the condition is `True`, and
  the second block when the condition is `False`. It always performs
  exactly one of the two.

```{attempt}
:id: ticket-not-run
:check: ticket-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-ticket
:title: Add a cell that chooses between two kinds of ticket, and run it
:path: {{ notebook }}
:tags: [ticket]
:run: true
visitor_age = 15
if visitor_age >= 18:
    ticket_kind = "adult"
else:
    ticket_kind = "child"
print(ticket_kind)
```

```{verify}
:id: ticket-ran
:label: Python chose the branch for a child
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed ticket
if globals().get("visitor_age") == 15 and globals().get("ticket_kind") == "child":
    print("The cell ran. The condition was False, so Python performed the block under else.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("visitor_age") == 15 and globals().get("ticket_kind") == "child"
```

The visitor is 15, so the condition `visitor_age >= 18` is `False`.
Python did not perform the first block. It performed the block under
`else:`, which made the name `ticket_kind` refer to `"child"`. The
last line has no indentation, so it is after both blocks, and Python
always performs it.

## Your task

A program tells a traveller whether a bus still has free seats. The
action below adds a cell that has only the first branch.

```{cell-insert}
:id: insert-seats
:title: Add a cell that has an if without an else, for me to complete
:path: {{ notebook }}
:tags: [seats]
:run: false
seats_left = 0
if seats_left > 0:
    seat_message = "You can book a seat."
# Write your two lines on the lines below this one.

print(seat_message)
```

The bus has `0` seats left, so the condition is `False`. No line gives
the name `seat_message` a value, and the last line cannot print it.

Add a second branch. Click on the empty line under the comment, and
write two lines:

1. the line `else:`, with no indentation

2. an indented line that makes the name `seat_message` refer to the
   string `"The bus is full."`

Do not change the value of `seats_left`. Then run the cell: hold
`Shift` and press `Enter`. The output must be:

```
The bus is full.
```

```{hint}
:title: Hint: what do the two lines look like?
Look at the cell with the tickets above. Your two lines have the same
form as its fourth and fifth lines. The first is `else:`. The second
begins with four spaces, and is an assignment with the name
`seat_message` on the left.
```

```{hint}
:title: Hint: I see a NameError
A `NameError` means that Python found a name that has no value. Here
the name is `seat_message`. The condition is `False`, so the line in
the first block did not run. Your `else:` branch must give
`seat_message` a value. Check that the name is spelled in the same way
in both branches.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: seats-not-started
:check: seats-else
:expect: The cell has not run yet
```

````{attempt}
:id: seats-no-else
:check: seats-else
:expect: The name seat_message does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
seats_left = 0
if seats_left > 0:
    seat_message = "You can book a seat."
```
````

````{attempt}
:id: seats-wrong-text
:check: seats-else
:expect: Every character must be the same

```{cell-insert}
:path: {{ notebook }}
:run: true
seats_left = 0
if seats_left > 0:
    seat_message = "You can book a seat."
else:
    seat_message = "the bus is full"
print(seat_message)
```
````

````{attempt}
:id: seats-value-changed
:check: seats-else
:expect: Change the first line back to seats_left = 0

```{cell-insert}
:path: {{ notebook }}
:run: true
seats_left = 3
if seats_left > 0:
    seat_message = "You can book a seat."
else:
    seat_message = "The bus is full."
print(seat_message)
```
````

````{attempt}
:id: seats-old-value
:check: seats-else
:expect: an earlier run gave the name that value

```{cell-insert}
:path: {{ notebook }}
:run: true
seats_left = 0
if seats_left > 0:
    seat_message = "You can book a seat."
print(seat_message)
```
````

````{hint}
:title: Show me a solution
:unlock: "seats-else" in failed_checks or "seats-else" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-seats-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [seats-solution]
:run: true
seats_left = 0
if seats_left > 0:
    seat_message = "You can book a seat."
else:
    seat_message = "The bus is full."
print(seat_message)
```
````

```{verify}
:id: seats-else
:label: The cell has a branch for a bus that is full
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed seats; cell-executed seats-solution
if "seats_left" not in globals():
    print("The cell has not run yet. Write your two lines under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
elif "seat_message" not in globals():
    print("The name seat_message does not exist yet. The condition is False, so the first block did not run, and no other line gives the name a value. Add the line else: under the comment, and under it an indented line that gives seat_message a value. Then run the cell again.")
elif seats_left != 0:
    print(f"The name seats_left refers to {seats_left!r}. This check tests the branch for a bus that is full. Change the first line back to seats_left = 0. Then run the cell again.")
elif seat_message == "The bus is full.":
    print("Correct. The condition is False, so Python performed the block under else.")
elif seat_message == "You can book a seat.":
    print("The bus has 0 seats left, but the name seat_message refers to the text for a bus that has free seats. That happens when the cell has no else branch and an earlier run gave the name that value. Add the line else: and an indented line under it. Then run the cell again.")
else:
    print(f"The name seat_message refers to {seat_message!r} but it must refer to 'The bus is full.' Every character must be the same: the capital letter at the start and the full stop at the end. Then run the cell again.")
"seats_left" in globals() and "seat_message" in globals() and seats_left == 0 and seat_message == "The bus is full."
```

After the check passes, change the first line to `seats_left = 3` and
run the cell again. The condition is now `True`, so Python performs
the first block, and the output is `You can book a seat.`
