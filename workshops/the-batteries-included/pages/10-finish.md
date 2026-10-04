---
title: What you have learned
---

# What you have learned

Your programs can now use code that comes with Python. You have
imported modules, calculated with whole numbers, made choices by
chance, calculated with dates, counted with a `Counter`, and found a
function in the documentation.

## The ideas

- A **module** is a file of Python code that is ready for other
  programs to use. It holds functions and values that have names.

- The **standard library** is the set of modules that comes with
  Python. You do not need to install anything to use it.

- To **import** a module means to make it ready to use in your
  program. After `import math`, you write the name of the module, a
  dot, and the name that you want: `math.sqrt(49)`.

- `from math import sqrt` imports one name. After it, you write
  `sqrt(49)` with no `math` and no dot before it.

- The module `random` calculates its numbers from a **seed**. The same
  seed always gives the same results.

- A value of the type `date` knows its year, its month and its day.
  These are **attributes**: values that belong to another value,
  written after a dot and without parentheses.

- One date minus another date gives a length of time, and its
  attribute `days` is the number of days.

- A `Counter` counts how many times each value appears in a list.

- The **documentation** describes every module. The tables near the
  top of a page are the place to begin, and the examples show how to
  call each function.

## The code

| Code | What it does |
|------|--------------|
| `import math` | imports the module `math` |
| `math.sqrt(49)` | gives the square root, `7.0` |
| `from math import sqrt` | imports the name `sqrt` from the module `math` |
| `math.floor(8.33)` | gives the whole number below, `8` |
| `math.ceil(3.33)` | gives the whole number above, `4` |
| `math.pi` | the number for calculations about a circle, a little more than `3.14` |
| `random.seed(7)` | sets the seed, so that the results are the same each time |
| `random.randint(1, 6)` | gives a whole number from `1` to `6` by chance |
| `random.choice(items)` | gives one item of a list by chance |
| `random.shuffle(items)` | puts the items of the list in a new order, and returns `None` |
| `date(2026, 1, 17)` | makes a date from a year, a month and a day |
| `date.fromisoformat("2026-01-17")` | makes a date from a string in the ISO form |
| `day.year`, `day.month`, `day.day` | give the three parts of a date, as integers |
| `(end - start).days` | gives the number of days from one date to another |
| `day.strftime("%d %B %Y")` | gives a string such as `21 March 2026` |
| `Counter(items)` | counts how many times each value appears in a list |
| `counts.most_common(2)` | gives a list of the two most common values, each in a tuple with its count |
| `statistics.mean(numbers)` | gives the average of a list of numbers |

## What comes next

Mariam's purchases are in a file of text, where commas separate the
parts of each line. This form of file has a name, CSV, and the
standard library has a module that reads it. Her budgets are in a file
of another form, JSON, and the standard library has a module for that
form too.

The next workshop, **CSV and JSON**, shows both. You import the two
modules in the way that you learned here.

Click `Finish` at the bottom of this panel.
