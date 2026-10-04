---
title: Unpacking a tuple
requires: [verify:arrival-ran, quiz:predict-unpack, verify:size-ran, verify:trip]
---

# Unpacking a tuple

A program often needs each item of a tuple under a name of its own.
With an index, that takes one line for each item:

```python
year = arrival[0]
month = arrival[1]
day = arrival[2]
```

These lines work, but they are long, and a wrong index is a mistake
that is difficult to see.

**Unpacking** does the same work in one line. Unpacking is an
assignment that has several names on the left side and one tuple on
the right side. Python gives the first name to the first item, the
second name to the second item, and continues in the same way to the
last item.

Think of a parcel that holds three things. When you unpack the parcel,
you take each thing and put it in its own place.

Click the action below. It adds a cell that unpacks a tuple into three
names, and runs it.

```{attempt}
:id: arrival-not-run
:check: arrival-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-arrival
:title: Add a cell that unpacks a tuple into three names, and run it
:path: {{ notebook }}
:tags: [arrival]
:run: true
arrival = (2026, 10, 4)
year, month, day = arrival
print(year)
print(month)
print(day)
```

The output is:

```
2026
10
4
```

```{verify}
:id: arrival-ran
:label: The tuple was unpacked into three names
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed arrival
if globals().get("arrival") == (2026, 10, 4) and globals().get("year") == 2026 and globals().get("month") == 10 and globals().get("day") == 4:
    print("The cell ran. The names year, month and day each refer to one item of the tuple.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("arrival") == (2026, 10, 4) and globals().get("year") == 2026 and globals().get("month") == 10 and globals().get("day") == 4
```

## What happened

1. `arrival = (2026, 10, 4)` makes the name `arrival` refer to a tuple
   of three items.

2. `year, month, day = arrival` is the unpacking. The left side has
   three names, with a comma between them. Python makes `year` refer
   to the first item, `month` to the second item, and `day` to the
   third item.

3. The three `print()` lines show the three values.

The tuple itself does not change. The name `arrival` still refers to
the whole tuple.

The number of names must be the same as the number of items. With two
names and three items, Python does not know what to do with the third
item. It stops with an error message of the type `ValueError`. A
`ValueError` means that a value has the correct type, but something
else about the value does not fit. Here, the number of items does not
fit.

## Predict

Look at this cell. Do not run it yet. The tuple holds the width and
the height of a table, in centimetres.

```python
size = (30, 20)
width, height = size
print(width * height)
```

```{quiz}
:id: predict-unpack
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "600"
wrong:
  - { text: "50", explanation: "`50` is `30 + 20`. The last line multiplies: the operator is `*`." }
  - { text: "(30, 20)", explanation: "The last line does not print the tuple. It prints `width * height`, which is one number." }
  - { text: "900", explanation: "`900` is `30 * 30`. The name `height` refers to the second item of the tuple, which is `20`." }
  - { text: "400", explanation: "`400` is `20 * 20`. The name `width` refers to the first item of the tuple, which is `30`." }
otherwise: "The second line makes `width` refer to the first item, and `height` refer to the second item. Then the last line multiplies the two values."
explanation: "The unpacking makes `width` refer to `30` and `height` refer to `20`. The last line prints `30 * 20`, which is `600`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: size-not-run
:check: size-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-size
:title: Add the cell that unpacks a width and a height, and run it
:path: {{ notebook }}
:tags: [size]
:run: true
size = (30, 20)
width, height = size
print(width * height)
```

```{verify}
:id: size-ran
:label: The tuple was unpacked into a width and a height
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed size
if globals().get("size") == (30, 20) and globals().get("width") == 30 and globals().get("height") == 20:
    print("The cell ran. The name width refers to 30 and the name height refers to 20, so the output is 600.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("size") == (30, 20) and globals().get("width") == 30 and globals().get("height") == 20
```

## Your task

