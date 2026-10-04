---
title: "Part 7: the report"
requires: [verify:ledger-report]
---

# Part 7: the report

Your ledger knows every answer, but the answers are only in the
notebook. When the notebook is closed, they are lost. In this last
part, the ledger makes a report, and you write the report to a file,
so that Mariam can keep it and read it without Python.

## The goal

Give the class `Ledger` one last method, named `report`. It gives back
the lines of a report, as a list of strings. Then write those lines to
a file named `report.txt`.

The method does not write the file itself. It only gives the lines
back. Then the code that calls the method can decide what to do with
them: write them to a file, or show them with `print()`.

You choose how the report looks. The check looks for the facts. It
does not look for an exact form.

## A method can call another method

The class already has a method for each fact of the report. The
method `report` does not add up the totals again. It calls the other
methods of the same ledger. Inside a method, `self` is the ledger, so
`self.total()` calls the method `total` of that ledger, and
`self.over_budget(month, budgets)` calls the method `over_budget`.

## What your code must do

- The method `report` has two parameters: `self` and `budgets`. The
  value of `budgets` is a dictionary of budgets, as in part 6.

- The method gives back a list of strings with `return`. Each string
  is one line of the report. No string has the newline character `\n`
  in it. The method does not print the lines.

- One line holds the total of all the purchases, with two decimal
  places, for example `Total 2834.79`.

- For each category, one line holds the name of the category and its
  total with two decimal places, for example `food 445.60`.

- For each month, one line holds the month and its total with two
  decimal places, for example `2026-01 917.20`.

- One line holds the description of the largest purchase and its
  amount with two decimal places, for example
  `2026-01-01 Rent for January 650.00`.

- For each month, one line holds the month and the names of the
  categories that were over their budget in that month, and no other
  category. An example is `2026-03 ['clothes', 'transport']`.

- The list can also have headings and empty strings, and each line can
  have more words. You decide.

- After the line that makes the ledger again, the cell has five more
  lines. They call the method, and write each line to the file
  `report.txt`. The method `write()` does not end the line, so the
  code adds the newline character `\n` to each line. The last line
  shows a short message, so that you can see that the cell has run:

  ```python
  report_lines = ledger.report(budgets)
  with open("report.txt", "w") as file:
      for line in report_lines:
          file.write(line + "\n")
  print("The report is in the file report.txt.")
  ```

  The name `budgets` refers to the dictionary that you read from the
  file `budgets.json` in part 6.

For example, the file can look like this:

```
Spending report

Total 2834.79

Total for each category
rent 1950.00
food 445.60
transport 181.30
phone 54.00
hobbies 63.49
clothes 140.40

Total for each month
2026-01 917.20
2026-02 942.34
2026-03 975.25

Largest purchase
2026-01-01 Rent for January 650.00

Over the budget
2026-01 ['clothes']
2026-02 ['food']
2026-03 ['clothes', 'transport']
```

## Where to write it

The action below adds the cell for this part. It holds the class
`Ledger` with the seven methods that it has now, all complete.

```{cell-insert}
:id: insert-report
:title: Add a cell for part 7, with the class as it is now
:path: {{ notebook }}
:tags: [report]
:run: false
# Part 7: the report. This is the class Ledger as it is now.
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    # Write the method report below this line.
    # Start the def line with four spaces.


# The class has changed, so this line makes the ledger again.
ledger = read_ledger("spending.csv")

# Write the five lines from the task below this line.

```

Write the method on the empty lines under the comment inside the
class, and the five lines from the task at the end of the cell. Then
run the cell. The check calls your method for ledgers of its own, and
then it reads the file `report.txt`.

## If you need help

```{hint}
:title: Hint: what to look at
The method builds a list. It starts with an empty list, `lines = []`,
and it appends one string for each line of the report:
`lines.append("Spending report")`.

An f-string builds a string from values. `f"Total {self.total():.2f}"`
holds the word `Total`, a space, and the total with two decimal
places.

To make one line for each category, loop over the dictionary that the
method `total_by_category` gives back:
`for category, amount in self.total_by_category().items():`. The line
with `lines.append()` is inside the loop.

The method `largest` gives back a `Purchase` object. Give the object a
name, and read its attributes: `biggest = self.largest()`, and then
`biggest.description` and `biggest.amount`.
```

