---
title: The spending file
requires: [verify:data-shown, verify:lines-counted, verify:one-line-read]
---

# The spending file

Mariam keeps a record of what she spends. Each time she buys
something, she types one line into a file. The file has the name
`spending-raw.csv`, and it holds her spending from January to March
of 2026.

A **file** is data that has a name and that stays on the computer
when a program ends. The workshop **Reading and writing files** showed
how a program reads a file. This page repeats what you need from that
workshop. There is no new idea on this page.

## Look at the file

Click the action below. It shows the file under your notebook.

```{attempt}
:id: data-not-shown
:check: data-shown
:expect: The file is not open yet
```

```{layout}
:id: show-data
:title: Show the file spending-raw.csv under the notebook
:name: data
```

```{verify}
:id: data-shown
:label: The file spending-raw.csv is open under the notebook
:substrate: ui
:trigger: after:show-data
:message: The file is not open yet. Click the action above to show the file under the notebook.
file-open spending-raw.csv
```

The file has 41 lines. The first line is the **header**: it gives the
name of each part of the lines below it. Each of the other lines is
one **row**: the record of one purchase. A row has four parts, with a
comma between them. Each part is a **field**.

```
date,description,amount,category
2026-01-01,Rent for January,650,rent
2026-01-03, Bread and milk ,6.40,Food
```

The third field is the amount of money. It is the field that this
workshop uses.

Mariam typed these lines by hand, and the file is not tidy. Some
fields have spaces around them, and some categories have capital
letters. A later workshop, **Cleaning messy text**, repairs those
problems.

Three rows have a larger problem. Find each of them in the file. The
number of the line is at the left side of the editor.

| Line | The row | What is wrong |
|------|---------|---------------|
| 9 | `2026-01-14,Gift for Chidi,unknown,hobbies` | the amount is a word |
| 22 | `2026-02-13,Haircut` | the amount and the category are missing |
| 36 | `2026-03-16,Lunch,,food` | the amount is empty |

No program can find the amount of these three rows, because the
amount is not there. These rows are the subject of this workshop.

## Reading the lines of a file

The cell below counts the lines of the file. It uses three things
from the workshop **Reading and writing files**:

- `open("spending-raw.csv")` opens the file, so that the program can
  read it.

- The line that begins with `with` gives the name `file` to the open
  file. The lines in its block use the file. When the block ends,
  Python closes the file.

- A `for` loop over `file` runs its block one time for each line of
  the file. In each pass, the name `line` refers to one line, as a
  string.

```{attempt}
:id: lines-not-counted
:check: lines-counted
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-count-lines
:title: Add a cell that counts the lines of the file, and run it
:path: {{ notebook }}
:tags: [count-lines]
:run: true
line_count = 0
with open("spending-raw.csv") as file:
    for line in file:
        line_count = line_count + 1
print(line_count)
```

The output is:

```
41
```

```{verify}
:id: lines-counted
:label: The cell counted the lines of the file
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed count-lines
if globals().get("line_count") == 41:
    print("The cell ran. It read the file and counted 41 lines.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("line_count") == 41
```

## From a line to a number

Everything that a program reads from a file is a string. To add up
the amounts, the program needs numbers. It gets a number from a line
in three steps:

1. `.strip()` removes the spaces at the two ends of the string. It
   also removes the **newline character**, written `\n`, which marks
   the end of each line of a file.

2. `.split(",")` cuts the string at each comma, and gives a list of
   the fields.

3. `float()` makes a float from a string that holds a number. A float
   is a number that has a decimal point.

The cell below does these three steps for one line.

```{attempt}
:id: one-line-not-read
:check: one-line-read
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-one-line
:title: Add a cell that gets the amount from one line, and run it
:path: {{ notebook }}
:tags: [one-line]
:run: true
bus_line = "2026-01-05,Bus ticket,2.80,transport\n"
bus_fields = bus_line.strip().split(",")
print(bus_fields)
bus_amount = float(bus_fields[2])
print(bus_amount)
print(bus_amount + 1)
```

The output is:

```
['2026-01-05', 'Bus ticket', '2.80', 'transport']
2.8
3.8
```

```{verify}
:id: one-line-read
:label: The cell got the amount from one line
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed one-line
if globals().get("bus_amount") == 2.8:
    print("The cell ran. The name bus_amount refers to the float 2.8.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("bus_amount") == 2.8
```

## What happened

The list `bus_fields` has four items, and each item is a string. The
index of the first item is `0`, so the amount is at index `2`. The
value of `bus_fields[2]` is the string `'2.80'`.

`float("2.80")` gives the float `2.8`. The last line of the cell adds
`1` to it, which is possible only with a number.

`float()` can do its work only when the string holds a number. The
next page shows what happens when it does not.
