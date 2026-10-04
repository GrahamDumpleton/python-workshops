---
title: "Part 6: over the budget"
requires: [verify:ledger-over]
---

# Part 6: over the budget

The next question is about Mariam's budgets. In each month, which
categories were over their budget? A category is **over its budget**
in a month when the total of its purchases in that month is larger
than its budget.

## The file of budgets

The budgets are in a file named `budgets.json`. Click the action below
to see the file under your notebook.

```{file-open}
:id: show-budgets
:title: Show the file budgets.json under the notebook
:path: budgets.json
:area: data
```

The file is a **JSON** file. JSON is a way to write data as text. It
looks like the dictionaries and lists of Python, and it keeps numbers
as numbers. This file holds one dictionary. Each key is a category,
and its value is the budget of that category for one month. The budget
for `food` is 180 in each month.

The module `json` reads JSON files. `json.load(file)` reads an open
file, and gives back the value that the file holds. For this file, it
gives back a dictionary whose values are integers.

## The goal

Give the class `Ledger` one more method, named `over_budget`. It takes
a month and a dictionary of budgets, and it gives back a list of the
categories that are over their budget in that month. Then read the
budgets from the file, and call the method for each of Mariam's three
months.

The budgets are not an attribute of the ledger. A ledger holds
purchases, and the same ledger can be compared with any budgets. So
the method receives the budgets as an argument.

## What your code must do

- The method `over_budget` has three parameters, in this order:
  `self`, `month` and `budgets`. The value of `month` is a string,
  such as `"2026-03"`. The value of `budgets` is a dictionary, in
  which each key is a category and its value is the budget of that
  category for one month.

- The method uses only the purchases of that month. The month of a
  purchase is `purchase.month()`.

- The method adds up the total of each category in that month. It
  compares each total with the budget of the category, which is
  `budgets[category]`.

- The method gives back a list. The list holds the name of every
  category whose total in that month is larger than its budget. A
  category whose total is exactly its budget is not in the list.

- The names in the list are in alphabetical order. When no category is
  over its budget, the list is empty.

- The method gives the list back with `return`. It does not print the
  list.

- After the line that makes the ledger again, the cell reads the file
  `budgets.json` with the module `json`, and gives the name `budgets`
  to the dictionary that the file holds. The cell must have the line
  `import json` before it uses the module.

- After that, the cell has four more lines. They make a dictionary
  named `over_by_month`. Each key is a month, and its value is the
  list that your method gives back for that month. The lines also show
  each month and its list:

  ```python
  over_by_month = {}
  for month in ledger.total_by_month():
      over_by_month[month] = ledger.over_budget(month, budgets)
      print(month, over_by_month[month])
  ```

  A `for` loop over a dictionary gives its keys. Here the keys are the
  three months.

For example, think of a ledger that holds these six purchases:

| date | description | amount | category |
|------|-------------|--------|----------|
| `2025-11-03` | `Novel` | `12.50` | `books` |
| `2025-11-10` | `Dictionary` | `9.00` | `books` |
| `2025-11-12` | `Concert` | `15.00` | `music` |
| `2025-12-01` | `Songbook` | `16.00` | `music` |
| `2025-12-05` | `Spade` | `26.00` | `garden` |
| `2025-12-09` | `Flower pots` | `9.50` | `garden` |

The budgets are 20 for `books`, 15 for `music` and 30 for `garden`.

- For the month `"2025-11"`, the method must give back `['books']`.
  The total for `books` is 21.50, which is larger than 20. The total
  for `music` is 15.00, which is exactly the budget, so `music` is not
  in the list.

- For the month `"2025-12"`, the method must give back
  `['garden', 'music']`. The total for `garden` is 35.50, and the total
  for `music` is 16.00.

When your code is correct, the output under the cell is:

```
2026-01 ['clothes']
2026-02 ['food']
2026-03 ['clothes', 'transport']
```

## Where to write it

The action below adds the cell for this part. It holds the class
`Ledger` with the six methods that it has now, all complete.

```{cell-insert}
:id: insert-over
:title: Add a cell for part 6, with the class as it is now
:path: {{ notebook }}
:tags: [over]
:run: false
# Part 6: over the budget. This is the class Ledger as it is now.
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

    # Write the method over_budget below this line.
    # Start the def line with four spaces.


# The class has changed, so this line makes the ledger again.
ledger = read_ledger("spending.csv")

# Read the budgets, and write the four lines from the task, below this line.

```