```{hint}
:title: Hint: the shape of the code
1. Under the comment inside the class, start the method, with four
   spaces before `def`: `def report(self, budgets):`.

2. In its body, start the list: `lines = []`.

3. Append the total: `lines.append(f"Total {self.total():.2f}")`.

4. Write a loop:
   `for category, amount in self.total_by_category().items():`. Its
   block has one line: `lines.append(f"{category} {amount:.2f}")`.

5. Do the same for the months, with a loop over
   `self.total_by_month().items()`, which appends the month and its
   total.

6. Get the largest purchase: `biggest = self.largest()`. Then append
   one line for it:
   `lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")`.

7. Write a last loop: `for month in self.total_by_month():`. Its block
   has one line:
   `lines.append(f"{month} {self.over_budget(month, budgets)}")`.

8. After the last loop, with eight spaces at the start of the line,
   give the list back: `return lines`.

9. At the end of the cell, at the left side, write the five lines from
   the task.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first. It names the type of
the error.

A `NameError` that names `budgets` means that the cell of part 6 has
not run. Return to the page **Part 6: over the budget**, and run your
cell there again, or use the solution of that page.

A `NameError` that names `total` or another method means that the
method is called without `self`. Inside a method, write
`self.total()`.

A `TypeError` that names `write()` means that a value of the list is
not a string. Build every line with an f-string or with quotes.
```

## Look at the report

After you have run your cell, click the action below. It shows the
file `report.txt` under your notebook. The view does not change when
your cell writes the file again, so click the action again each time
that you have run the cell.

```{attempt}
:id: report-not-started
:check: ledger-report
:expect: The class Ledger has no method named report yet
```

````{attempt}
:id: report-no-add
:check: ledger-report
:expect: The check could not make a ledger of its own

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def report(self, budgets):
        return []
```
````

````{attempt}
:id: report-no-budgets-parameter
:check: ledger-report
:expect: The method report does not have the right parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return lines
```
````

````{attempt}
:id: report-no-self-dot
:check: ledger-report
:expect: The method report stopped because it uses a name that has no value

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return lines
```
````

````{attempt}
:id: report-wrong-attribute
:check: ledger-report
:expect: The method report stopped with an error of the type AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.name} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return lines
```
````

````{attempt}
:id: report-prints
:check: ledger-report
:expect: The method report shows the lines with print(), but it does not return them

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        print(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            print(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            print(f"{month} {amount:.2f}")
        biggest = self.largest()
        print(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            print(f"{month} {self.over_budget(month, budgets)}")
```
````

````{attempt}
:id: report-none
:check: ledger-report
:expect: The method report gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
```
````

````{attempt}
:id: report-one-string
:check: ledger-report
:expect: The method report gives back one string

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return "\n".join(lines)
```
````

````{attempt}
:id: report-empty-list
:check: ledger-report
:expect: but it must give back a list of strings

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        return lines
```
````

````{attempt}
:id: report-not-strings
:check: ledger-report
:expect: which is not a string

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(self.total())
        return lines
```
````

````{attempt}
:id: report-no-total
:check: ledger-report
:expect: has no line that holds the total of all the purchases, 88.00

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return lines
```
````

````{attempt}
:id: report-no-decimals
:check: ledger-report
:expect: has no line that holds the category books together with its total 21.50

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.1f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return lines
```
````

````{attempt}
:id: report-no-months
:check: ledger-report
:expect: has no line that holds the month 2025-11 together with its total 36.50

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return lines
```
````

````{attempt}
:id: report-no-largest
:check: ledger-report
:expect: has no line that holds the description of the largest purchase, Spade, together with its amount 26.00

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return lines
```
````

````{attempt}
:id: report-no-over
:check: ledger-report
:expect: together with the categories that were over their budget in that month

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        return lines
```
````

````{attempt}
:id: report-global-budgets
:check: ledger-report
:expect: together with the categories that were over their budget in that month

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {["books"]}")
        return lines
```
````

