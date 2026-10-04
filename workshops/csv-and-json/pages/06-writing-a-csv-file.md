---
title: Writing a CSV file
requires: [verify:visitors-written, verify:clothes-file]
---

# Writing a CSV file

A program can also write a CSV file. Then another program, such as a
spreadsheet program, can read the results. The rules of the format
are the same for writing: a field that holds a comma must go between
double quotes. The module `csv` follows the rules for you again.

The function for this is `csv.writer()`. You give it a file that is
open for writing, and it gives you a **writer**. A writer has a
method with the name `writerow()`. You give `writerow()` a list, and
it writes the items of the list as one row of the file, with a comma
between the fields.

Think of the reader on the earlier pages in reverse. The reader takes
a line of text and gives you a list. The writer takes a list and
makes a line of text.

To open a file for writing, you give `open()` a second argument,
`"w"`. This is from the workshop **Reading and writing files**, so
here is a reminder: `open("visitors.csv", "w")` makes a new file with
that name. If a file with that name exists already, Python replaces
it, and what it held before is gone.

Click the action below. It adds a cell that writes a small CSV file,
and runs it.

```{attempt}
:id: visitors-not-run
:check: visitors-written
:expect: The file visitors.csv does not exist yet
```

```{cell-insert}
:id: insert-visitors
:title: Add a cell that writes a CSV file, and run it
:path: {{ notebook }}
:tags: [visitors]
:run: true
with open("visitors.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["name", "city", "age"])
    writer.writerow(["Amara", "Lagos", 31])
    writer.writerow(["Kenji", "Osaka, Japan", 27])
print("The file visitors.csv is written.")
```

The output is:

```
The file visitors.csv is written.
```

```{verify}
:id: visitors-written
:label: The cell wrote the file visitors.csv
:substrate: contents
:trigger: cell-executed visitors
:message: The file visitors.csv does not exist yet. Click the action above to add the cell and run it.
contains visitors.csv Amara,Lagos,31
```

The cell shows only one line, because the rows went into the file and
not to the screen. Click the action below to see the file under your
notebook.

```{file-open}
:id: open-visitors
:title: Show the file visitors.csv
:path: visitors.csv
:area: data
```

The file holds these three lines:

```
name,city,age
Amara,Lagos,31
Kenji,"Osaka, Japan",27
```

## What happened

| Line | What Python did |
|------|-----------------|
| `with open("visitors.csv", "w", newline="") as file:` | made the file, opened it for writing, and gave the open file the name `file` |
| `writer = csv.writer(file)` | made a writer for the open file |
| `writer.writerow(["name", "city", "age"])` | wrote the header row |
| `writer.writerow(["Amara", "Lagos", 31])` | wrote a row of data |

Look at three details:

- The header row is a row like every other row. The program writes
  it first, with the names of the fields.

- The value `"Osaka, Japan"` holds a comma, so the writer put double
  quotes around it in the file. You did not have to think about the
  rule.

- The ages `31` and `27` are integers in the program. In the file
  they are text, as everything in a CSV file is.

The call of `open()` has `newline=""` again. It matters most when a
program writes a file. Without it, on some computers, the file gets
an empty line after every row.

## Your task

Mariam wants a file that holds only her purchases of clothes.

Write a program that writes a file with the name `clothes.csv`. Use
the list `purchases` from the page before. Each item of that list is
a dictionary with the keys `"date"`, `"description"`, `"amount"` and
`"category"`.

Your program must do these things:

1. Open the file `clothes.csv` for writing, with `"w"` and
   `newline=""`, in a `with` block.

2. Inside the block, make a writer for the open file.

3. Write the header row. It has three fields: `date`, `description`
   and `amount`.

4. Write a `for` loop over the list `purchases`. For each
   purchase whose category is `clothes`, write a row with three
   fields: the date, the description and the amount of the purchase.

5. After the `with` block, show a message with
   `print("The file clothes.csv is written.")`.

When the program is correct, the file `clothes.csv` holds these four
lines:

```
date,description,amount
2026-01-17,Winter coat,74.90
2026-02-26,Socks,6.50
2026-03-09,Running shoes,59.00
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-clothes
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [clothes]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
The first three lines have the same form as the cell above that
writes `visitors.csv`:
`with open("clothes.csv", "w", newline="") as file:`, then
`writer = csv.writer(file)`, then
`writer.writerow(["date", "description", "amount"])`. The second line
and the third line begin with four spaces.
```

