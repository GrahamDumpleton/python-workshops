---
title: Reading JSON
requires: [verify:budgets-loaded, quiz:predict-numbers, verify:numbers-ran, verify:budget-total]
---

# Reading JSON

Python comes with a module that reads and writes JSON. Its name is
`json`. As with the module `csv`, a program must import it one time,
with the line `import json`.

To read a JSON file, you open the file in a `with` block, and you
give the open file to the function `json.load()`. The function reads
the whole file and returns the data as Python values. A part of the
file in curly brackets becomes a dictionary. A part in square
brackets becomes a list. A number becomes a number.

With CSV, the program received a row at a time, and it built the list
itself in a loop. With JSON there is no loop: one call gives all the
data, in the form that it has in the file.

Think of a flat box that holds furniture in parts. With CSV, you get
the parts, and you build the furniture. With JSON, the furniture
comes out of the box already built.

Click the action below. It adds a cell that reads the file
`budgets.json`, and runs it.

```{attempt}
:id: budgets-not-run
:check: budgets-loaded
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-budgets
:title: Add a cell that reads the file budgets.json, and run it
:path: {{ notebook }}
:tags: [budgets]
:run: true
import json

with open("budgets.json") as file:
    budgets = json.load(file)
print(budgets)
print(budgets["food"])
```

The output is:

```
{'rent': 650, 'food': 180, 'transport': 60, 'phone': 20, 'clothes': 50, 'hobbies': 30}
180
```

```{verify}
:id: budgets-loaded
:label: The cell read the budgets from the file
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed budgets
if globals().get("budgets") == {"rent": 650, "food": 180, "transport": 60, "phone": 20, "clothes": 50, "hobbies": 30}:
    print("The cell ran. The name budgets refers to a dictionary that holds the six budgets.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("budgets") == {"rent": 650, "food": 180, "transport": 60, "phone": 20, "clothes": 50, "hobbies": 30}
```

## What happened

| Line | What Python did |
|------|-----------------|
| `import json` | made the module `json` ready to use |
| `with open("budgets.json") as file:` | opened the file, and gave the open file the name `file` |
| `budgets = json.load(file)` | read the whole file, made a dictionary from it, and gave the dictionary the name `budgets` |

The name `budgets` refers to an ordinary Python dictionary. Python
shows its strings with single quotes, as it always does. You look up
a value with a key in square brackets: `budgets["food"]` is the
budget for food for one month.

The call of `open()` has no `newline=""` here. That argument is for
the module `csv` only.

## Numbers stay numbers

Look at this cell. Do not run it yet. The budget for food is `180`,
and the budget for the phone is `20`.

```python
food_and_phone = budgets["food"] + budgets["phone"]
print(food_and_phone)
```

```{quiz}
:id: predict-numbers
:type: text
:title: Predict the output
question: "What does the cell show?"
answer: "200"
wrong:
  - { text: "18020", explanation: "That is the result for two strings, which is what a CSV file gives. JSON keeps a number as a number, so `+` adds the two values." }
  - { text: "200.0", explanation: "The two values are the integers `180` and `20`, with no decimal point. The result of `+` on two integers is an integer." }
  - { text: "'18020'", explanation: "That is the result for two strings, which is what a CSV file gives. JSON keeps a number as a number, so `+` adds the two values." }
otherwise: "In the file, the values `180` and `20` have no quotes around them. Think about what type each value has after `json.load()` has read it."
explanation: "In a JSON file, a value with no quotes around it is a number. `json.load()` gives the integers `180` and `20`, and `+` adds them. The program does not need `float()` or `int()`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: numbers-not-run
:check: numbers-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-numbers
:title: Add the cell that adds two budgets, and run it
:path: {{ notebook }}
:tags: [numbers]
:run: true
food_and_phone = budgets["food"] + budgets["phone"]
print(food_and_phone)
```

The output is:

```
200
```

```{verify}
:id: numbers-ran
:label: The cell added two numbers from the file
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed numbers
if type(globals().get("food_and_phone")) is int and food_and_phone == 200:
    print("The cell ran. The two values from the file are numbers, so the result is the number 200.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("food_and_phone")) is int and food_and_phone == 200
```

## Your task

Find how much Mariam plans to spend in one month, in all the
categories together.

Write a program that adds the six values of the dictionary `budgets`,
and gives the name `budget_total` to the result.

