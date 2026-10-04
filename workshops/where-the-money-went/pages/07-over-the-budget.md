---
title: "Part 5: over the budget"
requires: [verify:over-budget]
---

# Part 5: over the budget

The last question of the report is about Mariam's budgets. In each
month, which categories were over their budget? A category is **over
its budget** in a month when the total of its purchases in that month
is larger than its budget.

## The file of budgets

The budgets are in a file named `budgets.json`. Click the action below
to see the file under your notebook.

```{file-open}
:id: show-budgets
:title: Show the file budgets.json under the notebook
:path: budgets.json
:area: data
```

The file is a **JSON** file. JSON is a way to write data as text. It
looks like the dictionaries and lists of Python, and it keeps numbers
as numbers. This file holds one dictionary. Each key is a category,
and its value is the budget of that category for one month. The budget
for `food` is 180 in each month.

The module `json` reads JSON files. `json.load(file)` reads an open
file, and gives back the value that the file holds. For this file, it
gives back a dictionary whose values are integers.

## The goal

Read the budgets from the file. Then write a function named
`over_budget`. It takes a list of purchases, a dictionary of budgets
and a month, and it gives back a list of the categories that are over
their budget in that month.

## What your code must do

- Before the function, the cell reads the file `budgets.json` with the
  module `json`, and gives the name `budgets` to the dictionary that
  the file holds. The cell must have the line `import json` before it
  uses the module.

- The function `over_budget` has three parameters, in this order:
  `rows`, `limits` and `month`. The value of `rows` is a list of
  purchases, such as `purchases`. The value of `limits` is a dictionary
  of budgets, such as `budgets`. The value of `month` is a string, such
  as `"2026-03"`.

- The function uses only the purchases of that month. The month of a
  purchase is the first seven characters of its date.

- The function adds up the total of each category in that month. It
  compares each total with the budget of the category, which is
  `limits[category]`.

- The function gives back a list. The list holds the name of every
  category whose total in that month is larger than its budget. A
  category whose total is exactly its budget is not in the list.

- The names in the list are in alphabetical order. When no category is
  over its budget, the list is empty.

- The function gives the list back with `return`. It does not print
  the list.

- The function reads the budgets from the parameter `limits`, and not
  from the name `budgets`, so that it works for every dictionary of
  budgets.

- After the function, the cell has four more lines. They make a
  dictionary named `over_by_month`. Each key is a month, and its value
  is the list that your function gives back for that month. The lines
  also show each month and its list:

  ```python
  over_by_month = {}
  for month in month_totals:
      over_by_month[month] = over_budget(purchases, budgets, month)
      print(month, over_by_month[month])
  ```

For example, think of a list that holds these six purchases:

| date | description | amount | category |
|------|-------------|--------|----------|
| `2025-11-03` | `Novel` | `12.50` | `books` |
| `2025-11-10` | `Dictionary` | `9.00` | `books` |
| `2025-11-12` | `Concert` | `15.00` | `music` |
| `2025-12-01` | `Songbook` | `16.00` | `music` |
| `2025-12-05` | `Spade` | `26.00` | `garden` |
| `2025-12-09` | `Flower pots` | `9.50` | `garden` |

The budgets are 20 for `books`, 15 for `music` and 30 for `garden`.

- For the month `"2025-11"`, the function must give back `['books']`.
  The total for `books` is 21.50, which is larger than 20. The total
  for `music` is 15.00, which is exactly the budget, so `music` is not
  in the list.

- For the month `"2025-12"`, the function must give back
  `['garden', 'music']`. The total for `garden` is 35.50, and the total
  for `music` is 16.00.

When your code is correct, the output under the cell is:

```
2026-01 ['clothes']
2026-02 ['food']
2026-03 ['clothes', 'transport']
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-over
:title: Add a cell for part 5
:path: {{ notebook }}
:tags: [over]
:run: false
# Part 5: over the budget. Write your code below this line.

```

Write your code under the comment, and run the cell. The check calls
your function with purchases and budgets of its own, for three
different months.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **CSV and JSON** showed how to read a JSON file. The file
is opened with `with open("budgets.json") as file:`, and the line in
the block under it is `budgets = json.load(file)`.

You already have a function that adds up the total of each category:
`total_by_category`. It works for every list of purchases. So when you
give it a list that holds only the purchases of one month, it gives
back the totals of that month. A function can call another function.

To make the list of the purchases of one month, start with an empty
list, and append a purchase only when an `if` finds that its month is
the month that the function received:
`if row["date"][:7] == month:`.

