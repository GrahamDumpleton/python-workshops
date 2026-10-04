---
title: Rows of text
requires: [verify:data-shown, verify:lines-read, quiz:predict-fields, verify:fields-split]
---

# Rows of text

**CSV** is a format for a table of data. The letters mean
"comma-separated values": values that have commas between them.

A CSV file is a file of text, and it follows three rules:

- Each line of the file is one **row** of the table.

- A row is made of **fields**. A field is one value of the row. A
  comma separates each field from the next field.

- The first line is usually the **header row**. It does not hold data.
  It holds the name of each field.

CSV exists because many different programs must give data to each
other. A spreadsheet program can save a table as a CSV file. A bank
can give you your payments as a CSV file. Almost every program that
works with tables can read the format, so a Python program that reads
CSV can use data from all of them.

Think of a table on paper, such as a list of purchases in a notebook.
Each purchase has a line of its own. At the top of each column there
is a word that says what the column holds. A CSV file is the same
table, written as plain text.

## Look at the file

Mariam keeps her purchases in the file `spending.csv`. Click the
action below. It shows the file under your notebook.

```{attempt}
:id: data-not-shown
:check: data-shown
:expect: The file is not open yet
```

```{layout}
:id: show-data
:title: Show the file spending.csv under the notebook
:name: data
```

```{verify}
:id: data-shown
:label: The file spending.csv is open under the notebook
:substrate: ui
:trigger: after:show-data
:message: The file is not open yet. Click the action above to show the file under the notebook.
file-open spending.csv
```

Read the first lines of the file. The first line is the header row.
It says that each row has four fields: `date`, `description`,
`amount` and `category`. Every other line is one purchase.

## Read the lines

A program reads a file with `open()` and a `with` block. This is from
the workshop **Reading and writing files**, so here is a reminder:

- `open("spending.csv")` opens the file so that the program can read
  it.

- `with open("spending.csv") as file:` gives the open file the name
  `file`, and begins a block. When the block ends, Python closes the
  file.

- A `for` loop over the file runs its block one time for each line of
  the file. Each line is a string.

- Each line ends with the **newline character**, which marks the end
  of a line. The method `strip()` removes it.

Click the action below. It adds a cell that reads every line of the
file into a list, and runs it.

```{attempt}
:id: lines-not-run
:check: lines-read
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-lines
:title: Add a cell that reads the lines of the file, and run it
:path: {{ notebook }}
:tags: [lines]
:run: true
text_lines = []
with open("spending.csv") as file:
    for line in file:
        text_lines.append(line.strip())
print(len(text_lines))
print(text_lines[0])
print(text_lines[1])
```

The output is:

```
38
date,description,amount,category
2026-01-01,Rent for January,650.00,rent
```

```{verify}
:id: lines-read
:label: The cell read the lines of the file
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed lines
if type(globals().get("text_lines")) is list and len(text_lines) == 38:
    print("The cell ran. The list text_lines holds the 38 lines of the file.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("text_lines")) is list and len(text_lines) == 38
```

The file has 38 lines: the header row and 37 purchases. The list
`text_lines` holds each line as one string. The item at index `0` is
the header row, and the item at index `1` is the first purchase.

## From a line to its fields

One string for the whole row is not useful yet. The program needs
each field alone, so that it can add the amounts or compare the
categories.

You know a method that cuts a string into parts: `split()`. The call
`split(",")` cuts a string at each comma, and gives a list of the
parts.

Look at this cell. Do not run it yet.

```python
first_fields = text_lines[1].split(",")
print(len(first_fields))
print(first_fields[2])
```

```{quiz}
:id: predict-fields
:type: text
:title: Predict the second line of output
question: "What is the second line of output, from `print(first_fields[2])`?"
answer: "650.00"
wrong:
  - { text: "650", explanation: "The field in the file is the text `650.00`. The method `split()` gives each part as a string, exactly as it is written in the file." }
  - { text: "650.0", explanation: "The field in the file is the text `650.00`. The method `split()` gives each part as a string, exactly as it is written in the file. It does not make a number." }
  - { text: "'650.00'", explanation: "The value is the string `'650.00'`. `print()` shows a string without its quotes, so the output is `650.00`." }
  - { text: "Rent for January", explanation: "An index begins at `0`. The description is the item at index `1`. The item at index `2` is the amount." }
  - { text: "rent", explanation: "An index begins at `0`, so index `2` is the third item. The category `rent` is the fourth item, at index `3`." }
otherwise: "The line is `2026-01-01,Rent for January,650.00,rent`. Cut it at each comma, and count the parts from `0`."
explanation: "The line is cut at its three commas, which gives four strings. An index begins at `0`, so the item at index `2` is the third string, `650.00`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: fields-not-run
:check: fields-split
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-fields
:title: Add the cell that splits the first purchase, and run it
:path: {{ notebook }}
:tags: [fields]
:run: true
first_fields = text_lines[1].split(",")
print(len(first_fields))
print(first_fields[2])
```

The output is:

```
4
650.00
```

```{verify}
:id: fields-split
:label: The cell split the first purchase into four fields
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed fields
if globals().get("first_fields") == ["2026-01-01", "Rent for January", "650.00", "rent"]:
    print("The cell ran. The list first_fields holds the four fields of the first purchase.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("first_fields") == ["2026-01-01", "Rent for January", "650.00", "rent"]
```

The row has four fields, and `split(",")` gave a list of four strings.
For this row, the method did the work correctly. The next page shows
a row where it does not.