Write the method on the empty lines under the comment inside the
class, and the other lines at the end of the cell. Then run the cell.
The check calls your method with purchases and budgets of its own, for
three different months.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **CSV and JSON** showed how to read a JSON file. The file
is opened with `with open("budgets.json") as file:`, and the line in
the block under it is `budgets = json.load(file)`.

The method `total_by_category`, which is in the cell, adds up one total
for each category. Your new method needs the same totals, but only for
the purchases of one month. So it has the same loop, with an `if`
inside it: `if purchase.month() == month:`. The line that adds to a
total is in the block under that `if`.

When the totals of the month are ready, a second loop compares each
total with its budget. `for category, amount in totals.items():` gives
each key of a dictionary together with its value.

`sorted()` takes a list and gives back a new list in order. For
strings with small letters, that is alphabetical order.
```

```{hint}
:title: Hint: the shape of the code
1. Under the comment inside the class, start the method, with four
   spaces before `def`: `def over_budget(self, month, budgets):`.

2. In its body, make an empty dictionary: `totals = {}`. Then write a
   loop: `for purchase in self.purchases:`.

3. Inside the loop, write an `if`: `if purchase.month() == month:`.
   The block under the `if` has one line:
   `totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount`.

4. After the loop, make an empty list: `names = []`. Then write a
   second loop: `for category, amount in totals.items():`.

5. Inside the second loop, an `if` tests whether the total is larger
   than the budget: `if amount > budgets[category]:`. The block under
   the `if` has one line: `names.append(category)`.

6. After the second loop, with eight spaces at the start of the line,
   give back the sorted list: `return sorted(names)`.

7. At the end of the cell, at the left side, write `import json`, and
   then the two lines that read the file:
   `with open("budgets.json") as file:` and, in the block under it,
   `budgets = json.load(file)`.

8. Under those lines, write the four lines from the task.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: over-not-started
:check: ledger-over
:expect: The class Ledger has no method named over_budget yet
```

````{attempt}
:id: over-no-add
:check: ledger-over
:expect: The check could not make a ledger of its own

```{cell-insert}
:path: {{ notebook }}
:run: true
class Ledger:
    def over_budget(self, month, budgets):
        return []
```
````

````{attempt}
:id: over-two-parameters
:check: ledger-over
:expect: The method over_budget does not have the right parameters

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

    def over_budget(self, month):
        return []
```
````

````{attempt}
:id: over-no-self-dot
:check: ledger-over
:expect: The method over_budget stopped because it uses a name that has no value

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
        for purchase in purchases:
            if purchase.month() == month:
                totals[purchase.category] = totals.get(purchase.category, 0) + purchase.amount
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)
```
````

````{attempt}
:id: over-wrong-key
:check: ledger-over
:expect: The method over_budget stopped with an error of the type KeyError

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
            if amount > budgets[month]:
                names.append(category)
        return sorted(names)
```
````

````{attempt}
:id: over-prints
:check: ledger-over
:expect: The method over_budget shows its result with print(), but it does not return it

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
        print(sorted(names))
```
````

````{attempt}
:id: over-sort-none
:check: ledger-over
:expect: The method over_budget gives back None

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
        return names.sort()
```
````

````{attempt}
:id: over-gives-totals
:check: ledger-over
:expect: but it must give back a list of the names of the categories

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
        return totals
```
````

````{attempt}
:id: over-not-sorted
:check: ledger-over
:expect: but they are not in alphabetical order

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
        return names
```
````

````{attempt}
:id: over-equal
:check: ledger-over
:expect: which is exactly its budget

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
            if amount >= budgets[category]:
                names.append(category)
        return sorted(names)
```
````

````{attempt}
:id: over-every-month
:check: ledger-over
:expect: Your method adds up the purchases of every month

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
        totals = self.total_by_category()
        names = []
        for category, amount in totals.items():
            if amount > budgets[category]:
                names.append(category)
        return sorted(names)
```
````

````{attempt}
:id: over-under
:check: ledger-over
:expect: Add up the total of each category for the purchases of that month only

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
            if amount < budgets[category]:
                names.append(category)
        return sorted(names)
```
````

````{attempt}
:id: over-no-budgets
:check: ledger-over
:expect: The name budgets does not exist yet

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

ledger = read_ledger("spending.csv")
```
````