`sorted()` takes a list and gives back a new list in order. For
strings with small letters, that is alphabetical order.
```

```{hint}
:title: Hint: the shape of the code
1. The first line of the cell is `import json`.

2. Read the file, at the left side of the cell:
   `with open("budgets.json") as file:` and, in the block under it,
   `budgets = json.load(file)`.

3. Define the function: `def over_budget(rows, limits, month):`.

4. In the body, make an empty list: `month_rows = []`. Then write a
   loop, `for row in rows:`, with an `if` inside it that tests
   `row["date"][:7] == month`. The block under the `if` appends `row`
   to `month_rows`.

5. After that loop, get the totals of the month from your function of
   part 2: `totals = total_by_category(month_rows)`.

6. Make a second empty list: `names = []`. Then write a second loop:
   `for category, total in totals.items():`. Inside it, an `if` tests
   whether `total` is larger than `limits[category]`. The block under
   the `if` appends `category` to `names`.

7. After the second loop, with four spaces at the start of the line,
   give back the sorted list: `return sorted(names)`.

8. After the function, at the left side of the cell, write the four
   lines from the task.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: over-not-started
:check: over-budget
:expect: The name budgets does not exist yet
```

````{attempt}
:id: over-budgets-text
:check: over-budget
:expect: refers to a string

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    budgets = file.read()
```
````

````{attempt}
:id: over-budgets-number
:check: over-budget
:expect: The name budgets must refer to a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
budgets = 650
```
````

````{attempt}
:id: over-budgets-other
:check: over-budget
:expect: does not hold the six budgets

```{cell-insert}
:path: {{ notebook }}
:run: true
budgets = {"rent": 650, "food": 180}
```
````

````{attempt}
:id: over-no-function
:check: over-budget
:expect: The function over_budget does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
import json

with open("budgets.json") as file:
    budgets = json.load(file)
```
````

````{attempt}
:id: over-not-a-function
:check: over-budget
:expect: The name over_budget is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
over_budget = ["clothes"]
```
````

````{attempt}
:id: over-two-parameters
:check: over-budget
:expect: must have exactly three parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, month):
    return []
```
````

````{attempt}
:id: over-global-budgets
:check: over-budget
:expect: stopped with a KeyError

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total > budgets[category]:
            names.append(category)
    return sorted(names)
```
````

````{attempt}
:id: over-name-error
:check: over-budget
:expect: uses a name that has no value yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = totals_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total > limits[category]:
            names.append(category)
    return sorted(names)
```
````

````{attempt}
:id: over-other-error
:check: over-budget
:expect: stopped with an error of the type AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total > limits[category]:
            names.add(category)
    return sorted(names)
```
````

````{attempt}
:id: over-prints
:check: over-budget
:expect: shows the list with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total > limits[category]:
            names.append(category)
    print(sorted(names))
```
````

````{attempt}
:id: over-sort-method
:check: over-budget
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total > limits[category]:
            names.append(category)
    return names.sort()
```
````

````{attempt}
:id: over-returns-totals
:check: over-budget
:expect: must give back a list

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    return total_by_category(month_rows)
```
````

````{attempt}
:id: over-returns-amounts
:check: over-budget
:expect: holds a value that is not a string

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total > limits[category]:
            names.append(total)
    return sorted(names)
```
````

````{attempt}
:id: over-every-month
:check: over-budget
:expect: uses the purchases of every month

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    totals = total_by_category(rows)
    names = []
    for category, total in totals.items():
        if total > limits[category]:
            names.append(category)
    return sorted(names)
```
````

````{attempt}
:id: over-each-purchase
:check: over-budget
:expect: compares each purchase with the budget

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    names = []
    for row in rows:
        if row["date"][:7] == month and row["amount"] > limits[row["category"]]:
            names.append(row["category"])
    return sorted(names)
```
````

````{attempt}
:id: over-not-sorted
:check: over-budget
:expect: but they are not in alphabetical order

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total > limits[category]:
            names.append(category)
    return names
```
````

````{attempt}
:id: over-under
:check: over-budget
:expect: but it must give back

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total < limits[category]:
            names.append(category)
    return sorted(names)
```
````

````{attempt}
:id: over-exactly
:check: over-budget
:expect: is exactly its budget

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total >= limits[category]:
            names.append(category)
    return sorted(names)
```
````

````{attempt}
:id: over-no-name
:check: over-budget
:expect: The name over_by_month does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total > limits[category]:
            names.append(category)
    return sorted(names)
```
````

````{attempt}
:id: over-one-month
:check: over-budget
:expect: The name over_by_month must refer to a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
over_by_month = over_budget(purchases, budgets, "2026-03")
```
````

