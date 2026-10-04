---
title: Spaces around a field
requires: [verify:strip-shown, verify:strip-fields]
---

# Spaces around a field

The first kind of untidiness is a space at the start or at the end of
a field. You cannot see such a space when you read the file quickly,
but it is a character like any other character. For Python, the string
`" Food"` has five characters and the string `"Food"` has four, so
the two strings are not equal.

Think of a label on a jar in a kitchen. It does not matter to you
whether the word on the label starts at the left edge or a little to
the right. You read the word. Python reads the empty space too.

The method `strip()` of a string solves this. A **method** is a
function that belongs to a value. You write it after the value, with a
dot. `strip()` gives back a new string without the spaces at the start
and at the end. It keeps the spaces between the words.

Click the action below. It adds a cell that uses `strip()` on one
field from line 3 of the file, and runs it. The function `len()` gives
the number of characters in a string.

```{attempt}
:id: strip-not-shown
:check: strip-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-strip
:title: Add a cell that removes the spaces around one field, and run it
:path: {{ notebook }}
:tags: [strip]
:run: true
field = " Bread and milk "
print(len(field))
print(len(field.strip()))
print(field == "Bread and milk")
print(field.strip() == "Bread and milk")
```

The output is:

```
16
14
False
True
```

```{verify}
:id: strip-shown
:label: The cell removed the spaces around one field
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed strip
if globals().get("field") == " Bread and milk ":
    print("The cell ran. The field has 16 characters with its spaces, and 14 characters after strip().")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("field") == " Bread and milk "
```

## What happened

The string `field` has 16 characters: 14 for the words and the two
spaces between them, one space at the start and one space at the end.
`field.strip()` gives a new string of 14 characters. The space at the
start and the space at the end are removed, and the two spaces between
the words are still there.

The third line of output is `False`: with its spaces, the field is not
equal to `"Bread and milk"`. The fourth line is `True`: after
`strip()`, it is equal.

A string never changes. `field.strip()` does not change `field`. It
gives back a new string, and you must give that new string a name, or
put it in a list, to keep it.

## Your task

Any field of any row can have extra spaces, so a program strips every
field. Write a function that does this for one row.

A reminder about functions: the line that begins with `def` gives the
name of the function and its **parameters**, which are the names for
the values that the function is given. The lines of the function begin
with four spaces. The line that begins with `return` gives the result
back.

Your function must be like this:

- Its name is `strip_fields`.

- It has one parameter, `row`, which is a list of strings.

- It returns a new list. The new list has the same strings in the same
  order, and each string has no spaces at its start or at its end.

- After the function, the last line of the cell is
  `print(strip_fields(raw_rows[2]))`. It calls your function with line
  3 of the file.

An example:

| Call | Return value |
|------|--------------|
| `strip_fields([" Phone bill", " 18.00", "phone "])` | `['Phone bill', '18.00', 'phone']` |

The function must work with a list of any length. When your code is
correct, the output under the cell is:

```
['2026-01-03', 'Bread and milk', '6.40', 'Food']
```

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-strip-fields
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [strip-fields]
:run: false
# Write the function strip_fields on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`. The check at the
bottom of this page runs each time you run the cell. It calls your
function with several lists of its own.

```{hint}
:title: Hint: how to begin
The first line of your function is `def strip_fields(row):`.

Inside the function, start with an empty list: `stripped = []`. Then
use a `for` loop over `row`. The loop gives you each string of the row
in turn.
```

```{hint}
:title: Hint: the loop and the return
Inside the loop, call `strip()` on the string, and add the result to
the new list with `append()`:

`stripped.append(field.strip())`

After the loop, give the new list back: `return stripped`. The
`return` line begins with four spaces, and not with eight. With eight
spaces it is inside the loop, and the function stops after the first
string.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: strip-fields-not-started
:check: strip-fields
:expect: The function strip_fields does not exist yet
```

````{attempt}
:id: strip-fields-not-a-function
:check: strip-fields
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
strip_fields = [" Phone bill".strip()]
```
````

````{attempt}
:id: strip-fields-no-parameter
:check: strip-fields
:expect: but it has 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def strip_fields():
    return []
```
````

````{attempt}
:id: strip-fields-error
:check: strip-fields
:expect: stopped with an error of the type AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def strip_fields(row):
    return row.strip()
```
````

````{attempt}
:id: strip-fields-prints
:check: strip-fields
:expect: shows the list with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def strip_fields(row):
    stripped = []
    for field in row:
        stripped.append(field.strip())
    print(stripped)
```
````

