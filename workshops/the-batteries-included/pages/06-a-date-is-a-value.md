---
title: A date is a value
requires: [verify:coat-day-ran, verify:taxi-day-ran, verify:month-of]
---

# A date is a value

The module `datetime` holds types for dates and times. Every value in
Python has a **type**, which is the kind of value that it is: an
integer, a float, a string, a list. The module `datetime` adds a type
with the name `date`. A value of the type `date` holds one day of the
calendar: a year, a month and a day.

## Why a string is not enough

In Mariam's file, the date of each purchase is text, such as
`"2026-01-17"`. For Python, a string is only a row of characters.
Python does not know that the characters `01` in the middle are a
month, and it cannot calculate with them.

A value of the type `date` knows what its parts mean. You can ask it
for its month. You can compare it with another date. On the next page
you subtract one date from another, to count the days between them.

## Make a date from three numbers

The name `date` is inside the module `datetime`, so you import it with
`from datetime import date`. To make a date, you call `date` with
three arguments, in this order: the year, the month and the day.

Mariam bought a winter coat on 2026-01-17. Click the action below. It
adds a cell that makes this date and shows its parts, and runs the
cell.

```{attempt}
:id: coat-day-not-run
:check: coat-day-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-coat-day
:title: Add a cell that makes a date and shows its parts, and run it
:path: {{ notebook }}
:tags: [coat-day]
:run: true
from datetime import date

coat_day = date(2026, 1, 17)
print(coat_day)
print(coat_day.year)
print(coat_day.month)
print(coat_day.day)
```

The output is:

```
2026-01-17
2026
1
17
```

```{verify}
:id: coat-day-ran
:label: The cell made a date and showed its parts
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed coat-day
if str(globals().get("coat_day")) == "2026-01-17" and type(globals().get("coat_day")).__name__ == "date":
    print("The cell ran. The name coat_day refers to a date, and its parts are the year 2026, the month 1 and the day 17.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
str(globals().get("coat_day")) == "2026-01-17" and type(globals().get("coat_day")).__name__ == "date"
```

## What happened

- `date(2026, 1, 17)` made a value of the type `date`. You write the
  numbers without a zero in front: the month is `1`, and not `01`.

- `print(coat_day)` showed the date as `2026-01-17`. This is the ISO
  form of a date: the year, then the month, then the day.

- `coat_day.year`, `coat_day.month` and `coat_day.day` gave the three
  parts. Each part is an integer. These three names are
  **attributes**. An attribute is a value that belongs to another
  value. You write it after a dot. There are no parentheses after an
  attribute, because it is a value and not a function. It is the same
  idea as `math.pi`.

Python does not accept a date that does not exist. `date(2026, 2, 30)`
stops with a `ValueError`, because February does not have 30 days.

## Make a date from a string

The dates in a file are strings. `date.fromisoformat()` takes a string
that is written in the ISO form, and gives the date. The name
`fromisoformat` is the three words "from ISO format" without spaces.
It is a function that belongs to the type `date`, so you write
`date`, a dot, and then the name.

Mariam took a taxi on 2026-03-15. Click the action below. It adds a
cell that makes this date from a string, and runs the cell.

```{attempt}
:id: taxi-day-not-run
:check: taxi-day-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-taxi-day
:title: Add a cell that makes a date from a string, and run it
:path: {{ notebook }}
:tags: [taxi-day]
:run: true
taxi_day = date.fromisoformat("2026-03-15")
print(taxi_day)
print(taxi_day.day)
```

The output is:

```
2026-03-15
15
```

```{verify}
:id: taxi-day-ran
:label: The cell made a date from a string
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed taxi-day
if str(globals().get("taxi_day")) == "2026-03-15" and type(globals().get("taxi_day")).__name__ == "date":
    print("The cell ran. date.fromisoformat() made a date from the string, and the day of that date is 15.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
str(globals().get("taxi_day")) == "2026-03-15" and type(globals().get("taxi_day")).__name__ == "date"
```

The first line of output looks the same as the string. But `taxi_day`
is a date and not a string, so `taxi_day.day` gives the integer `15`.
A string has no attribute `day`.

## Your task

Mariam wants to know in which month she made each purchase. Write a
function that gives the month of a date that is written as a string.

Your function must be like this:

- Its name is `month_of`.

- It has one parameter, `text`, which is a string that holds a date in
  the ISO form.

- It returns the month of that date, as an integer.

Two examples:

| Call | Return value |
|------|--------------|
| `month_of("2026-03-16")` | `3` |
| `month_of("2026-11-02")` | `11` |

