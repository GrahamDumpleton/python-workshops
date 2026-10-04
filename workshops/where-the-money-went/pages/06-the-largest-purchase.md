---
title: "Part 4: the largest purchase"
requires: [verify:largest-purchase]
---

# Part 4: the largest purchase

The third question of the report is which purchase was the largest.
In this part, the largest purchase is the one that has the largest
amount.

## The goal

Write a function named `largest_purchase`. It takes a list of
purchases, and it gives back the purchase that has the largest amount.
It gives back the complete dictionary of that purchase, so that the
program can show its date and its description as well as its amount.

## What your code must do

- The function `largest_purchase` has one parameter, named `rows`. The
  value that it receives is a list of dictionaries, such as
  `purchases`. The list holds at least one purchase.

- The function compares the amounts of the purchases. The amount of a
  purchase is `row["amount"]`.

- The function gives back one dictionary: the purchase that has the
  largest amount. It does not give back the amount alone.

- The function gives the dictionary back with `return`. It does not
  print it.

- The function does not change the list.

- After the function, the cell has five more lines. The first two find
  the largest of all the purchases, and show it. The next line makes a
  list of the purchases that are not rent. The last two find the
  largest purchase in that list, and show it:

  ```python
  largest = largest_purchase(purchases)
  print(largest["date"], largest["description"], f"{largest['amount']:.2f}")
  not_rent = [row for row in purchases if row["category"] != "rent"]
  largest_other = largest_purchase(not_rent)
  print(largest_other["date"], largest_other["description"], f"{largest_other['amount']:.2f}")
  ```

  Inside the f-strings, the key `'amount'` is written with single
  quotes, because the f-string itself is written with double quotes.
  The third line is a **list comprehension**: it makes a new list from
  every purchase whose category is not `"rent"`.

For example, think of a list that holds these four purchases:

| date | description | amount | category |
|------|-------------|--------|----------|
| `2025-11-02` | `Tea` | `3.50` | `food` |
| `2025-12-09` | `Notebook` | `12.00` | `hobbies` |
| `2025-11-20` | `Tram ticket` | `2.10` | `transport` |
| `2025-12-05` | `Soup` | `4.25` | `food` |

For that list, the function must give back the second purchase:

```
{'date': '2025-12-09', 'description': 'Notebook', 'amount': Decimal('12.00'), 'category': 'hobbies'}
```

The check uses lists in which one purchase is larger than every other
purchase. In Mariam's data, three purchases have the same largest
amount, because she paid the same rent in each month. Your function
may give back any one of the three.

When your code is correct, the output under the cell is:

```
2026-01-01 Rent for January 650.00
2026-01-17 Winter coat 74.90
```

The first line can also show the rent for February or for March.

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-largest
:title: Add a cell for part 4
:path: {{ notebook }}
:tags: [largest]
:run: false
# Part 4: the largest purchase. Write your code below this line.

```

Write your code under the comment, and run the cell. The check calls
your function with two short lists of purchases of its own.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Doing it again** showed how to find the largest value
with a loop. A name remembers the largest value that the loop has seen
until now. In each pass, an `if` compares the new value with it, and
replaces it when the new value is larger.

Here the function must give back a purchase, and not a number. So the
name remembers a complete purchase: the dictionary. The `if` compares
the amount of the new purchase with the amount of the purchase that
the name remembers.

The first value of that name can be the first purchase of the list:
`rows[0]`.
```

```{hint}
:title: Hint: the shape of the code
1. The first line defines the function:
   `def largest_purchase(rows):`.

2. In the body, give a name its first value, which is the first
   purchase of the list: `largest_row = rows[0]`.

3. Start the loop: `for row in rows:`.

4. Inside the loop, write an `if` line that tests whether the amount of
   `row` is larger than the amount of `largest_row`:
   `if row["amount"] > largest_row["amount"]:`.

5. The block under the `if` has one line, which starts with twelve
   spaces. It makes the name remember this purchase:
   `largest_row = row`.

6. After the loop, with four spaces at the start of the line, give the
   purchase back: `return largest_row`.

7. After the function, at the left side of the cell, write the five
   lines from the task.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: largest-not-started
:check: largest-purchase
:expect: The function largest_purchase does not exist yet
```

````{attempt}
:id: largest-not-a-function
:check: largest-purchase
:expect: The name largest_purchase is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
largest_purchase = purchases[0]
```
````

````{attempt}
:id: largest-no-parameter
:check: largest-purchase
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase():
    return purchases[0]
```
````

````{attempt}
:id: largest-name-error
:check: largest-purchase
:expect: uses a name that has no value yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    for row in rows:
        if row["amount"] > biggest_row["amount"]:
            biggest_row = row
    return biggest_row
```
````

````{attempt}
:id: largest-type-error
:check: largest-purchase
:expect: stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_row = rows[0]
    for row in rows:
        if row > largest_row:
            largest_row = row
    return largest_row
```
````

