---
title: Rows that cannot be read
requires: [verify:invalid-shown, verify:clean-rows]
---

# Rows that cannot be read

Untidy data can be cleaned. Some data cannot: the information is not
there. Three lines of the file are like this, and no code can repair
them:

| Line | Text of the line | What is wrong |
|------|------------------|---------------|
| 9 | `2026-01-14,Gift for Chidi,unknown,hobbies` | the amount is a word |
| 22 | `2026-02-13,Haircut` | two fields only |
| 36 | `2026-03-16,Lunch,,food` | the amount is empty |

A program must not guess an amount. The correct thing to do is to
**skip** these rows, which means to leave them out, and to keep a
list of them, so that a person can look at them later.

The three rows fail in two different ways, and your code handles each
way with a different tool.

## A row with the wrong number of fields

Line 22 gives a list of two strings. `clean_row` reads `row[2]`, and
a list of two strings has no index 2, so the function stops with an
`IndexError`.

Your code can know this before it calls `clean_row`. The function
`len()` gives the number of items in a list, so the test
`len(row) == 4` is `True` only for a row that has four fields. An
`if` with this test decides whether the row goes to `clean_row` or to
the list of skipped rows.

This is the plainest way, because the test says exactly what is
wrong. It also finds a row that has too many fields, which gives no
error at all.

## An amount that is not a number

Lines 9 and 36 have four fields, so the test with `len()` is `True`
for them. They fail later, inside `clean_row`, when `Decimal()`
receives a string that is not a number.

An error that stops a program while it runs is called an
**exception**. Each exception has a type, such as `ValueError`. The
workshop **When the data is wrong** showed how to handle one with
`try` and `except`:

```python
try:
    number = float("unknown")
except ValueError:
    print("float() cannot read this text.")
```

Python runs the block under `try`. If a line in that block fails with
a `ValueError`, Python leaves the block at once and runs the block
under `except ValueError:`. The program does not stop. If no line
fails, Python does not run the `except` block.

`float()` fails with a `ValueError`. `Decimal()` is different: when
its string is not a number, it fails with an exception of a type of
its own, named `InvalidOperation`. This type is in the module
`decimal` too, and your code must import it before it can name it
after `except`. One `import` line can get two names from a module,
with a comma between the names.

Click the action below. It adds a cell that imports
`InvalidOperation`, tries to make a `Decimal` from the word on line 9,
and catches the exception. The action runs the cell.

```{attempt}
:id: invalid-not-shown
:check: invalid-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-invalid
:title: Add a cell that catches the exception from Decimal, and run it
:path: {{ notebook }}
:tags: [invalid]
:run: true
from decimal import Decimal, InvalidOperation

try:
    bad_amount = Decimal("unknown")
    print(bad_amount)
except InvalidOperation:
    print("Decimal() cannot read this text.")
```

The output is:

```
Decimal() cannot read this text.
```

```{verify}
:id: invalid-shown
:label: The cell caught the exception from Decimal
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed invalid
if "InvalidOperation" in globals():
    print("The cell ran. Decimal() failed with an InvalidOperation, and the except block caught it.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
"InvalidOperation" in globals()
```

`Decimal("unknown")` failed, so Python never reached the line
`print(bad_amount)`. It ran the `except` block. An empty string, as
on line 36, fails in the same way.

Always name the type of the exception after `except`. An `except:`
line with no type catches every error, also the errors that come from
a mistake in your own code, such as a name that is spelled wrongly.
Your program then hides the mistake, and you never see it.

## Your task

Clean every row of the file. Put the clean rows in one list, and the
rows that cannot be read in another list.

- Make two empty lists, named `clean_rows` and `skipped_rows`.

- Use a `for` loop over `raw_rows[1:]`. The slice `[1:]` gives every
  row except the header.

- If the row has four fields, try to clean it with `clean_row(row)`,
  and add the result to `clean_rows`. If `clean_row` fails with an
  `InvalidOperation`, add the row itself to `skipped_rows`.

- If the row does not have four fields, add the row itself to
  `skipped_rows`.

- After the loop, the last two lines of the cell are
  `print(len(clean_rows))` and `print(len(skipped_rows))`.

When your code is correct, the output under the cell is:

```
37
3
```

```{cell-insert}
:id: insert-clean-rows
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [clean-rows]
:run: false
# Write the code that cleans every row below this line.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: the shape of the code
The code has this shape. Each level is four spaces further to the
right than the level before it.

1. Two lines that make the empty lists: `clean_rows = []` and
   `skipped_rows = []`.

2. The loop: `for row in raw_rows[1:]:`.

3. Inside the loop, an `if` and an `else`: `if len(row) == 4:` and,
   further down, `else:`.

4. Inside the `if` block, a `try:` and an `except InvalidOperation:`.
```

