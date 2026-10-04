---
title: "Part 1: read the purchases"
requires: [verify:read-spending]
---

# Part 1: read the purchases

From this page on, you write the code. Each page gives you one part of
the program: the goal, what the result must be, and a new cell to
write in. No page gives you the code, but every page has hints.

## The goal

Write a function named `read_spending`. It takes the name of a CSV
file, and it reads the rows of that file. It gives back two values: a
list of the clean rows, and the number of rows that it skipped because
they cannot be read.

A function is a group of lines that has a name. You define it one
time with `def`, and you can then call it many times. Here the function
keeps the lines that read a file in one place, so that the program can
read any file of purchases with one call.

## What your code must do

- The function `read_spending` has one **parameter**, named `name`. A
  parameter is a name in the `def` line that receives the value given
  in the call. Here that value is a string: the name of a file.

- The function opens the file whose name is in `name`, and reads its
  rows with `csv.reader`. The module `csv` reads CSV files.
  `csv.reader(file)` gives each row of the file as a list of strings,
  one string for each field. The cell must have the line `import csv`
  before it uses the module.

- The first row of the file is the header. It is not a purchase. The
  function does not put it in the list, and does not count it as a row
  that was skipped.

- The function calls `clean_row` with every other row. When
  `clean_row` gives back a dictionary, the function adds that
  dictionary to a list.

- When `clean_row` raises an `InvalidOperation` or an `IndexError`,
  the function does not stop. It skips that row, and it adds 1 to a count
  of the rows that it skipped.

- The function gives back two values with one `return` line: first the
  list of dictionaries, and then the count. It does not print them.

- After the function, the cell has three more lines. They call your
  function with Mariam's file, and show how many purchases were read
  and how many rows were skipped:

  ```python
  purchases, skipped_rows = read_spending("spending-raw.csv")
  print(len(purchases))
  print(skipped_rows)
  ```

For example, think of a file that holds these five lines:

```
date,description,amount,category
2025-12-01,Soup,4.25,food
2025-12-02,Pen,none,hobbies
2025-12-04,Tram ticket
2025-12-07, Map ,6.00,Hobbies
```

For that file, the function must give back a list of two dictionaries,
for the purchases `Soup` and `Map`, and the number 2. The header is
not counted. The row for `Pen` is skipped because `none` is not a
number, and the row for `Tram ticket` is skipped because it has only
two fields.

When your code is correct, the output under the cell is:

```
37
3
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-read
:title: Add a cell for part 1
:path: {{ notebook }}
:tags: [read]
:run: false
# Part 1: read the purchases. Write your code below this line.

```

Click on the empty line under the comment, and write your code. Then
run the cell: hold `Shift` and press `Enter`. The check at the bottom
of this page runs each time you run the cell. It calls your function
with two small files of its own, and it tells you what your function
gave back. The check removes its two files when it has finished.

If you see an error message, or the check does not pass, change your
code and run the cell again. You can try as many times as you like.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Cleaning messy text** read a CSV file into a list of
rows:

- `with open(name, newline="") as file:` opens the file. The lines
  that use the file are in the block under the `with` line, and Python
  closes the file at the end of that block. The module `csv` asks for
  `newline=""` each time that you open a file for it.

- `for fields in csv.reader(file):` gives each row of the file in
  turn, as a list of strings. The block of the loop appends each row
  to a list, for example a list named `raw_rows`.

- The slice `raw_rows[1:]` gives every row except the first one, which
  is the header. A second loop, over `raw_rows[1:]`, cleans the rows.

The workshop **When the data is wrong** showed how to handle an
exception. The line that can raise the exception is in a block under
`try:`. The `except` line names the type of the exception, and the
block under it says what to do. One `except` line can name two types.
You write the types in parentheses, with a comma between them:
`except (InvalidOperation, IndexError):`.

The workshop **Pairs and unique things** showed that a function can
give back two values: `return rows, skipped` with a comma between the
two values.
```

```{hint}
:title: Hint: the shape of the code
1. The first line of the cell is `import csv`.

