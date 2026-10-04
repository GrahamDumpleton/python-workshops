---
title: The csv module
requires: [verify:reader-ran, verify:spending-rows]
---

# The csv module

Python comes with code that knows every rule of the CSV format. The
code is in a module with the name `csv`.

A **module** is a file of Python code that someone has already
written, which holds functions and other names that are ready to use.
Python comes with many modules. To use a module, a program must
**import** it: the line `import csv` tells Python to make the module
ready, and gives the program the name `csv`. After that line, you
write the name of the module, a dot and the name of the thing that
you want from it, such as `csv.reader`. The workshop **The batteries
included** explains modules in full.

One `import` line is enough for a whole notebook. When the line has
run one time, every later cell can use the module.

## A reader

The module has a function with the name `csv.reader()`. You give it
an open file, and it gives you a **reader**. A reader is a value that
gives the rows of the file one at a time. You write a `for` loop over
the reader, in the same way as you write a loop over the lines of a
file. The difference is in what each pass of the loop
receives:

- A loop over the file gives one line each time, as one string.

- A loop over the reader gives one row each time, as a list of
  strings. The reader has already cut the row into its fields, by the
  rules of CSV.

Think of a person at a post office who opens each envelope for you.
You do not get the closed envelope. You get what is inside it, ready
to use.

Click the action below. It adds a cell that reads the file
`shopping.csv` again, this time with a reader, and runs it.

```{attempt}
:id: reader-not-run
:check: reader-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-reader
:title: Add a cell that reads the file with csv.reader, and run it
:path: {{ notebook }}
:tags: [reader]
:run: true
import csv

shopping_rows = []
with open("shopping.csv", newline="") as file:
    reader = csv.reader(file)
    for row in reader:
        shopping_rows.append(row)
print(len(shopping_rows[1]))
print(shopping_rows[1])
print(shopping_rows[1][1])
```

The output is:

```
4
['2026-01-14', 'Tea, sugar and rice', '12.50', 'food']
Tea, sugar and rice
```

```{verify}
:id: reader-ran
:label: The cell read the rows with csv.reader
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed reader
if type(globals().get("shopping_rows")) is list and len(shopping_rows) == 3 and shopping_rows[1] == ["2026-01-14", "Tea, sugar and rice", "12.50", "food"]:
    print("The cell ran. The row of the first purchase has four fields, and the description is one string.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("shopping_rows")) is list and len(shopping_rows) == 3 and shopping_rows[1] == ["2026-01-14", "Tea, sugar and rice", "12.50", "food"]
```

## What happened

| Line | What Python did |
|------|-----------------|
| `import csv` | made the module `csv` ready to use |
| `shopping_rows = []` | made an empty list for the rows |
| `with open("shopping.csv", newline="") as file:` | opened the file, and gave the open file the name `file` |
| `reader = csv.reader(file)` | made a reader for the open file |
| `for row in reader:` | ran the block one time for each row of the file, with the name `row` for the row |
| `shopping_rows.append(row)` | added the row to the end of the list |

The row of the first purchase is now correct. It has four items. The
description is one string, with the comma in it and without the
double quotes. The amount is at index `2`, as in every other row.

Two details are different from the cell on the page before:

- The call of `open()` has a second argument, `newline=""`. It tells
  Python to leave the end of each line exactly as it is in the file,
  because the module `csv` handles the ends of the lines itself. The
  Python documentation says that a file for the module `csv` must
  always be opened with `newline=""`. The value `""` is a string with
  nothing in it: two double quotes with no space between them.

- The cell does not use `strip()`. The reader removes the newline
  character from the end of each row.

The reader gives every row of the file, and the header row is the
first one. So `shopping_rows[0]` is the list of the names of the
fields, and the purchases begin at index `1`.

## Your task

Now read the file of Mariam with a reader.

Write a program that reads the file `spending.csv` with
`csv.reader()`, and puts every row of the file into a list with the
name `spending_rows`. The list must hold every row, and the header
row is one of them.

Your program must do these things:

