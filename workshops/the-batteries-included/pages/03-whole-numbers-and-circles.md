---
title: Whole numbers and circles
requires: [verify:notebooks-ran, verify:egg-boxes-ran, verify:table-edge-ran, verify:trips-and-months]
---

# Whole numbers and circles

The module `math` holds many functions and values for calculations. On
this page you use three of its names: `floor`, `ceil` and `pi`.

## Why a division is often not the answer

Many questions about real things need a whole number as the answer. A
division gives a float, and the float is often not a whole number.

- A notebook costs 2.40 and Mariam has 20.00. The division `20 / 2.4`
  gives a little more than `8.33`. A shop does not sell a part of a
  notebook, so she can buy 8.

- Mariam needs 20 eggs, and a box holds 6 eggs. The division `20 / 6`
  gives a little more than `3.33`. Three boxes are not enough, so she
  must buy 4.

In the first example the answer is the whole number below the result.
In the second example the answer is the whole number above the result.
The module `math` has one function for each:

- `math.floor()` gives the nearest whole number that is not larger
  than its argument. It goes down. The floor of a room is the part
  under you.

- `math.ceil()` gives the nearest whole number that is not smaller
  than its argument. It goes up. The name is short for "ceiling", and
  the ceiling of a room is the part over you.

## Down to a whole number

Click the action below. It adds a cell that calculates how many
notebooks Mariam can buy, and runs it.

```{attempt}
:id: notebooks-not-run
:check: notebooks-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-notebooks
:title: Add a cell that uses math.floor, and run it
:path: {{ notebook }}
:tags: [notebooks]
:run: true
import math

print(20 / 2.4)
notebooks = math.floor(20 / 2.4)
print(notebooks)
```

The output is:

```
8.333333333333334
8
```

```{verify}
:id: notebooks-ran
:label: The cell used math.floor
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed notebooks
if type(globals().get("notebooks")) is int and globals().get("notebooks") == 8:
    print("The cell ran. math.floor() gave 8, the whole number below 8.33.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("notebooks")) is int and globals().get("notebooks") == 8
```

The cell begins with `import math`. A module that is imported already
can be imported again without a problem: Python does nothing the
second time. So a cell that needs a module can always begin with the
`import` line.

The first line of output is the result of the division. The second
line is the result of `math.floor()`. It is the integer `8`, with no
decimal point.

## Up to a whole number

Click the action below. It adds a cell that calculates how many boxes
of eggs Mariam must buy, and runs it.

```{attempt}
:id: egg-boxes-not-run
:check: egg-boxes-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-egg-boxes
:title: Add a cell that uses math.ceil, and run it
:path: {{ notebook }}
:tags: [egg-boxes]
:run: true
print(20 / 6)
egg_boxes = math.ceil(20 / 6)
print(egg_boxes)
```

The output is:

```
3.3333333333333335
4
```

```{verify}
:id: egg-boxes-ran
:label: The cell used math.ceil
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed egg-boxes
if type(globals().get("egg_boxes")) is int and globals().get("egg_boxes") == 4:
    print("The cell ran. math.ceil() gave 4, the whole number above 3.33.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("egg_boxes")) is int and globals().get("egg_boxes") == 4
```

When the argument is a whole number already, the two functions give
that number: `math.floor(7.0)` and `math.ceil(7.0)` both give `7`.

## A value in a module

A module holds values as well as functions. The name `math.pi` refers
to the number that you need for every calculation about a circle. It
is a little more than `3.14`. The length of the edge of a circle is
this number multiplied by the width of the circle.

After `math.pi` there are no parentheses. Parentheses call a function,
and `math.pi` is not a function. It is a name that refers to a float.

Mariam has a round table that is 1.2 metres wide. Click the action
below. It adds a cell that calculates the length of the edge of the
table, and runs it.

```{attempt}
:id: table-edge-not-run
:check: table-edge-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-table-edge
:title: Add a cell that uses math.pi, and run it
:path: {{ notebook }}
:tags: [table-edge]
:run: true
print(math.pi)
table_edge = math.pi * 1.2
print(f"{table_edge:.2f}")
```

The output is:

```
3.141592653589793
3.77
```

```{verify}
:id: table-edge-ran
:label: The cell used math.pi
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed table-edge
if type(globals().get("table_edge")) is float and round(globals().get("table_edge"), 2) == 3.77:
    print("The cell ran. The edge of the table is about 3.77 metres long.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("table_edge")) is float and round(globals().get("table_edge"), 2) == 3.77
```

The edge of the table is about 3.77 metres long. The last line of the
cell uses an f-string, which is a string that begins with `f` and
puts a value in the place of each pair of curly brackets. The part
`:.2f` shows the number with two digits after the decimal point.

## Your task

Answer two questions about Mariam's money. Each answer is one line of
code, and both lines go in the same cell.

