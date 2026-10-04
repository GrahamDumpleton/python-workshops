---
title: The days between two dates
requires: [verify:time-between-ran, verify:concert-ran, verify:days-between]
---

# The days between two dates

You can subtract one date from another date. The result is the length
of time between them. This is the main reason to make dates from the
strings of a file.

## Why this is difficult without the module

How many days are there from 2026-02-26 to 2026-03-01? To answer, you
must know how many days February has, and February has one more day
in some years. A calculation with the numbers of the strings would
need many rules. The module `datetime` knows these rules already.

## Subtract one date from another

Mariam bought a monthly bus pass on 2026-01-12 and a train ticket on
2026-01-27. Click the action below. It adds a cell that subtracts the
first date from the second date, and runs the cell.

```{attempt}
:id: time-between-not-run
:check: time-between-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-time-between
:title: Add a cell that subtracts one date from another, and run it
:path: {{ notebook }}
:tags: [time-between]
:run: true
from datetime import date

bus_pass_day = date(2026, 1, 12)
train_day = date(2026, 1, 27)
time_between = train_day - bus_pass_day
print(time_between)
print(time_between.days)
```

The output is:

```
15 days, 0:00:00
15
```

```{verify}
:id: time-between-ran
:label: The cell subtracted one date from another
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed time-between
if getattr(globals().get("time_between"), "days", None) == 15:
    print("The cell ran. There are 15 days from the day of the bus pass to the day of the train ticket.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
getattr(globals().get("time_between"), "days", None) == 15
```

## What happened

- The operator `-` between two dates gave a new value. This value is
  not a date and it is not a number. It has a type of its own, with
  the name `timedelta`, which holds a length of time. In mathematics,
  "delta" is a word for a difference.

- `print(time_between)` showed `15 days, 0:00:00`. The second part is
  for hours, minutes and seconds. It is zero here, because a date has
  no time of day.

- `time_between.days` gave the integer `15`. The attribute `days` is
  the number of days. This is the value that you usually want, because
  you can compare it and calculate with it as with every other
  integer.

The order matters. The later date minus the earlier date gives a
positive number. `bus_pass_day - train_day` gives a length of time
whose attribute `days` is `-15`.

## Show a date in another form

`print()` shows a date in the ISO form. For a report that people read,
you may want another form. The method `strftime()` of a date gives a
string that is built from a pattern. In the pattern, a `%` sign and a
letter mark the place of one part of the date.

Mariam went to a concert on 2026-03-21. Click the action below. It
adds a cell that shows this date with the name of the month, and runs
the cell.

```{attempt}
:id: concert-not-run
:check: concert-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-concert
:title: Add a cell that shows a date in another form, and run it
:path: {{ notebook }}
:tags: [concert]
:run: true
concert_day = date(2026, 3, 21)
concert_text = concert_day.strftime("%d %B %Y")
print(concert_text)
```

The output is:

```
21 March 2026
```

```{verify}
:id: concert-ran
:label: The cell showed a date in another form
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed concert
if globals().get("concert_text") == "21 March 2026":
    print("The cell ran. The method strftime() gave the string 21 March 2026.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("concert_text") == "21 March 2026"
```

In the pattern `"%d %B %Y"`, the part `%d` is the place of the day,
`%B` is the place of the name of the month, and `%Y` is the place of
the year. The spaces between them stay as they are. The name
`strftime` is short for "string from time". You do not need to
remember the letters: the documentation of the module `datetime` has
a table of them.

## Your task

Write a function that counts the days from one date to a later date.
The two dates arrive as strings, as they do from a file.

Your function must be like this:

- Its name is `days_between`.

- It has two parameters, in this order: `first` and `second`. Each is
  a string that holds a date in the ISO form. The date in `second` is
  the later one.

- It returns the number of days from the date in `first` to the date
  in `second`, as an integer.

Two examples:

| Call | Return value |
|------|--------------|
| `days_between("2026-01-03", "2026-01-17")` | `14` |
| `days_between("2026-02-26", "2026-03-01")` | `3` |

The function must work with any two dates in the ISO form, not only
with these.

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-days-between
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [days-between]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`. To try your
function, you can add the line
`print(days_between("2026-01-03", "2026-01-17"))` under it, without
spaces at the start. The check calls your function with several pairs
of dates.

```{hint}
:title: Hint: three steps
Python cannot subtract one string from another. So the function first
makes a date from each string, with `date.fromisoformat()`. Then it
subtracts the two dates. Then it returns the attribute `days` of the
result.
```

```{hint}
:title: Hint: the lines of the function
The first line is `def days_between(first, second):`. The next two
lines make the dates: `start = date.fromisoformat(first)` and
`end = date.fromisoformat(second)`. The last line is
`return (end - start).days`. The parentheses make Python subtract
first, and then read the attribute `days` of the result.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: days-between-not-started
:check: days-between
:expect: The function days_between does not exist yet
```

````{attempt}
:id: days-between-not-a-function
:check: days-between
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
days_between = 14
```
````

````{attempt}
:id: days-between-one-parameter
:check: days-between
:expect: but it has 1

