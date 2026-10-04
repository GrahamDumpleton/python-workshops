---
title: Clean one row
requires: [verify:clean-row]
---

# Clean one row

You now have every part that you need to clean a row:

- `strip()` removes the spaces around a field.

- Your function `clean_category` gives the one correct word for a
  category.

- `Decimal()` turns the string of an amount into an exact number.

On this page you combine the parts in one function, `clean_row`.
A program is built in this way: small functions that each do one
thing, and a larger function that calls them. You tested each small
function before you used it, so a mistake in the large function is
easier to find.

## What the function must do

Your function takes one row as the module `csv` gave it: a list of
four strings. It gives back a new list of four clean values.

- Its name is `clean_row`.

- It has one parameter, `row`, which is a list of four strings: the
  date, the description, the amount and the category.

- It returns a new list of four values, in the same order:

  1. the date, as a string with no spaces around it
  2. the description, as a string with no spaces around it
  3. the amount, as a `Decimal`
  4. the category, as the string that `clean_category` gives

- After the function, the last line of the cell is
  `print(clean_row(raw_rows[2]))`. It calls your function with line 3
  of the file.

An example:

| Call | Return value |
|------|--------------|
| `clean_row(["2026-01-05 ", " Bus ticket", " 2.80", "Travel"])` | `['2026-01-05', 'Bus ticket', Decimal('2.80'), 'transport']` |

When your code is correct, the output under the cell is:

```
['2026-01-03', 'Bread and milk', Decimal('6.40'), 'food']
```

When Python shows a list, it shows each value in the form that you
write in code. So a string has quotes, and a `Decimal` is shown as
`Decimal('6.40')`. The value is the number 6.40.

For now, the function needs to work only for a row that has four
fields and an amount that is a number. The next page handles the
other rows.

```{cell-insert}
:id: insert-clean-row
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [clean-row]
:run: false
# Write the function clean_row on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`. The check at the
bottom of this page calls your function with three rows of its own.

```{hint}
:title: Hint: one line for each field
The first line of your function is `def clean_row(row):`.

Inside the function, `row[0]` is the date, `row[1]` is the
description, `row[2]` is the amount and `row[3]` is the category.
Write one line for each field, and give each clean value a name. For
example, the line for the date is `date = row[0].strip()`.
```

```{hint}
:title: Hint: the amount, the category and the return
The amount needs two steps: strip the string, and make a `Decimal`
from it. You can write both in one line:
`amount = Decimal(row[2].strip())`.

The category needs your function from an earlier page:
`category = clean_category(row[3])`.

The last line of the function gives a new list back. Square brackets
make a list: `return [date, description, amount, category]`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

A `NameError` means that Python does not know a name. If the name is
`Decimal`, run the cell on the last page that begins with
`from decimal import Decimal`. If the name is `clean_category` or
`spellings`, run the cells on the page **Other words for one
category**.

An `IndexError` means that an index is too large. A row of four
fields has the indexes 0, 1, 2 and 3.

An `InvalidOperation` means that `Decimal()` received a string that
is not a number. Check that you give it the amount, which is
`row[2]`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: clean-row-not-started
:check: clean-row
:expect: The function clean_row does not exist yet
```

````{attempt}
:id: clean-row-not-a-function
:check: clean-row
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_row = ["2026-01-03", "Bread and milk", Decimal("6.40"), "food"]
```
````

````{attempt}
:id: clean-row-no-parameter
:check: clean-row
:expect: but it has 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row():
    return []
```
````

````{attempt}
:id: clean-row-error
:check: clean-row
:expect: stopped with an error of the type IndexError

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    date = row[0].strip()
    description = row[1].strip()
    amount = Decimal(row[2].strip())
    category = clean_category(row[4])
    return [date, description, amount, category]
```
````

````{attempt}
:id: clean-row-prints
:check: clean-row
:expect: shows the list with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    print([row[0].strip(), row[1].strip(), Decimal(row[2].strip()), clean_category(row[3])])
```
````

````{attempt}
:id: clean-row-no-return
:check: clean-row
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    date = row[0].strip()
    amount = Decimal(row[2].strip())
```
````

````{attempt}
:id: clean-row-not-a-list
:check: clean-row
:expect: but it must give a list of four values

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    return row[1].strip()
```
````

````{attempt}
:id: clean-row-three-values
:check: clean-row
:expect: This list has 3 values, but it must have 4

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    return [row[0].strip(), row[1].strip(), Decimal(row[2].strip())]
```
````

````{attempt}
:id: clean-row-description-spaces
:check: clean-row
:expect: The description is

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    return [row[0].strip(), row[1], Decimal(row[2].strip()), clean_category(row[3])]
```
````

````{attempt}
:id: clean-row-date-spaces
:check: clean-row
:expect: The date is

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    return [row[0], row[1].strip(), Decimal(row[2].strip()), clean_category(row[3])]
```
````

````{attempt}
:id: clean-row-amount-string
:check: clean-row
:expect: The amount is still a string

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    return [row[0].strip(), row[1].strip(), row[2].strip(), clean_category(row[3])]
```
````