2. Define the function: `def read_spending(name):`.

3. In the body, make an empty list for the rows of the file:
   `raw_rows = []`.

4. Open the file: `with open(name, newline="") as file:`. Write `name`
   without quotes, because it is the parameter.

5. Inside the `with` block, write a loop:
   `for fields in csv.reader(file):`. Its block has one line:
   `raw_rows.append(fields)`.

6. After the `with` block, with four spaces at the start of each line,
   give two names their first values: `rows = []` and `skipped = 0`.

7. Start the second loop: `for fields in raw_rows[1:]:`.

8. Inside the second loop, write `try:`. The block under it has one
   line, which cleans the row and adds it to the list:
   `rows.append(clean_row(fields))`.

9. Write `except (InvalidOperation, IndexError):` with the same number
   of spaces as `try:`. The block under it has one line:
   `skipped = skipped + 1`.

10. After the second loop, with four spaces at the start of the line,
    give both values back: `return rows, skipped`.

11. After the function, at the left side of the cell, write the three
    lines from the task.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

A `NameError` that names `csv` means that the line `import csv` is
missing. Write it as the first line of the cell. A `NameError` that
names `InvalidOperation` or `clean_row` means that the first cell of
the page **The data** has not run. Return to that page, and click its
first action that adds a cell.

A `FileNotFoundError` means that Python did not find the file. Check
the spelling of `"spending-raw.csv"` in the call, and check that the
function opens `name`, without quotes.

An `InvalidOperation` or an `IndexError` means that `clean_row` raised
the exception, and no `except` line handled it. Check that the call of
`clean_row` is inside the `try` block, and that the `except` line
names both types.

An `IndentationError` means that the spaces at the start of a line are
wrong. Each block starts four spaces further to the right than the
line that opens it.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: read-not-started
:check: read-spending
:expect: The function read_spending does not exist yet
```

````{attempt}
:id: read-not-a-function
:check: read-spending
:expect: The name read_spending is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
read_spending = "spending-raw.csv"
```
````

````{attempt}
:id: read-two-parameters
:check: read-spending
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name, rows):
    return rows, 0
```
````

````{attempt}
:id: read-no-import
:check: read-spending
:expect: uses a name that has no value yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        rows.append(clean_row(fields))
    return rows, skipped
```
````

````{attempt}
:id: read-name-in-quotes
:check: read-spending
:expect: did not find the file

```{cell-insert}
:path: {{ notebook }}
:run: true
import csv

def read_spending(name):
    raw_rows = []
    with open("name", newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        rows.append(clean_row(fields))
    return rows, skipped
```
````

````{attempt}
:id: read-no-try
:check: read-spending
:expect: stopped with an InvalidOperation

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        rows.append(clean_row(fields))
    return rows, skipped
```
````

````{attempt}
:id: read-one-type
:check: read-spending
:expect: stopped with an IndexError

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except InvalidOperation:
            skipped = skipped + 1
    return rows, skipped
```
````

````{attempt}
:id: read-other-error
:check: read-spending
:expect: stopped with an error of the type TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + "1"
    return rows, skipped
```
````

````{attempt}
:id: read-prints
:check: read-spending
:expect: shows its result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
    print(len(rows), skipped)
```
````

````{attempt}
:id: read-no-return
:check: read-spending
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
```
````

````{attempt}
:id: read-one-value
:check: read-spending
:expect: gives back one value, which is a list

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
    return rows
```
````

````{attempt}
:id: read-not-two-values
:check: read-spending
:expect: must give back two values

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    return 37
```
````

````{attempt}
:id: read-wrong-order
:check: read-spending
:expect: The first value must be a list

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
    return skipped, rows
```
````

````{attempt}
:id: read-raw-fields
:check: read-spending
:expect: holds a list of fields

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            clean_row(fields)
            rows.append(fields)
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
    return rows, skipped
