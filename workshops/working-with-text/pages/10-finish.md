---
title: What you have learned
---

# What you have learned

Your programs can now work with text as well as with numbers, and you
have built a line of text that was completely your own.

## The ideas

- A **string** is a piece of text: a row of characters. It is written
  between quotes, and the quotes are not part of the string.

- Python treats a string and a number differently. `"42"` is text,
  and `42` is a number.

- The operator `+` joins two strings. It adds nothing between them. A
  string and a number cannot be joined with `+`.

- An **f-string** has the letter `f` before its first quote. Python
  replaces each pair of braces with the value of the name or the
  expression between them. `:.2f` after the name shows a number with
  two digits after the decimal point.

- The function `len()` gives back the number of characters of a
  string. A space is also a character.

- The **index** of a character is its position. Python counts from 0.

- A **slice** is a part of a string. It starts at the first index and
  stops before the second index.

- A **method** is a function that belongs to a value. It is written
  after the value, with a dot between them.

- A string never changes. A method gives back a new value. To keep
  the new value, give it a name.

- The method `split()` gives back a **list**: a value that holds
  several values in order.

## The code

| Code | What it does |
|------|--------------|
| `city = "Nairobi"` | makes the name `city` refer to a string |
| `given_name + " " + last_name` | joins three strings into one new string |
| `f"{guest} sits at table {table}."` | builds a string from text and values |
| `f"{bread_price:.2f}"` | shows a number with two digits after the decimal point |
| `len(planet)` | gives back the number of characters |
| `capital[0]` | gives back the first character |
| `month[0:3]` | gives back the characters at the indexes 0, 1 and 2 |
| `station.upper()` | gives back a new string in capital letters |
| `typed_name.strip()` | gives back a new string without the spaces at its ends |
| `date_text.replace("/", "-")` | gives back a new string in which every `/` is replaced by `-` |
| `shopping.split()` | gives back a list of the words |

## What comes next

In this workshop you may have seen an error message, for example
after a missing quote. Every programmer sees error messages every
day. The next workshop, **When things go wrong**, shows how to read
an error message, and how to find and correct the mistake that caused
it.

Click `Finish` at the bottom of this panel.
