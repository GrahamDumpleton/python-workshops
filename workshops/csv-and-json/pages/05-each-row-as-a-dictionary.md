---
title: Each row as a dictionary
requires: [verify:purchases-read, quiz:predict-strings, verify:strings-ran, verify:spending-total, verify:food-total]
---

# Each row as a dictionary

The header row of a CSV file gives a name to each field. The module
`csv` can use those names. It can give you each row as a dictionary,
where each key is the name of a field and each value is the field of
that row.

A **dictionary** holds pairs of a key and a value, and you look a
value up by its key: `row["amount"]`. That is easier to read than
`row[2]`, and it has a second advantage. If someone adds a new field
to the file, or changes the order of the fields, `row[2]` reads the
wrong field. `row["amount"]` still reads the amount.

Think of a paper form. Each box on the form has a label, such as
"Date" or "Amount". You find a value by its label, and you do not
count the boxes.

The function for this is `csv.DictReader()`. You use it in the same
way as `csv.reader()`. It reads the header row itself, and uses it
for the keys. Then it gives one dictionary for each row of data.

Click the action below. It adds a cell that reads `spending.csv` with
`csv.DictReader()`, and runs it.

```{attempt}
:id: purchases-not-run
:check: purchases-read
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-purchases
:title: Add a cell that reads each row as a dictionary, and run it
:path: {{ notebook }}
:tags: [purchases]
:run: true
purchases = []
with open("spending.csv", newline="") as file:
    reader = csv.DictReader(file)
    for row in reader:
        purchases.append(row)
print(len(purchases))
print(purchases[0])
print(purchases[0]["description"])
```

The output is:

```
37
{'date': '2026-01-01', 'description': 'Rent for January', 'amount': '650.00', 'category': 'rent'}
Rent for January
```

```{verify}
:id: purchases-read
:label: The cell read each row as a dictionary
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed purchases
if type(globals().get("purchases")) is list and len(purchases) == 37 and purchases[0] == {"date": "2026-01-01", "description": "Rent for January", "amount": "650.00", "category": "rent"}:
    print("The cell ran. The list purchases holds 37 dictionaries, one for each purchase.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("purchases")) is list and len(purchases) == 37 and purchases[0] == {"date": "2026-01-01", "description": "Rent for January", "amount": "650.00", "category": "rent"}
```

## What happened

Only one line is different from the cell that used `csv.reader()`:
the line `reader = csv.DictReader(file)`.

- The list `purchases` holds 37 items, and not 38. The header row is
  not an item of the list, because `csv.DictReader()` used it for the
  keys.

- Each item is a dictionary with four keys: `"date"`,
  `"description"`, `"amount"` and `"category"`.

- `purchases[0]` is the first purchase, and
  `purchases[0]["description"]` is its description.

## Every value is a string

Look at the dictionary in the output again. The value of the key
`"amount"` is `'650.00'`, with quotes around it. A CSV file is text,
and the module `csv` does not change the text. Every value that it
gives is a string, even when the value looks like a number.

Look at this cell. Do not run it yet. The amounts of the first two
purchases are `650.00` and `6.40`.

```python
two_amounts = purchases[0]["amount"] + purchases[1]["amount"]
print(two_amounts)
```