````{attempt}
:id: clean-row-amount-float
:check: clean-row
:expect: The amount is a float

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    return [row[0].strip(), row[1].strip(), float(row[2].strip()), clean_category(row[3])]
```
````

````{attempt}
:id: clean-row-amount-from-float
:check: clean-row
:expect: is not exactly

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    return [row[0].strip(), row[1].strip(), Decimal(float(row[2].strip())), clean_category(row[3])]
```
````

````{attempt}
:id: clean-row-category
:check: clean-row
:expect: The category is

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    return [row[0].strip(), row[1].strip(), Decimal(row[2].strip()), row[3].strip()]
```
````

````{attempt}
:id: clean-row-with-strip-fields
:check: clean-row
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def clean_row(row):
    fields = strip_fields(row)
    fields[2] = Decimal(fields[2])
    fields[3] = clean_category(fields[3])
    return fields
```
````

````{hint}
:title: Show me a solution
:unlock: "clean-row" in failed_checks or "clean-row" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-clean-row-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [clean-row-solution]
:run: true
def clean_row(row):
    date = row[0].strip()
    description = row[1].strip()
    amount = Decimal(row[2].strip())
    category = clean_category(row[3])
    return [date, description, amount, category]

print(clean_row(raw_rows[2]))
```
````

```{verify}
:id: clean-row
:label: Your function gives the four clean values of a row
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed clean-row; cell-executed clean-row-solution
def _workshop_check():
    import contextlib, decimal, inspect, io
    if "clean_row" not in globals():
        print("The function clean_row does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["clean_row"]
    if not callable(function):
        print("The name clean_row exists, but its value is not a function. Begin your cell with the line def clean_row(row): and write the body under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function clean_row must have one parameter, the list of four strings, but it has {count}. Make the first line def clean_row(row): and use the name row inside the function. Then run the cell again.")
        return False
    cases = [
        (["2026-01-05 ", " Bus ticket", " 2.80", "Travel"], ["2026-01-05", "Bus ticket", "2.80", "transport"]),
        (["2026-02-14", "Dinner at a restaurant ", " 36.50 ", "groceries"], ["2026-02-14", "Dinner at a restaurant", "36.50", "food"]),
        ([" 2026-03-09", "Running shoes", "59", " Clothes"], ["2026-03-09", "Running shoes", "59", "clothes"]),
    ]
    for row, expected in cases:
        call = f"clean_row({row!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(list(row))
        except Exception as error:
            print(f"The function clean_row stopped with an error of the type {type(error).__name__} when the check called {call}. Run the same call in a cell of your own, and read the error message from the last line. The hint about error messages on this page says what a NameError, an IndexError and an InvalidOperation mean. Then correct the function and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The function clean_row shows the list with print(), but it does not return it. The code that calls the function gets None. Replace print() in the function with return. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give a list of four values. A function with no return line gives None. Make the last line of the function return [date, description, amount, category]. Then run the cell again.")
            return False
        if not isinstance(result, list):
            print(f"{call} gives {result!r} but it must give a list of four values: the date, the description, the amount and the category. Put the four values between square brackets in the return line. Then run the cell again.")
            return False
        if len(result) != 4:
            print(f"{call} gives {result!r}. This list has {len(result)} values, but it must have 4: the date, the description, the amount and the category. Then run the cell again.")
            return False
        if result[0] != expected[0]:
            print(f"{call} gives {result!r}. The date is {result[0]!r} but it must be {expected[0]!r}. The date is row[0], and it must have no spaces around it: row[0].strip(). Then run the cell again.")
            return False
        if result[1] != expected[1]:
            print(f"{call} gives {result!r}. The description is {result[1]!r} but it must be {expected[1]!r}. The description is row[1], and it must have no spaces around it: row[1].strip(). Then run the cell again.")
            return False
        amount = result[2]
        if isinstance(amount, str):
            print(f"{call} gives {result!r}. The amount is still a string, {amount!r}, but it must be a Decimal. Make a Decimal from the stripped string: Decimal(row[2].strip()). Then run the cell again.")
            return False
        if isinstance(amount, float):
            print(f"{call} gives {result!r}. The amount is a float, {amount!r}, but it must be a Decimal, so that money stays exact. Use Decimal() where you used float(): Decimal(row[2].strip()). Then run the cell again.")
            return False
        if not isinstance(amount, decimal.Decimal):
            print(f"{call} gives {result!r}. The amount is {amount!r} but it must be a Decimal. Make a Decimal from the stripped string: Decimal(row[2].strip()). Then run the cell again.")
            return False
        if amount != decimal.Decimal(expected[2]):
            print(f"{call} gives an amount that is not exactly {expected[2]}. Make the Decimal from the string in row[2] itself, and not from a float or from another field: Decimal(row[2].strip()). Then run the cell again.")
            return False
        if result[3] != expected[3]:
            print(f"{call} gives {result!r}. The category is {result[3]!r} but it must be {expected[3]!r}. Call your function clean_category with row[3]. It removes the spaces, makes the letters small and replaces another spelling. Then run the cell again.")
            return False
    print("Correct. Your function gives back the date and the description with no spaces around them, the amount as a Decimal, and the clean category.")
    return True
globals().pop("_workshop_check")()
```

Your notebook now has a function that cleans any row that can be read.
Three rows of the file cannot be read. The next page handles them.