````{attempt}
:id: report-no-file
:check: ledger-report
:expect: The file report.txt does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = []
        lines.append(f"Total {self.total():.2f}")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return lines

ledger = read_ledger("spending.csv")
```
````

````{attempt}
:id: report-empty-file
:check: ledger-report
:expect: The file report.txt is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
report_lines = ledger.report(budgets)
with open("report.txt", "w") as file:
    for line in report_lines:
        pass
```
````

````{attempt}
:id: report-one-line
:check: ledger-report
:expect: is on one line

```{cell-insert}
:path: {{ notebook }}
:run: true
report_lines = ledger.report(budgets)
with open("report.txt", "w") as file:
    for line in report_lines:
        file.write(line + " ")
```
````

````{attempt}
:id: report-other-ledger
:check: ledger-report
:expect: The file report.txt has no line that holds the total of all the purchases, 2834.79

```{cell-insert}
:path: {{ notebook }}
:run: true
small_report = Ledger()
small_report.add(Purchase("2026-01-03", "Bread and milk", Decimal("6.40"), "food"))
report_lines = small_report.report(budgets)
with open("report.txt", "w") as file:
    for line in report_lines:
        file.write(line + "\n")
```
````

````{attempt}
:id: report-other-way
:check: ledger-report
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        biggest = self.largest()
        lines = ["Total: " + f"{self.total():.2f}"]
        by_category = self.total_by_category()
        for category in by_category:
            lines.append(f"Category {category}: {by_category[category]:.2f}")
        by_month = self.total_by_month()
        for month in by_month:
            over = ", ".join(self.over_budget(month, budgets))
            lines.append(f"Month {month}: {by_month[month]:.2f} (over the budget: {over})")
        lines.append(f"Largest purchase: {biggest.description}, {biggest.amount:.2f}")
        return lines

ledger = read_ledger("spending.csv")
with open("report.txt", "w") as file:
    file.write("\n".join(ledger.report(budgets)))
print("The report is in the file report.txt.")
```
````

````{hint}
:title: Show me a solution
:unlock: "ledger-report" in failed_checks or "ledger-report" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.
Then click the action below the check, to see the report that the
solution wrote.

```{cell-insert}
:id: insert-report-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [report-solution]
:run: true
class Ledger:
    def __init__(self):
        self.purchases = []

    def add(self, purchase):
        self.purchases.append(purchase)

    def total(self):
        result = 0
        for purchase in self.purchases:
            result = result + purchase.amount
        return result

    def total_by_category(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        return totals

    def total_by_month(self):
        totals = {}
        for purchase in self.purchases:
            totals[purchase.month()] = totals.get(purchase.month(), 0) + purchase.amount
        return totals

    def largest(self):
        result = self.purchases[0]
        for purchase in self.purchases:
            if purchase.amount > result.amount:
                result = purchase
        return result

    def over_budget(self, month, budgets):
        totals = {}
        for purchase in self.purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)

    def report(self, budgets):
        lines = ["Spending report", ""]
        lines.append(f"Total {self.total():.2f}")
        lines.append("")
        lines.append("Total for each category")
        for category, amount in self.total_by_category().items():
            lines.append(f"{category} {amount:.2f}")
        lines.append("")
        lines.append("Total for each month")
        for month, amount in self.total_by_month().items():
            lines.append(f"{month} {amount:.2f}")
        lines.append("")
        lines.append("Largest purchase")
        biggest = self.largest()
        lines.append(f"{biggest.date} {biggest.description} {biggest.amount:.2f}")
        lines.append("")
        lines.append("Over the budget")
        for month in self.total_by_month():
            lines.append(f"{month} {self.over_budget(month, budgets)}")
        return lines

# The class has changed, so this line makes the ledger again.
ledger = read_ledger("spending.csv")

report_lines = ledger.report(budgets)
with open("report.txt", "w") as file:
    for line in report_lines:
        file.write(line + "\n")