1. Give the name `spending_rows` to an empty list.

2. Open the file `spending.csv` with `newline=""`, in a `with` block.

3. Inside the block, make a reader for the open file.

4. Write a `for` loop over the reader, and add each row to the list
   `spending_rows` in the loop.

5. After the `with` block, show the number of rows with
   `print(len(spending_rows))`, and show the first purchase with
   `print(spending_rows[1])`.

When the program is correct, the output under the cell is:

```
38
['2026-01-01', 'Rent for January', '650.00', 'rent']
```

You do not need the line `import csv` again, because the cell above
has already run it.

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-spending-rows
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [spending-rows]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Your program has the same form as the cell above that reads
`shopping.csv`. Two things are different: the name of the file, and
the name of the list. The first two lines are `spending_rows = []`
and `with open("spending.csv", newline="") as file:`.
```

```{hint}
:title: Hint: the lines inside the block
Each line inside the `with` block begins with four spaces. The first
one makes the reader: `reader = csv.reader(file)`. The second one
begins the loop: `for row in reader:`. The line under the `for` line
begins with eight spaces: `spending_rows.append(row)`. The two
`print()` lines come last, and they begin without spaces.
```

```{hint}
:title: Hint: I see a NameError for csv
A `NameError` with the name `csv` means that the line `import csv`
has not run in this notebook. Add the line `import csv` at the top of
your cell, and run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: spending-rows-not-started
:check: spending-rows
:expect: The name spending_rows does not exist yet
```

````{attempt}
:id: spending-rows-not-a-list
:check: spending-rows
:expect: its value is not a list

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_rows = "spending.csv"
print(spending_rows)
```
````

````{attempt}
:id: spending-rows-empty
:check: spending-rows
:expect: The list spending_rows is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_rows = []
with open("spending.csv", newline="") as file:
    reader = csv.reader(file)
print(len(spending_rows))
```
````

````{attempt}
:id: spending-rows-lines
:check: spending-rows
:expect: holds strings, but it must hold lists

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_rows = []
with open("spending.csv", newline="") as file:
    reader = csv.reader(file)
    for row in file:
        spending_rows.append(row)
print(len(spending_rows))
print(spending_rows[1])
```
````

````{attempt}
:id: spending-rows-file-missing
:check: spending-rows
:expect: The check cannot read the file spending.csv

```{file-rename}
:path: spending.csv
:to: spending-moved.csv
```
````

````{attempt}
:id: spending-rows-split
:check: spending-rows
:expect: still has the newline character at its end

```{file-rename}
:path: spending-moved.csv
:to: spending.csv
```

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_rows = []
with open("spending.csv", newline="") as file:
    for line in file:
        spending_rows.append(line.split(","))
print(len(spending_rows))
print(spending_rows[1])
```
````

````{attempt}
:id: spending-rows-no-header
:check: spending-rows
:expect: The header row is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_rows = []
with open("spending.csv", newline="") as file:
    reader = csv.reader(file)
    for row in reader:
        spending_rows.append(row)
spending_rows = spending_rows[1:]
print(len(spending_rows))
print(spending_rows[1])
```
````

````{attempt}
:id: spending-rows-one-row
:check: spending-rows
:expect: holds 1 row, but the file has 38 rows

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_rows = []
with open("spending.csv", newline="") as file:
    reader = csv.reader(file)
    for row in reader:
        last_row = row
spending_rows.append(last_row)
print(len(spending_rows))
```
````

````{attempt}
:id: spending-rows-other-file
:check: spending-rows
:expect: holds 3 rows, but the file has 38 rows

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_rows = []
with open("shopping.csv", newline="") as file:
    reader = csv.reader(file)
    for row in reader:
        spending_rows.append(row)
print(len(spending_rows))
print(spending_rows[1])
```
````

````{attempt}
:id: spending-rows-changed
:check: spending-rows
:expect: is different from row 1 of the file

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_rows = []
with open("spending.csv", newline="") as file:
    reader = csv.reader(file)
    for row in reader:
        spending_rows.append(row[:3])