```{cell-insert}
:path: {{ notebook }}
:run: true
def days_between(first):
    return (date(2026, 1, 17) - date.fromisoformat(first)).days
```
````

````{attempt}
:id: days-between-strings
:check: days-between
:expect: Python cannot subtract one string from another

```{cell-insert}
:path: {{ notebook }}
:run: true
def days_between(first, second):
    return second - first
```
````

````{attempt}
:id: days-between-other-error
:check: days-between
:expect: stopped with an AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def days_between(first, second):
    return (second.date - first.date).days
```
````

````{attempt}
:id: days-between-prints
:check: days-between
:expect: shows the number of days with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def days_between(first, second):
    start = date.fromisoformat(first)
    end = date.fromisoformat(second)
    print((end - start).days)
```
````

````{attempt}
:id: days-between-no-return
:check: days-between
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def days_between(first, second):
    start = date.fromisoformat(first)
    end = date.fromisoformat(second)
    result = (end - start).days
```
````

````{attempt}
:id: days-between-no-days
:check: days-between
:expect: gives a length of time

```{cell-insert}
:path: {{ notebook }}
:run: true
def days_between(first, second):
    start = date.fromisoformat(first)
    end = date.fromisoformat(second)
    return end - start
```
````

````{attempt}
:id: days-between-wrong-order
:check: days-between
:expect: gives -14 but it must give 14

```{cell-insert}
:path: {{ notebook }}
:run: true
def days_between(first, second):
    start = date.fromisoformat(first)
    end = date.fromisoformat(second)
    return (start - end).days
```
````

````{attempt}
:id: days-between-day-numbers
:check: days-between
:expect: gives -25 but it must give 3

```{cell-insert}
:path: {{ notebook }}
:run: true
def days_between(first, second):
    start = date.fromisoformat(first)
    end = date.fromisoformat(second)
    return end.day - start.day
```
````

````{attempt}
:id: days-between-one-line
:check: days-between
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def days_between(first, second):
    return (date.fromisoformat(second) - date.fromisoformat(first)).days
```
````

````{hint}
:title: Show me a solution
:unlock: "days-between" in failed_checks or "days-between" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-days-between-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [days-between-solution]
:run: true
def days_between(first, second):
    start = date.fromisoformat(first)
    end = date.fromisoformat(second)
    return (end - start).days

print(days_between("2026-01-03", "2026-01-17"))
print(days_between("2026-02-26", "2026-03-01"))
```
````

```{verify}
:id: days-between
:label: Your function counts the days from one date to another
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed days-between; cell-executed days-between-solution
def _workshop_check():
    import contextlib, inspect, io
    if "days_between" not in globals():
        print("The function days_between does not exist yet. Write it under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    days_between = globals()["days_between"]
    if not callable(days_between):
        print("The name days_between exists, but its value is not a function. Begin your cell with the line def days_between(first, second): and write the lines of the function under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(days_between).parameters)
    except (TypeError, ValueError):
        count = 2
    if count != 2:
        print(f"The function days_between must have two parameters, the two strings that hold the dates, but it has {count}. Make the first line def days_between(first, second): and use those two names inside the function. Then run the cell again.")
        return False
    cases = [("2026-01-03", "2026-01-17", 14), ("2026-02-26", "2026-03-01", 3), ("2025-12-25", "2026-01-05", 11)]
    for first, second, expected in cases:
        call = f"days_between({first!r}, {second!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = days_between(first, second)
        except TypeError:
            print(f"The function days_between stopped with a TypeError when the check called {call}. The two parameters are strings, and Python cannot subtract one string from another. Make a date from each string with date.fromisoformat(), and subtract the two dates. Then run the cell again.")
            return False
        except Exception as error:
            kind = type(error).__name__
            kind = ("an " if kind[0] in "AEIOU" else "a ") + kind
            print(f"The function days_between stopped with {kind} when the check called {call}. The two parameters are strings. Make a date from each string with date.fromisoformat(), subtract the two dates, and return the attribute days of the result. Then run the cell again.")
            return False
        if result is None and shown.getvalue().strip() == str(expected):
            print("The function days_between shows the number of days with print(), but it does not return it. The code that calls the function gets None. Replace print() with a line that begins with return. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {expected}. A function with no return line gives None. Add a line that begins with return and gives the number of days. Then run the cell again.")
            return False
        if type(result).__name__ == "timedelta":
            print(f"{call} gives a length of time, which is a value of the type timedelta, but it must give the integer {expected}. Read the attribute days of the result of the subtraction: put the subtraction in parentheses, and write .days after them. Then run the cell again.")
            return False
        if type(result) is int and result == -expected:
            print(f"{call} gives {result} but it must give {expected}. The subtraction is in the wrong order. Subtract the date of the parameter first from the date of the parameter second. Then run the cell again.")
            return False
        if type(result) is not int or result != expected:
            print(f"{call} gives {result!r} but it must give {expected}. Make a date from each string with date.fromisoformat(), subtract the first date from the second date, and return the attribute days of the result. Then run the cell again.")
            return False
    print("Correct. Your function makes two dates from the strings and gives the number of days between them.")
    return True
globals().pop("_workshop_check")()
```
