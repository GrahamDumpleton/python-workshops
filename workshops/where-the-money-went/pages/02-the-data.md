---
title: The data
requires: [verify:clean-row-ran, quiz:predict-bad-row, verify:bad-row-ran]
---

# The data

A program that makes a report needs data. On this page you look at the
file that Mariam typed, and you add one function to your notebook. You
write no code on this page.

## The file of purchases

Mariam's purchases are in a file named `spending-raw.csv`. The file is
already in the folder of this workshop. Click the action below. It
shows the file under your notebook, so that you can see what your
program reads.

```{layout}
:id: show-data
:title: Show the file spending-raw.csv under the notebook
:name: data
```

The file is a **CSV** file. A CSV file holds rows of text. Each line of
the file is one row, and commas divide a row into **fields**. The first
row is the **header**: it holds the names of the fields. Here the
fields are `date`, `description`, `amount` and `category`. Every other
row is one purchase.

Look at the rows. The file has several problems:

- Some fields have a space before or after the text. Line 3 has
  ` Bread and milk `, with a space on each side.

- One category is written in several ways. Lines 3, 10 and 12 have
  `Food`, `food` and `FOOD`.

- Two categories have a second spelling. `groceries` means `food`, and
  `travel` means `transport`.

- The amounts are not written in one way. Line 2 has `650`, and line 7
  has `9.5`.

- Three rows cannot be read at all. In line 9 the amount is the word
  `unknown`. Line 22 has only two fields. In line 36 the amount is
  empty.

## The function that cleans one row

The workshop **Cleaning messy text** built a function that makes one
row clean. You do not write that function again here. The action below
adds a function to your notebook that does the same cleaning. It has
one difference: the function of that workshop gives back a list, and
this one gives back a dictionary, so that each value has a name.

The function is named `clean_row`. It takes the fields of one row, as a
**list** of strings: a list is a value that holds many values in
order. It gives back a **dictionary**. A dictionary holds pairs. Each
pair has a **key** and a **value**, and you use the key to find the
value. The dictionary that `clean_row` gives back has four keys:
`"date"`, `"description"`, `"amount"` and `"category"`.

Click the action below. It adds a cell that defines the function and
calls it with one row, and runs the cell.

```{attempt}
:id: clean-row-not-run
:check: clean-row-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-clean-row
:title: Add a cell that defines the function clean_row, and run it
:path: {{ notebook }}
:tags: [clean-row]
:run: true
from decimal import Decimal, InvalidOperation

other_spellings = {"groceries": "food", "travel": "transport"}

def clean_row(fields):
    date = fields[0].strip()
    description = fields[1].strip()
    amount_text = fields[2].strip()
    category = fields[3].strip().lower()
    category = other_spellings.get(category, category)
    amount = Decimal(amount_text)
    return {"date": date, "description": description, "amount": amount, "category": category}

sample_row = clean_row(["2026-01-03", " Bread and milk ", "6.40", "Food"])
print(sample_row)
```

The output is:

```
{'date': '2026-01-03', 'description': 'Bread and milk', 'amount': Decimal('6.40'), 'category': 'food'}
```

```{verify}
:id: clean-row-ran
:label: The function clean_row exists
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed clean-row
if callable(globals().get("clean_row")) and isinstance(globals().get("sample_row"), dict) and sample_row.get("category") == "food":
    print("The cell ran. The function clean_row exists, and it made one row clean.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
callable(globals().get("clean_row")) and isinstance(globals().get("sample_row"), dict) and sample_row.get("category") == "food"
```

## What the function does

Read the function line by line. Every idea in it comes from an earlier
workshop.

- `fields[0]` is the first value of the list, `fields[1]` is the
  second, and so on. A row of the file has four fields, so the function
  reads the indexes 0 to 3.

- The method `strip()` gives a copy of a string without the spaces at
  its start and its end. The function uses it on every field.

- The method `lower()` gives a copy of a string with every letter
  small. After it, `Food` and `FOOD` are both `food`.