````{attempt}
:id: largest-other-error
:check: largest-purchase
:expect: stopped with an error of the type IndexError

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_row = rows[len(rows)]
    for row in rows:
        if row["amount"] > largest_row["amount"]:
            largest_row = row
    return largest_row
```
````

````{attempt}
:id: largest-prints
:check: largest-purchase
:expect: shows the purchase with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_row = rows[0]
    for row in rows:
        if row["amount"] > largest_row["amount"]:
            largest_row = row
    print(largest_row)
```
````

````{attempt}
:id: largest-no-return
:check: largest-purchase
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_row = rows[0]
    for row in rows:
        if row["amount"] > largest_row["amount"]:
            largest_row = row
```
````

````{attempt}
:id: largest-amount-only
:check: largest-purchase
:expect: That is the largest amount

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_amount = 0
    for row in rows:
        if row["amount"] > largest_amount:
            largest_amount = row["amount"]
    return largest_amount
```
````

````{attempt}
:id: largest-description-only
:check: largest-purchase
:expect: must give back the complete dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_row = rows[0]
    for row in rows:
        if row["amount"] > largest_row["amount"]:
            largest_row = row
    return largest_row["description"]
```
````

````{attempt}
:id: largest-last-row
:check: largest-purchase
:expect: That is the last purchase of the list

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_row = rows[0]
    for row in rows:
        if row["amount"] > largest_row["amount"]:
            largest_amount = row["amount"]
        largest_row = row
    return largest_row
```
````

````{attempt}
:id: largest-smallest
:check: largest-purchase
:expect: That is the purchase that has the smallest amount

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_row = rows[0]
    for row in rows:
        if row["amount"] < largest_row["amount"]:
            largest_row = row
    return largest_row
```
````

````{attempt}
:id: largest-first-row
:check: largest-purchase
:expect: but it must give back the purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_row = rows[0]
    for row in rows:
        if row["amount"] > largest_row["amount"]:
            largest_row = rows[0]
    return largest_row
```
````

````{attempt}
:id: largest-no-name
:check: largest-purchase
:expect: The name largest does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    largest_row = rows[0]
    for row in rows:
        if row["amount"] > largest_row["amount"]:
            largest_row = row
    return largest_row
```
````

````{attempt}
:id: largest-wrong-name
:check: largest-purchase
:expect: The name largest must refer to the purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
largest = purchases[1]
```
````

````{attempt}
:id: largest-no-other
:check: largest-purchase
:expect: The name largest_other does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
largest = largest_purchase(purchases)
```
````

````{attempt}
:id: largest-wrong-other
:check: largest-purchase
:expect: The name largest_other must refer to the largest purchase that is not rent

```{cell-insert}
:path: {{ notebook }}
:run: true
largest_other = largest_purchase(purchases)
```
````

````{attempt}
:id: largest-other-way
:check: largest-purchase
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def largest_purchase(rows):
    best = 0
    for position in range(len(rows)):
        if rows[position]["amount"] >= rows[best]["amount"]:
            best = position
    return rows[best]

largest = largest_purchase(purchases)
print(largest["date"], largest["description"], f"{largest['amount']:.2f}")
not_rent = [row for row in purchases if row["category"] != "rent"]
largest_other = largest_purchase(not_rent)
print(largest_other["date"], largest_other["description"], f"{largest_other['amount']:.2f}")
```
````

````{hint}
:title: Show me a solution
:unlock: "largest-purchase" in failed_checks or "largest-purchase" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-largest-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [largest-solution]
:run: true
def largest_purchase(rows):
    largest_row = rows[0]
    for row in rows:
        if row["amount"] > largest_row["amount"]:
            largest_row = row
    return largest_row