```
````

````{attempt}
:id: read-fixed-file
:check: read-spending
:expect: reads the file spending-raw.csv

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open("spending-raw.csv", newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
    return rows, skipped
```
````

````{attempt}
:id: read-return-in-loop
:check: read-spending
:expect: holds only the first purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
        return rows, skipped
```
````

````{attempt}
:id: read-other-rows
:check: read-spending
:expect: but the list must hold these purchases

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[2:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
    return rows, 2
```
````

````{attempt}
:id: read-header-counted
:check: read-spending
:expect: counts the header

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
    return rows, skipped
```
````

````{attempt}
:id: read-wrong-count
:check: read-spending
:expect: for the number of rows that it skipped

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = 1
    return rows, skipped
```
````

````{attempt}
:id: read-no-purchases
:check: read-spending
:expect: The name purchases does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
    return rows, skipped
```
````

````{attempt}
:id: read-one-name
:check: read-spending
:expect: The name purchases must refer to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
purchases = read_spending("spending-raw.csv")
```
````

````{attempt}
:id: read-short-list
:check: read-spending
:expect: The list purchases holds 10 values

```{cell-insert}
:path: {{ notebook }}
:run: true
purchases, skipped_count = read_spending("spending-raw.csv")
purchases = purchases[:10]
```
````

````{attempt}
:id: read-no-skipped-rows
:check: read-spending
:expect: The name skipped_rows does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
purchases, skipped_count = read_spending("spending-raw.csv")
```
````

````{attempt}
:id: read-wrong-skipped-rows
:check: read-spending
:expect: The name skipped_rows refers to the value 0

```{cell-insert}
:path: {{ notebook }}
:run: true
skipped_rows = 0
```
````

````{attempt}
:id: read-two-blocks
:check: read-spending
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except ArithmeticError:
            skipped = skipped + 1
        except IndexError:
            skipped = skipped + 1
    return rows, skipped

purchases, skipped_rows = read_spending("spending-raw.csv")
print(len(purchases))
print(skipped_rows)
```
````

````{attempt}
:id: read-other-way
:check: read-spending
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
import csv

def read_spending(name):
    good = []
    bad = 0
    with open(name) as file:
        reader = csv.reader(file)
        header = next(reader)
        for fields in reader:
            if len(fields) == 4:
                try:
                    good.append(clean_row(fields))
                except InvalidOperation:
                    bad = bad + 1
            else:
                bad = bad + 1
    return good, bad

purchases, skipped_rows = read_spending("spending-raw.csv")
print(len(purchases))
print(skipped_rows)
```
````

````{hint}
:title: Show me a solution
:unlock: "read-spending" in failed_checks or "read-spending" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-read-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [read-solution]
:run: true
import csv

def read_spending(name):
    raw_rows = []
    with open(name, newline="") as file:
        for fields in csv.reader(file):
            raw_rows.append(fields)
    rows = []
    skipped = 0
    for fields in raw_rows[1:]:
        try:
            rows.append(clean_row(fields))
        except (InvalidOperation, IndexError):
            skipped = skipped + 1
    return rows, skipped

purchases, skipped_rows = read_spending("spending-raw.csv")
print(len(purchases))
print(skipped_rows)
```
````