```{hint}
:title: Hint: the loop
The loop is inside the `with` block, so the `for` line begins with
four spaces: `for purchase in purchases:`. Under it, with eight
spaces: `if purchase["category"] == "clothes":`. Under that, with
twelve spaces, the line that writes the row. The list for
`writerow()` holds three values: `purchase["date"]`,
`purchase["description"]` and `purchase["amount"]`.
```

```{hint}
:title: Hint: I see a NameError for purchases
A `NameError` with the name `purchases` means that the cell that
reads the file has not run in this notebook. Go back to the page
**Each row as a dictionary**, and click its first action. Then run
your cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: clothes-not-started
:check: clothes-file
:expect: The file clothes.csv does not exist yet
```

````{attempt}
:id: clothes-empty
:check: clothes-file
:expect: The file clothes.csv is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
print("The file clothes.csv is written.")
```
````

````{attempt}
:id: clothes-no-header
:check: clothes-file
:expect: The header row is missing

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
    for purchase in purchases:
        if purchase["category"] == "clothes":
            writer.writerow([purchase["date"], purchase["description"], purchase["amount"]])
print("The file clothes.csv is written.")
```
````

````{attempt}
:id: clothes-wrong-header
:check: clothes-file
:expect: The first row of the file is

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["date", "description", "amount", "category"])
    for purchase in purchases:
        if purchase["category"] == "clothes":
            writer.writerow([purchase["date"], purchase["description"], purchase["amount"], purchase["category"]])
print("The file clothes.csv is written.")
```
````

````{attempt}
:id: clothes-header-only
:check: clothes-file
:expect: holds the header row and no purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["date", "description", "amount"])
    for purchase in purchases:
        if purchase["category"] == "Clothes":
            writer.writerow([purchase["date"], purchase["description"], purchase["amount"]])
print("The file clothes.csv is written.")
```
````

````{attempt}
:id: clothes-every-purchase
:check: clothes-file
:expect: holds every purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["date", "description", "amount"])
    for purchase in purchases:
        writer.writerow([purchase["date"], purchase["description"], purchase["amount"]])
print("The file clothes.csv is written.")
```
````

````{attempt}
:id: clothes-empty-lines
:check: clothes-file
:expect: has empty lines in it

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["date", "description", "amount"])
    for purchase in purchases:
        if purchase["category"] == "clothes":
            writer.writerow([purchase["date"], purchase["description"], purchase["amount"]])
            writer.writerow([])
print("The file clothes.csv is written.")
```
````

````{attempt}
:id: clothes-two-fields
:check: clothes-file
:expect: Row 2 of the file is

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["date", "description", "amount"])
    for purchase in purchases:
        if purchase["category"] == "clothes":
            writer.writerow([purchase["description"], purchase["amount"], purchase["date"]])
print("The file clothes.csv is written.")
```
````

````{attempt}
:id: clothes-too-few
:check: clothes-file
:expect: holds 2 rows under the header row

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["date", "description", "amount"])
    for purchase in purchases:
        if purchase["category"] == "clothes" and purchase["date"] < "2026-03":
            writer.writerow([purchase["date"], purchase["description"], purchase["amount"]])
print("The file clothes.csv is written.")
```
````

````{attempt}
:id: clothes-too-many
:check: clothes-file
:expect: holds 6 rows under the header row

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["date", "description", "amount"])
    for purchase in purchases:
        if purchase["category"] == "clothes":
            writer.writerow([purchase["date"], purchase["description"], purchase["amount"]])
    for purchase in purchases:
        if purchase["category"] == "clothes":
            writer.writerow([purchase["date"], purchase["description"], purchase["amount"]])
print("The file clothes.csv is written.")
```
````

````{attempt}
:id: clothes-as-numbers
:check: clothes-file
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("clothes.csv", "w", newline="") as clothes_file:
    clothes_writer = csv.writer(clothes_file)
    clothes_writer.writerow(["date", "description", "amount"])
    for item in purchases:
        if item["category"] == "clothes":
            clothes_writer.writerow([item["date"], item["description"], float(item["amount"])])
print("The file clothes.csv is written.")
```
````

