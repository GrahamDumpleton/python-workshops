---
title: A small program of your own
requires: [verify:delivery-program]
---

# A small program of your own

On this page you write a small program yourself, from nothing. It
uses `if`, `elif` and `else` to choose one of three values.

## The problem

A company delivers parcels. The cost of a delivery depends on the
weight of the parcel, in kilograms.

| Weight of the parcel | Cost |
|----------------------|------|
| 2 kilograms or less | `5` |
| more than 2 kilograms, up to 10 kilograms | `9` |
| more than 10 kilograms | `20` |

Look at the limits. A parcel of exactly 2 kilograms costs `5`, and a
parcel of exactly 10 kilograms costs `9`.

Lucía sends a parcel that weighs 10 kilograms. Write a program that
finds the cost of her delivery, and that also gives the right cost
when the weight is changed.

## What the program must do

1. Give the name `parcel_weight` to the value `10`.

2. Choose the cost with `if`, `elif` and `else`. Each of the three
   blocks gives the name `delivery_cost` a value: `5`, `9` or `20`.
   The conditions compare `parcel_weight` with the limits in the
   table.

3. After the three branches, show the value of `delivery_cost` with
   `print()`. This line has no indentation.

When the program is correct, the output under the cell is:

```
9
```

Some examples of what the program must give for other weights:

| `parcel_weight` | `delivery_cost` |
|-----------------|-----------------|
| `1` | `5` |
| `2` | `5` |
| `7` | `9` |
| `10` | `9` |
| `15` | `20` |

## Where to write it

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-delivery
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [delivery]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
When you press `Enter` after a line that ends with `:`, the notebook
adds the four spaces of the block for you. To write the `elif` line
or the `else:` line, first remove those spaces with the `Backspace`
key.

When the program is complete, run the cell: hold `Shift` and press
`Enter`.

## Test every branch

The check below tests your program with the value that `parcel_weight`
has at that moment. One weight tests only one branch. A program can
give the right cost for one weight and the wrong cost for another.

When the output is `9` for a weight of `10`, change the first line and
run the cell again for each of these weights: `2`, `15` and `7`.
Compare each output with the table of examples. The check runs each
time, and its message says which branch gave a wrong result.

## If you need help

```{hint}
:title: Hint: how to begin
The first line is the assignment `parcel_weight = 10`. The second line
begins the decision: the word `if`, then a condition that is `True`
for the lightest parcels, then `:`. The line under it is indented, and
is the assignment `delivery_cost = 5`.
```

```{hint}
:title: Hint: the three branches
Look at the cell with the water on the page **More than two choices**.
Your program has the same form. The `if` line tests
`parcel_weight <= 2`. The `elif` line tests `parcel_weight <= 10`. It
does not need to test "more than 2", because Python reaches the `elif`
line only when the first condition was `False`. The `else:` line has
no condition, and its block is `delivery_cost = 20`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the message first. A `SyntaxError` often means
that a `:` is missing at the end of the `if`, `elif` or `else` line,
or that a condition has `=` where it needs a comparison operator. An
`IndentationError` means that the spaces at the start of a line are
wrong: the `if`, `elif` and `else` lines have no indentation, and each
line under them has four spaces. A `NameError` means that a name is
not spelled in the same way in every line.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: delivery-not-started
:check: delivery-program
:expect: The name parcel_weight does not exist yet
```

````{attempt}
:id: delivery-no-else
:check: delivery-program
:expect: The name delivery_cost does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
parcel_weight = 15
if parcel_weight <= 2:
    delivery_cost = 5
elif parcel_weight <= 10:
    delivery_cost = 9
```
````

````{attempt}
:id: delivery-boundary
:check: delivery-program
:expect: so that 10 itself is included

```{cell-insert}
:path: {{ notebook }}
:run: true
parcel_weight = 10
if parcel_weight < 2:
    delivery_cost = 5
elif parcel_weight < 10:
    delivery_cost = 9
else:
    delivery_cost = 20