````{attempt}
:id: over-budgets-text
:check: ledger-over
:expect: The name budgets refers to a string

```{cell-insert}
:path: {{ notebook }}
:run: true
with open("budgets.json") as file:
    budgets = file.read()
```
````

````{attempt}
:id: over-budgets-other
:check: ledger-over
:expect: does not refer to the dictionary of the six budgets

```{cell-insert}
:path: {{ notebook }}
:run: true
budgets = {"rent": 650, "food": 180}
```
````

````{attempt}
:id: over-no-over-by-month
:check: ledger-over
:expect: The name over_by_month does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
import json

with open("budgets.json") as file:
    budgets = json.load(file)
```
````

````{attempt}
:id: over-one-month
:check: ledger-over
:expect: but it must hold one list for each of Mariam's three months

```{cell-insert}
:path: {{ notebook }}
:run: true
over_by_month = {}
over_by_month["2026-01"] = ledger.over_budget("2026-01", budgets)
```
````

````{attempt}
:id: over-other-way
:check: ledger-over
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
import json

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
        in_month = Ledger()
        for purchase in self.purchases:
            if purchase.month() == month:
                in_month.add(purchase)
        totals = in_month.total_by_category()
        return sorted([category for category in totals if totals[category] > budgets[category]])

ledger = read_ledger("spending.csv")
file = open("budgets.json")
budgets = json.load(file)
file.close()
over_by_month = {month: ledger.over_budget(month, budgets) for month in ledger.total_by_month()}
print(over_by_month)
```
````

````{hint}
:title: Show me a solution
:unlock: "ledger-over" in failed_checks or "ledger-over" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-over-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [over-solution]
:run: true
import json

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

# The class has changed, so this line makes the ledger again.
ledger = read_ledger("spending.csv")

with open("budgets.json") as file:
    budgets = json.load(file)

over_by_month = {}
for month in ledger.total_by_month():
    over_by_month[month] = ledger.over_budget(month, budgets)
    print(month, over_by_month[month])