````{hint}
:title: Hint: the lines inside the loop
Inside the `try` block there is one line:
`clean_rows.append(clean_row(row))`. Python calls `clean_row` first.
If the call fails, Python leaves the `try` block before `append()`
runs, so nothing is added to `clean_rows`.

Inside the `except` block, and inside the `else` block, there is the
same line: `skipped_rows.append(row)`.

The loop looks like this, with two lines left for you to write:

```python
for row in raw_rows[1:]:
    if len(row) == 4:
        try:
            # add the clean row to clean_rows
        except InvalidOperation:
            skipped_rows.append(row)
    else:
        # add the row to skipped_rows
```
````

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: clean-rows-not-started
:check: clean-rows
:expect: The name clean_rows does not exist yet
```

````{attempt}
:id: clean-rows-no-skipped
:check: clean-rows
:expect: The name skipped_rows does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
for row in raw_rows[1:]:
    if len(row) == 4:
        try:
            clean_rows.append(clean_row(row))
        except InvalidOperation:
            print("skipped")
```
````

````{attempt}
:id: clean-rows-count-not-list
:check: clean-rows
:expect: skipped_rows must be a list

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
skipped_rows = 0
for row in raw_rows[1:]:
    if len(row) == 4:
        try:
            clean_rows.append(clean_row(row))
        except InvalidOperation:
            skipped_rows = skipped_rows + 1
    else:
        skipped_rows = skipped_rows + 1
```
````

````{attempt}
:id: clean-rows-empty
:check: clean-rows
:expect: The list clean_rows is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
skipped_rows = []
for row in raw_rows[1:]:
    if len(row) == 4:
        try:
            clean_row(row)
        except InvalidOperation:
            skipped_rows.append(row)
    else:
        skipped_rows.append(row)
```
````

````{attempt}
:id: clean-rows-header
:check: clean-rows
:expect: The header of the file is in skipped_rows

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
skipped_rows = []
for row in raw_rows:
    if len(row) == 4:
        try:
            clean_rows.append(clean_row(row))
        except InvalidOperation:
            skipped_rows.append(row)
    else:
        skipped_rows.append(row)
```
````

````{attempt}
:id: clean-rows-raw
:check: clean-rows
:expect: is not a clean row

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
skipped_rows = []
for row in raw_rows[1:]:
    if len(row) == 4:
        try:
            clean_row(row)
            clean_rows.append(row)
        except InvalidOperation:
            skipped_rows.append(row)
    else:
        skipped_rows.append(row)
```
````

````{attempt}
:id: clean-rows-no-else
:check: clean-rows
:expect: skipped_rows has 2 rows, but it must have 3

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
skipped_rows = []
for row in raw_rows[1:]:
    if len(row) == 4:
        try:
            clean_rows.append(clean_row(row))
        except InvalidOperation:
            skipped_rows.append(row)
```
````

````{attempt}
:id: clean-rows-too-few
:check: clean-rows
:expect: clean_rows has 36 rows, but it must have 37

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
skipped_rows = []
for row in raw_rows[2:]:
    if len(row) == 4:
        try:
            clean_rows.append(clean_row(row))
        except InvalidOperation:
            skipped_rows.append(row)
    else:
        skipped_rows.append(row)
```
````

````{attempt}
:id: clean-rows-changed
:check: clean-rows
:expect: but it must hold the values

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
skipped_rows = []
for row in raw_rows[1:]:
    if len(row) == 4:
        try:
            cleaned = clean_row(row)
            cleaned[3] = row[3].strip().lower()
            clean_rows.append(cleaned)
        except InvalidOperation:
            skipped_rows.append(row)
    else:
        skipped_rows.append(row)
```
````

````{attempt}
:id: clean-rows-wrong-skipped
:check: clean-rows
:expect: skipped_rows must hold the three rows that cannot be read

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
skipped_rows = []
for row in raw_rows[1:]:
    if len(row) == 4:
        try:
            clean_rows.append(clean_row(row))
        except InvalidOperation:
            skipped_rows.append(raw_rows[1])
    else:
        skipped_rows.append(raw_rows[1])
```
````

````{attempt}
:id: clean-rows-two-excepts
:check: clean-rows
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_rows = []
skipped_rows = []
for row in raw_rows[1:]:
    try:
        clean_rows.append(clean_row(row))
    except InvalidOperation:
        skipped_rows.append(row)
    except IndexError:
        skipped_rows.append(row)