print(delivery_cost)
```
````

````{attempt}
:id: delivery-order
:check: delivery-program
:expect: must come first

```{cell-insert}
:path: {{ notebook }}
:run: true
parcel_weight = 2
if parcel_weight <= 10:
    delivery_cost = 9
elif parcel_weight <= 2:
    delivery_cost = 5
else:
    delivery_cost = 20
print(delivery_cost)
```
````

````{attempt}
:id: delivery-else-missing
:check: delivery-program
:expect: ends with an else branch

```{cell-insert}
:path: {{ notebook }}
:run: true
parcel_weight = 15
if parcel_weight <= 2:
    delivery_cost = 5
elif parcel_weight <= 10:
    delivery_cost = 9
print(delivery_cost)
```
````

````{attempt}
:id: delivery-weight-text
:check: delivery-program
:expect: must refer to a number

```{cell-insert}
:path: {{ notebook }}
:run: true
parcel_weight = "10"
delivery_cost = 9
print(delivery_cost)
```
````

````{attempt}
:id: delivery-other-way
:check: delivery-program
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
parcel_weight = 2.5
if parcel_weight > 10:
    delivery_cost = 20
elif parcel_weight > 2:
    delivery_cost = 9
else:
    delivery_cost = 5
print(delivery_cost)
```
````

````{hint}
:title: Show me a solution
:unlock: "delivery-program" in failed_checks or "delivery-program" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-delivery-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [delivery-solution]
:run: true
parcel_weight = 10
if parcel_weight <= 2:
    delivery_cost = 5
elif parcel_weight <= 10:
    delivery_cost = 9
else:
    delivery_cost = 20
print(delivery_cost)
```
````

```{verify}
:id: delivery-program
:label: Your program gives the right cost for the weight of the parcel
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed delivery; cell-executed delivery-solution
if "parcel_weight" not in globals():
    print("The name parcel_weight does not exist yet. Write your program under the comment in the new cell, and begin with the line that gives this name the value 10. Check the spelling. Then hold Shift and press Enter to run the cell.")
elif type(parcel_weight) not in (int, float):
    print(f"The name parcel_weight refers to {parcel_weight!r} but it must refer to a number. Write the weight without quotes: parcel_weight = 10. Then run the cell again.")
elif "delivery_cost" not in globals():
    print(f"The name delivery_cost does not exist yet. The parcel weighs {parcel_weight} kilograms, and no line of your program gave the cost a value for that weight. Each of the three branches, if, elif and else, must have an indented line that begins with delivery_cost = and the name must be spelled in the same way each time. Then run the cell again.")
elif delivery_cost == (5 if parcel_weight <= 2 else 9 if parcel_weight <= 10 else 20):
    print(f"Correct for a parcel of {parcel_weight} kilograms: the cost is {delivery_cost}. To test the other branches, run your cell again with the weights 2, 10 and 15.")
elif parcel_weight <= 2:
    print(f"The parcel weighs {parcel_weight} kilograms, which is 2 kilograms or less, so the cost must be 5. But the name delivery_cost refers to {delivery_cost!r}. The condition for the lightest parcels must come first, in the if line, because Python uses the first condition that is True. Write it with <= so that 2 itself is included: parcel_weight <= 2. Then run the cell again.")
elif parcel_weight <= 10:
    print(f"The parcel weighs {parcel_weight} kilograms, which is more than 2 and not more than 10, so the cost must be 9. But the name delivery_cost refers to {delivery_cost!r}. Check the branch in the middle. Its condition must be parcel_weight <= 10, with <= so that 10 itself is included, and its block must be delivery_cost = 9. Then run the cell again.")
else:
    print(f"The parcel weighs {parcel_weight} kilograms, which is more than 10, so the cost must be 20. But the name delivery_cost refers to {delivery_cost!r}. Check that your program ends with an else branch, and that its block is delivery_cost = 20. Without that branch, the name keeps the value from an earlier run. Then run the cell again.")
"parcel_weight" in globals() and "delivery_cost" in globals() and type(parcel_weight) in (int, float) and delivery_cost == (5 if parcel_weight <= 2 else 9 if parcel_weight <= 10 else 20)
```
