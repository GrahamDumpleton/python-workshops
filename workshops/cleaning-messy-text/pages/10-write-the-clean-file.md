---
title: Write the clean file
requires: [verify:two-places-shown, verify:clean-file, verify:files-compared]
---

# Write the clean file

The clean rows are in a list in your notebook. A list lasts only as
long as the notebook runs. To keep the clean data, and to give it to
another program, you write it to a file.

The new file gets a new name, `spending-clean.csv`. Your program
never changes `spending-raw.csv`. The raw file is the record of what
Mariam typed. If your cleaning code has a mistake, you can correct
the code and run it again, because the raw data is still there.

Someone has already cleaned the same data with care, and the result
is in the file `spending.csv`, which came with this workshop. So you
have a test for all your work: the text of your new file must be
exactly the same as the text of `spending.csv`.

## Two digits after the point

One detail is left. A `Decimal` keeps the digits that it was given.
Line 2 of the raw file has the amount `650`, so the `Decimal` is
shown as `650`. The clean file writes every amount with two digits
after the point: `650.00`.

An **f-string** is a string with the letter `f` before its first
quote. Inside it, a name between `{` and `}` is replaced by its
value. After the name, `:.2f` tells Python to write the number with
two digits after the point. You used this in the workshop **Working
with text**, and it works for a `Decimal` too.

```{attempt}
:id: two-places-not-shown
:check: two-places-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-two-places
:title: Add a cell that writes a Decimal with two digits after the point, and run it
:path: {{ notebook }}
:tags: [two-places]
:run: true
rent_amount = Decimal("650")
print(rent_amount)
print(f"{rent_amount:.2f}")
```

The output is:

```
650
650.00
```

```{verify}
:id: two-places-shown
:label: The cell wrote a Decimal with two digits after the point
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed two-places
if str(globals().get("rent_amount")) == "650":
    print("The cell ran. With :.2f in an f-string, the Decimal 650 is written as 650.00.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
str(globals().get("rent_amount")) == "650"
```

The f-string gives a string, `"650.00"`. That is what a file needs,
because a file holds text.

## How to write a CSV file

The module `csv` writes rows as well as it reads them. The workshop
**CSV and JSON** showed how. This is the pattern:

```python
with open("example.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["date", "description", "amount", "category"])
    writer.writerow(["2026-01-05", "Bus ticket", "2.80", "transport"])
```

- `open()` with `"w"` opens the file for writing. If the file does
  not exist, Python makes it. If it exists, Python replaces what is in
  it. The module `csv` asks for `newline=""` here too.

- `csv.writer(file)` gives a writer for the file.

- `writer.writerow()` takes a list, and writes its items as one line
  of the file, with commas between them.

## Your task

Write the clean rows to the file `spending-clean.csv`.

- Open the file `spending-clean.csv` for writing, and make a writer
  for it.

- Write the header first. The header is `raw_rows[0]`, which is the
  list `['date', 'description', 'amount', 'category']`.

- Then use a `for` loop over `clean_rows`. For each row, write one
  line with the four values of the row. Write the amount with two
  digits after the point.

The cell shows no output, because it writes to the file and prints
nothing. The first three lines of the file must be:

```
date,description,amount,category
2026-01-01,Rent for January,650.00,rent
2026-01-03,Bread and milk,6.40,food
```

```{cell-insert}
:id: insert-write-clean
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [write-clean]
:run: false
# Write the code that writes spending-clean.csv below this line.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`. The check at the bottom
of this page reads your file and compares it with `spending.csv`,
line by line.

```{hint}
:title: Hint: the first three lines
The first three lines are almost the same as in the pattern above:

`with open("spending-clean.csv", "w", newline="") as file:`

and then, with four spaces at the start of each line,
`writer = csv.writer(file)` and `writer.writerow(raw_rows[0])`.
```

```{hint}
:title: Hint: the loop
The loop is inside the `with` block, so the line
`for row in clean_rows:` begins with four spaces, and the line inside
the loop begins with eight spaces.

In a clean row, `row[2]` is the amount. Do not give the row to
`writerow()` as it is, because the amount is then written with the
digits that it has: `650` and not `650.00`. Make a new list of four
items, with the amount as an f-string:

`writer.writerow([row[0], row[1], f"{row[2]:.2f}", row[3]])`
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: clean-file-not-started
:check: clean-file
:expect: The file spending-clean.csv does not exist yet
```

````{attempt}
:id: clean-file-empty
:check: clean-file
:expect: The file spending-clean.csv is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending-clean.csv", "w", newline="") as file:
    writer = csv.writer(file)
```
````

````{attempt}
:id: clean-file-no-header
:check: clean-file
:expect: but it must be the header

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending-clean.csv", "w", newline="") as file:
    writer = csv.writer(file)
    for row in clean_rows:
        writer.writerow([row[0], row[1], f"{row[2]:.2f}", row[3]])
```
````

````{attempt}
:id: clean-file-amounts
:check: clean-file
:expect: The amount is written as 650

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending-clean.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(raw_rows[0])
    for row in clean_rows:
        writer.writerow(row)
```
````

````{attempt}
:id: clean-file-too-short
:check: clean-file
:expect: Your file has 2 lines, but it must have 38

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending-clean.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(raw_rows[0])
    for row in clean_rows[:1]:
        writer.writerow([row[0], row[1], f"{row[2]:.2f}", row[3]])
```
````

````{attempt}
:id: clean-file-other-line
:check: clean-file
:expect: but it must be '2026-01-01,Rent for January,650.00,rent'

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending-clean.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(raw_rows[0])
    for row in clean_rows:
        writer.writerow([row[0], row[1], row[3], f"{row[2]:.2f}"])
