---
title: Code that is ready to use
requires: [verify:garden-ran, verify:room-side]
---

# Code that is ready to use

A **module** is a file of Python code that is ready for other programs
to use. A module holds functions and values, and each of them has a
name. Someone has already written the code and tested it.

The **standard library** is the set of modules that comes with Python.
Every computer that has Python has these modules, so you do not need
to install anything to use them.

## Why modules exist

Many programs need the same things: a square root, a date, a random
number. A function is a group of lines that has a name, and you know
how to write one. But a function that calculates a square root is
difficult to write well. It is better to use one that works already.

So why are these functions not ready in every program, as `print()`
and `len()` are? There are too many of them. The standard library
holds thousands of names. If all of them were ready all the time,
Python would start slowly, and a name that you choose would often be
the same as a name that exists already. So the names are kept in
modules, and your program asks for the modules that it needs.

## A comparison

Think of a shelf of closed boxes of tools. Each box has a label, such
as "measuring" or "cutting". The tools stay in their boxes until you
need them. When you need to measure something, you take the box with
the label "measuring" from the shelf and put it on your table.

A module is like one box. The standard library is like the complete
shelf. The word `import` is how you take one box from the shelf.

## Import a module and use it

The module `math` holds functions for calculations. One of them is
`sqrt()`, which gives the square root of a number. The square root of
`49` is `7`, because `7 * 7` is `49`. For example, a square garden
that has an area of 49 square metres has sides that are 7 metres
long.

Click the action below. It adds a cell that imports the module `math`
and uses the function `sqrt()`, and runs the cell.

```{attempt}
:id: garden-not-run
:check: garden-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-garden
:title: Add a cell that imports the module math and calculates a square root, and run it
:path: {{ notebook }}
:tags: [garden]
:run: true
import math

garden_side = math.sqrt(49)
print(garden_side)
```

The output is:

```
7.0
```

```{verify}
:id: garden-ran
:label: The cell imported a module and used it
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed garden
if globals().get("garden_side") == 7.0 and "math" in globals():
    print("The cell ran. It imported the module math, and math.sqrt(49) gave 7.0.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("garden_side") == 7.0 and "math" in globals()
```

## What happened

- The line `import math` told Python to find the module `math` and to
  make it ready. To **import** a module means to make it ready to use
  in your program. After this line, the name `math` refers to the
  module.

- In `math.sqrt(49)`, the dot means "inside". The expression says:
  "the function `sqrt` that is inside the module `math`". You know the
  dot from methods such as `name.upper()`. There, the dot means "the
  method `upper` that belongs to this string". The idea is the same:
  the name on the right of the dot belongs to the thing on the left.

- `math.sqrt(49)` called the function with the argument `49`, and the
  function returned `7.0`. The result of `sqrt()` is always a float,
  which is a number with a decimal point.

You import a module one time. After that, every later cell of the
notebook can use it. In a program, the `import` lines are usually the
first lines.

If you use `math.sqrt()` before the line `import math` has run, Python
does not know the name `math`. It stops with a `NameError`, and the
last line of the error message is:

```
NameError: name 'math' is not defined
```

When you see this message with the name of a module, the `import` line
is missing.

## Your task

A square room has an area of 144 square metres. Calculate the length
of one side of the room.

Write one line that does this:

- It calls `math.sqrt()` with the argument `144`.

- It gives the result the name `room_side`.

The module `math` is imported already, so you do not need to import it
again.

The action below adds a new cell for your line.

```{cell-insert}
:id: insert-room-side
:title: Add a cell for my line
:path: {{ notebook }}
:tags: [room-side]
:run: false
# Write your line below this one.

```

Click on the empty line under the comment, and type your line. Then
run the cell: hold `Shift` and press `Enter`. The cell shows no
output, because an assignment shows nothing. To see the result, you
can add the line `print(room_side)` under your line.

```{hint}
:title: Hint: the form of the line
The line is an assignment. The name `room_side` is on the left of the
`=` sign. On the right is the call of the function, which begins with
the name of the module and a dot.
```

```{hint}
:title: Hint: the line
The line is `room_side = math.sqrt(144)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: room-side-not-started
:check: room-side
:expect: The name room_side does not exist yet
```

````{attempt}
:id: room-side-typed
:check: room-side
:expect: refers to the integer 12

```{cell-insert}
:path: {{ notebook }}
:run: true
room_side = 12
```
````

````{attempt}
:id: room-side-area
:check: room-side
:expect: That is the area of the room

```{cell-insert}
:path: {{ notebook }}
:run: true
room_side = 144
```
````

````{attempt}
:id: room-side-half
:check: room-side
:expect: but it must refer to 12.0

```{cell-insert}
:path: {{ notebook }}
:run: true
room_side = 144 / 2
```
````

````{attempt}
:id: room-side-function
:check: room-side
:expect: refers to the function itself

```{cell-insert}
:path: {{ notebook }}
:run: true
room_side = math.sqrt
```
````

````{hint}
:title: Show me a solution
:unlock: "room-side" in failed_checks or "room-side" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-room-side-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [room-side-solution]
:run: true
room_side = math.sqrt(144)
print(room_side)
```
````

```{verify}
:id: room-side
:label: The name room_side refers to the square root of 144
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed room-side; cell-executed room-side-solution
if "room_side" not in globals():
    print("The name room_side does not exist yet. Write your line under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
elif callable(globals()["room_side"]):
    print("The name room_side refers to the function itself, and not to its result. Call the function: write parentheses after its name, with the argument 144 between them. Then run the cell again.")
elif type(globals()["room_side"]) is int and globals()["room_side"] == 12:
    print("The name room_side refers to the integer 12. The answer is correct, but the task is to let Python calculate it. math.sqrt(144) gives the float 12.0. Write room_side = math.sqrt(144) and run the cell again.")
elif type(globals()["room_side"]) in (int, float) and globals()["room_side"] == 144:
    print("The name room_side refers to 144. That is the area of the room. The length of a side is the square root of the area. Write room_side = math.sqrt(144) and run the cell again.")
elif type(globals()["room_side"]) is float and globals()["room_side"] == 12.0:
    print("Correct. math.sqrt(144) gives 12.0, so one side of the room is 12 metres long.")
else:
    print(f"The name room_side refers to {globals()['room_side']!r} but it must refer to 12.0. Call the function sqrt of the module math with the argument 144: room_side = math.sqrt(144). Then run the cell again.")
type(globals().get("room_side")) is float and globals().get("room_side") == 12.0
```

The name `sqrt` is only one of the names in the module `math`. On the
next page you use three more.