```
````

````{hint}
:title: Show me a solution
:unlock: "clean-rows" in failed_checks or "clean-rows" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-clean-rows-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [clean-rows-solution]
:run: true
clean_rows = []
skipped_rows = []
for row in raw_rows[1:]:
    if len(row) == 4:
        try:
            clean_rows.append(clean_row(row))
        except InvalidOperation:
            skipped_rows.append(row)
    else:
        skipped_rows.append(row)

print(len(clean_rows))
print(len(skipped_rows))
```
````

```{verify}
:id: clean-rows
:label: Your code cleans 37 rows and skips 3 rows
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed clean-rows; cell-executed clean-rows-solution
def _workshop_check():
    import csv
    if "clean_rows" not in globals():
        print("The name clean_rows does not exist yet. Write your code under the comment in the new cell, and check the spelling of the name. Then hold Shift and press Enter to run the cell.")
        return False
    if "skipped_rows" not in globals():
        print("The name skipped_rows does not exist yet. Make two empty lists before the loop: clean_rows = [] and skipped_rows = []. Add each row that cannot be read to skipped_rows. Then run the cell again.")
        return False
    cleaned = globals()["clean_rows"]
    skipped = globals()["skipped_rows"]
    if not isinstance(cleaned, list):
        print(f"clean_rows must be a list, but it is {cleaned!r}. Start with clean_rows = [] and add each clean row to it with append(). Then run the cell again.")
        return False
    if not isinstance(skipped, list):
        print(f"skipped_rows must be a list, but it is {skipped!r}. Start with skipped_rows = [] and add each row that cannot be read to it with append(), so that a person can look at those rows later. Then run the cell again.")
        return False
    if len(cleaned) == 0:
        print("The list clean_rows is empty. Inside the try block, add the result of clean_row to the list: clean_rows.append(clean_row(row)). Then run the cell again.")
        return False
    if ["date", "description", "amount", "category"] in skipped:
        print("The header of the file is in skipped_rows. The header is not a purchase, so your loop must not read it. Loop over raw_rows[1:], which is every row except the first one. Then run the cell again.")
        return False
    try:
        with open("spending.csv", newline="") as file:
            expected = list(csv.reader(file))[1:]
    except OSError:
        print("The check cannot read the file spending.csv, which holds the correct clean rows. Click Restart at the top of this panel to get the files of the workshop back.")
        return False
    for index in range(len(cleaned)):
        item = cleaned[index]
        if not isinstance(item, list) or len(item) != 4 or isinstance(item[2], str):
            print(f"clean_rows[{index}] is {item!r}. That is not a clean row. Add the list that clean_row gives, and not the row itself: clean_rows.append(clean_row(row)). Then run the cell again.")
            return False
    if len(cleaned) != len(expected):
        print(f"clean_rows has {len(cleaned)} rows, but it must have {len(expected)}. Loop over raw_rows[1:], and add one clean row for every row that has four fields and an amount that is a number. Then run the cell again.")
        return False
    for index in range(len(expected)):
        item = cleaned[index]
        want = expected[index]
        try:
            same = item[0] == want[0] and item[1] == want[1] and round(float(item[2]), 2) == float(want[2]) and item[3] == want[3]
        except Exception:
            same = False
        if not same:
            print(f"clean_rows[{index}] is {item!r} but it must hold the values {want[0]}, {want[1]}, {want[2]} and {want[3]}. Add the list that clean_row gives, and do not change it. If that list is wrong, return to the page before this one and run its check. Then run the cell again.")
            return False
    if len(skipped) != 3:
        print(f"skipped_rows has {len(skipped)} rows, but it must have 3. Line 22 of the file has two fields only: add it in an else block that belongs to the if. Lines 9 and 36 have an amount that is not a number: add them in the except block. Then run the cell again.")
        return False
    if skipped != [["2026-01-14", "Gift for Chidi", "unknown", "hobbies"], ["2026-02-13", "Haircut"], ["2026-03-16", "Lunch", "", "food"]]:
        print("skipped_rows must hold the three rows that cannot be read, as they are in raw_rows. Add the row itself: skipped_rows.append(row). Then run the cell again.")
        return False
    print("Correct. clean_rows holds the 37 clean rows, and skipped_rows holds the 3 rows that cannot be read.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

`clean_rows` holds 37 purchases, and every value in it is clean.
`skipped_rows` holds the three rows that your program left out.
Nothing is lost: Mariam can read the three rows, find the amounts,
and correct the file.

Skipping a row is a decision, and a program must make it visibly. A
program that leaves rows out and says nothing gives a total that is
too small, and nobody knows why.