```{quiz}
:id: predict-strings
:type: text
:title: Predict the output
question: "What does the cell show?"
answer: "650.006.40"
wrong:
  - { text: "656.40", explanation: "That is the result for two numbers. The two values are strings, and `+` between two strings joins them into one longer string." }
  - { text: "656.4", explanation: "That is the result for two numbers. The two values are strings, and `+` between two strings joins them into one longer string." }
  - { text: "'650.006.40'", explanation: "The value is that string. `print()` shows a string without its quotes." }
  - { text: "650.00 6.40", explanation: "The operator `+` joins two strings with nothing between them. It does not add a space." }
  - { text: "650.00+6.40", explanation: "Python does the operation. The operator `+` joins the two strings, and the `+` is not part of the result." }
otherwise: "The two values are the strings `\"650.00\"` and `\"6.40\"`. Think about what `+` does with two strings, as in `\"ab\" + \"cd\"`."
explanation: "The two values are strings. Between two strings, `+` joins them, so the result is the string `650.006.40`. That is not the amount that Mariam spent."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: strings-not-run
:check: strings-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-strings
:title: Add the cell that adds two values from the file, and run it
:path: {{ notebook }}
:tags: [strings]
:run: true
two_amounts = purchases[0]["amount"] + purchases[1]["amount"]
print(two_amounts)
```

The output is:

```
650.006.40
```

```{verify}
:id: strings-ran
:label: The cell joined two strings
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed strings
if globals().get("two_amounts") == "650.006.40":
    print("The cell ran. The name two_amounts refers to a string, because the two values from the file are strings.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("two_amounts") == "650.006.40"
```

To calculate with a value from a CSV file, a program must first turn
the string into a number. The function `float()` does this:
`float("6.40")` gives the float `6.4`. A **float** is a number that
has a decimal point.

## Correct a program

The cell below is meant to add the amounts of all the purchases, and
show the total. It has a mistake in it. The action adds the cell, but
does not run it.

```{cell-insert}
:id: insert-total
:title: Add a cell that has a mistake in it, without running it
:path: {{ notebook }}
:tags: [total]
:run: false
spending_total = 0
for purchase in purchases:
    spending_total = spending_total + purchase["amount"]
print(f"{spending_total:.2f}")
```

Run the cell: click inside it, hold `Shift` and press `Enter`. The
notebook shows an error message under the cell. Read the last line of
the message first:

```
TypeError: unsupported operand type(s) for +: 'int' and 'str'
```

A `TypeError` means that an operation got a value of a type that it
cannot use. Here the operation is `+`. On its left side is an
integer, the total, which is `0` at the start. On its right side is a
string, the amount from the file. Python cannot add a number and a
string.

Correct the line inside the loop, so that the program adds each
amount as a number. Then run the cell again. When the program is
correct, the output is:

```
2834.79
```

The last line of the cell shows the total with an f-string. The part
`:.2f` after the name tells Python to show the number with two digits
after the decimal point.

```{hint}
:title: Hint: what to change
Only the third line needs a change. The expression
`purchase["amount"]` gives a string. Put that expression between the
parentheses of `float()`, so that Python adds a number.
```

```{hint}
:title: Hint: the corrected line
The third line becomes
`spending_total = spending_total + float(purchase["amount"])`. It
begins with four spaces, as before.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: total-not-started
:check: spending-total
:expect: The name spending_total does not exist yet
```

````{attempt}
:id: total-still-zero
:check: spending-total
:expect: still refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = 0
for purchase in purchases:
    amount = purchase["amount"]
print(f"{spending_total:.2f}")
```
````

````{attempt}
:id: total-a-string
:check: spending-total
:expect: refers to a string

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = ""
for purchase in purchases:
    spending_total = spending_total + purchase["amount"]
print(len(spending_total))
```
````

````{attempt}
:id: total-last-only
:check: spending-total
:expect: but it must refer to 2834.79

```{cell-insert}
:path: {{ notebook }}
:run: true
spending_total = 0
for purchase in purchases:
    spending_total = float(purchase["amount"])
print(f"{spending_total:.2f}")
```
````

````{hint}
:title: Show me a solution
:unlock: "spending-total" in failed_checks or "spending-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds the
corrected program, and the action runs it. Compare it with your own
cell.

```{cell-insert}
:id: insert-total-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [total-solution]
:run: true
spending_total = 0
for purchase in purchases:
    spending_total = spending_total + float(purchase["amount"])
print(f"{spending_total:.2f}")
```
````

```{verify}
:id: spending-total
:label: Your program adds the amounts as numbers
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed total; cell-executed total-solution
if "spending_total" not in globals():
    print("The name spending_total does not exist yet. Click the action above to add the cell. Then click inside the cell, hold Shift and press Enter to run it.")
elif type(spending_total) is str:
    print("The name spending_total refers to a string. The total must be a number. Keep the first line as spending_total = 0, and turn each amount into a number in the loop: spending_total = spending_total + float(purchase[\"amount\"]). Then run the cell again.")
elif type(spending_total) not in (int, float):
    print("The name spending_total does not refer to a number. Keep the first line as spending_total = 0, and add each amount in the loop: spending_total = spending_total + float(purchase[\"amount\"]). Then run the cell again.")
elif spending_total == 0:
    print("The name spending_total still refers to 0, so the program has not added an amount. The line inside the loop must turn the string into a number with float(), and add it to the total: spending_total = spending_total + float(purchase[\"amount\"]). Then run the cell again.")
elif round(float(spending_total), 2) == 2834.79:
    print("Correct. The total of the 37 purchases is 2834.79. The function float() turned each string into a number before the program added it.")
else:
    print(f"The name spending_total refers to {spending_total:.2f} but it must refer to 2834.79. Each pass of the loop must add one amount to the total that is already there: spending_total = spending_total + float(purchase[\"amount\"]). Then run the cell again.")
type(globals().get("spending_total")) in (int, float) and round(float(spending_total), 2) == 2834.79
```

## Your task

Now find how much Mariam spent on food.

Write a program that adds the amounts of the purchases whose category
is `food`, and gives the name `food_total` to the result. Use the
list `purchases`.

Your program must do these things:

1. Give the name `food_total` to `0`.

2. Write a `for` loop over the list `purchases`.

3. In the loop, test with an `if` line whether the value of the key
   `"category"` is equal to `"food"`.

4. Only when it is, add the amount to `food_total`, as a number.

5. After the loop, show the total with
   `print(f"{food_total:.2f}")`.

For example, the first purchase has the category `rent`, so the
program does not add its amount. The second purchase has the category
`food` and the amount `6.40`, so the program adds `6.4`.

When the program is correct, the output under the cell is:

```
445.60
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-food
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [food]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Your program has the same form as the program that you corrected.
The first two lines are `food_total = 0` and
`for purchase in purchases:`. The new part is an `if` line inside
the loop.
```

```{hint}
:title: Hint: the if line and the line under it
The `if` line begins with four spaces:
`if purchase["category"] == "food":`. The line under it begins with
eight spaces, because it is in the block of the `if`:
`food_total = food_total + float(purchase["amount"])`. The `print()`
line comes last, and it begins without spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: food-not-started
:check: food-total
:expect: The name food_total does not exist yet
```

````{attempt}
:id: food-a-string
:check: food-total
:expect: does not refer to a number

```{cell-insert}
:path: {{ notebook }}
:run: true
food_total = "445.60"
print(food_total)
```
````

````{attempt}
:id: food-everything
:check: food-total
:expect: That is the total of every purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
food_total = 0
for purchase in purchases:
    food_total = food_total + float(purchase["amount"])
print(f"{food_total:.2f}")
```
````

````{attempt}
:id: food-capital-letter
:check: food-total
:expect: The name food_total refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
food_total = 0
for purchase in purchases:
    if purchase["category"] == "Food":
        food_total = food_total + float(purchase["amount"])
print(f"{food_total:.2f}")
```
````

````{attempt}
:id: food-counted
:check: food-total
:expect: That is the number of purchases

```{cell-insert}
:path: {{ notebook }}
:run: true
food_total = 0
for purchase in purchases:
    if purchase["category"] == "food":
        food_total = food_total + 1
print(food_total)
```
````

````{attempt}
:id: food-other-category
:check: food-total
:expect: but it must refer to 445.60

```{cell-insert}
:path: {{ notebook }}
:run: true
food_total = 0
for purchase in purchases:
    if purchase["category"] == "transport":
        food_total = food_total + float(purchase["amount"])
print(f"{food_total:.2f}")
```
````

````{hint}
:title: Show me a solution
:unlock: "food-total" in failed_checks or "food-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-food-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [food-solution]
:run: true
food_total = 0
for purchase in purchases:
    if purchase["category"] == "food":
        food_total = food_total + float(purchase["amount"])
print(f"{food_total:.2f}")
```
````

```{verify}
:id: food-total
:label: Your program adds the amounts of the food purchases
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed food; cell-executed food-solution
if "food_total" not in globals():
    print("The name food_total does not exist yet. Write your program under the comment in the new cell, and begin with the line food_total = 0. Then hold Shift and press Enter to run the cell.")
elif type(food_total) not in (int, float):
    print("The name food_total does not refer to a number. Begin with food_total = 0, and add each amount as a number: food_total = food_total + float(purchase[\"amount\"]). Then run the cell again.")
elif round(float(food_total), 2) == 445.60:
    print("Correct. Mariam spent 445.60 on food. Your program chose the rows by the name of a field, and turned each amount into a number.")
elif round(float(food_total), 2) == 2834.79:
    print("The name food_total refers to 2834.79. That is the total of every purchase. The line that adds the amount must be in the block of an if line, so that it runs only for food: if purchase[\"category\"] == \"food\": Then run the cell again.")
elif food_total == 0:
    print("The name food_total refers to 0, so the program has not added an amount. Check the if line. The key is \"category\", and the value to compare with is \"food\", in small letters: if purchase[\"category\"] == \"food\": Then run the cell again.")
elif food_total == 17:
    print("The name food_total refers to 17. That is the number of purchases of food. The task asks for the total of their amounts. Add the amount of each purchase, as a number: food_total = food_total + float(purchase[\"amount\"]). Then run the cell again.")
else:
    print(f"The name food_total refers to {food_total:.2f} but it must refer to 445.60. Check that the if line compares the category with \"food\", and that the line under it adds float(purchase[\"amount\"]) to food_total. Then run the cell again.")
type(globals().get("food_total")) in (int, float) and round(float(food_total), 2) == 445.60
```

You have read a CSV file, chosen rows by the name of a field, and
calculated with the values. The next page shows how a program writes
a CSV file.