A `for` loop can run over the values of a dictionary. This is from
the workshop **Looping over anything**, so here is a reminder:
`budgets.values()` gives the values without the keys, and the line
`for amount in budgets.values():` runs its block one time for each
value.

Your program must do these things:

1. Give the name `budget_total` to `0`.

2. Write a `for` loop over the values of the dictionary `budgets`.

3. In the loop, add each value to `budget_total`.

4. After the loop, show the total with `print(budget_total)`.

For example, after the first two passes of the loop, the total is
`650 + 180`, which is `830`.

When the program is correct, the output under the cell is:

```
990
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-budget-total
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [budget-total]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
The first two lines are `budget_total = 0` and
`for amount in budgets.values():`. The line under the `for` line
begins with four spaces, and it adds `amount` to `budget_total`.
```

```{hint}
:title: Hint: the line in the loop
The line in the loop is `budget_total = budget_total + amount`. The
values are numbers already, so the line does not need `float()`. The
last line is `print(budget_total)`, and it begins without spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: budget-total-not-started
:check: budget-total
:expect: The name budget_total does not exist yet
```

````{attempt}
:id: budget-total-keys
:check: budget-total
:expect: does not refer to a number

```{cell-insert}
:path: {{ notebook }}
:run: true
budget_total = ""
for category in budgets:
    budget_total = budget_total + category
print(budget_total)
```
````

````{attempt}
:id: budget-total-zero
:check: budget-total
:expect: The name budget_total refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
budget_total = 0
for amount in budgets.values():
    amount_total = amount
print(budget_total)
```
````

````{attempt}
:id: budget-total-counted
:check: budget-total
:expect: That is the number of categories

```{cell-insert}
:path: {{ notebook }}
:run: true
budget_total = 0
for amount in budgets.values():
    budget_total = budget_total + 1
print(budget_total)
```
````

````{attempt}
:id: budget-total-last
:check: budget-total
:expect: That is the last value of the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
budget_total = 0
for amount in budgets.values():
    budget_total = amount
print(budget_total)
```
````

````{attempt}
:id: budget-total-other
:check: budget-total
:expect: but it must refer to 990

```{cell-insert}
:path: {{ notebook }}
:run: true
budget_total = budgets["rent"] + budgets["food"]
print(budget_total)
```
````

````{attempt}
:id: budget-total-by-key
:check: budget-total
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
budget_total = 0
for category in budgets:
    budget_total = budget_total + budgets[category]
print(budget_total)
```
````

````{hint}
:title: Show me a solution
:unlock: "budget-total" in failed_checks or "budget-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-budget-total-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [budget-total-solution]
:run: true
budget_total = 0
for amount in budgets.values():
    budget_total = budget_total + amount
print(budget_total)
```
````

```{verify}
:id: budget-total
:label: Your program adds the six budgets
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed budget-total; cell-executed budget-total-solution
if "budget_total" not in globals():
    print("The name budget_total does not exist yet. Write your program under the comment in the new cell, and begin with the line budget_total = 0. Then hold Shift and press Enter to run the cell.")
elif type(budget_total) not in (int, float):
    print("The name budget_total does not refer to a number. Begin with budget_total = 0, and write the loop over the values of the dictionary, not over its keys: for amount in budgets.values(): Then run the cell again.")
elif budget_total == 990:
    print("Correct. The six budgets together are 990 for one month. The values came from the file as numbers, so your program added them with no float().")
elif budget_total == 0:
    print("The name budget_total refers to 0, so the program has not added a value. The line in the loop must add each value to the total: budget_total = budget_total + amount. Then run the cell again.")
elif budget_total == 6:
    print("The name budget_total refers to 6. That is the number of categories. The task asks for the total of the budgets. Add each value in the loop: budget_total = budget_total + amount. Then run the cell again.")
elif budget_total == 30:
    print("The name budget_total refers to 30. That is the last value of the dictionary. Each pass of the loop must add the value to the total that is already there: budget_total = budget_total + amount. Then run the cell again.")
else:
    print(f"The name budget_total refers to {budget_total} but it must refer to 990. Write the loop over all the values with for amount in budgets.values(): and add each one: budget_total = budget_total + amount. Then run the cell again.")
type(globals().get("budget_total")) in (int, float) and budget_total == 990
```

Mariam plans to spend 990 in one month. On the next page she changes
her budgets, and your program saves them.
