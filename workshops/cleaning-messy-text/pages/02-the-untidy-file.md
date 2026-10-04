---
title: The untidy file
requires: [quiz:count-spellings, verify:raw-rows-read]
---

# The untidy file

Mariam wrote down everything that she bought from January to March
2026. She typed each purchase on a line of a file, on the day that she
bought it. Some days she typed with care, and some days she typed
fast. Nobody checked what she typed.

This is how most real data is made. People type it, at different
times, and each person has habits of their own. So real data is
**untidy**: the same thing is written in several different ways, and
some lines have mistakes.

A person who reads the file does not notice most of this. A program
does. A program that adds up the money for the category `food` looks
for the string `"food"` exactly. It does not count a purchase that has
the category `"Food"` or `"groceries"`, and so its total is wrong.
The program shows no error message. It gives a wrong answer, which is
worse.

## Look at the file

The file has the name `spending-raw.csv`. The word "raw" means that
nobody has cleaned the data yet. Click the action below. It shows the
file under your notebook.

```{layout}
:id: show-data
:title: Show the file spending-raw.csv under the notebook
:name: data
```

The file is a **CSV** file: a file of text in which each line is one
**row**, and commas divide each row into **fields**. The first line is
the header. It gives the names of the four fields: `date`,
`description`, `amount` and `category`. Each line after it is one
purchase.

Read the first fifteen lines of the file slowly. The numbers at the
left side are the line numbers. You can find four kinds of
untidiness:

- **Extra spaces.** Line 3 has a space before `Bread` and a space
  after `milk`. Line 5 has a space before `18.00`.

- **Capital letters.** The category is `Food` in line 3, `Hobbies` in
  line 7 and `TRANSPORT` in line 8.

- **Other words for the same category.** Line 6 says `groceries`,
  which means `food`. Line 14 says `travel`, which means `transport`.

- **Amounts written in different ways.** Line 2 says `650`, and line
  7 says `9.5`. Other lines have two digits after the point, as in
  `6.40`.

Three lines are worse than untidy. A program cannot read them at all:

- Line 9 has the word `unknown` where the amount must be.

- Line 22 has two fields only. It has no amount and no category.

- Line 36 has nothing between the two commas where the amount must be.

```{quiz}
:id: count-spellings
:type: text
:title: Count the spellings
question: "Lines 3, 6 and 12 of the file are all purchases of food. In how many different ways is the category written in these three lines? Type a number."
answer: "3"
wrong:
  - { text: "1", explanation: "For a person, the three lines have one category. Look at the last field of each line, letter by letter. Python compares strings letter by letter, and a capital letter is different from a small letter." }
  - { text: "2", explanation: "Look again at the last field of line 3 and of line 12. One has a capital letter at the start only, and the other has capital letters only. For Python these are different strings." }
  - { text: "three", explanation: "That is correct, but type it as a number: `3`." }
otherwise: "Look at the last field of line 3, of line 6 and of line 12. Count how many different strings you see."
explanation: "Line 3 says `Food`, line 6 says `groceries` and line 12 says `FOOD`. A person reads all three as food. For Python they are three different strings, and none of them is equal to `\"food\"`."
```

## Read the file into a list

Before you can clean the rows, your program must read them. The cell
below does this for you, because reading a file is not the subject of
this workshop. It uses three ideas from earlier workshops:

- `import csv` makes the module `csv` ready to use. A **module** is a
  file of Python code that someone has already written. The module
  `csv` comes with Python, and it reads and writes CSV files. The
  workshop **The batteries included** explains `import`.

- `with open("spending-raw.csv", newline="") as file:` opens the file
  for reading, and gives it the name `file` inside the block. When the
  block ends, Python closes the file. The module `csv` asks for
  `newline=""` each time that you open a file for it. The workshop
  **Reading and writing files** explains `with` and `open()`.

- `csv.reader(file)` gives the rows of the file one by one to a `for`
  loop. Each row is a list of strings, one string for each field. The
  workshop **CSV and JSON** explains the module `csv`.

You can also divide a line into fields with `line.split(",")`. This
workshop uses the module `csv`, because it is made for CSV files: it
also removes the end of each line for you, and it reads a field that
has quotes around it correctly.

```{attempt}
:id: raw-rows-not-read
:check: raw-rows-read
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-read-raw
:title: Add a cell that reads the file into a list of rows, and run it
:path: {{ notebook }}
:tags: [read-raw]
:run: true
import csv

raw_rows = []
with open("spending-raw.csv", newline="") as file:
    for row in csv.reader(file):
        raw_rows.append(row)

print(len(raw_rows))
print(raw_rows[0])
print(raw_rows[2])
print(raw_rows[21])
```

The output is:

```
41
['date', 'description', 'amount', 'category']
['2026-01-03', ' Bread and milk ', '6.40', 'Food']
['2026-02-13', 'Haircut']
```

```{verify}
:id: raw-rows-read
:label: The rows of the file are in the list raw_rows
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed read-raw
if isinstance(globals().get("raw_rows"), list) and len(globals().get("raw_rows")) == 41:
    print("The cell ran. The list raw_rows holds the 41 rows of the file, and each row is a list of strings.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("raw_rows"), list) and len(globals().get("raw_rows")) == 41
```

## What happened

The name `raw_rows` now refers to a list of 41 rows: the header and 40
lines that Mariam typed. Each row is a list too, so `raw_rows` is a
list of lists.

- `raw_rows[0]` is the header.

- An index starts at 0, so `raw_rows[2]` is line 3 of the file. Look
  at its second field: `' Bread and milk '`. The spaces from the file
  are inside the string.

- `raw_rows[21]` is line 22 of the file. It is a list of two strings
  only, because the line has two fields only.

Every value in every row is a string, the amounts too. `'6.40'` has
quotes around it, so it is text and not a number.

On the next pages you clean one kind of untidiness at a time.
