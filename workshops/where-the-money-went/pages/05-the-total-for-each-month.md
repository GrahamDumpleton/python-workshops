---
title: "Part 3: the total for each month"
requires: [verify:month-totals]
---

# Part 3: the total for each month

The second question of the report is how much Mariam spent in each
month. This part is similar to part 2, with one difference: a purchase
has a key for its category, but it has no key for its month. Your code
must find the month in the date.

## The goal

Write a function named `total_by_month`. It takes a list of purchases,
and it gives back a dictionary. Each key of the dictionary is a month,
written as in `"2026-01"`, and its value is the sum of the amounts of
all the purchases in that month.

## What your code must do

- The function `total_by_month` has one parameter, named `rows`. The
  value that it receives is a list of dictionaries, such as
  `purchases`.

- The date of a purchase is a string such as `"2026-01-17"`: four
  characters for the year, a hyphen, two characters for the month, a
  hyphen, and two characters for the day. The month of a purchase is
  the first seven characters of its date: `"2026-01"`. The year is part
  of it, so that January 2026 and January 2027 are different months.

- The function makes a dictionary. Every month that is in the list is a
  key of the dictionary, one time only.

- The value for each key is the total of that month: the amounts of all
  its purchases, added together.

- The function gives the dictionary back with `return`. It does not
  print the dictionary.

- After the function, the cell has three more lines. They call your
  function with Mariam's purchases, and show each month and its total
  with two decimal places:

  ```python
  month_totals = total_by_month(purchases)
  for month, total in month_totals.items():
      print(f"{month} {total:.2f}")
  ```

For example, think of a list that holds these four purchases:

| date | description | amount | category |
|------|-------------|--------|----------|
| `2025-11-02` | `Tea` | `3.50` | `food` |
| `2025-11-20` | `Tram ticket` | `2.10` | `transport` |
| `2025-12-05` | `Soup` | `4.25` | `food` |
| `2025-12-09` | `Notebook` | `12.00` | `hobbies` |

For that list, the function must give back this dictionary:

```
{'2025-11': Decimal('5.60'), '2025-12': Decimal('16.25')}
```

When your code is correct, the output under the cell is:

```
2026-01 917.20
2026-02 942.34
2026-03 975.25
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-month
:title: Add a cell for part 3
:path: {{ notebook }}
:tags: [month]
:run: false
# Part 3: the total for each month. Write your code below this line.

```

Write your code under the comment, and run the cell. The check calls
your function with two short lists of purchases of its own.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Working with text** showed how to take a part of a
string. A **slice** is written with square brackets and a colon.
`text[:7]` gives the first seven characters of the string `text`.

`row["date"]` is the date of a purchase, and it is a string. So
`row["date"][:7]` is the first seven characters of the date.

Everything else is the same as in your function `total_by_category`.
The key of the dictionary is now the month, and not the category.
```

```{hint}
:title: Hint: the shape of the code
1. The first line defines the function: `def total_by_month(rows):`.

2. In the body, make an empty dictionary: `totals = {}`.

3. Start a loop over the list: `for row in rows:`.

4. Inside the loop, give a name to the month of this purchase:
   `month = row["date"][:7]`.

5. The next line of the loop gives the key `month` a new value: the
   total until now, plus the amount of this purchase. The total until
   now is `totals.get(month, 0)`, and the amount is `row["amount"]`.

6. After the loop, with four spaces at the start of the line, give the
   dictionary back: `return totals`.

7. After the function, at the left side of the cell, write the three
   lines from the task.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: month-not-started
:check: month-totals
:expect: The function total_by_month does not exist yet
```

````{attempt}
:id: month-not-a-function
:check: month-totals
:expect: The name total_by_month is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
total_by_month = "2026-01"
```
````

````{attempt}
:id: month-two-parameters
:check: month-totals
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows, month):
    return {}
```
````

````{attempt}
:id: month-key-error
:check: month-totals
:expect: stopped with a KeyError

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["month"]
        totals[month] = totals.get(month, 0) + row["amount"]
    return totals
```
````

````{attempt}
:id: month-float-start
:check: month-totals
:expect: stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][:7]
        totals[month] = totals.get(month, 0.0) + row["amount"]
    return totals
```
````

````{attempt}
:id: month-other-error
:check: month-totals
:expect: stopped with an error of the type NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        totals[when] = totals.get(when, 0) + row["amount"]
    return totals
```
````

````{attempt}
:id: month-prints
:check: month-totals
:expect: shows the dictionary with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][:7]
        totals[month] = totals.get(month, 0) + row["amount"]
    print(totals)
```
````

````{attempt}
:id: month-no-return
:check: month-totals
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][:7]
        totals[month] = totals.get(month, 0) + row["amount"]
```
````

