---
title: Choosing good names
requires: [quiz:valid-name, verify:room-renamed]
---

# Choosing good names

You choose the names in your programs. Python accepts many names, but
it has a few rules. Good programmers also follow some habits that make
code easier to read.

## The rules of Python

Python accepts a name only when it follows these rules:

- A name can contain letters, digits and the underscore symbol `_`.

- A name cannot begin with a digit.

- A name cannot contain a space, or a symbol such as `-`.

- Capital letters and small letters are different. `Price` and `price`
  are two different names.

- A few words have a special meaning in Python and cannot be used as
  names. Examples are `if`, `for` and `class`. You meet these words in
  later workshops.

A name that breaks a rule gives an error when the cell runs.

```{quiz}
:id: valid-name
:title: Which name does Python accept?
question: "Which of these is a name that Python accepts?"
options:
  - { text: "`2nd_ticket`", explanation: "A name cannot begin with a digit." }
  - { text: "`ticket price`", explanation: "A name cannot contain a space. Python reads this as two separate names." }
  - { text: "`ticket_price`", correct: true }
  - { text: "`ticket-price`", explanation: "The symbol `-` is the operator for subtraction. Python reads this as `ticket` minus `price`." }
explanation: "`ticket_price` contains only letters and an underscore, and it does not begin with a digit."
```

## The habits of good programmers

Python accepts the name `x`, and it accepts the name `tp`. But a
program is read by people many more times than it is written. A good
name tells the reader what the value means.

Python programmers follow these habits:

- Use whole words that say what the value means: `ticket_price`, not
  `tp` or `x`.

- Use small letters only.

- Join the words with the underscore `_`, because a name cannot
  contain a space: `total_cost`, not `totalcost`.

Compare these two cells. They do the same calculation.

```python
a = 12
b = 3
c = a * b
```

```python
ticket_price = 12
tickets = 3
total_cost = ticket_price * tickets
```

Python calculates both in the same way. Only the second cell tells a
person what is being calculated.

## Your task

A room is 6 metres long and 4 metres wide. The action below adds a
cell that calculates the area of the floor. The cell works, but its
names say nothing.

```{cell-insert}
:id: insert-room
:title: Add a cell with poor names for me to change
:path: {{ notebook }}
:tags: [room]
:run: false
a = 6
b = 4
c = a * b
c
```

Change the three names in the cell:

- change `a` to `room_length`

- change `b` to `room_width`

- change `c` to `room_area`

Each name appears more than once. Change it in every place. Then run
the cell. The output must still be `24`.

```{hint}
:title: Hint: how many places must I change?
The name `a` appears two times: in the first line and in the third
line. The name `b` also appears two times. The name `c` appears two
times: in the third line and in the last line. That makes six changes.
```

```{hint}
:title: Hint: I see a NameError
A `NameError` means that a line uses a name that no line has created.
You probably changed a name in one place but not in another place.
Read the last line of the error message to see which name Python
could not find. Then check the spelling of that name in every line.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: room-not-started
:check: room-renamed
:expect: The name room_area does not exist yet
```

````{attempt}
:id: room-only-area
:check: room-renamed
:expect: The name room_length does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
a = 6
b = 4
room_area = a * b
room_area
```
````

````{attempt}
:id: room-no-width
:check: room-renamed
:expect: The name room_width does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
room_length = 6
b = 4
room_area = room_length * b
room_area
```
````

````{hint}
:title: Show me a solution
:unlock: "room-renamed" in failed_checks or "room-renamed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-room-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [room-solution]
:run: true
room_length = 6
room_width = 4
room_area = room_length * room_width
room_area
```
````

```{verify}
:id: room-renamed
:label: The cell uses the names room_length, room_width and room_area
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed room; cell-executed room-solution
if "room_area" not in globals():
    print("The name room_area does not exist yet. Change the name c to room_area in the third line and in the last line of the cell. Check the spelling, and use small letters. Then run the cell.")
elif "room_length" not in globals():
    print("The name room_length does not exist yet. Change the name a to room_length in the first line and in the third line of the cell. Check the spelling, and use small letters. Then run the cell again.")
elif "room_width" not in globals():
    print("The name room_width does not exist yet. Change the name b to room_width in the second line and in the third line of the cell. Check the spelling, and use small letters. Then run the cell again.")
elif room_length == 6 and room_width == 4 and room_area == 24:
    print("Correct. The cell gives the same result, 24, and now its names say what the values mean.")
else:
    print("The three names exist, but their values are not the ones expected. room_length must refer to 6, room_width must refer to 4, and room_area must refer to room_length * room_width, which is 24. Change only the names, not the numbers. Then run the cell again.")
all(name in globals() for name in ("room_length", "room_width", "room_area")) and room_length == 6 and room_width == 4 and room_area == 24
```
