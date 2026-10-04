---
title: "Part 2: the total for each category"
requires: [verify:category-totals]
---

# Part 2: the total for each category

You have a list of 37 clean purchases. In this part you answer the
first question of the report: how much did Mariam spend in each
category?

## The goal

Write a function named `total_by_category`. It takes a list of
purchases, and it gives back a dictionary. Each key of the dictionary
is a category, and its value is the sum of the amounts of all the
purchases in that category.

A dictionary is the right kind of value for this work, because the
program must find the total that belongs to a category, and a
dictionary finds a value by its key.

## What your code must do

- The function `total_by_category` has one parameter, named `rows`.
  The value that it receives is a list of dictionaries, such as
  `purchases`. Each dictionary is one purchase.

- The function reads two values from each purchase:
  `row["category"]`, which is a string, and `row["amount"]`, which is a
  `Decimal` value.

- The function makes a dictionary. Every category that is in the list
  is a key of the dictionary, one time only.

- The value for each key is the total of that category: the amounts of
  all its purchases, added together.

- The function gives the dictionary back with `return`. It does not
  print the dictionary.

- The function reads its data from the parameter `rows`, and not from
  the name `purchases`, so that it works for every list of purchases.

- After the function, the cell has three more lines. They call your
  function with Mariam's purchases, and show each category and its
  total with two decimal places:

  ```python
  category_totals = total_by_category(purchases)
  for category, total in category_totals.items():
      print(f"{category} {total:.2f}")
  ```

For example, think of a list that holds these four purchases:

| date | description | amount | category |
|------|-------------|--------|----------|
| `2025-11-02` | `Tea` | `3.50` | `food` |
| `2025-11-20` | `Tram ticket` | `2.10` | `transport` |
| `2025-12-05` | `Soup` | `4.25` | `food` |
| `2025-12-09` | `Notebook` | `12.00` | `hobbies` |

For that list, the function must give back this dictionary:

```
{'food': Decimal('7.75'), 'transport': Decimal('2.10'), 'hobbies': Decimal('12.00')}
```

When your code is correct, the output under the cell is:

```
rent 1950.00
food 445.60
transport 181.30
phone 54.00
hobbies 63.49
clothes 140.40
```

## Where to write it

The action below adds a new cell for this part.

```{cell-insert}
:id: insert-category
:title: Add a cell for part 2
:path: {{ notebook }}
:tags: [category]
:run: false
# Part 2: the total for each category. Write your code below this line.

```

Write your code under the comment, and run the cell. The check calls
your function with two short lists of purchases of its own.

## If you need help

```{hint}
:title: Hint: what to look at
The workshop **Looking things up** showed how to count with a
dictionary: `counts[word] = counts.get(word, 0) + 1`. That line adds 1
to the count of a word.

A total for each category works in the same way. The only difference
is the value that the line adds. A count adds 1 in each pass of the
loop. A total adds the amount of the purchase.

An empty dictionary is written `{}`.

`totals.get(category, 0)` gives the value for the key `category`. When
the dictionary does not have that key yet, it gives 0. That is the
total of the category until now.

Write the start value as `0`, and not as `0.0`. The amounts are
`Decimal` values, and Python does not add a `Decimal` value and a
float.
```

```{hint}
:title: Hint: the shape of the code
1. The first line defines the function:
   `def total_by_category(rows):`.

2. In the body, make an empty dictionary: `totals = {}`.

3. Start a loop over the list: `for row in rows:`. This line is in the
   body of the function, so it starts with four spaces.

4. Inside the loop, give a name to the category of this purchase:
   `category = row["category"]`.

5. The next line of the loop gives the key `category` a new value: the
   total until now, plus the amount of this purchase. The total until
   now is `totals.get(category, 0)`, and the amount is
   `row["amount"]`.

6. After the loop, with four spaces at the start of the line, give the
   dictionary back: `return totals`.

7. After the function, at the left side of the cell, write the three
   lines from the task.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: category-not-started
:check: category-totals
:expect: The function total_by_category does not exist yet
```

````{attempt}
:id: category-not-a-function
:check: category-totals
:expect: The name total_by_category is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
total_by_category = {}
```
````

````{attempt}
:id: category-no-parameter
:check: category-totals
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category():
    return {}
```
````

````{attempt}
:id: category-key-error
:check: category-totals
:expect: stopped with a KeyError

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = totals[category] + row["amount"]
    return totals
```
````

````{attempt}
:id: category-float-start
:check: category-totals
:expect: stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = totals.get(category, 0.0) + row["amount"]
    return totals
```
````

````{attempt}
:id: category-other-error
:check: category-totals
:expect: stopped with an error of the type NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    for row in rows:
        category = row["category"]
        sums[category] = sums.get(category, 0) + row["amount"]
    return sums
