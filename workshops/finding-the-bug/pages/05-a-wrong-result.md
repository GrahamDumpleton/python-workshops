---
title: A wrong result with no error
requires: [quiz:rent-expected, quiz:rent-shown]
---

# A wrong result with no error

The program now runs to its end. Python shows no error message. This
does not mean that the program is correct. Python reports a line that
it cannot perform. It cannot report a line that it can perform and
that gives the wrong number, because Python does not know which
number you wanted.

So after a program runs, you compare what it shows with what you
know to be true. This page shows how to do that, and how to make a
problem small before you look for its cause.

## Look at the report

Your terminal shows this report:

```
Purchases: 37
Total: 2834.79

Total for each category:
  rent: 650.00
  food: 49.90
  transport: 24.50
  phone: 18.00
  hobbies: 28.00
  clothes: 59.00

Total for each month:
  2026: 2834.79

Largest purchase: 2026-01-01 Rent for January 650.00
```

If the terminal does not show it any more, run
`python -m spending spending.csv` again.

Here is one fact that you know about the data. Mariam pays her rent
one time each month. The file holds three months, and the rent is
650.00 each time.

```{quiz}
:id: rent-expected
:title: What the report must show
:type: text
question: "What is the correct total for the category `rent`? Type the number."
answer:
  - "1950.00"
  - "1950"
  - "1950.0"
wrong:
  - { pattern: "650(\\.0+)?", explanation: "650.00 is the rent of one month. The file holds three months, so the total is three times 650.00." }
otherwise: "The rent is 650.00 for each month, and the file holds three months. Multiply 650.00 by 3."
explanation: "Three times 650.00 is 1950.00. The report shows `rent: 650.00`, so the report is wrong. The other totals for a category are also too small: the six numbers do not add up to the total of 2834.79."
```

The report has a second mistake, under `Total for each month`. Leave
that one for later. When a program has several bugs, find and repair
one bug at a time.

## Make the problem small

A report on 37 purchases is hard to check by hand. A report on three
purchases is not. Before you look for the cause of a bug, try to show
the bug with as little data as you can.

This program has the option `--category`, which makes the report use
the purchases of one category only. Click in the terminal, type this
command, and press `Enter`:

```
python -m spending spending.csv --category rent
```

````{hint}
:title: Run the command for me
The action below types the command in the terminal and runs it.

```{execute}
:id: run-rent
:title: Run the program for the category rent
:wait: prompt
python -m spending spending.csv --category rent
```
````

Now the report is about three purchases only. Read its first five
lines in the terminal.

```{quiz}
:id: rent-shown
:title: Two lines that do not agree
:type: text
question: "The second line of this report is `Total: 1950.00`, which is correct. What does the line that begins with `rent:` show? Type the number."
answer:
  - "650.00"
  - "650"
  - { pattern: "rent: ?650\\.00", example: "rent: 650.00" }
wrong:
  - { pattern: "(rent: ?)?1950(\\.00)?", explanation: "1950.00 is what the line must show. Look at the terminal: the line under `Total for each category:` shows another number." }
otherwise: "Look at the line under `Total for each category:` in the terminal. Type the number after `rent:`."
explanation: "The report has only purchases of rent in it, so the two numbers must be the same. But `Total:` shows 1950.00 and `rent:` shows 650.00. The two lines do not agree, and you know that 1950.00 is the correct one."
```

## Where to look

You have learned two things without reading any code:

- The method that adds up all the purchases gives the right number.

- The code that adds up the purchases of each category gives a wrong
  number, and the wrong number is the amount of one purchase.

Which code makes the totals for each category? The traceback on the
earlier pages showed that the lines of the report are made in the
file `spending/report.py`. Lines 10 to 12 of that file are these:

```python
    lines.append("Total for each category:")
    for category, amount in ledger.total_by_category().items():
        lines.append(f"  {category}: {amount:.2f}")
```

The numbers come from the method `total_by_category` of the ledger.
That method is in `spending/models.py`. On the next page you look
inside it while it runs.