```
````

```{verify}
:id: ledger-over
:label: The ledger finds the categories that are over their budget in a month
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed over; cell-executed over-solution
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
    rows = [("2025-11-03", "Novel", "12.50", "books"), ("2025-11-10", "Dictionary", "9.00", "books"), ("2025-11-12", "Concert", "15.00", "music"), ("2025-12-01", "Songbook", "16.00", "music"), ("2025-12-05", "Spade", "26.00", "garden"), ("2025-12-09", "Flower pots", "9.50", "garden")]
    about = "The check made a ledger of 6 purchases of its own: in 2025-11, books 12.50, books 9.00 and music 15.00, and in 2025-12, music 16.00, garden 26.00 and garden 9.50."
    tests = [
        ("2025-11", 20, 15, 30, ["books"]),
        ("2025-12", 20, 15, 30, ["garden", "music"]),
        ("2025-10", 20, 15, 30, []),
        ("2025-11", 25, 10, 40, ["music"]),
        ("2025-12", 25, 10, 40, ["music"]),
    ]
    if not isinstance(cls, type) or not isinstance(kind, type) or fresh(rows) is None:
        print("The check could not make a ledger of its own with Ledger(), Purchase(...) and the method add. Your cell must keep the methods of the class Ledger as the action gave them, and the class Purchase of part 1 must exist. If those lines are lost, click the action that adds the cell for this part again, and write your method in the new cell. Then run the cell again.")
        return False
    for month, books, music, garden, wanted in tests:
        limits = {"books": books, "music": music, "garden": garden}
        called = f"It called over_budget(\"{month}\", budgets), where the budgets are {books} for books, {music} for music and {garden} for garden."
        method = getattr(fresh(rows), "over_budget", missing)
        if not callable(method):
            print("The class Ledger has no method named over_budget yet. Write it inside the class, under the comment, with four spaces before def: def over_budget(self, month, budgets): Check the spelling of the name. Then run the cell again.")
            return False
        try:
            inspect.signature(method).bind(month, limits)
        except (TypeError, ValueError):
            print("The method over_budget does not have the right parameters. It must have three parameters, in this order: self, month and budgets. The def line must be: def over_budget(self, month, budgets): Then run the cell again.")
            return False
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = method(month, limits)
        except NameError:
            print("The method over_budget stopped because it uses a name that has no value. Inside a method, the list of the ledger is self.purchases, and not purchases alone. Check also the spelling of each name in the body. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The method over_budget stopped with an error of the type {type(error).__name__}. {about} {called} If the type is KeyError, check that the key that the method looks for in budgets is a category, such as purchase.category. If the type is TypeError, check that the method calls purchase.month() with parentheses. Correct the method, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The method over_budget shows its result with print(), but it does not return it. The code that calls the method then receives None. Replace print() in the last line of the body with return, so that the method gives the list back: return sorted(names). Then run the cell again.")
            return False
        if result is None:
            print("The method over_budget gives back None. That happens when the body has no return line. After the second loop, add a line that starts with eight spaces and gives the list back: return sorted(names). Remember that the method sort() of a list gives back None, and that the function sorted() gives back a new list. Then run the cell again.")
            return False
        if not isinstance(result, list):
            print(f"The method over_budget gives back {result!r}, but it must give back a list of the names of the categories. Start with an empty list, append the name of each category that is over its budget, and give back the sorted list: return sorted(names). Then run the cell again.")
            return False
        if result == wanted:
            continue
        if sorted(str(name) for name in result) == wanted:
            print(f"{about} {called} The method gives back {result!r}. The categories are correct, but they are not in alphabetical order: the list must be {wanted!r}. Give back the sorted list: return sorted(names). Then run the cell again.")
        elif month == "2025-11" and music == 15 and sorted(str(name) for name in result) == ["books", "music"]:
            print(f"{about} {called} The method gives back {result!r}, but it must give back {wanted!r}. The total for music in that month is 15.00, which is exactly its budget, so music is not over its budget. Compare with > and not with >= in the line that tests the total. Then run the cell again.")
        elif sorted(str(name) for name in result) == sorted(name for name, limit, total in [("books", books, 21.5), ("music", music, 31.0), ("garden", garden, 35.5)] if total > limit):
            print(f"{about} {called} The method gives back {result!r}, but it must give back {wanted!r}. Your method adds up the purchases of every month. It must use only the purchases of the month that it receives. Inside the first loop, add to a total only when this test is true: if purchase.month() == month: Then run the cell again.")
        else:
            print(f"{about} {called} The method gives back {result!r}, but it must give back {wanted!r}. Add up the total of each category for the purchases of that month only. Then append a category to the list when its total is larger than budgets[category]. Then run the cell again.")
        return False
    if "budgets" not in globals():
        print("The method over_budget is correct. The name budgets does not exist yet. At the end of the cell, read the file with the module json: import json, then with open(\"budgets.json\") as file: and, in the block under it, budgets = json.load(file). Then run the cell again.")
        return False
    budgets = globals()["budgets"]
    if isinstance(budgets, str):
        print("The method over_budget is correct. The name budgets refers to a string, which is the text of the file. The function json.load turns that text into a dictionary: in the block under the with line, write budgets = json.load(file) and not file.read(). Then run the cell again.")
        return False
    if budgets != {"rent": 650, "food": 180, "transport": 60, "phone": 20, "clothes": 50, "hobbies": 30}:
        print("The method over_budget is correct. The name budgets does not refer to the dictionary of the six budgets that the file budgets.json holds. Read the file, and do not change the dictionary: with open(\"budgets.json\") as file: and, in the block under it, budgets = json.load(file). Then run the cell again.")
        return False
    if "over_by_month" not in globals():
        print("The method over_budget and the name budgets are correct. The name over_by_month does not exist yet. At the end of the cell, add the four lines from the task. The first one is: over_by_month = " + chr(123) + chr(125) + ". Then run the cell again.")
        return False
    if globals()["over_by_month"] != {"2026-01": ["clothes"], "2026-02": ["food"], "2026-03": ["clothes", "transport"]}:
        print(f"The method over_budget and the name budgets are correct. The name over_by_month refers to {globals()['over_by_month']!r}, but it must hold one list for each of Mariam's three months. Check the four lines from the task. The line inside the loop is: over_by_month[month] = ledger.over_budget(month, budgets). Then run the cell again.")
        return False
    print("Correct. The method over_budget finds the categories that are over their budget in one month. Mariam was over her budget for clothes in January and in March, for food in February, and for transport in March.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The ledger can answer every question. Mariam was over her budget for
clothes in January and in March, for food in February, and for
transport in March.

The method received the budgets as an argument. So the same ledger can
be compared with the budgets of next year, with no change to the
class.