```
````

````{attempt}
:id: category-prints
:check: category-totals
:expect: shows the dictionary with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = totals.get(category, 0) + row["amount"]
    print(totals)
```
````

````{attempt}
:id: category-no-return
:check: category-totals
:expect: gives back None

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = totals.get(category, 0) + row["amount"]
```
````

````{attempt}
:id: category-one-number
:check: category-totals
:expect: must give back a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    total = 0
    for row in rows:
        total = total + row["amount"]
    return total
```
````

````{attempt}
:id: category-counts
:check: category-totals
:expect: is the number of purchases in the category

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = totals.get(category, 0) + 1
    return totals
```
````

````{attempt}
:id: category-last-amount
:check: category-totals
:expect: is the amount of the last purchase in the category

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = row["amount"]
    return totals
```
````

````{attempt}
:id: category-wrong-keys
:check: category-totals
:expect: The keys of the dictionary must be the categories

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["description"]
        totals[category] = totals.get(category, 0) + row["amount"]
    return totals
```
````

````{attempt}
:id: category-return-in-loop
:check: category-totals
:expect: holds only the first purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = totals.get(category, 0) + row["amount"]
        return totals
```
````

````{attempt}
:id: category-wrong-totals
:check: category-totals
:expect: but it must hold

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = totals.get(category, 1) + row["amount"]
    return totals
```
````

````{attempt}
:id: category-no-name
:check: category-totals
:expect: The name category_totals does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = totals.get(category, 0) + row["amount"]
    return totals
```
````

````{attempt}
:id: category-not-a-dictionary
:check: category-totals
:expect: The name category_totals must refer to a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
category_totals = len(purchases)
```
````

````{attempt}
:id: category-some-purchases
:check: category-totals
:expect: does not hold the totals of the 37 purchases

```{cell-insert}
:path: {{ notebook }}
:run: true
category_totals = total_by_category(purchases[:5])
```
````

````{attempt}
:id: category-other-way
:check: category-totals
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_by_category(rows):
    sums = {}
    for row in rows:
        if row["category"] in sums:
            sums[row["category"]] = sums[row["category"]] + row["amount"]
        else:
            sums[row["category"]] = row["amount"]
    return sums

category_totals = total_by_category(purchases)
for category, total in category_totals.items():
    print(f"{category} {total:.2f}")
```
````

````{hint}
:title: Show me a solution
:unlock: "category-totals" in failed_checks or "category-totals" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-category-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [category-solution]
:run: true
def total_by_category(rows):
    totals = {}
    for row in rows:
        category = row["category"]
        totals[category] = totals.get(category, 0) + row["amount"]
    return totals

category_totals = total_by_category(purchases)
for category, total in category_totals.items():
    print(f"{category} {total:.2f}")
