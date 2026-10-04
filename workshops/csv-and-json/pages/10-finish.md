---
title: What you have learned
---

# What you have learned

You can now read and write the two formats that most data files use.
You read the purchases of Mariam from a CSV file, and you calculated
with them. You read her budgets from a JSON file, changed them, and
saved them in a new file.

## The ideas

- A **format** is a set of rules that says how data is written in a
  file.

- **CSV** is a format for a table. Each line of the file is one
  **row**. A row is made of **fields**, with a comma between them.
  The first line is usually the **header row**, which holds the name
  of each field.

- A field that holds a comma is written between double quotes. The
  method `split(",")` does not know this rule, so it cuts such a row
  in the wrong places. The module `csv` knows every rule of the
  format.

- A **module** is a file of Python code that someone has already
  written. A program makes a module ready with `import`.

- A **reader** gives each row of a CSV file as a list of strings.
  `csv.DictReader()` gives each row as a dictionary, with the names
  from the header row as the keys.

- Every value from a CSV file is a string. A program turns a value
  into a number with `float()` before it calculates with it.

- A **writer** writes a list as one row of a CSV file, and puts the
  double quotes where the format needs them.

- A file for the module `csv` is opened with `newline=""`.

- **JSON** is a format that looks like Python dictionaries and lists.
  It holds data that is not a table, and it keeps a number as a
  number.

- `json.load()` reads a whole JSON file and returns Python values.
  `json.dump()` writes Python values to a file as JSON.

- A program that changes data can save it under a new name, so that
  the old data is not lost.

## The code

| Code | What it does |
|------|--------------|
| `import csv` | makes the module `csv` ready to use |
| `open("spending.csv", newline="")` | opens a CSV file for reading |
| `reader = csv.reader(file)` | makes a reader that gives each row as a list of strings |
| `reader = csv.DictReader(file)` | makes a reader that gives each row as a dictionary |
| `for row in reader:` | repeats its block one time for each row |
| `float(row["amount"])` | turns the string from the file into a number |
| `open("clothes.csv", "w", newline="")` | opens a CSV file for writing |
| `writer = csv.writer(file)` | makes a writer for the open file |
| `writer.writerow(["date", "amount"])` | writes a list as one row of the file |
| `import json` | makes the module `json` ready to use |
| `budgets = json.load(file)` | reads a JSON file and gives its data as Python values |
| `json.dump(budgets, file, indent=2)` | writes Python values to a file as JSON, in a form that a person can read |

## What comes next

The file `spending.csv` was clean. Every row had four fields, every
amount was written in the same way, and every category had one
spelling. Data that people type is usually not like that. The next
workshop, **Cleaning messy text**, gives you the same purchases as
Mariam first typed them, with extra spaces and with categories that
are spelled in several ways. It shows how a program makes such data
clean.

Click `Finish` at the bottom of this panel.
