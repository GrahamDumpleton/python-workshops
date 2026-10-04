---
title: What you have learned
---

# What you have learned

Your programs can now choose what to do, and you have written a
program with three branches that was completely your own.

## The ideas

- A **comparison** asks a question about two values. Its result is a
  **boolean**: one of the two values `True` and `False`.

- The **comparison operators** are `>`, `<`, `>=`, `<=`, `==` and
  `!=`. At a limit, think about what must happen when the two values
  are equal.

- `==` compares two values. `=` is an assignment, which gives a name
  to a value. A condition needs `==`.

- Two strings are equal only when every character is the same.
  Capital letters matter.

- An `if` line ends with `:` and has a **block** under it. Python
  performs the block only when the **condition** is `True`.

- **Indentation**, the spaces at the start of a line, says which lines
  are in a block. These workshops use four spaces.

- `else:` adds a branch for every other case. `elif` adds a branch
  with a condition of its own.

- Python tests the conditions in order, from the top, and performs
  only the block of the first condition that is `True`.

- `and`, `or` and `not` make one boolean from other booleans.

## The code

| Code | What it does |
|------|--------------|
| `bag_weight <= 23` | gives `True` when the value of `bag_weight` is 23 or less, and `False` when it is more |
| `reply == "yes"` | gives `True` when the name `reply` refers to exactly the string `"yes"` |
| `reply != "yes"` | gives `True` when the name `reply` refers to any other value |
| `if basket >= 100:` | begins a block that Python performs only when the condition is `True` |
| `elif parcel_weight <= 10:` | begins a block for when no condition above was `True` and this condition is `True` |
| `else:` | begins a block for when no condition above was `True` |
| `a and b` | gives `True` when both `a` and `b` are `True` |
| `a or b` | gives `True` when at least one of `a` and `b` is `True` |
| `not a` | gives `True` when `a` is `False` |

## What comes next

Until now, each name referred to one value: one price, one weight, one
age. A real program works with many values of the same kind, such as
all the prices on a receipt. The next workshop, **Keeping a list**,
shows how one name can refer to many values.

Click `Finish` at the bottom of this panel.
