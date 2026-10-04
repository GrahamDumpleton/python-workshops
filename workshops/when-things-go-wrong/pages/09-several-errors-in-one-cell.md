---
title: Several errors in one cell
requires: [verify:trip-fixed]
---

# Several errors in one cell

A cell can have more than one mistake. Python does not show all of
them at once. It stops at the first error that it finds, and shows one
error message.

So you correct one mistake, and run the cell again. Then Python shows
the next error. This is normal, and it shows progress: each new error
message means that the mistake before it is gone. Programmers work in
this way every day.

The method is always the same:

1. Run the cell.

2. Read the last line of the error message, for the type and the
   message.

3. Find the line that Python marks.

4. Correct that one mistake, and go back to step 1.

## The problem

Amara plans a walking trip. She walks 40 kilometres each day, for 3
days. The cell below is meant to show her name, and then the total
distance. When it is correct, the output is:

```
Traveller: Amara
Distance: 120
```

The cell has three mistakes, on three different lines. Each one gives
a different type of error.

```{cell-insert}
:id: insert-trip
:title: Add a cell that has three mistakes in it, without running it
:path: {{ notebook }}
:tags: [trip]
:run: false
traveller = "Amara"
km_per_day = 40
trip_days = 3
print("Traveller:" traveller)
trip_km = km_per_day * trip_dys
trip_summary = "Distance: " + trip_km
print(trip_summary)
```

## Your task

Run the cell. Read the error message, and correct the one mistake
that it describes. Then run the cell again, and do the same for the
next error message. Continue until the cell shows the two lines of
output above.

Correct only one mistake each time, and run the cell after each
correction. In this way you see each of the three error messages.

You can click `Check` at any time. The check tells you how far Python
gets in the cell.

```{hint}
:title: Hint: the first error
The first error is a `SyntaxError`, on line 4. Python finds it before
any line runs. Look at the two values between the parentheses of
`print()`. Which symbol must be between two values?
```

```{hint}
:title: Hint: the second error
The second error is a `NameError`, on line 5. The message says which
name has no value. Compare that name, letter by letter, with the name
that line 3 creates.
```

```{hint}
:title: Hint: the third error
The third error is a `TypeError`, on line 6. The line joins a string
and a number with the operator `+`. Use an f-string instead, with the
name `trip_km` in braces: `f"Distance: {trip_km}"`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run the cell, or after you have clicked `Check`.

```{attempt}
:id: trip-not-started
:check: trip-fixed
:expect: No line of the cell has run yet
```

````{attempt}
:id: trip-stops-at-name
:check: trip-fixed
:expect: Python now stops at the fifth line

```{cell-insert}
:path: {{ notebook }}
:run: true
traveller = "Amara"
km_per_day = 40
trip_days = 3
print("Traveller:", traveller)
```
````

````{attempt}
:id: trip-stops-at-type
:check: trip-fixed
:expect: Python now stops at the sixth line

```{cell-insert}
:path: {{ notebook }}
:run: true
traveller = "Amara"
km_per_day = 40
trip_days = 3
print("Traveller:", traveller)
trip_km = km_per_day * trip_days
```
````

````{attempt}
:id: trip-name-in-quotes
:check: trip-fixed
:expect: That happens when the name is inside the quotes

```{cell-insert}
:path: {{ notebook }}
:run: true
traveller = "Amara"
km_per_day = 40
trip_days = 3
print("Traveller:", traveller)
trip_km = km_per_day * trip_days
trip_summary = "Distance: trip_km"
print(trip_summary)
```
````

````{attempt}
:id: trip-wrong-distance
:check: trip-fixed
:expect: and it must refer to 120

```{cell-insert}
:path: {{ notebook }}
:run: true
traveller = "Amara"
km_per_day = 40
trip_days = 3
print("Traveller:", traveller)
trip_km = km_per_day * km_per_day
trip_summary = f"Distance: {trip_km}"
print(trip_summary)
```
````

````{attempt}
:id: trip-wrong-summary
:check: trip-fixed
:expect: and it must refer to the text Distance: 120

```{cell-insert}
:path: {{ notebook }}
:run: true
traveller = "Amara"
km_per_day = 40
trip_days = 3
print("Traveller:", traveller)
trip_km = km_per_day * trip_days
trip_summary = f"Distance:{trip_km}"
print(trip_summary)
```
````

````{hint}
:title: Show me a solution
:unlock: "trip-fixed" in failed_checks or "trip-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell,
line by line.

```{cell-insert}
:id: insert-trip-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [trip-solution]
:run: true
traveller = "Amara"
km_per_day = 40
trip_days = 3
print("Traveller:", traveller)
trip_km = km_per_day * trip_days
trip_summary = f"Distance: {trip_km}"
print(trip_summary)
```
````

```{verify}
:id: trip-fixed
:label: The cell runs without an error and shows the distance of the trip
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed trip; cell-executed trip-solution
if "traveller" not in globals():
    print("No line of the cell has run yet. If you ran the cell and saw a SyntaxError, that is expected: Python found the error when it read the cell. Add the comma that is missing in the fourth line. Then run the cell again.")
elif "trip_km" not in globals():
    print("Good progress. Python can read the whole cell, and the first four lines run. Python now stops at the fifth line, so the name trip_km does not exist yet. Read the NameError, and correct the spelling of the name in the fifth line. Then run the cell again.")
elif "trip_summary" not in globals():
    print("Good progress. The first five lines run. Python now stops at the sixth line, so the name trip_summary does not exist yet. Read the TypeError, and change the sixth line into an f-string that holds the name trip_km in braces. Then run the cell again.")
elif trip_km == 120 and trip_summary == "Distance: 120":
    print("Correct. You found and corrected three errors, one at a time. The cell runs to its end, and it shows a distance of 120 kilometres.")
elif trip_summary == "Distance: trip_km":
    print("The cell runs without an error, but the name trip_summary refers to the text Distance: trip_km. That happens when the name is inside the quotes of an ordinary string. Write the letter f before the first quote, and put braces around the name. Then run the cell again.")
elif trip_km != 120:
    print(f"The cell runs without an error, but the name trip_km refers to {trip_km} and it must refer to 120. The fifth line must multiply km_per_day by trip_days, and the first three lines must not change. Then run the cell again.")
else:
    print(f"The cell runs without an error, but the name trip_summary refers to the text {trip_summary} and it must refer to the text Distance: 120. Check that the string has one space after the colon. Then run the cell again.")
all(name in globals() for name in ("traveller", "trip_km", "trip_summary")) and trip_km == 120 and trip_summary == "Distance: 120"
```

## What you did

You started with a cell that could not run at all, and you repaired it
in three steps. Each error message told you the type of the problem
and the line. You did not need to search the cell for the mistakes,
because Python showed you where each one was.