largest = largest_purchase(purchases)
print(largest["date"], largest["description"], f"{largest['amount']:.2f}")
not_rent = [row for row in purchases if row["category"] != "rent"]
largest_other = largest_purchase(not_rent)
print(largest_other["date"], largest_other["description"], f"{largest_other['amount']:.2f}")
```
````

```{verify}
:id: largest-purchase
:label: The function largest_purchase gives back the purchase with the largest amount
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed largest; cell-executed largest-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    if "largest_purchase" not in globals():
        print("The function largest_purchase does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["largest_purchase"]
    if not callable(function):
        print("The name largest_purchase is not a function. It refers to another kind of value. Define the function with a line that starts with def largest_purchase(rows): and write the body under it. Then run the cell again.")
        return False
    try:
        inspect.signature(function).bind([])
    except TypeError:
        print("The function largest_purchase must have exactly one parameter, which receives the list of purchases. The def line must be: def largest_purchase(rows): Then run the cell again.")
        return False
    except ValueError:
        pass
    first = [("2025-11-02", "Tea", "3.50", "food"), ("2025-12-09", "Notebook", "12.00", "hobbies"), ("2025-11-20", "Tram ticket", "2.10", "transport"), ("2025-12-05", "Soup", "4.25", "food")]
    second = [("2025-10-08", "Paper", "5.00", "hobbies"), ("2025-10-01", "Pencils", "1.80", "hobbies"), ("2025-10-03", "Glue", "2.20", "hobbies"), ("2025-10-09", "Rice", "3.10", "food")]
    for lines, best, smallest in [(first, 1, 2), (second, 0, 1)]:
        rows = [{"date": d, "description": s, "amount": Decimal(a), "category": c} for d, s, a, c in lines]
        about = "The check called largest_purchase with a list of " + str(len(lines)) + " purchases of its own: " + "; ".join(f"{s} {a}" for d, s, a, c in lines) + "."
        wanted = f"{lines[best][1]} {lines[best][2]}"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(rows)
        except NameError:
            print("The function largest_purchase stopped because it uses a name that has no value yet. The name that the if line compares must have a first value before the loop, for example largest_row = rows[0]. Check also the spelling of each name in the body. Then run the cell again.")
            return False
        except TypeError:
            print("The function largest_purchase stopped with a TypeError. The most likely reason is that the if line compares two dictionaries, or a dictionary and a number. Python cannot say which of two dictionaries is larger. Compare the amounts: if row[\"amount\"] > largest_row[\"amount\"]: Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function largest_purchase stopped with an error of the type {type(error).__name__} when the check called it with a list of purchases. Call the function in a cell of your own, with largest_purchase(purchases), and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The function largest_purchase shows the purchase with print(), but it does not return it. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the purchase back. Then run the cell again.")
            return False
        if result is None:
            print("The function largest_purchase gives back None. That happens when the body has no return line. After the loop, add a line that starts with four spaces and gives the purchase back: return largest_row. Then run the cell again.")
            return False
        if result == rows[best]:
            continue
        if isinstance(result, (int, float, Decimal)) and not isinstance(result, bool):
            print(f"{about} Your function gives back {float(result):.2f}. That is the largest amount, or another number, but the function must give back the complete dictionary of the purchase {wanted}. Make the name remember the purchase, and not its amount: largest_row = row. Then return that name. Then run the cell again.")
            return False
        if not isinstance(result, dict) or "amount" not in result or "description" not in result:
            print(f"{about} Your function gives back {result!r}. The function must give back the complete dictionary of the purchase {wanted}, with all four keys. Return the name that remembers the purchase, and not one of its values. Then run the cell again.")
            return False
        found = f"{result['description']} {result['amount']}"
        if result == rows[-1]:
            print(f"{about} Your function gives back the purchase {found}. That is the last purchase of the list, and not the largest, which is {wanted}. That happens when the line that remembers the purchase is not inside the block of the if line, so it runs in every pass. Then run the cell again.")
            return False
        if result == rows[smallest]:
            print(f"{about} Your function gives back the purchase {found}. That is the purchase that has the smallest amount. The largest is {wanted}. The if line must test whether the new amount is larger, with the operator > and not with <. Then run the cell again.")
            return False
        print(f"{about} Your function gives back the purchase {found}, but it must give back the purchase {wanted}, which has the largest amount. Check that the if line compares row[\"amount\"] with the amount of the purchase that the name remembers, and that its block makes the name remember the new purchase: largest_row = row. Then run the cell again.")
        return False
    if "largest" not in globals():
        print("The function largest_purchase is correct. The name largest does not exist yet. After the function, at the left side of the cell, add the five lines from the task. The first one is: largest = largest_purchase(purchases). Then run the cell again.")
        return False
    found = globals()["largest"]
    try:
        right = isinstance(found, dict) and found.get("category") == "rent" and round(float(found.get("amount")), 2) == 650.00
    except (TypeError, ValueError):
        right = False
    if not right:
        print("The function largest_purchase is correct. The name largest must refer to the purchase that has the largest amount of all, which is the rent of one month. Give the name to the result of your function: largest = largest_purchase(purchases). If the list purchases has changed, run your cell of part 1 again first. Then run this cell again.")
        return False
    if "largest_other" not in globals():
        print("The name largest is correct. The name largest_other does not exist yet. Add the last three lines from the task. They make the list not_rent, find the largest purchase in it, and show it. Then run the cell again.")
        return False
    found = globals()["largest_other"]
    if not (isinstance(found, dict) and found.get("description") == "Winter coat"):
        print("The name largest is correct. The name largest_other must refer to the largest purchase that is not rent, which is the purchase Winter coat. Make the list of the purchases that are not rent, and call your function with it: not_rent = [row for row in purchases if row[\"category\"] != \"rent\"] and then largest_other = largest_purchase(not_rent). Then run the cell again.")
        return False
    print("Correct. The function largest_purchase gives back the purchase that has the largest amount. The largest purchase is the rent of one month, 650.00. The largest that is not rent is the winter coat, 74.90.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The largest purchase is the rent, 650.00 in each month. That is not a
surprise, so the program also finds the largest purchase that is not
rent: a winter coat for 74.90, on 2026-01-17.

You did not write a second function for that. You gave the same
function a different list. A function that reads its data from its
parameter can answer many questions.