```
````

````{attempt}
:id: clean-file-last-newline
:check: clean-file
:expect: differs at the end

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending-clean.csv", "w") as file:
    file.write("date,description,amount,category")
    for row in clean_rows:
        file.write(f"\n{row[0]},{row[1]},{row[2]:.2f},{row[3]}")
```
````

````{attempt}
:id: clean-file-with-write
:check: clean-file
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("spending-clean.csv", "w") as file:
    file.write("date,description,amount,category\n")
    for row in clean_rows:
        file.write(f"{row[0]},{row[1]},{row[2]:.2f},{row[3]}\n")
```
````

````{hint}
:title: Show me a solution
:unlock: "clean-file" in failed_checks or "clean-file" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-write-clean-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [write-clean-solution]
:run: true
with open("spending-clean.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(raw_rows[0])
    for row in clean_rows:
        writer.writerow([row[0], row[1], f"{row[2]:.2f}", row[3]])
```
````

```{verify}
:id: clean-file
:label: The text of your file is the same as the text of spending.csv
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed write-clean; cell-executed write-clean-solution
def _workshop_check():
    try:
        with open("spending-clean.csv") as file:
            text = file.read()
    except FileNotFoundError:
        print("The file spending-clean.csv does not exist yet. Write your code under the comment in the new cell, and check the spelling of the name of the file. Then hold Shift and press Enter to run the cell.")
        return False
    except Exception as error:
        print(f"The check cannot read the file spending-clean.csv. Python stopped with an error of the type {type(error).__name__}. Run your cell again, so that it writes the file again.")
        return False
    try:
        with open("spending.csv") as file:
            expected_text = file.read()
    except Exception:
        print("The check cannot read the file spending.csv, which holds the correct clean rows. Click Restart at the top of this panel to get the files of the workshop back.")
        return False
    if text == expected_text:
        print("Correct. Your file has the header and 37 purchases, and its text is exactly the same as the text of spending.csv.")
        return True
    lines = text.splitlines()
    expected = expected_text.splitlines()
    if len(lines) == 0:
        print("The file spending-clean.csv is empty. Inside the with block, write the header with writer.writerow(raw_rows[0]), and then one line for each row of clean_rows. Then run the cell again.")
        return False
    if lines[0] != expected[0]:
        print(f"The first line of your file is {lines[0]!r} but it must be the header, {expected[0]!r}. Write the header before the loop: writer.writerow(raw_rows[0]). Then run the cell again.")
        return False
    for index in range(min(len(lines), len(expected))):
        if lines[index] == expected[index]:
            continue
        mine = lines[index].split(",")
        want = expected[index].split(",")
        if len(mine) == 4 and mine[0] == want[0] and mine[1] == want[1] and mine[3] == want[3]:
            print(f"Line {index + 1} of your file is {lines[index]!r}. The amount is written as {mine[2]} but it must be written as {want[2]}, with two digits after the point. Write the amount as an f-string with :.2f after the name. The second hint on this page shows the line. Then run the cell again.")
            return False
        print(f"Line {index + 1} of your file is {lines[index]!r} but it must be {expected[index]!r}. Write the four values of each clean row in this order: the date, the description, the amount and the category. Then run the cell again.")
        return False
    if len(lines) != len(expected):
        print(f"Your file has {len(lines)} lines, but it must have {len(expected)}: the header and one line for each of the 37 clean rows. Loop over every row of clean_rows, and write one line inside the loop for each row. Then run the cell again.")
        return False
    print("The lines of your file are correct, but the text differs at the end of a line or at the end of the file. Every line, the last line too, must end with a new line, and the file must have no empty lines. writer.writerow() does this for you. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

## See the result

Click the action below. It opens your new file under the notebook,
in a tab beside the tab of the raw file. Click each tab in turn, and
compare line 3 of the two files.

```{file-open}
:id: open-clean-file
:title: Show the file spending-clean.csv under the notebook
:path: spending-clean.csv
:area: data
```

The check has already compared your file with `spending.csv`. The
cell below does the same comparison in your notebook, so that you see
how it works. It reads all the text of each file with `.read()`, and
compares the two strings with `==`. Two strings are equal only when
every character is the same.

```{attempt}
:id: files-not-compared
:check: files-compared
:expect: The cell has not run yet
```

````{attempt}
:id: files-different
:check: files-compared
:expect: the text of the two files is different

```{cell-insert}
:path: {{ notebook }}
:run: true
clean_text = "date"
expected_text = "date,description"
```
````

```{cell-insert}
:id: insert-compare
:title: Add a cell that compares the text of the two files, and run it
:path: {{ notebook }}
:tags: [compare]
:run: true
with open("spending-clean.csv") as file:
    clean_text = file.read()
with open("spending.csv") as file:
    expected_text = file.read()

print(len(clean_text))
print(len(expected_text))
print(clean_text == expected_text)
```

The output is:

```
1402
1402
True
```

```{verify}
:id: files-compared
:label: The cell compared the text of the two files
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed compare
if isinstance(globals().get("clean_text"), str) and isinstance(globals().get("expected_text"), str) and globals().get("clean_text") == globals().get("expected_text"):
    print("The cell ran. The two files have the same 1402 characters, so the comparison gives True.")
elif isinstance(globals().get("clean_text"), str) and isinstance(globals().get("expected_text"), str):
    print("The cell ran, but the text of the two files is different, so the comparison gives False. Make the check above this one pass first. Then click on this cell and run it again: hold Shift and press Enter.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("clean_text"), str) and isinstance(globals().get("expected_text"), str) and globals().get("clean_text") == globals().get("expected_text")
```

Each file has 1402 characters, and every character is the same. Your
code turned 40 untidy lines into the same 37 clean purchases that a
careful person made by hand.