- `other_spellings.get(category, category)` looks for the category in
  the dictionary `other_spellings`. For `groceries` it gives `food`.
  For a category that is not a key of that dictionary, it gives the
  category itself.

- The last line gives back the dictionary with `return`.

## Amounts are `Decimal` values

In this workshop, every amount is a `Decimal` value, and not a float.
A float cannot hold every decimal number exactly: `0.1 + 0.2` gives
`0.30000000000000004`. That is a problem for money. A `Decimal` value
holds a decimal number exactly, as a person writes it. The
first line of the cell takes `Decimal` from the module `decimal`,
and `Decimal(amount_text)` makes a `Decimal` value from a
string.

Python shows a `Decimal` value as `Decimal('6.40')`. You can add
`Decimal` values with `+` and compare them with `>`, in the same way
as other numbers. In an f-string, `{amount:.2f}` shows a `Decimal`
value with two decimal places, as it does for a float.

There is one rule to remember. Python does not add a `Decimal` value
and a float. `Decimal("6.40") + 0.0` gives a `TypeError`. A `Decimal`
value and an integer can be added, so a total that starts at `0` works.

`Decimal()` cannot make a number from every string. When the string
is not a number, `Decimal()` raises an exception of the type
`InvalidOperation`. An **exception** is what Python calls an error that
stops a program while it runs. The type `InvalidOperation` is in the
module `decimal` too, so the first line of the cell imports both names:
`from decimal import Decimal, InvalidOperation`.

## A row that cannot be read

What happens when `clean_row` gets line 9 of the file, where the
amount is the word `unknown`? Read this cell. Do not run it yet.

```python
try:
    clean_row(["2026-01-14", "Gift for Chidi", "unknown", "hobbies"])
    print("read")
except InvalidOperation:
    print("skipped")
```

Python tries the lines of the block under `try`. When one of those
lines raises an `InvalidOperation`, Python leaves the block at once,
and runs the block under `except InvalidOperation:`.

```{quiz}
:id: predict-bad-row
:type: text
:title: Predict the output
question: "What does this cell show?"
answer: "skipped"
wrong:
  - { text: "read", explanation: "The call of `clean_row` raises an `InvalidOperation`, because `Decimal(\"unknown\")` cannot make a number. Python leaves the `try` block at once, so the line `print(\"read\")` never runs." }
  - { text: "InvalidOperation", explanation: "The function does raise an `InvalidOperation`. But the call is inside a `try` block, and the `except` line names `InvalidOperation`, so Python runs the block under `except`. Look at what that block shows." }
  - { text: "read skipped", explanation: "Only one of the two lines with `print()` runs. When the call raises the exception, Python leaves the `try` block before it reaches `print(\"read\")`." }
otherwise: "The cell shows one of the two words that are in the lines with `print()`. Decide whether the call of `clean_row` raises an `InvalidOperation`, and type that word."
explanation: "`clean_row` calls `Decimal(\"unknown\")`, which raises an `InvalidOperation`. Python leaves the `try` block, and runs the block under `except InvalidOperation:`, which shows `skipped`."
```

```{attempt}
:id: bad-row-not-run
:check: bad-row-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-bad-row
:title: Add the cell that tries a row with a wrong amount, and run it
:path: {{ notebook }}
:tags: [bad-row]
:run: true
try:
    clean_row(["2026-01-14", "Gift for Chidi", "unknown", "hobbies"])
    print("read")
except InvalidOperation:
    print("skipped")
```

```{verify}
:id: bad-row-ran
:label: The cell that tries a row with a wrong amount has run
:substrate: contents
:trigger: cell-executed bad-row
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} bad-row
```

A row with too few fields stops in a different way. Line 22 of the
file has only two fields, so `fields[2]` does not exist, and
`clean_row` raises an `IndexError`. Your code in the next part must
handle both types of exception: `InvalidOperation` and `IndexError`.