A bus travels from the city of Lima to the city of Cusco. The road is
about 1100 kilometres long. Keep the three values in a tuple, and then
unpack the tuple.

Your program must do these three things, in this order:

1. Give the name `trip` to the tuple `("Lima", "Cusco", 1100)`.

2. Unpack `trip` into three names, in one line. The names are `start`,
   `end` and `distance`, in this order.

3. Show the value of `distance` with `print()`.

When the program is correct, the output under the cell is:

```
1100
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-trip
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [trip]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell that unpacks the tuple `arrival`. Your program has
the same form: one line that creates the tuple, one line that unpacks
it, and one `print()` line.
```

```{hint}
:title: Hint: the unpacking
The unpacking has the three names on the left side, with commas
between them, and the name of the tuple on the right side:
`start, end, distance = trip`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: trip-not-started
:check: trip
:expect: The name trip does not exist yet
```

````{attempt}
:id: trip-wrong-tuple
:check: trip
:expect: but it must refer to the tuple ('Lima', 'Cusco', 1100)

```{cell-insert}
:path: {{ notebook }}
:run: true
trip = ("Lima", "Cusco")
```
````

````{attempt}
:id: trip-not-unpacked
:check: trip
:expect: The name start does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
trip = ("Lima", "Cusco", 1100)
```
````

````{attempt}
:id: trip-wrong-order
:check: trip
:expect: The names are not in the correct order

```{cell-insert}
:path: {{ notebook }}
:run: true
trip = ("Lima", "Cusco", 1100)
distance, start, end = trip
print(distance)
```
````

````{attempt}
:id: trip-with-indexes
:check: trip
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
trip = ("Lima", "Cusco", 1100)
start = trip[0]
end = trip[1]
distance = trip[2]
print(distance)
```
````

````{hint}
:title: Show me a solution
:unlock: "trip" in failed_checks or "trip" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-trip-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [trip-solution]
:run: true
trip = ("Lima", "Cusco", 1100)
start, end, distance = trip
print(distance)
```
````

```{verify}
:id: trip
:label: Your program unpacks the tuple into three names
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed trip; cell-executed trip-solution
if "trip" not in globals():
    print("The name trip does not exist yet. Write your program under the comment in the new cell, and begin with the line that creates the tuple: trip = (\"Lima\", \"Cusco\", 1100). Then hold Shift and press Enter to run the cell.")
elif trip != ("Lima", "Cusco", 1100) or not isinstance(trip, tuple):
    print(f"The name trip refers to {trip!r} but it must refer to the tuple ('Lima', 'Cusco', 1100). Check the parentheses, the spelling of the two cities and the number. Then run the cell again.")
elif "start" not in globals() or "end" not in globals() or "distance" not in globals():
    print("The tuple is correct. The name " + [name for name in ("start", "end", "distance") if name not in globals()][0] + " does not exist yet. Add a line that unpacks the tuple into three names: start, end, distance = trip. Check the spelling of each name. Then run the cell again.")
elif (start, end, distance) == trip:
    print("Correct. The name start refers to 'Lima', the name end refers to 'Cusco', and the name distance refers to 1100.")
elif sorted([start, end, distance], key=repr) == sorted(trip, key=repr):
    print(f"The names are not in the correct order. The name start refers to {start!r}, the name end refers to {end!r} and the name distance refers to {distance!r}. Python gives the first name to the first item. Write the names in the same order as the items: start, end, distance = trip. Then run the cell again.")
else:
    print(f"The name start refers to {start!r}, the name end refers to {end!r} and the name distance refers to {distance!r}. They must refer to 'Lima', 'Cusco' and 1100. Unpack the tuple in one line: start, end, distance = trip. Then run the cell again.")
"trip" in globals() and "start" in globals() and "end" in globals() and "distance" in globals() and isinstance(trip, tuple) and trip == ("Lima", "Cusco", 1100) and (start, end, distance) == trip
```