```{verify}
:id: read-spending
:label: The function read_spending reads the purchases of a file
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed read; cell-executed read-solution
def _workshop_check():
    import contextlib, inspect, io, os
    from decimal import InvalidOperation
    if "read_spending" not in globals():
        print("The function read_spending does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["read_spending"]
    if not callable(function):
        print("The name read_spending is not a function. It refers to another kind of value. Define the function with a line that starts with def read_spending(name): and write the body under it. Then run the cell again.")
        return False
    try:
        inspect.signature(function).bind("file.csv")
    except TypeError:
        print("The function read_spending must have exactly one parameter, which receives the name of the file. The def line must be: def read_spending(name): Then run the cell again.")
        return False
    except ValueError:
        pass
    if not callable(globals().get("clean_row")):
        print("The function clean_row is missing. Return to the page The data, and click the action that adds the function clean_row again. Then return to this page and run your cell again.")
        return False
    header = "date,description,amount,category\n"
    tests = [
        ("_check_first.csv", header + "2025-12-01,Soup,4.25,food\n2025-12-02,Pen,none,hobbies\n2025-12-04,Bread,,food\n2025-12-07, Map ,6.00,Hobbies\n2025-12-09,Apples,2.4,groceries\n", ["Soup", "Map", "Apples"], 2, "The file holds a header, 3 purchases that can be read, and 2 rows whose amount is not a number."),
        ("_check_second.csv", header + "2025-11-02, Tea ,3.5,Food\n2025-11-03,Stamp\n2025-11-05,Tram ticket,2.10,travel\n", ["Tea", "Tram ticket"], 1, "The file holds a header, 2 purchases that can be read, and 1 row that has only two fields."),
    ]
    for file_name, text, expected, bad, kind in tests:
        about = "The check made a small file of its own. " + kind
        shown = io.StringIO()
        try:
            with open(file_name, "w") as file:
                file.write(text)
            with contextlib.redirect_stdout(shown):
                result = function(file_name)
        except NameError:
            print("The function read_spending stopped because it uses a name that has no value yet. The most likely reason is that the line import csv is missing: write it as the first line of the cell. Check also the spelling of each name in the body. If the name is InvalidOperation, return to the page The data and click its first action again. Then run the cell again.")
            return False
        except FileNotFoundError:
            print(f"The function read_spending did not find the file. The check called read_spending(\"{file_name}\"), and that file exists. The function must open the file whose name is in the parameter: open(name, newline=\"\") with no quotes around name. Then run the cell again.")
            return False
        except InvalidOperation:
            print(f"The function read_spending stopped with an InvalidOperation. {about} For such a row, clean_row raises an InvalidOperation, because Decimal() cannot read the amount. Put the call of clean_row in a block under try: and add an except line that names the types of both exceptions: except (InvalidOperation, IndexError): The block under it adds 1 to the count of skipped rows. Then run the cell again.")
            return False
        except IndexError:
            print(f"The function read_spending stopped with an IndexError. {about} For such a row, clean_row raises an IndexError. Put the call of clean_row in a block under try: and name both types in the except line: except (InvalidOperation, IndexError): The block under it adds 1 to the count of skipped rows. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function read_spending stopped with an error of the type {type(error).__name__} when the check called it with the name of a small file of its own. Call the function in a cell of your own, with read_spending(\"spending-raw.csv\"), and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        finally:
            try:
                os.remove(file_name)
            except OSError:
                pass
        if result is None and shown.getvalue().strip():
            print("The function read_spending shows its result with print(), but it does not return it. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the two values back: return rows, skipped. Then run the cell again.")
            return False
        if result is None:
            print("The function read_spending gives back None. That happens when the body has no return line. After the loop, add a line that starts with four spaces and gives both values back: return rows, skipped. Then run the cell again.")
            return False
        if isinstance(result, list):
            print("The function read_spending gives back one value, which is a list. It must give back two values: the list of rows, and the number of rows that it skipped. Write both in the return line, with a comma between them: return rows, skipped. Then run the cell again.")
            return False
        if not (isinstance(result, tuple) and len(result) == 2):
            print(f"The function read_spending must give back two values: the list of rows, and the number of rows that it skipped. It gives back {result!r}. Write both values in the return line, with a comma between them: return rows, skipped. Then run the cell again.")
            return False
        rows, count = result
        if not isinstance(rows, list) or isinstance(count, bool) or not isinstance(count, int):
            print("The function read_spending gives back two values, but they are not a list and then an integer. The first value must be a list of the clean rows, and the second value must be the number of rows that were skipped, in this order: return rows, skipped. Then run the cell again.")
            return False
        if any(isinstance(row, list) for row in rows):
            print("The list that read_spending gives back holds a list of fields, as csv.reader gives it. It must hold the dictionary that clean_row gives back for that row. Append the result of the call: rows.append(clean_row(fields)). Then run the cell again.")
            return False
        if not all(isinstance(row, dict) and "description" in row and "amount" in row for row in rows):
            print("The list that read_spending gives back must hold only the dictionaries that clean_row gives back. It holds another kind of value. Append the result of the call: rows.append(clean_row(fields)). Then run the cell again.")
            return False
        names = [row["description"] for row in rows]
        if names != expected:
            if len(rows) == 37:
                print(f"The function read_spending reads the file spending-raw.csv, also when it is called with the name of another file. The check called read_spending(\"{file_name}\"), and the function gave back 37 purchases. Open the file whose name is in the parameter: open(name, newline=\"\"). Then run the cell again.")
            elif names == expected[:1]:
                print(f"{about} The list that your function gives back holds only the first purchase. That happens when the return line is inside the loop, so the function stops in the first pass. The return line must start with four spaces only. Then run the cell again.")
            else:
                print(f"{about} Your function gives back a list of the purchases {names!r}, but the list must hold these purchases: {expected!r}. Only the header and the rows that cannot be read are not in the list. Check that the loop that cleans the rows starts at the second row of the file, with raw_rows[1:], and that it gives every row to clean_row. Then run the cell again.")
            return False
        if count == bad + 1:
            print(f"{about} Your function gives back {count} for the number of rows that it skipped. It counts the header as a row that was skipped, but the header is not a purchase. Loop over every row except the first one: for fields in raw_rows[1:]: Then run the cell again.")
            return False
        if count != bad:
            print(f"{about} Your function gives back {count} for the number of rows that it skipped, but it must give back {bad}. The except block must add 1 to the count: skipped = skipped + 1. Then run the cell again.")
            return False
    if "purchases" not in globals():
        print("The function read_spending is correct. The name purchases does not exist yet. After the function, at the left side of the cell, add the three lines from the task. The first one is: purchases, skipped_rows = read_spending(\"spending-raw.csv\"). Then run the cell again.")
        return False
    purchases = globals()["purchases"]
    if not isinstance(purchases, list):
        print("The function read_spending is correct. The name purchases must refer to a list of rows, but it refers to another kind of value. The function gives back two values, so the call needs two names: purchases, skipped_rows = read_spending(\"spending-raw.csv\"). Then run the cell again.")
        return False
    if len(purchases) != 37 or not all(isinstance(row, dict) and "amount" in row for row in purchases):
        print(f"The function read_spending is correct. The list purchases holds {len(purchases)} values, but the file spending-raw.csv holds 37 purchases that can be read. Make the list with your function, and do not change it: purchases, skipped_rows = read_spending(\"spending-raw.csv\"). Then run the cell again.")
        return False
    if "skipped_rows" not in globals():
        print("The list purchases is correct. The name skipped_rows does not exist yet. Give the two values that the function gives back these two names: purchases, skipped_rows = read_spending(\"spending-raw.csv\"). Then run the cell again.")
        return False
    if globals()["skipped_rows"] != 3:
        print(f"The list purchases is correct. The name skipped_rows refers to the value {globals()['skipped_rows']!r}, but the file spending-raw.csv has 3 rows that cannot be read. Give the name to the second value that your function gives back: purchases, skipped_rows = read_spending(\"spending-raw.csv\"). Then run the cell again.")
        return False
    print("Correct. The function read_spending read 37 purchases from the file spending-raw.csv, and it skipped the 3 rows that cannot be read.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The name `purchases` refers to a list of 37 dictionaries, one for each
purchase that can be read. Every dictionary has the keys `"date"`,
`"description"`, `"amount"` and `"category"`, and every value in it is
clean. Your function skipped the three rows that cannot be read, and
the program did not stop. Every other part of the program reads this
list.
