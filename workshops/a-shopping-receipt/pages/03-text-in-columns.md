---
title: Text in columns
requires: [verify:ragged-ran, verify:widths-ran, quiz:predict-width, verify:padded-ran, verify:columns-ran]
---

# Text in columns

This page teaches the one new idea of this workshop. You need it to
make the lines of the receipt form columns. You write no code on this
page.

## The problem

An **f-string** is a string with the letter `f` before its first
quote. Inside an f-string, Python replaces each name in curly brackets
with its value. The workshop **Working with text** also showed how to
give a number two decimal places: write `:.2f` after the name, as in
`{price:.2f}`.

Click the action below. It adds a cell that prints two lines with
f-strings, and runs it.

```{attempt}
:id: ragged-not-run
:check: ragged-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-ragged
:title: Add a cell that prints two lines without columns, and run it
:path: {{ notebook }}
:tags: [ragged]
:run: true
drink = "Tea"
drink_price = 2.5
snack = "Sandwich"
snack_price = 11.75
print(f"{drink} {drink_price:.2f}")
print(f"{snack} {snack_price:.2f}")
```

The output is:

```
Tea 2.50
Sandwich 11.75
```

```{verify}
:id: ragged-ran
:label: The cell printed two lines without columns
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed ragged
if globals().get("drink") == "Tea" and globals().get("snack_price") == 11.75:
    print("The cell ran. The two prices do not start at the same place.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("drink") == "Tea" and globals().get("snack_price") == 11.75
```

Each line is correct, but the two prices do not stand one under the
other. The word `Sandwich` is longer than the word `Tea`, so the
second price starts further to the right. A receipt with many lines
would be difficult to read.

## A width

The answer is to give each value a **width**: the number of characters
that the value must fill. A character is one letter, digit, space or
symbol. When the value is shorter than its width, Python adds spaces
until the width is full.

A table on paper works in the same way. Each column has a fixed width,
and a short word leaves empty space in its column.

You write the width after a colon, inside the curly brackets:

- `{fruit:12}` shows the value of `fruit` in a width of 12 characters

- `{weight:8.2f}` shows the value of `weight` in a width of 8
  characters, with two decimal places. The width comes first, and then
  the `.2f` that you already know.

The next cell prints three values, each with a width. It prints a
square bracket before and after each value, so that you can see the
spaces that Python adds.

```{attempt}
:id: widths-not-run
:check: widths-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-widths
:title: Add a cell that shows three values with a width, and run it
:path: {{ notebook }}
:tags: [widths]
:run: true
fruit = "Pear"
boxes = 4
weight = 3.5
print(f"[{fruit:12}]")
print(f"[{boxes:3}]")
print(f"[{weight:8.2f}]")
```

The output is:

```
[Pear        ]
[  4]
[    3.50]
```

## What happened

- `{fruit:12}` shows `Pear` and then 8 spaces. The word has 4
  characters, and 4 + 8 is 12. Python puts a string at the left side
  of its width, and adds the spaces after it.

- `{boxes:3}` shows 2 spaces and then `4`. Python puts a number at the
  right side of its width, and adds the spaces before it.

- `{weight:8.2f}` shows 4 spaces and then `3.50`. The number is shown
  with two decimal places, which makes 4 characters, and Python adds 4
  spaces before it.

Strings go to the left and numbers go to the right. That is what you
want in a receipt: the names start at the same place, and the decimal
points of the numbers stand one under the other.

```{verify}
:id: widths-ran
:label: The cell showed three values with a width
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed widths
if globals().get("fruit") == "Pear" and globals().get("boxes") == 4 and globals().get("weight") == 3.5:
    print("The cell ran. Python added spaces after the string and before the numbers.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("fruit") == "Pear" and globals().get("boxes") == 4 and globals().get("weight") == 3.5
```

## How long is the result?

Look at this cell. Do not run it yet. `len()` gives the number of
characters in a string.

```python
padded = f"{fruit:12}"
print(len(padded))
```

```{quiz}
:id: predict-width
:type: text
:title: Predict the output
question: "The name `fruit` refers to the string `\"Pear\"`. What does this cell show?"
answer: "12"
wrong:
  - { text: "4", explanation: "4 is the number of characters in `Pear`. The f-string gives the value a width of 12, so Python adds spaces after the word. `len()` counts the spaces too." }
  - { text: "8", explanation: "8 is the number of spaces that Python adds. `len()` counts the 4 letters and the 8 spaces together." }
  - { text: "16", explanation: "The width is the complete number of characters, with the word included. Python does not add 12 spaces to the word." }
otherwise: "The width in `{fruit:12}` is the number of characters that the value fills, with the spaces included."
explanation: "A value with a width of 12 always fills 12 characters when the value is shorter than that: here, 4 letters and 8 spaces."
```

```{attempt}
:id: padded-not-run
:check: padded-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-padded
:title: Add the cell that measures the string, and run it
:path: {{ notebook }}
:tags: [padded]
:run: true
padded = f"{fruit:12}"
print(len(padded))
```

```{verify}
:id: padded-ran
:label: The string with a width has 12 characters
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed padded
if isinstance(globals().get("padded"), str) and len(padded) == 12:
    print("The cell ran. The string has 12 characters: 4 letters and 8 spaces.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("padded"), str) and len(padded) == 12
```

## The two lines again, in columns

The last cell of this page prints the drink and the snack again. This
time each name has a width of 10, and each price has a width of 8 with
two decimal places.

```{attempt}
:id: columns-not-run
:check: columns-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-columns
:title: Add a cell that prints the two lines in columns, and run it
:path: {{ notebook }}
:tags: [columns]
:run: true
drink_line = f"{drink:10}{drink_price:8.2f}"
snack_line = f"{snack:10}{snack_price:8.2f}"
print(drink_line)
print(snack_line)
```

The output is:

```
Tea           2.50
Sandwich     11.75
```

The f-strings have no space between the two pairs of curly brackets.
The widths make all the space that the line needs. Both lines have
exactly 18 characters, because 10 + 8 is 18, and the prices now stand
one under the other.

```{verify}
:id: columns-ran
:label: The cell printed the two lines in columns
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed columns
if isinstance(globals().get("drink_line"), str) and isinstance(globals().get("snack_line"), str) and len(drink_line) == len(snack_line) == 18:
    print("The cell ran. Both lines have 18 characters, and the prices stand one under the other.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("drink_line"), str) and isinstance(globals().get("snack_line"), str) and len(drink_line) == len(snack_line) == 18
```

```{hint}
:title: What happens when the value is longer than the width?
Python never removes part of a value. A value that is longer than its
width is shown completely, and it uses more characters than the width.
The columns after it then start further to the right. Choose a width
that is large enough for the longest value.
```