````{attempt}
:id: month-a-list
:check: month-totals
:expect: must give back a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    months = []
    for row in rows:
        months.append(row["date"][:7])
    return months
```
````

````{attempt}
:id: month-complete-dates
:check: month-totals
:expect: The keys are complete dates

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"]
        totals[month] = totals.get(month, 0) + row["amount"]
    return totals
```
````

````{attempt}
:id: month-return-in-loop
:check: month-totals
:expect: holds only the first purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][:7]
        totals[month] = totals.get(month, 0) + row["amount"]
        return totals
```
````

````{attempt}
:id: month-wrong-slice
:check: month-totals
:expect: The keys of the dictionary must be the months

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][5:7]
        totals[month] = totals.get(month, 0) + row["amount"]
    return totals
```
````

````{attempt}
:id: month-counts
:check: month-totals
:expect: is the number of purchases in the month

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][:7]
        totals[month] = totals.get(month, 0) + 1
    return totals
```
````

````{attempt}
:id: month-last-amount
:check: month-totals
:expect: is the amount of the last purchase in the month

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][:7]
        totals[month] = row["amount"]
    return totals
```
````

````{attempt}
:id: month-wrong-totals
:check: month-totals
:expect: but it must hold

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][:7]
        totals[month] = totals.get(month, 1) + row["amount"]
    return totals
```
````

````{attempt}
:id: month-no-name
:check: month-totals
:expect: The name month_totals does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][:7]
        totals[month] = totals.get(month, 0) + row["amount"]
    return totals
```
````

````{attempt}
:id: month-not-a-dictionary
:check: month-totals
:expect: The name month_totals must refer to a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
month_totals = ["2026-01", "2026-02", "2026-03"]
```
````

````{attempt}
:id: month-categories
:check: month-totals
:expect: does not hold the totals of the 37 purchases

```{cell-insert}
:path: {{ notebook }}
:run: true
month_totals = total_by_category(purchases)
```
````

````{attempt}
:id: month-other-way
:check: month-totals
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_month(rows):
    sums = {}
    for row in rows:
        year, number, day = row["date"].split("-")
        key = year + "-" + number
        if key not in sums:
            sums[key] = 0
        sums[key] = sums[key] + row["amount"]
    return sums

month_totals = total_by_month(purchases)
for month, total in month_totals.items():
    print(f"{month} {total:.2f}")
```
````

````{hint}
:title: Show me a solution
:unlock: "month-totals" in failed_checks or "month-totals" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-month-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [month-solution]
:run: true
def total_by_month(rows):
    totals = {}
    for row in rows:
        month = row["date"][:7]
        totals[month] = totals.get(month, 0) + row["amount"]
    return totals

month_totals = total_by_month(purchases)
for month, total in month_totals.items():
    print(f"{month} {total:.2f}")