```
````

```{verify}
:id: category-totals
:label: The function total_by_category gives back the total for each category
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed category; cell-executed category-solution
def _workshop_check():
    import contextlib, inspect, io
    from decimal import Decimal
    if "total_by_category" not in globals():
        print("The function total_by_category does not exist yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["total_by_category"]
    if not callable(function):
        print("The name total_by_category is not a function. It refers to another kind of value. Define the function with a line that starts with def total_by_category(rows): and write the body under it. Then run the cell again.")
        return False
    try:
        inspect.signature(function).bind([])
    except TypeError:
        print("The function total_by_category must have exactly one parameter, which receives the list of purchases. The def line must be: def total_by_category(rows): Then run the cell again.")
        return False
    except ValueError:
        pass
    def same(found, wanted):
        try:
            return set(found) == set(wanted) and all(round(float(found[key]), 2) == wanted[key] for key in wanted)
        except (TypeError, ValueError):
            return False
    def show(value):
        if not isinstance(value, dict):
            return repr(value)
        if len(value) == 0:
            return "nothing, because it is empty"
        try:
            return ", ".join(f"{key} {float(number):.2f}" for key, number in value.items())
        except (TypeError, ValueError):
            return repr(value)
    first = [("2025-11-02", "Tea", "3.50", "food"), ("2025-11-20", "Tram ticket", "2.10", "transport"), ("2025-12-05", "Soup", "4.25", "food"), ("2025-12-09", "Notebook", "12.00", "hobbies")]
    second = [("2025-10-01", "Pencils", "1.80", "hobbies"), ("2025-10-03", "Glue", "2.20", "hobbies"), ("2025-11-08", "Paper", "5.00", "hobbies"), ("2025-11-09", "Rice", "3.10", "food")]
    tests = [(first, {"food": 7.75, "transport": 2.10, "hobbies": 12.00}), (second, {"hobbies": 9.00, "food": 3.10})]
    for lines, expected in tests:
        rows = [{"date": d, "description": s, "amount": Decimal(a), "category": c} for d, s, a, c in lines]
        about = "The check called total_by_category with a list of " + str(len(lines)) + " purchases of its own: " + "; ".join(f"{s} {a} {c}" for d, s, a, c in lines) + "."
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(rows)
        except KeyError:
            print("The function total_by_category stopped with a KeyError. That happens when the code reads totals[category] for a category that is not a key of the dictionary yet. Read the total until now with totals.get(category, 0) which gives 0 for a category that is not a key yet. It also happens when a key of a purchase is spelled wrongly: the keys are \"category\" and \"amount\". Then run the cell again.")
            return False
        except TypeError:
            print("The function total_by_category stopped with a TypeError. The most likely reason is a start value that is a float, such as 0.0. The amounts are Decimal values, and Python does not add a Decimal value and a float. Use the integer 0 as the start value: totals.get(category, 0). Check also that the function reads row[\"amount\"] and row[\"category\"] from each purchase. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function total_by_category stopped with an error of the type {type(error).__name__} when the check called it with a list of purchases. Call the function in a cell of your own, with total_by_category(purchases), and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip():
            print("The function total_by_category shows the dictionary with print(), but it does not return it. The code that calls the function then receives None. Replace print() in the last line of the body with return, so that the function gives the dictionary back. Then run the cell again.")
            return False
        if result is None:
            print("The function total_by_category gives back None. That happens when the body has no return line. After the loop, add a line that starts with four spaces and gives the dictionary back: return totals. Then run the cell again.")
            return False
        if not isinstance(result, dict):
            print(f"The function total_by_category must give back a dictionary, but it gives back {result!r}. Make an empty dictionary before the loop, add the amount of each purchase to the total of its category inside the loop, and return the dictionary after the loop. Then run the cell again.")
            return False
        if same(result, expected):
            continue
        counts = {}
        last = {}
        for d, s, a, c in lines:
            counts[c] = counts.get(c, 0) + 1
            last[c] = float(a)
        if set(result) != set(expected):
            if same(result, {lines[0][3]: float(lines[0][2])}):
                print(f"{about} Your function gives back a dictionary that holds: {show(result)}. The dictionary holds only the first purchase. That happens when the return line is inside the loop, so the function stops in the first pass. The return line must start with four spaces, and not with eight. Then run the cell again.")
            else:
                print(f"{about} Your function gives back a dictionary that has the keys {sorted(result, key=repr)!r}. The keys of the dictionary must be the categories: {sorted(expected)!r}. Read the category of each purchase with row[\"category\"] and use it as the key. Then run the cell again.")
            return False
        if same(result, counts):
            print(f"{about} Your function gives back a dictionary that holds: {show(result)}. Each value is the number of purchases in the category, and not the total of their amounts. Add the amount of the purchase, and not 1: totals.get(category, 0) + row[\"amount\"]. Then run the cell again.")
            return False
        if same(result, last):
            print(f"{about} Your function gives back a dictionary that holds: {show(result)}. Each value is the amount of the last purchase in the category, and not the total. The line inside the loop must add the amount to the total until now: totals[category] = totals.get(category, 0) + row[\"amount\"]. Then run the cell again.")
            return False
        print(f"{about} Your function gives back a dictionary that holds: {show(result)}, but it must hold: {show(expected)}. Start each total at 0 with totals.get(category, 0) and add the amount of each purchase in its pass of the loop. Then run the cell again.")
        return False
    facts = {"rent": 1950.00, "food": 445.60, "transport": 181.30, "phone": 54.00, "hobbies": 63.49, "clothes": 140.40}
    if "category_totals" not in globals():
        print("The function total_by_category is correct. The name category_totals does not exist yet. After the function, at the left side of the cell, add the three lines from the task. The first one is: category_totals = total_by_category(purchases). Then run the cell again.")
        return False
    found = globals()["category_totals"]
    if not isinstance(found, dict):
        print("The function total_by_category is correct. The name category_totals must refer to a dictionary, but it refers to another kind of value. Give the name to the result of your function: category_totals = total_by_category(purchases). Then run the cell again.")
        return False
    if not same(found, facts):
        print("The function total_by_category is correct. But the dictionary category_totals does not hold the totals of the 37 purchases in the list purchases. Make it with your function, from the complete list: category_totals = total_by_category(purchases). If the list purchases has changed, run your cell of part 1 again first. Then run this cell again.")
        return False
    print("Correct. The function total_by_category gives back the total for each category. Mariam spent the most on rent, and then on food.")
    return True
globals().pop("_workshop_check")()
```

## What you have now

The dictionary `category_totals` answers the first question. Mariam
spent 1950.00 on rent in three months, and 445.60 on food. The amounts
that she typed as `Food`, `FOOD` and `groceries` are all in the one
total for `food`, because the rows are clean.
