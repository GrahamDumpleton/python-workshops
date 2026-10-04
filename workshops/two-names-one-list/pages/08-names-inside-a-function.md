---
title: Names inside a function
requires: [verify:volume-ran, quiz:predict-base, verify:floor-fixed]
---

# Names inside a function

The rest of this workshop is about names, and about where a name
exists. Until now, every name that you made was available in every
cell that ran later. Names that are made inside a function are
different.

A **local name** is a name that is made inside a function: each
parameter, and each name that a line of the function assigns. A local
name exists only while the function runs. When the function returns,
Python removes its local names.

A **global name** is a name that is made outside every function, at
the left edge of a cell. A global name exists from the moment when
its line runs, and every later cell can use it.

## Why local names exist

A function often needs names for its own work: a total that it adds
up, or the result of one step. If these names stayed after the call,
they could replace names of the same spelling in your notebook, and
every person who writes a function would need to know every name
that you use. Local names prevent that. A function can use any names
inside, and the code that calls it sees only the return value.

Think of a calculation on a piece of scrap paper. You write the
steps on the scrap paper, you say the answer, and you throw the paper
away. Only the answer remains.

## A function with a local name

Click the action below. It adds a cell with a function that
calculates the volume of a box, and runs it.

```{attempt}
:id: volume-not-run
:check: volume-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-volume
:title: Add a cell with a function that uses a local name, and run it
:path: {{ notebook }}
:tags: [volume]
:run: true
def box_volume(width, depth, height):
    base = width * depth
    return base * height

volume = box_volume(2, 3, 4)
print(volume)
```

The output is `24`.

```{verify}
:id: volume-ran
:label: The function calculated the volume of the box
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed volume
if globals().get("volume") == 24 and callable(globals().get("box_volume")):
    print("The cell ran. The function box_volume returned 24, and the name volume refers to it.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("volume") == 24 and callable(globals().get("box_volume"))
```

## What happened

The function has four local names: the parameters `width`, `depth`
and `height`, and the name `base`, which the first line of the
function assigns.

1. The call `box_volume(2, 3, 4)` ties the three parameters to the
   arguments `2`, `3` and `4`.

2. `base = width * depth` makes the local name `base`, which refers
   to `6`.

3. `return base * height` gives back `24`. The function ends, and
   Python removes the four local names.

4. `volume = box_volume(2, 3, 4)` ties the global name `volume` to the
   return value.

The cell made two global names: `box_volume`, which refers to the
function, and `volume`.

```{quiz}
:id: predict-base
:title: Predict what happens
question: "After this cell has run, a new cell holds the one line `print(base)`. What happens when the new cell runs?"
options:
  - { text: "The notebook shows `6`, the value that `base` had inside the function", explanation: "The name `base` existed only while the function ran. Python removed it when the function returned." }
  - { text: "Python stops with a `NameError`, because the name `base` does not exist outside the function", correct: true }
  - { text: "The notebook shows `None`, because the function has finished", explanation: "Python does not give `None` for a name that does not exist. It stops with a `NameError`." }
explanation: "`base` is a local name of the function `box_volume`. It existed only while the function ran. Outside the function, no name `base` exists, so Python stops with a `NameError`. The only thing that leaves the function is its return value."
```

## Your task

The cell below has this mistake. Its function calculates the area of
a floor, and the last line tries to use the local name `area` outside
the function.

```{cell-insert}
:id: insert-floor
:title: Add a cell that uses a local name outside its function
:path: {{ notebook }}
:tags: [floor]
:run: false
def room_area(width, length):
    area = width * length
    return area

room_area(4, 5)
print(area)
```

First run the cell as it is: click inside it, hold `Shift` and press
`Enter`. Python stops with an error message. Its last line is:

```
NameError: name 'area' is not defined
```

The call `room_area(4, 5)` worked, and it returned `20`. But no name
was given to the return value, so the value was lost. Then `area`
was removed with the other local names.

Now correct the cell. Do not change the function. Change the last two
lines:

- The line with the call must give the return value the global name
  `floor`.

- The last line must show the value of `floor` with `print()`.

Run the cell again. When the cell is correct, the output is `20`.

```{hint}
:title: Hint: what to look at
Look at the last two lines of the cell at the top of this page. The
line `volume = box_volume(2, 3, 4)` gives a name to the return value,
and the next line prints that name. Your two lines need the same
form.
```

```{hint}
:title: Hint: the two lines
The line with the call is an assignment. Write the name `floor`, then
`=`, then the call `room_area(4, 5)`. The last line is `print(floor)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: floor-not-started
:check: floor-fixed
:expect: The cell has not run yet
```

````{attempt}
:id: floor-no-name
:check: floor-fixed
:expect: The name floor does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def room_area(width, length):
    area = width * length
    return area

room_area(4, 5)
```
````

````{attempt}
:id: floor-wrong-value
:check: floor-fixed
:expect: The name floor refers to 9

```{cell-insert}
:path: {{ notebook }}
:run: true
def room_area(width, length):
    area = width + length
    return area

floor = room_area(4, 5)
print(floor)
```
````

````{attempt}
:id: floor-printed-in-assignment
:check: floor-fixed
:expect: The name floor refers to None

```{cell-insert}
:path: {{ notebook }}
:run: true
def room_area(width, length):
    area = width * length
    return area

floor = print(room_area(4, 5))
```
````

````{hint}
:title: Show me a solution
:unlock: "floor-fixed" in failed_checks or "floor-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-floor-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [floor-solution]
:run: true
def room_area(width, length):
    area = width * length
    return area

floor = room_area(4, 5)
print(floor)
```
````

```{verify}
:id: floor-fixed
:label: The return value has the global name floor
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed floor; cell-executed floor-solution
if "room_area" not in globals():
    print("The cell has not run yet. Click inside the new cell, then hold Shift and press Enter to run it.")
elif "floor" not in globals():
    print("The name floor does not exist yet. The function room_area exists, so the cell ran, but no line gave a name to the return value. Change the line with the call to an assignment: floor = room_area(4, 5) and change the last line to print(floor). Then run the cell again.")
elif floor is None:
    print("The name floor refers to None. That happens when the assignment has print() on its right side, because print() gives back None. The assignment must have only the call on its right side: floor = room_area(4, 5) and the line under it shows the value: print(floor). Then run the cell again.")
elif floor == 20:
    print("Correct. The return value of room_area(4, 5) now has the global name floor, which refers to 20.")
else:
    print(f"The name floor refers to {floor!r}, but it must refer to 20, the return value of room_area(4, 5). Do not change the function. The line with the call must be floor = room_area(4, 5). Then run the cell again.")
"room_area" in globals() and globals().get("floor") is not None and globals().get("floor") == 20
```

You corrected the cell. A value leaves a function only as its return
value, and the code that calls the function must give that value a
name to keep it.