````{hint}
:title: Show me a solution
:unlock: "clothes-file" in failed_checks or "clothes-file" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-clothes-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [clothes-solution]
:run: true
with open("clothes.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["date", "description", "amount"])
    for purchase in purchases:
        if purchase["category"] == "clothes":
            writer.writerow([purchase["date"], purchase["description"], purchase["amount"]])
print("The file clothes.csv is written.")
```
````

```{verify}
:id: clothes-file
:label: Your program wrote the purchases of clothes to clothes.csv
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed clothes; cell-executed clothes-solution
def _workshop_check():
    import csv
    header = ["date", "description", "amount"]
    expected = [["2026-01-17", "Winter coat", "74.90"], ["2026-02-26", "Socks", "6.50"], ["2026-03-09", "Running shoes", "59.00"]]
    try:
        with open("clothes.csv", newline="") as file:
            rows = [row for row in csv.reader(file)]
    except FileNotFoundError:
        print("The file clothes.csv does not exist yet. Write your program under the comment in the new cell. The first line opens the file for writing: with open(\"clothes.csv\", \"w\", newline=\"\") as file: Then hold Shift and press Enter to run the cell.")
        return False
    except (OSError, ValueError, csv.Error):
        print("The check cannot read the file clothes.csv as a CSV file. Write the file with a writer: writer = csv.writer(file) and then writer.writerow() with a list for each row. Then run the cell again.")
        return False
    if len(rows) == 0:
        print("The file clothes.csv is empty. The program opened the file, but it wrote no row. Inside the with block, make a writer with writer = csv.writer(file), and write the header row with writer.writerow([\"date\", \"description\", \"amount\"]). Then run the cell again.")
        return False
    if [] in rows:
        print("The file clothes.csv has empty lines in it. Check that the call of open() has newline=\"\" as its third argument, and that the program does not call writerow() with an empty list. Then run the cell again.")
        return False
    if rows[0] != header and rows[0] == expected[0]:
        print("The header row is missing. The first row of the file clothes.csv is a purchase. Before the loop, write the names of the three fields: writer.writerow([\"date\", \"description\", \"amount\"]). Then run the cell again.")
        return False
    if rows[0] != header:
        print(f"The first row of the file is {rows[0]!r} but it must be the header row with exactly three fields: writer.writerow([\"date\", \"description\", \"amount\"]). Then run the cell again.")
        return False
    data = rows[1:]
    if len(data) == 0:
        print("The file clothes.csv holds the header row and no purchase. Check the if line in the loop. The key is \"category\", and the value to compare with is \"clothes\", in small letters: if purchase[\"category\"] == \"clothes\": Then run the cell again.")
        return False
    if len(data) == 37:
        print("The file clothes.csv holds every purchase. The line that writes a row must be in the block of an if line, so that it runs only for clothes: if purchase[\"category\"] == \"clothes\": Then run the cell again.")
        return False
    for number in range(len(expected)):
        if number >= len(data):
            print(f"The file clothes.csv holds {len(data)} rows under the header row, but Mariam made 3 purchases of clothes. Check the if line in the loop: if purchase[\"category\"] == \"clothes\": Then run the cell again.")
            return False
        row = data[number]
        same = len(row) == 3 and row[0] == expected[number][0] and row[1] == expected[number][1]
        if same:
            try:
                same = float(row[2]) == float(expected[number][2])
            except ValueError:
                same = False
        if not same:
            print(f"Row {number + 2} of the file is {row!r} but it must be {expected[number]!r}. The list for writerow() must hold three values in this order: purchase[\"date\"], purchase[\"description\"], purchase[\"amount\"]. Then run the cell again.")
            return False
    if len(data) > len(expected):
        print(f"The file clothes.csv holds {len(data)} rows under the header row, but Mariam made 3 purchases of clothes. Check the if line in the loop: if purchase[\"category\"] == \"clothes\": Then run the cell again.")
        return False
    print("Correct. The file clothes.csv holds the header row and the 3 purchases of clothes.")
    return True
globals().pop("_workshop_check")()
```

Click the action below to see the file that your program wrote.

```{file-open}
:id: open-clothes
:title: Show the file clothes.csv
:path: clothes.csv
:area: data
```