print(len(spending_rows))
print(spending_rows[1])
```
````

````{attempt}
:id: spending-rows-another-way
:check: spending-rows
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_rows = []
with open("spending.csv", newline="") as spending_file:
    for fields in csv.reader(spending_file):
        spending_rows = spending_rows + [fields]
print(len(spending_rows))
print(spending_rows[1])
```
````

````{hint}
:title: Show me a solution
:unlock: "spending-rows" in failed_checks or "spending-rows" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-spending-rows-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [spending-rows-solution]
:run: true
spending_rows = []
with open("spending.csv", newline="") as file:
    reader = csv.reader(file)
    for row in reader:
        spending_rows.append(row)
print(len(spending_rows))
print(spending_rows[1])
```
````

```{verify}
:id: spending-rows
:label: Your list spending_rows holds every row of the file
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed spending-rows; cell-executed spending-rows-solution
def _workshop_check():
    import csv
    if "spending_rows" not in globals():
        print("The name spending_rows does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes an empty list: spending_rows = []. Then hold Shift and press Enter to run the cell.")
        return False
    rows = globals()["spending_rows"]
    if type(rows) is not list:
        print("The name spending_rows exists, but its value is not a list. The first line of your program must make an empty list: spending_rows = []. The loop then adds each row with spending_rows.append(row). Then run the cell again.")
        return False
    if len(rows) == 0:
        print("The list spending_rows is empty. The program needs a for loop over the reader inside the with block, which adds each row to the list: for row in reader: and under it spending_rows.append(row). Then run the cell again.")
        return False
    try:
        with open("spending.csv", newline="") as file:
            expected = [row for row in csv.reader(file)]
    except OSError:
        print("The check cannot read the file spending.csv. The file is missing or it has another name. Click the restart button at the top of this panel, which begins the workshop again with all of its files.")
        return False
    if rows == expected:
        print("Correct. The list spending_rows holds the 38 rows of the file, and each row is a list of four strings.")
        return True
    if type(rows[0]) is str:
        print("The list spending_rows holds strings, but it must hold lists. A loop over the file gives each line as one string. A loop over the reader gives each row as a list of its fields. The for line must name the reader: for row in reader: Then run the cell again.")
        return False
    if type(rows[0]) is not list:
        print("The items of spending_rows are not lists. Each item must be one row that the reader gives. Make the reader with reader = csv.reader(file), and add each row in the loop with spending_rows.append(row). Then run the cell again.")
        return False
    if type(rows[0][-1]) is str and rows[0][-1].endswith("\n"):
        print("The last field of each row still has the newline character at its end. That happens when the program cuts each line with split(). Use the reader for this task: reader = csv.reader(file) and then for row in reader: The reader cuts each row by the rules of CSV, and removes the newline character. Then run the cell again.")
        return False
    if rows == expected[1:]:
        print("The list spending_rows holds the 37 purchases. The header row is missing. For this task the list must hold every row that the reader gives, and the header row is the first one. Add every row to the list, and do not remove one. Then run the cell again.")
        return False
    if len(rows) != len(expected):
        count = "1 row" if len(rows) == 1 else f"{len(rows)} rows"
        print(f"The list spending_rows holds {count}, but the file has 38 rows. Check that the program opens spending.csv, and that the line spending_rows.append(row) is inside the for loop, with eight spaces at its start. Then run the cell again.")
        return False
    for number in range(len(expected)):
        if rows[number] != expected[number]:
            print(f"The item at index {number} of spending_rows is {rows[number]!r}. It is different from row {number + 1} of the file, which is {expected[number]!r}. Add each row to the list exactly as the reader gives it: spending_rows.append(row). Then run the cell again.")
            return False
globals().pop("_workshop_check")()
```

The list `spending_rows` now holds the whole table. To get the amount
of a purchase, you write `spending_rows[1][2]`: the row at index `1`,
and in that row the field at index `2`. That works, but you must
remember that the amount is the field at index `2`. The next page
shows a clearer way.
