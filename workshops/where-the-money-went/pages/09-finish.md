---
title: What you have learned
---

# What you have learned

You have built a complete program. Nobody gave you the code: you had a
goal for each part, and you wrote the lines yourself. Your program
reads two files, and it writes a report that answers four questions
about Mariam's spending:

- She spent the most on rent, 1950.00, and then on food, 445.60.

- She spent 917.20 in January, 942.34 in February and 975.25 in March.

- Her largest purchase was the rent, 650.00 in each month. Her largest
  purchase that was not rent was a winter coat, 74.90.

- She was over her budget for clothes in January and in March, for
  food in February, and for transport in March.

## The ideas

- Real data is untidy. A program makes each row clean before it uses
  the row, and it skips the rows that cannot be read. It does not stop
  at the first wrong row.

- `try` and `except` handle an error that comes from the data. The
  `except` line names the type of the exception, such as
  `InvalidOperation` or `IndexError`.

- A large program is made from small functions. Each function does one
  thing, and you tested each one before you wrote the next one.

- A dictionary adds up a total for each group. The same pattern gave
  the total for each category and the total for each month. Only the
  key was different.

- The pattern that finds the largest number in a list also finds the
  dictionary that has the largest value for one key.

- A function that reads its data from its parameters can be used
  again. `largest_purchase` found the largest purchase of all, and
  also the largest that was not rent. `over_budget` used
  `total_by_category` for the purchases of one month.

- Amounts of money are `Decimal` values, and not floats, so that every
  total is exact.

- A result that must last longer than the program is written to a
  file.

## The code

| Code | What it does |
|------|--------------|
| `import csv` | makes the module `csv` ready to use |
| `with open(name, newline="") as file:` | opens a file, and closes it at the end of the block |
| `for fields in csv.reader(file):` | gives each row of the file as a list of strings |
| `raw_rows[1:]` | gives every row except the first one, which is the header |
| `try:` and `except (InvalidOperation, IndexError):` | try some lines, and say what to do when they raise one of the two types of exception |
| `return rows, skipped` | gives back two values |
| `totals[key] = totals.get(key, 0) + row["amount"]` | adds an amount to the total of a key |
| `row["date"][:7]` | gives the first seven characters of the date, which are the month |
| `if row["amount"] > largest_row["amount"]:` | tests whether this purchase is larger than the largest until now |
| `budgets = json.load(file)` | reads the value that a JSON file holds |
| `with open("report.txt", "w") as file:` | opens a file for writing, and replaces what it held |
| `file.write(f"{category} {total:.2f}\n")` | writes one line to the file |

## What comes next

The set **Working with real data in Python** is now complete. You can
read data from files, handle the rows that are wrong, make untidy text
clean, use the modules that come with Python, and save your results.

In this workshop, each purchase was a dictionary with four keys.
Nothing in a dictionary says that it is a purchase, and nothing stops a
program from giving it a wrong key. The next set of workshops, **Your
own types in Python**, shows how to make a new kind of value of your
own. It begins with the workshop **Your first class**.

Click `Finish` at the bottom of this panel.
