---
title: A comma inside a field
requires: [quiz:predict-broken, verify:broken-split]
---

# A comma inside a field

In a CSV file, a comma separates two fields. Sometimes a comma is
also part of a value. A description such as `Tea, sugar and rice` has
a comma in it. A program that reads the row must not cut the
description into two fields.

The CSV format has a rule for this: a field that holds a comma is
written between double quotes. The quotes say "everything between us
is one field". The quotes are not part of the value.

An address on a letter works in a similar way. The address
`12 Garden Road, Nairobi` has a comma in it, but a person who reads
it knows that it is one address. In a CSV file, the quotes give the
program the same knowledge.

## A file with such a field

The file `spending.csv` has no field that holds a comma. Click the
action below. It writes a small file with the name `shopping.csv`,
and shows it under your notebook.

```{file-write}
:id: write-shopping
:title: Write the file shopping.csv and show it
:path: shopping.csv
:open: true
:area: data
date,description,amount,category
2026-01-14,"Tea, sugar and rice",12.50,food
2026-01-16,Notebook,3.20,hobbies
```

The file has a header row and two purchases. Look at the first
purchase. It has four fields, and its description is between double
quotes, because the description holds a comma.

## Predict the result

Look at this cell. Do not run it yet. It reads the lines of the file
in the same way as before, and then it cuts the first purchase at
each comma.

```python
shopping_lines = []
with open("shopping.csv") as file:
    for line in file:
        shopping_lines.append(line.strip())
broken_fields = shopping_lines[1].split(",")
print(len(broken_fields))
print(broken_fields)
```

```{quiz}
:id: predict-broken
:type: text
:title: Predict the first line of output
question: 'The line is `2026-01-14,"Tea, sugar and rice",12.50,food`. What is the first line of output, from `print(len(broken_fields))`?'
answer: "5"
wrong:
  - { text: "4", explanation: "The row has four fields, but `split()` does not know the rules of CSV. It cuts the string at every comma, and the comma inside the quotes is also a comma. Count the commas in the line." }
  - { text: "3", explanation: "`3` is the number of lines in the file. The question is about the number of parts when the first purchase is cut at every comma." }
otherwise: "The method `split(\",\")` cuts the string at every comma. Count the commas in the line. The number of parts is one more than the number of commas."
explanation: "The line has four commas, so `split(\",\")` gives five parts. The method does not know that the comma between the quotes is part of the description."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: broken-not-run
:check: broken-split
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-broken
:title: Add the cell that splits a row with a comma in a field, and run it
:path: {{ notebook }}
:tags: [broken]
:run: true
shopping_lines = []
with open("shopping.csv") as file:
    for line in file:
        shopping_lines.append(line.strip())
broken_fields = shopping_lines[1].split(",")
print(len(broken_fields))
print(broken_fields)
```

The output is:

```
5
['2026-01-14', '"Tea', ' sugar and rice"', '12.50', 'food']
```

```{verify}
:id: broken-split
:label: The cell split the row at every comma
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed broken
if type(globals().get("broken_fields")) is list and len(broken_fields) == 5:
    print("The cell ran. The list broken_fields holds five strings, but the row has only four fields.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("broken_fields")) is list and len(broken_fields) == 5
```

## What went wrong

The list has three mistakes in it:

- It holds five items, but the row has four fields. The description
  is cut into two items: `'"Tea'` and `' sugar and rice"'`.

- The two parts of the description still hold the double quotes,
  which are not part of the value.

- The amount is now at index `3`. In every other row it is at index
  `2`. A program that reads the amount from index `2` gets the text
  `' sugar and rice"'`, which is not a number.

The method `split()` cuts text at a character. It does not know the
rules of the CSV format. You could write code that handles the
quotes, but the format has more rules than this one, and that code
has been written already. It comes with Python, and the next page
shows how to use it.