````{attempt}
:id: over-missing-month
:check: over-budget
:expect: does not hold the correct list for the month 2026-02

```{cell-insert}
:path: {{ notebook }}
:run: true
over_by_month = {}
over_by_month["2026-01"] = over_budget(purchases, budgets, "2026-01")
over_by_month["2026-03"] = over_budget(purchases, budgets, "2026-03")
```
````

````{attempt}
:id: over-other-way
:check: over-budget
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
import json

with open("budgets.json") as file:
    budgets = json.load(file)

def over_budget(rows, limits, month):
    sums = {}
    for row in rows:
        if row["date"].startswith(month):
            sums[row["category"]] = sums.get(row["category"], 0) + row["amount"]
    return sorted([name for name in sums if sums[name] > limits[name]])

over_by_month = {}
for month in month_totals:
    over_by_month[month] = over_budget(purchases, budgets, month)
    print(month, over_by_month[month])
```
````

````{hint}
:title: Show me a solution
:unlock: "over-budget" in failed_checks or "over-budget" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-over-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [over-solution]
:run: true
import json

with open("budgets.json") as file:
    budgets = json.load(file)

def over_budget(rows, limits, month):
    month_rows = []
    for row in rows:
        if row["date"][:7] == month:
            month_rows.append(row)
    totals = total_by_category(month_rows)
    names = []
    for category, total in totals.items():
        if total > limits[category]:
            names.append(category)
    return sorted(names)

over_by_month = {}
for month in month_totals:
    over_by_month[month] = over_budget(purchases, budgets, month)
    print(month, over_by_month[month])
```
````