The function must work with any date in the ISO form, not only with
these.

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-month-of
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [month-of]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`. To try your
function, you can add the line `print(month_of("2026-03-16"))` under
it, without spaces at the start. The check calls your function with
several dates.

```{hint}
:title: Hint: two steps
The function does two things. First it makes a date from the string
`text`, with `date.fromisoformat()`. Then it returns one attribute of
that date.
```

```{hint}
:title: Hint: the lines of the function
The first line is `def month_of(text):`. The second line can be
`day = date.fromisoformat(text)`, and the third line is then
`return day.month`. The second line and the third line begin with four
spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: month-of-not-started
:check: month-of
:expect: The function month_of does not exist yet
```

````{attempt}
:id: month-of-not-a-function
:check: month-of
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
month_of = date.fromisoformat("2026-03-16").month
```
````

````{attempt}
:id: month-of-two-parameters
:check: month-of
:expect: but it has 2

```{cell-insert}
:path: {{ notebook }}
:run: true
def month_of(text, part):
    return date.fromisoformat(text).month
```
````

````{attempt}
:id: month-of-error
:check: month-of
:expect: stopped with an AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def month_of(text):
    return text.month
```
````

````{attempt}
:id: month-of-prints
:check: month-of
:expect: shows the month with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def month_of(text):
    print(date.fromisoformat(text).month)
```
````

````{attempt}
:id: month-of-no-return
:check: month-of
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def month_of(text):
    day = date.fromisoformat(text)
```
````

````{attempt}
:id: month-of-string
:check: month-of
:expect: gives the string '03'

```{cell-insert}
:path: {{ notebook }}
:run: true
def month_of(text):
    return text[5:7]
```
````

````{attempt}
:id: month-of-day
:check: month-of
:expect: That is the day of the date

```{cell-insert}
:path: {{ notebook }}
:run: true
def month_of(text):
    return date.fromisoformat(text).day
```
````

````{attempt}
:id: month-of-year
:check: month-of
:expect: That is the year of the date

```{cell-insert}
:path: {{ notebook }}
:run: true
def month_of(text):
    return date.fromisoformat(text).year
```
````

````{attempt}
:id: month-of-whole-date
:check: month-of
:expect: but it must give 3

```{cell-insert}
:path: {{ notebook }}
:run: true
def month_of(text):
    return date.fromisoformat(text)
```
````

````{attempt}
:id: month-of-with-slice
:check: month-of
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def month_of(text):
    return int(text[5:7])
```
````

````{hint}
:title: Show me a solution
:unlock: "month-of" in failed_checks or "month-of" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-month-of-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [month-of-solution]
:run: true
def month_of(text):
    day = date.fromisoformat(text)
    return day.month

print(month_of("2026-03-16"))
print(month_of("2026-11-02"))
```
````

```{verify}
:id: month-of
:label: Your function gives the month of a date
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed month-of; cell-executed month-of-solution
def _workshop_check():
    import contextlib, inspect, io
    if "month_of" not in globals():
        print("The function month_of does not exist yet. Write it under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    month_of = globals()["month_of"]
    if not callable(month_of):
        print("The name month_of exists, but its value is not a function. Begin your cell with the line def month_of(text): and write the lines of the function under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(month_of).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function month_of must have one parameter, the string that holds the date, but it has {count}. Make the first line def month_of(text): and use the name text inside the function. Then run the cell again.")
        return False
    cases = [("2026-03-16", 2026, 3, 16), ("2026-11-02", 2026, 11, 2), ("2025-07-30", 2025, 7, 30)]
    for text, year, month, day in cases:
        call = f"month_of({text!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = month_of(text)
        except Exception as error:
            kind = type(error).__name__
            kind = ("an " if kind[0] in "AEIOU" else "a ") + kind
            print(f"The function month_of stopped with {kind} when the check called {call}. The parameter text is a string. Make a date from it with date.fromisoformat(text), and then read the attribute month of that date. Then run the cell again.")
            return False
        if result is None and shown.getvalue().strip() == str(month):
            print("The function month_of shows the month with print(), but it does not return it. The code that calls the function gets None. Replace print() with a line that begins with return. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {month}. A function with no return line gives None. Add a line that begins with return and gives the month of the date. Then run the cell again.")
            return False
        if type(result) is str:
            print(f"{call} gives the string {result!r} but it must give the integer {month}. A part of a string is a string. Make a date with date.fromisoformat(text) and return its attribute month, which is an integer. Then run the cell again.")
            return False
        if type(result) is int and result == day and day != month:
            print(f"{call} gives {result} but it must give {month}. That is the day of the date. Return the attribute month. Then run the cell again.")
            return False
        if type(result) is int and result == year:
            print(f"{call} gives {result} but it must give {month}. That is the year of the date. Return the attribute month. Then run the cell again.")
            return False
        if type(result) is not int or result != month:
            print(f"{call} gives {result!r} but it must give {month}. Make a date with date.fromisoformat(text), and return its attribute month. Then run the cell again.")
            return False
    print("Correct. Your function makes a date from the string and gives its month.")
    return True
globals().pop("_workshop_check")()
```