````{attempt}
:id: strip-fields-no-return
:check: strip-fields
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def strip_fields(row):
    stripped = []
    for field in row:
        stripped.append(field.strip())
```
````

````{attempt}
:id: strip-fields-string
:check: strip-fields
:expect: but it must give a list

```{cell-insert}
:path: {{ notebook }}
:run: true
def strip_fields(row):
    return row[0].strip()
```
````

````{attempt}
:id: strip-fields-early-return
:check: strip-fields
:expect: has 1 item, but it must have 3 items

```{cell-insert}
:path: {{ notebook }}
:run: true
def strip_fields(row):
    stripped = []
    for field in row:
        stripped.append(field.strip())
        return stripped
```
````

````{attempt}
:id: strip-fields-result-lost
:check: strip-fields
:expect: still has a space at its start or at its end

```{cell-insert}
:path: {{ notebook }}
:run: true
def strip_fields(row):
    stripped = []
    for field in row:
        field.strip()
        stripped.append(field)
    return stripped
```
````

````{attempt}
:id: strip-fields-other-list
:check: strip-fields
:expect: The strings must be the same strings, in the same order

```{cell-insert}
:path: {{ notebook }}
:run: true
def strip_fields(row):
    stripped = []
    for field in row:
        stripped.append(field.strip().lower())
    return stripped
```
````

````{attempt}
:id: strip-fields-comprehension
:check: strip-fields
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def strip_fields(row):
    return [field.strip() for field in row]
```
````

````{hint}
:title: Show me a solution
:unlock: "strip-fields" in failed_checks or "strip-fields" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-strip-fields-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [strip-fields-solution]
:run: true
def strip_fields(row):
    stripped = []
    for field in row:
        stripped.append(field.strip())
    return stripped

print(strip_fields(raw_rows[2]))
```
````

```{verify}
:id: strip-fields
:label: Your function removes the spaces around every field of a row
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed strip-fields; cell-executed strip-fields-solution
def _workshop_check():
    import contextlib, inspect, io
    if "strip_fields" not in globals():
        print("The function strip_fields does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["strip_fields"]
    if not callable(function):
        print("The name strip_fields exists, but its value is not a function. Begin your cell with the line def strip_fields(row): and write the body under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function strip_fields must have one parameter, the list of strings, but it has {count}. Make the first line def strip_fields(row): and use the name row inside the function. Then run the cell again.")
        return False
    cases = [
        ([" Phone bill", " 18.00", "phone "], ["Phone bill", "18.00", "phone"]),
        (["2026-02-14", "Dinner at a restaurant", " 36.50 ", "Food"], ["2026-02-14", "Dinner at a restaurant", "36.50", "Food"]),
        (["  Tea  ", "Rice and beans"], ["Tea", "Rice and beans"]),
    ]
    for row, expected in cases:
        call = f"strip_fields({row!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(list(row))
        except Exception as error:
            print(f"The function strip_fields stopped with an error of the type {type(error).__name__} when the check called {call}. The parameter row is a list of strings. Use a for loop to get each string, and call strip() on the string, not on the list. Then run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The function strip_fields shows the list with print(), but it does not return it. The code that calls the function gets None. Replace print() in the last line of the function with return. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {expected!r}. A function with no return line gives None. After the loop, add a line that begins with return and gives the new list back. Then run the cell again.")
            return False
        if not isinstance(result, list):
            print(f"{call} gives {result!r} but it must give a list of strings: {expected!r}. Make an empty list, add each stripped string to it with append(), and return the list. Then run the cell again.")
            return False
        if len(result) != len(expected):
            word = "item" if len(result) == 1 else "items"
            print(f"{call} gives {result!r}. This list has {len(result)} {word}, but it must have {len(expected)} items, one for each string of the row. Check that the return line begins with four spaces, so that it is after the loop and not inside the loop. Then run the cell again.")
            return False
        if result == expected:
            continue
        spaces = [item for item in result if isinstance(item, str) and item != item.strip()]
        if spaces:
            print(f"{call} gives {result!r}. The string {spaces[0]!r} still has a space at its start or at its end. A string never changes, so strip() gives back a new string. Add that new string to your list: stripped.append(field.strip()). Then run the cell again.")
            return False
        print(f"{call} gives {result!r} but it must give {expected!r}. The strings must be the same strings, in the same order, and only the spaces at the start and at the end are removed. Then run the cell again.")
        return False
    print("Correct. Your function gives back a new list in which no string has a space at its start or at its end.")
    return True
globals().pop("_workshop_check")()
```

Line 3 of the file now has the description `'Bread and milk'`, with no
spaces around it. The category is still `'Food'`, with a capital
letter. The next page corrects that.