```{verify}
:id: over-budget
:label: The function over_budget gives back the categories that are over their budget
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed over; cell-executed over-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    if "budgets" not in globals():
        print("The name budgets does not exist yet. Write your code under the comment in the new cell. It starts with the lines that read the file budgets.json: import json, then with open(\"budgets.json\") as file: and, in the block under it, budgets = json.load(file). Then hold Shift and press Enter to run the cell.")
        return False
    money = globals()["budgets"]
    if isinstance(money, str):
        print("The name budgets refers to a string, which is the text of the file. That happens with file.read(). The program needs the dictionary that the text describes. Use the module json to read the file: budgets = json.load(file). Then run the cell again.")
        return False
    if not isinstance(money, dict):
        print("The name budgets must refer to a dictionary, but it refers to another kind of value. Give the name to the value that json.load gives back: budgets = json.load(file). Then run the cell again.")
        return False
    if money != {"rent": 650, "food": 180, "transport": 60, "phone": 20, "clothes": 50, "hobbies": 30}:
        print("The dictionary budgets does not hold the six budgets of the file budgets.json. Read the file again, and do not change the dictionary: budgets = json.load(file). Then run the cell again.")
        return False
    if "over_budget" not in globals():
        print("The dictionary budgets is correct. The function over_budget does not exist yet. Write it under the lines that read the file, and check the spelling of its name. Then run the cell again.")
        return False
    function = globals()["over_budget"]
    if not callable(function):
        print("The name over_budget is not a function. It refers to another kind of value. Define the function with a line that starts with def over_budget(rows, limits, month): and write the body under it. Then run the cell again.")
        return False
    try:
        inspect.signature(function).bind([], dict(), "2025-11")
    except TypeError:
        print("The function over_budget must have exactly three parameters, in this order: the list of purchases, the dictionary of budgets, and the month. The def line must be: def over_budget(rows, limits, month): Then run the cell again.")
        return False
    except ValueError:
        pass
    lines = [("2025-11-03", "Novel", "12.50", "books"), ("2025-11-10", "Dictionary", "9.00", "books"), ("2025-11-12", "Concert", "15.00", "music"), ("2025-11-20", "Seeds", "8.00", "garden"), ("2025-12-01", "Songbook", "16.00", "music"), ("2025-12-05", "Spade", "26.00", "garden"), ("2025-12-09", "Flower pots", "9.50", "garden"), ("2025-12-15", "Magazine", "4.00", "books")]
    limits = {"books": 20, "music": 15, "garden": 30}
    every = ["books", "garden", "music"]
    for month, expected in [("2025-12", ["garden", "music"]), ("2025-11", ["books"]), ("2026-01", [])]:
        rows = [{"date": d, "description": s, "amount": Decimal(a), "category": c} for d, s, a, c in lines]
        sums = {}
        single = set()
        for d, s, a, c in lines:
            if d[:7] == month:
                sums[c] = sums.get(c, 0) + Decimal(a)
                if Decimal(a) > limits[c]:
                    single.add(c)
        totals = ", ".join(f"{c} {sums[c]:.2f}" for c in sums) if sums else "all 0, because the list has no purchase in that month"
        about = f"The check called over_budget with 8 purchases of its own, the budgets books 20, music 15 and garden 30, and the month {month}. The totals of that month are: {totals}."
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(rows, dict(limits), month)
        except KeyError:
            print("The function over_budget stopped with a KeyError. The check called it with budgets of its own, for the categories books, music and garden. The most likely reason is that the function reads the budget from the name budgets, and not from its parameter. Read it from the parameter: limits[category]. It also happens when a key of a purchase is spelled wrongly. Then run the cell again.")
            return False
        except NameError:
            print("The function over_budget stopped because it uses a name that has no value yet. Check the spelling of each name in the body. If the function calls total_by_category, that function must exist: run your cell of part 2 again. A list that the function appends to must have a first value before the loop, for example names = []. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function over_budget stopped with an error of the type {type(error).__name__} when the check called it. Call the function in a cell of your own, with over_budget(purchases, budgets, \"2026-03\"), and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The function over_budget shows the list with print(), but it does not return it. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the list back. Then run the cell again.")
            return False
        if result is None:
            print("The function over_budget gives back None. That happens when the body has no return line. It also happens with return names.sort() because the method sort() changes the list and gives back None. Use return sorted(names) which gives back the sorted list. Then run the cell again.")
            return False
        if not isinstance(result, list):
            print(f"The function over_budget must give back a list of the names of categories, but it gives back {result!r}. Make an empty list before the loop over the totals, append each category whose total is larger than its budget, and return the sorted list. Then run the cell again.")
            return False
        if not all(isinstance(name, str) for name in result):
            print(f"{about} Your function gives back {result!r}. The list holds a value that is not a string. Append the name of the category, which is the key of the dictionary of totals, and not its total. Then run the cell again.")
            return False
        if result == expected:
            continue
        if sorted(result) == expected:
            print(f"{about} Your function gives back {result!r}. These are the correct categories, but they are not in alphabetical order. Give back the result of sorted() with the list between the parentheses. Then run the cell again.")
            return False
        if sorted(result) == every:
            print(f"{about} Your function gives back {result!r} but it must give back {expected!r}. The function uses the purchases of every month. It must add up only the purchases whose month is the month that it received: if row[\"date\"][:7] == month. Then run the cell again.")
            return False
        if sorted(result) == sorted(c for c in sums if sums[c] >= limits[c]):
            print(f"{about} Your function gives back {result!r} but it must give back {expected!r}. The total for music is exactly its budget, so music is not over its budget. Compare with > and not with >=. Then run the cell again.")
            return False
        if single and sorted(set(result)) == sorted(single):
            print(f"{about} Your function gives back {result!r} but it must give back {expected!r}. The function compares each purchase with the budget. No purchase for garden is larger than 30, but the two purchases together are. Add up the total of each category in the month first, and then compare each total with its budget. Then run the cell again.")
            return False
        print(f"{about} Your function gives back {result!r} but it must give back {expected!r}. The list must hold each category whose total in that month is larger than its budget. Check the comparison in your if line: total > limits[category]. Then run the cell again.")
        return False
    facts = [("2026-01", ["clothes"]), ("2026-02", ["food"]), ("2026-03", ["clothes", "transport"])]
    if "over_by_month" not in globals():
        print("The function over_budget is correct. The name over_by_month does not exist yet. After the function, at the left side of the cell, add the four lines from the task. The first one is: over_by_month = {} with nothing between the braces. Then run the cell again.")
        return False
    found = globals()["over_by_month"]
    if not isinstance(found, dict):
        print("The function over_budget is correct. The name over_by_month must refer to a dictionary that has a key for each month, but it refers to another kind of value. Make it with the four lines from the task. Then run the cell again.")
        return False
    for month, expected in facts:
        if found.get(month) != expected:
            print(f"The function over_budget is correct. But the dictionary over_by_month does not hold the correct list for the month {month}. Make the dictionary with the four lines from the task, which call your function for each month of month_totals. If the list purchases or the dictionary month_totals has changed, run your cells of part 1 and part 3 again first. Then run this cell again.")
            return False
    print("Correct. The function over_budget gives back the categories that are over their budget in a month. Mariam was over her budget for clothes in January and March, for food in February, and for transport in March.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The dictionary `over_by_month` answers the last question. Mariam spent
more than her budget on clothes in January and in March, on food in
February, and on transport in March.

Your program now knows all four answers. They are in the names
`category_totals`, `month_totals`, `largest` and `over_by_month`. The
last part writes them to a file.
