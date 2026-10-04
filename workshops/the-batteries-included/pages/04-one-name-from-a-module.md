---
title: One name from a module
requires: [verify:field-ran, verify:boxes-needed]
---

# One name from a module

There is a second way to import. The line `from math import sqrt`
imports one name from a module, and not the module as a whole. After
that line, you write `sqrt(49)`, with no `math` and no dot before it.

## Why there are two ways

When a program uses one function many times, the name of the module
before every call makes the lines long. The second way makes the
lines shorter.

Each way has an advantage:

- After `import math`, you write `math.sqrt(49)`. The line is longer,
  but everyone who reads it can see that `sqrt` comes from the module
  `math`.

- After `from math import sqrt`, you write `sqrt(49)`. The line is
  shorter, but the reader must look at the `import` lines to find
  where `sqrt` comes from.

Both ways are correct, and you will see both in programs that other
people wrote. If you did the workshop **Reading and writing files**,
you used the second way there, in the line `from pathlib import Path`.

In the comparison of the shelf of boxes, `import math` puts the
complete box on your table. `from math import sqrt` takes one tool
from the box and puts only that tool on your table.

## Import one name

A square field has an area of 400 square metres. Click the action
below. It adds a cell that imports the name `sqrt` and calculates the
length of one side of the field, and runs the cell.

```{attempt}
:id: field-not-run
:check: field-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-field
:title: Add a cell that imports one name from the module math, and run it
:path: {{ notebook }}
:tags: [field]
:run: true
from math import sqrt

field_side = sqrt(400)
print(field_side)
```

The output is:

```
20.0
```

```{verify}
:id: field-ran
:label: The cell imported one name and used it
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed field
if globals().get("field_side") == 20.0 and callable(globals().get("sqrt")):
    print("The cell ran. It imported the name sqrt from the module math, and sqrt(400) gave 20.0.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("field_side") == 20.0 and callable(globals().get("sqrt"))
```

## What happened

- The line `from math import sqrt` told Python to find the module
  `math`, and to make the name `sqrt` in your program refer to the
  function `sqrt` of that module. Read the line as: "from the module
  `math`, import the name `sqrt`".

- The line `field_side = sqrt(400)` called the function by its own
  name. It is the same function as `math.sqrt`, so the result is the
  same.

This form imports only the names that the line gives. It does not
make the name of the module ready. If `from math import sqrt` is the
only `import` line of a program, then `math.floor(2.5)` stops with a
`NameError`, because the program does not know the name `math`.

One line can import several names, with a comma between them:

```python
from math import floor, ceil
```

## Your task

A box holds 12 bottles. A shop must pack 50 bottles. How many boxes
does the shop need?

Write a cell of two lines:

1. The first line imports the name `ceil` from the module `math`, with
   the word `from`.

2. The second line calls `ceil()` with the division `50 / 12`, and
   gives the result the name `boxes_needed`. Write `ceil` with no
   `math` and no dot before it.

The action below adds a new cell for your two lines.

```{cell-insert}
:id: insert-boxes-needed
:title: Add a cell for my two lines
:path: {{ notebook }}
:tags: [boxes-needed]
:run: false
# Write your two lines below this one.

```

Click on the empty line under the comment, and type your lines. Then
run the cell: hold `Shift` and press `Enter`. To see your answer, you
can add `print(boxes_needed)` under your lines.

```{hint}
:title: Hint: the import line
The import line has the same form as the line in the cell above. It
begins with `from math import`, and then comes the name that you
want.
```

```{hint}
:title: Hint: the two lines
The first line is `from math import ceil`. The second line is
`boxes_needed = ceil(50 / 12)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: boxes-not-started
:check: boxes-needed
:expect: The name boxes_needed does not exist yet
```

````{attempt}
:id: boxes-with-module-name
:check: boxes-needed
:expect: your cell did not import the name ceil

```{cell-insert}
:path: {{ notebook }}
:run: true
import math
boxes_needed = math.ceil(50 / 12)
```
````

````{attempt}
:id: boxes-division-only
:check: boxes-needed
:expect: is the result of the division

```{cell-insert}
:path: {{ notebook }}
:run: true
from math import ceil
boxes_needed = 50 / 12
```
````

````{attempt}
:id: boxes-floor
:check: boxes-needed
:expect: 4 boxes hold only 48 bottles

```{cell-insert}
:path: {{ notebook }}
:run: true
from math import floor
boxes_needed = floor(50 / 12)
```
````

````{attempt}
:id: boxes-other-value
:check: boxes-needed
:expect: refers to 50 but it must refer to 5

```{cell-insert}
:path: {{ notebook }}
:run: true
from math import ceil
boxes_needed = ceil(50)
```
````

````{hint}
:title: Show me a solution
:unlock: "boxes-needed" in failed_checks or "boxes-needed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-boxes-needed-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [boxes-needed-solution]
:run: true
from math import ceil

boxes_needed = ceil(50 / 12)
print(boxes_needed)
```
````

```{verify}
:id: boxes-needed
:label: Your cell imported ceil and calculated the number of boxes
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed boxes-needed; cell-executed boxes-needed-solution
def _workshop_check():
    import math
    if "boxes_needed" not in globals():
        print("The name boxes_needed does not exist yet. Write your two lines under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    boxes = globals()["boxes_needed"]
    if type(boxes) is float and boxes != int(boxes):
        print(f"The name boxes_needed refers to {boxes!r}, which is the result of the division. The answer must be a whole number. Put the division between the parentheses of ceil(). Then run the cell again.")
        return False
    if boxes == 4:
        print("The name boxes_needed refers to 4, but 4 boxes hold only 48 bottles. The number of boxes goes up to a whole number, so use ceil(). Then run the cell again.")
        return False
    if type(boxes) is not int or boxes != 5:
        print(f"The name boxes_needed refers to {boxes!r} but it must refer to 5. Write boxes_needed = ceil(50 / 12) and run the cell again.")
        return False
    if globals().get("ceil") is not math.ceil:
        print("The name boxes_needed refers to 5, which is correct, but your cell did not import the name ceil. Make the first line from math import ceil. Then write ceil(50 / 12) with no math and no dot before it, and run the cell again.")
        return False
    print("Correct. Your cell imported the name ceil from the module math, and the shop needs 5 boxes.")
    return True
globals().pop("_workshop_check")()
```