print("The report is in the file report.txt.")
```
````

```{verify}
:id: ledger-report
:label: The ledger makes a report, and the file report.txt holds it
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed report; cell-executed report-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    missing = object()
    cls = globals().get("Ledger")
    kind = globals().get("Purchase")
    def fresh(rows):
        try:
            with contextlib.redirect_stdout(io.StringIO()):
                made = cls()
                for row in rows:
                    made.add(kind(row[0], row[1], Decimal(row[2]), row[3]))
                return made if len(made.purchases) == len(rows) else None
        except Exception:
            return None
    def lacking(lines, total, categories, months, largest, over):
        if not any(total in line for line in lines):
            return f"the total of all the purchases, {total}"
        for name, amount in categories:
            if not any(name in line and amount in line for line in lines):
                return f"the category {name} together with its total {amount}"
        for month, amount in months:
            if not any(month in line and amount in line for line in lines):
                return f"the month {month} together with its total {amount}"
        if not any(largest[0] in line and largest[1] in line for line in lines):
            return f"the description of the largest purchase, {largest[0]}, together with its amount {largest[1]}"
        for month, names in over:
            found = [[name for name, amount in categories if name in line] for line in lines if month in line]
            if not any(sorted(group) == names for group in found):
                return f"the month {month} together with the categories that were over their budget in that month, and no other category (for {month} that is: {', '.join(names)})"
        return None
    tests = [
        ([("2025-11-03", "Novel", "12.50", "books"), ("2025-11-10", "Dictionary", "9.00", "books"), ("2025-11-12", "Concert", "15.00", "music"), ("2025-12-01", "Songbook", "16.00", "music"), ("2025-12-05", "Spade", "26.00", "garden"), ("2025-12-09", "Flower pots", "9.50", "garden")], {"books": 20, "music": 15, "garden": 30},
         "The check made a ledger of 6 purchases of its own (2025-11-03 Novel 12.50 books, 2025-11-10 Dictionary 9.00 books, 2025-11-12 Concert 15.00 music, 2025-12-01 Songbook 16.00 music, 2025-12-05 Spade 26.00 garden, 2025-12-09 Flower pots 9.50 garden), and it called report(budgets) with the budgets 20 for books, 15 for music and 30 for garden.",
         "88.00", [("books", "21.50"), ("music", "31.00"), ("garden", "35.50")], [("2025-11", "36.50"), ("2025-12", "51.50")], ("Spade", "26.00"), [("2025-11", ["books"]), ("2025-12", ["garden", "music"])]),
        ([("2025-10-03", "Poster", "4.00", "music"), ("2025-10-12", "Concert", "15.00", "music"), ("2025-10-20", "Novel", "12.50", "books")], {"books": 10, "music": 25},
         "The check made a ledger of 3 purchases of its own (2025-10-03 Poster 4.00 music, 2025-10-12 Concert 15.00 music, 2025-10-20 Novel 12.50 books), and it called report(budgets) with the budgets 10 for books and 25 for music.",
         "31.50", [("music", "19.00"), ("books", "12.50")], [("2025-10", "31.50")], ("Concert", "15.00"), [("2025-10", ["books"])]),
    ]
    if not isinstance(cls, type) or not isinstance(kind, type) or fresh(tests[0][0]) is None:
        print("The check could not make a ledger of its own with Ledger(), Purchase(...) and the method add. Your cell must keep the methods of the class Ledger as the action gave them, and the class Purchase of part 1 must exist. If those lines are lost, click the action that adds the cell for this part again, and write your method in the new cell. Then run the cell again.")
        return False
    for rows, limits, about, total, categories, months, largest, over in tests:
        method = getattr(fresh(rows), "report", missing)
        if not callable(method):
            print("The class Ledger has no method named report yet. Write it inside the class, under the comment, with four spaces before def: def report(self, budgets): Check the spelling of the name. Then run the cell again.")
            return False
        try:
            inspect.signature(method).bind(dict(limits))
        except (TypeError, ValueError):
            print("The method report does not have the right parameters. It must have two parameters: self, and then budgets. The def line must be: def report(self, budgets): Then run the cell again.")
            return False
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = method(dict(limits))
        except NameError:
            print("The method report stopped because it uses a name that has no value. Inside a method, another method of the same ledger is called with self and a dot, such as self.total() and self.largest(). Check also the spelling of each name in the body. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The method report stopped with an error of the type {type(error).__name__}. {about} If the type is KeyError, check that the method gives its parameter budgets to self.over_budget(month, budgets). If the type is AttributeError, check the names of the attributes and of the methods. Correct the method, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The method report shows the lines with print(), but it does not return them. The code that calls the method then receives None, and it has nothing to write to the file. Append each line to a list, and give the list back at the end of the body: return lines. Then run the cell again.")
            return False
        if result is None:
            print("The method report gives back None. That happens when the body has no return line. After the last loop, add a line that starts with eight spaces and gives the list back: return lines. Then run the cell again.")
            return False
        if isinstance(result, str):
            print("The method report gives back one string. It must give back a list of strings, one string for each line of the report. Start with lines = [] and add each line with lines.append(...). Then give the list back: return lines. Then run the cell again.")
            return False
        if not isinstance(result, list) or len(result) == 0:
            print(f"The method report gives back {result!r}, but it must give back a list of strings, one string for each line of the report. Start with lines = [] and add each line with lines.append(...). Then give the list back: return lines. Then run the cell again.")
            return False
        for item in result:
            if not isinstance(item, str):
                print(f"The list that the method report gives back holds the value {item!r}, which is not a string. Every value of the list must be a string, because write() takes only strings. " + "Build each line with an f-string, for example: lines.append(f\"{category} {amount:.2f}\"). Then run the cell again.")
                return False
        what = lacking(result, total, categories, months, largest, over)
        if what is not None:
            if "over their budget" in what:
                print(f"{about} The list that your method gives back has no line that holds {what}. Append one string for each month, which holds the month and the list that self.over_budget(month, budgets) gives back. Give that method the parameter budgets of your method. Then run the cell again.")
            else:
                print(f"{about} The list that your method gives back has no line that holds {what}. Append one string for that fact to the list. " + "Write each amount with two decimal places, which in an f-string is {amount:.2f}. Then run the cell again.")
            return False
    try:
        with open("report.txt") as file:
            content = file.read()
    except FileNotFoundError:
        print("The method report is correct. The file report.txt does not exist yet. At the end of the cell, at the left side, add the five lines from the task. They call the method and write each line to the file. Then run the cell again.")
        return False
    except Exception as error:
        print(f"The method report is correct. The check could not read the file report.txt. Python stopped with an error of the type {type(error).__name__}. Write the file again with the five lines from the task. Then run the cell again.")
        return False
    lines = [line.strip() for line in content.splitlines() if line.strip()]
    if len(lines) == 0:
        print("The method report is correct. The file report.txt is empty. Check that the line with file.write() is inside the for loop, and that the for loop is inside the with block. Then run the cell again.")
        return False
    if len(lines) == 1:
        print("The method report is correct. All the text of the file report.txt is on one line. The method write() does not end the line. Add the newline character to each line when you write it: file.write(line + \"\\n\"). Then run the cell again.")
        return False
    what = lacking(lines, "2834.79", [("rent", "1950.00"), ("food", "445.60"), ("transport", "181.30"), ("phone", "54.00"), ("hobbies", "63.49"), ("clothes", "140.40")], [("2026-01", "917.20"), ("2026-02", "942.34"), ("2026-03", "975.25")], ("Rent for", "650.00"), [("2026-01", ["clothes"]), ("2026-02", ["food"]), ("2026-03", ["clothes", "transport"])])
    if what is not None:
        print(f"The method report is correct. The file report.txt has no line that holds {what}. Make the lines from Mariam's ledger and her budgets, and write every line to the file: report_lines = ledger.report(budgets), and then the four other lines from the task. Then run the cell again.")
        return False
    print("Correct. The method report gives back the lines of the report, and the file report.txt holds the total, the total for each category and for each month, the largest purchase, and the categories that were over their budget in each month.")
    return True
globals().pop("_workshop_check")()
```

```{file-open}
:id: show-report
:title: Show the file report.txt under the notebook
:path: report.txt
:area: data
```

## What you have now

Your program is complete. It has two classes of your own and one
function. It reads a file of purchases and a file of budgets, and it
writes a report that answers every question. When Mariam adds the
purchases of April to her file, she runs the same cells again, and the
report is new.