1. One bus ticket costs 2.80, and Mariam has 30.00. How many tickets
   can she buy? Give the answer the name `full_trips`. The division is
   `30 / 2.8`.

2. Mariam wants a bicycle that costs 200, and she saves 45 each month.
   After how many months does she have enough money? Give the answer
   the name `months_needed`. The division is `200 / 45`.

For each question, decide whether the answer is the whole number
below the result of the division or the whole number above it. Then
use `math.floor()` or `math.ceil()`. Both answers must be integers.

The action below adds a new cell for your two lines.

```{cell-insert}
:id: insert-trips-and-months
:title: Add a cell for my two lines
:path: {{ notebook }}
:tags: [trips-and-months]
:run: false
# Write your two lines below this one.

```

Click on the empty line under the comment, and type your lines. Then
run the cell: hold `Shift` and press `Enter`. To see your answers, you
can add `print(full_trips)` and `print(months_needed)` under your
lines.

```{hint}
:title: Hint: down or up
Mariam cannot buy a part of a ticket, so the number of tickets goes
down to a whole number. After 4 months Mariam does not have enough
money yet, so the number of months goes up to a whole number.
```

```{hint}
:title: Hint: the first line
The first line is `full_trips = math.floor(30 / 2.8)`. The second line
has the same form, with the other function and the other division.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: trips-not-started
:check: trips-and-months
:expect: The name full_trips does not exist yet
```

````{attempt}
:id: trips-only
:check: trips-and-months
:expect: The name months_needed does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
full_trips = math.floor(30 / 2.8)
```
````

````{attempt}
:id: trips-no-function
:check: trips-and-months
:expect: is the result of the division

```{cell-insert}
:path: {{ notebook }}
:run: true
full_trips = 30 / 2.8
months_needed = 200 / 45
```
````

````{attempt}
:id: trips-rounded-up
:check: trips-and-months
:expect: 11 tickets cost more than 30.00

```{cell-insert}
:path: {{ notebook }}
:run: true
full_trips = math.ceil(30 / 2.8)
months_needed = math.ceil(200 / 45)
```
````

````{attempt}
:id: months-rounded-down
:check: trips-and-months
:expect: After 4 months Mariam has 180

```{cell-insert}
:path: {{ notebook }}
:run: true
full_trips = math.floor(30 / 2.8)
months_needed = math.floor(200 / 45)
```
````

````{attempt}
:id: months-not-divided
:check: trips-and-months
:expect: The name months_needed refers to 200 but it must refer to 5

```{cell-insert}
:path: {{ notebook }}
:run: true
full_trips = math.floor(30 / 2.8)
months_needed = math.ceil(200)
```
````

````{hint}
:title: Show me a solution
:unlock: "trips-and-months" in failed_checks or "trips-and-months" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-trips-and-months-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [trips-and-months-solution]
:run: true
full_trips = math.floor(30 / 2.8)
months_needed = math.ceil(200 / 45)
print(full_trips)
print(months_needed)
```
````

```{verify}
:id: trips-and-months
:label: The two names refer to the correct whole numbers
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed trips-and-months; cell-executed trips-and-months-solution
def _workshop_check():
    if "full_trips" not in globals():
        print("The name full_trips does not exist yet. Write your two lines under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    if "months_needed" not in globals():
        print("The name months_needed does not exist yet. Your cell needs a second line, which makes the name months_needed refer to the number of months. Then run the cell again.")
        return False
    trips = globals()["full_trips"]
    months = globals()["months_needed"]
    for name, value, function in [("full_trips", trips, "math.floor()"), ("months_needed", months, "math.ceil()")]:
        if type(value) is float and value != int(value):
            print(f"The name {name} refers to {value!r}, which is the result of the division. The answer must be a whole number. Put the division between the parentheses of {function}. Then run the cell again.")
            return False
    if trips == 11:
        print("The name full_trips refers to 11, but 11 tickets cost more than 30.00. The number of tickets goes down to a whole number, so use math.floor() for this line. Then run the cell again.")
        return False
    if months == 4:
        print("The name months_needed refers to 4. After 4 months Mariam has 180, which is not enough. The number of months goes up to a whole number, so use math.ceil() for this line. Then run the cell again.")
        return False
    if type(trips) is not int or trips != 10:
        print(f"The name full_trips refers to {trips!r} but it must refer to 10. Write full_trips = math.floor(30 / 2.8) and run the cell again.")
        return False
    if type(months) is not int or months != 5:
        print(f"The name months_needed refers to {months!r} but it must refer to 5. Write months_needed = math.ceil(200 / 45) and run the cell again.")
        return False
    print("Correct. Mariam can buy 10 tickets, and she has enough money for the bicycle after 5 months.")
    return True
globals().pop("_workshop_check")()
```
