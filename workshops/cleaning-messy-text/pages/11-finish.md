---
title: What you have learned
---

# What you have learned

You took a file that people could read and a program could not, and
you made it clean. Your code turned 20 spellings of a category into
6, turned every amount into an exact number, left out the three rows
that cannot be read, and wrote a new file whose text is the same as
the text of a file that was cleaned by hand.

## The ideas

- Real data is **untidy**, because people type it. The same thing is
  written in several ways, and some rows have mistakes. A program
  that uses untidy data gives wrong answers and shows no error
  message.

- **Clean** data writes the same thing in the same way every time.
  Cleaning is a list of small steps, and each step removes one kind of
  untidiness.

- `strip()` removes the spaces around a field, and `lower()` gives a
  word one form. A string never changes, so each method gives back a
  new string.

- A dictionary of other spellings, used with `get(word, word)`,
  replaces the words that it knows and gives every other word back as
  it is.

- A float is not exact, so money is not added as floats. A `Decimal`
  is exact. Always make a `Decimal` from a string.

- A large function is built from small functions that you have tested
  one at a time.

- A row that cannot be read is skipped, and kept in a list, so that a
  person can look at it later. A test with `len()` finds a row with
  the wrong number of fields. `try` and `except` with the type of the
  exception handle a value that cannot be read.

- A program never changes the raw data. It writes the clean data to a
  new file.

## The code

| Code | What it does |
|------|--------------|
| `field.strip()` | gives the string without the spaces at its start and at its end |
| `text.strip().lower()` | removes the spaces, and then makes every letter small |
| `spellings.get(word, word)` | gives the value for the key `word`, or `word` itself when the key does not exist |
| `float("6.40")` | turns a string into a float, which is not exact |
| `from decimal import Decimal` | gets `Decimal` from the module `decimal` |
| `Decimal("6.40")` | turns a string into an exact number |
| `len(row) == 4` | is `True` when the row has four fields |
| `except InvalidOperation:` | catches the exception that `Decimal()` raises for a string that is not a number |
| `f"{amount:.2f}"` | writes a number with two digits after the point |
| `writer.writerow([...])` | writes a list as one line of a CSV file |
| `clean_text == expected_text` | is `True` when two strings have exactly the same characters |

## What comes next

You can now read a file, handle the rows that are wrong, use modules
that come with Python, and clean untidy text. The next workshop,
**Where the money went**, is the last workshop of **Working with real
data in Python**. In it, you use all of this to build one complete
program. The program reads the untidy file of spending and Mariam's
budgets, and writes a report: the total for each category, the total
for each month, the largest purchase, and the categories that went
over their budget.

Click `Finish` at the bottom of this panel.