```
````

```{verify}
:id: month-totals
:label: The function total_by_month gives back the total for each month
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed month; cell-executed month-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    if "total_by_month" not in globals():
        print("The function total_by_month does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["total_by_month"]
    if not callable(function):
        print("The name total_by_month is not a function. It refers to another kind of value. Define the function with a line that starts with def total_by_month(rows): and write the body under it. Then run the cell again.")
        return False
    try:
        inspect.signature(function).bind([])
    except TypeError:
        print("The function total_by_month must have exactly one parameter, which receives the list of purchases. The def line must be: def total_by_month(rows): Then run the cell again.")
        return False
    except ValueError:
        pass
    def same(found, wanted):
        try:
            return set(found) == set(wanted) and all(round(float(found[key]), 2) == wanted[key] for key in wanted)
        except (TypeError, ValueError):
            return False
    def show(value):
        if not isinstance(value, dict):
            return repr(value)
        if len(value) == 0:
            return "nothing, because it is empty"
        try:
            return ", ".join(f"{key} {float(number):.2f}" for key, number in value.items())
        except (TypeError, ValueError):
            return repr(value)
    first = [("2025-11-02", "Tea", "3.50", "food"), ("2025-11-20", "Tram ticket", "2.10", "transport"), ("2025-12-05", "Soup", "4.25", "food"), ("2025-12-09", "Notebook", "12.00", "hobbies")]
    second = [("2025-10-01", "Pencils", "1.80", "hobbies"), ("2025-10-03", "Glue", "2.20", "hobbies"), ("2025-11-08", "Paper", "5.00", "hobbies"), ("2025-11-09", "Rice", "3.10", "food")]
    tests = [(first, {"2025-11": 5.60, "2025-12": 16.25}), (second, {"2025-10": 4.00, "2025-11": 8.10})]
    for lines, expected in tests:
        rows = [{"date": d, "description": s, "amount": Decimal(a), "category": c} for d, s, a, c in lines]
        about = "The check called total_by_month with a list of " + str(len(lines)) + " purchases of its own: " + "; ".join(f"{d} {s} {a}" for d, s, a, c in lines) + "."
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(rows)
        except KeyError:
            print("The function total_by_month stopped with a KeyError. That happens when the code reads a key that a dictionary does not have. A purchase has the keys \"date\", \"description\", \"amount\" and \"category\". It has no key for the month: take the month from the date, with row[\"date\"][:7]. Read the total until now with totals.get(month, 0) which gives 0 for a month that is not a key yet. Then run the cell again.")
            return False
        except TypeError:
            print("The function total_by_month stopped with a TypeError. The most likely reason is a start value that is a float, such as 0.0. The amounts are Decimal values, and Python does not add a Decimal value and a float. Use the integer 0 as the start value: totals.get(month, 0). Check also that the function reads row[\"amount\"] and row[\"date\"] from each purchase. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function total_by_month stopped with an error of the type {type(error).__name__} when the check called it with a list of purchases. Call the function in a cell of your own, with total_by_month(purchases), and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The function total_by_month shows the dictionary with print(), but it does not return it. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the dictionary back. Then run the cell again.")
            return False
        if result is None:
            print("The function total_by_month gives back None. That happens when the body has no return line. After the loop, add a line that starts with four spaces and gives the dictionary back: return totals. Then run the cell again.")
            return False
        if not isinstance(result, dict):
            print(f"The function total_by_month must give back a dictionary, but it gives back {result!r}. Make an empty dictionary before the loop, add the amount of each purchase to the total of its month inside the loop, and return the dictionary after the loop. Then run the cell again.")
            return False
        if same(result, expected):
            continue
        counts = {}
        last = {}
        for d, s, a, c in lines:
            counts[d[:7]] = counts.get(d[:7], 0) + 1
            last[d[:7]] = float(a)
        if set(result) != set(expected):
            if same(result, {lines[0][0][:7]: float(lines[0][2])}):
                print(f"{about} Your function gives back a dictionary that holds: {show(result)}. The dictionary holds only the first purchase. That happens when the return line is inside the loop, so the function stops in the first pass. The return line must start with four spaces, and not with eight. Then run the cell again.")
            elif set(result) == set(d for d, s, a, c in lines):
                print(f"{about} Your function gives back a dictionary that has the keys {sorted(result)!r}. The keys are complete dates, so every day has a total of its own. The key must be the month, which is the first seven characters of the date: row[\"date\"][:7]. Then run the cell again.")
            else:
                print(f"{about} Your function gives back a dictionary that has the keys {sorted(result, key=repr)!r}. The keys of the dictionary must be the months: {sorted(expected)!r}. The month is the first seven characters of the date: row[\"date\"][:7]. Then run the cell again.")
            return False
        if same(result, counts):
            print(f"{about} Your function gives back a dictionary that holds: {show(result)}. Each value is the number of purchases in the month, and not the total of their amounts. Add the amount of the purchase, and not 1: totals.get(month, 0) + row[\"amount\"]. Then run the cell again.")
            return False
        if same(result, last):
            print(f"{about} Your function gives back a dictionary that holds: {show(result)}. Each value is the amount of the last purchase in the month, and not the total. The line inside the loop must add the amount to the total until now: totals[month] = totals.get(month, 0) + row[\"amount\"]. Then run the cell again.")
            return False
        print(f"{about} Your function gives back a dictionary that holds: {show(result)}, but it must hold: {show(expected)}. Start each total at 0 with totals.get(month, 0) and add the amount of each purchase in its pass of the loop. Then run the cell again.")
        return False
    facts = {"2026-01": 917.20, "2026-02": 942.34, "2026-03": 975.25}
    if "month_totals" not in globals():
        print("The function total_by_month is correct. The name month_totals does not exist yet. After the function, at the left side of the cell, add the three lines from the task. The first one is: month_totals = total_by_month(purchases). Then run the cell again.")
        return False
    found = globals()["month_totals"]
    if not isinstance(found, dict):
        print("The function total_by_month is correct. The name month_totals must refer to a dictionary, but it refers to another kind of value. Give the name to the result of your function: month_totals = total_by_month(purchases). Then run the cell again.")
        return False
    if not same(found, facts):
        print("The function total_by_month is correct. But the dictionary month_totals does not hold the totals of the 37 purchases in the list purchases. Make it with your function, from the complete list: month_totals = total_by_month(purchases). If the list purchases has changed, run your cell of part 1 again first. Then run this cell again.")
        return False
    print("Correct. The function total_by_month gives back the total for each month. Mariam spent a little more in each month than in the month before.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The dictionary `month_totals` answers the second question. Mariam spent
917.20 in January, 942.34 in February and 975.25 in March.

You wrote almost the same function two times. Only the key is
different: the category in part 2, and the month in this part. The
pattern "a dictionary with a total for each key" works for every way of
dividing data into groups.
