---
title: A function of your own
requires: [verify:shipping-function]
---

# A function of your own

On this page you write a function from a description. The page does
not show the lines to write. The function has a parameter, it makes a
decision, and it returns a result.

## The problem

Hyun-woo sends parcels to customers. The cost of sending a parcel
depends on its weight in kilograms:

- A parcel that weighs less than `2` kilograms costs `5`.

- Every other parcel costs `9`. That includes a parcel that weighs
  exactly `2` kilograms.

Hyun-woo needs the cost in many parts of his program, so the
calculation belongs in a function.

## What the function must do

Write a function with the name `shipping_cost`. It has one parameter,
with the name `weight`. It returns the cost of sending a parcel of
that weight.

| The call | The return value |
|----------|------------------|
| `shipping_cost(1)` | `5` |
| `shipping_cost(0.5)` | `5` |
| `shipping_cost(2)` | `9` |
| `shipping_cost(3.5)` | `9` |

The function must return the cost. It must not print it.

The body of a function can hold every kind of line that you know,
including an `if` with an `else`. The `if` line and the `else` line are in
the body, so they begin with four spaces. The lines of their blocks
are one step deeper, so they begin with eight spaces.

Under the function, write lines that call it and print the return
value, so that you can test it. For example:

```python
print(shipping_cost(1))
print(shipping_cost(2))
```

When the function is correct, these two lines show `5` and then `9`.

## Where to write it

```{cell-insert}
:id: insert-shipping
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [shipping]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function and
the lines that test it. Then run the cell: hold `Shift` and press
`Enter`.

If you see an error message, or the output is not what you expected,
change the function and run the cell again. You can try as many times
as you like.

## If you need help

```{hint}
:title: Hint: how to begin
The first line is `def shipping_cost(weight):`. The first line of the
body is the `if` line, and it begins with four spaces:
`if weight < 2:`.
```

```{hint}
:title: Hint: the rest of the body
Under the `if` line, a line with eight spaces gives a name to the
lower cost: `cost = 5`. Then comes `else:` with four spaces, and under
it `cost = 9` with eight spaces. The last line of the body begins
with four spaces and gives the result back: `return cost`.
```

```{hint}
:title: Hint: I see an IndentationError
An `IndentationError` means that the spaces at the beginning of a line
are wrong. The `def` line and the `print()` lines under the function
begin without spaces. The `if` line, the `else` line and the `return`
line begin with four spaces. The line under the `if` and the line
under the `else` begin with eight spaces.
```

```{hint}
:title: Hint: the output shows None
The word `None` in the output means that a call gave nothing back.
Check that the body has a line with `return`, and that the body does
not print the cost where it must return it.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: shipping-not-started
:check: shipping-function
:expect: The function shipping_cost does not exist yet
```

````{attempt}
:id: shipping-not-a-function
:check: shipping-function
:expect: it is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
shipping_cost = 5
print(shipping_cost)
```
````

````{attempt}
:id: shipping-no-parameter
:check: shipping-function
:expect: has no parameter, but it must have exactly one

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost():
    return 5

print(shipping_cost())
```
````

````{attempt}
:id: shipping-stops
:check: shipping-function
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost(weight):
    if wieght < 2:
        cost = 5
    else:
        cost = 9
    return cost
```
````

````{attempt}
:id: shipping-prints
:check: shipping-function
:expect: shows the cost with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost(weight):
    if weight < 2:
        print(5)
    else:
        print(9)

shipping_cost(1)
shipping_cost(2)
```
````

````{attempt}
:id: shipping-no-return
:check: shipping-function
:expect: gives nothing back

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost(weight):
    if weight < 2:
        cost = 5
    else:
        cost = 9

print(shipping_cost(1))
```
````

````{attempt}
:id: shipping-return-in-one-block
:check: shipping-function
:expect: but shipping_cost(2) gives nothing back

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost(weight):
    if weight < 2:
        cost = 5
        return cost
    else:
        cost = 9

print(shipping_cost(1))
```
````

````{attempt}
:id: shipping-always-five
:check: shipping-function
:expect: gives 5 for every weight

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost(weight):
    cost = 5
    return cost

print(shipping_cost(1))
```
````

````{attempt}
:id: shipping-reversed
:check: shipping-function
:expect: The two costs are in the wrong blocks

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost(weight):
    if weight > 2:
        cost = 5
    else:
        cost = 9
    return cost

print(shipping_cost(1))
```
````

````{attempt}
:id: shipping-boundary
:check: shipping-function
:expect: A parcel of exactly 2 kilograms costs 9

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost(weight):
    if weight <= 2:
        cost = 5
    else:
        cost = 9
    return cost

print(shipping_cost(2))
```
````

````{attempt}
:id: shipping-wrong-costs
:check: shipping-function
:expect: but it must give 5

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost(weight):
    if weight < 2:
        cost = 2
    else:
        cost = 9
    return cost

print(shipping_cost(1))
```
````

````{attempt}
:id: shipping-two-returns
:check: shipping-function
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def shipping_cost(kilograms):
    if kilograms >= 2:
        return 9
    else:
        return 5

print(shipping_cost(1))
print(shipping_cost(2))
```
````

````{hint}
:title: Show me a solution
:unlock: "shipping-function" in failed_checks or "shipping-function" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-shipping-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [shipping-solution]
:run: true
def shipping_cost(weight):
    if weight < 2:
        cost = 5
    else:
        cost = 9
    return cost

print(shipping_cost(1))
print(shipping_cost(2))
```
````

```{verify}
:id: shipping-function
:label: Your function shipping_cost returns the right cost for every weight
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shipping; cell-executed shipping-solution
def _workshop_check():
    import contextlib, inspect, io
    if "shipping_cost" not in globals():
        print("The function shipping_cost does not exist yet. Write it under the comment in the new cell. The first line is def shipping_cost(weight): and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["shipping_cost"]
    if not callable(function):
        print("The name shipping_cost exists, but it is not a function. A function begins with a line that has the word def, the name, the parameter in parentheses and a colon: def shipping_cost(weight): Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        found = "no parameter" if count == 0 else f"{count} parameters"
        print(f"The function shipping_cost has {found}, but it must have exactly one. The weight of the parcel must arrive through the parameter. The def line must be: def shipping_cost(weight): Then run the cell again.")
        return False
    weights = (1, 0.5, 2, 3.5)
    expected = [5, 5, 9, 9]
    results = []
    printed = []
    for weight in weights:
        output = io.StringIO()
        try:
            with contextlib.redirect_stdout(output):
                results.append(function(weight))
        except Exception as error:
            print(f"The call shipping_cost({weight}) stopped with a {type(error).__name__}. Read the last line of the error message under your cell. The body must use the same name as the parameter in the def line, and every name must have a value before it is used. Correct the body, and run the cell again.")
            return False
        printed.append(output.getvalue().strip())
    if results == expected:
        print("Correct. shipping_cost(1) gives 5, shipping_cost(2) gives 9 and shipping_cost(3.5) gives 9. Your function makes a decision and returns the result.")
        return True
    if all(result is None for result in results) and printed[0] != "":
        print(f"The function shipping_cost shows the cost with print(), but it does not return it. The call shipping_cost(1) puts {printed[0]} on the screen, and the code that calls the function receives nothing. Replace each print() in the body with a line that gives the cost back with the word return. Then run the cell again.")
        return False
    if all(result is None for result in results):
        print("The call shipping_cost(1) gives nothing back. The body needs a last line that begins with four spaces and with the word return, and then the value to give back: return cost. Then run the cell again.")
        return False
    for weight, result in zip(weights, results):
        if result is None:
            print(f"Some calls give a result, but shipping_cost({weight}) gives nothing back. The function must return a cost for every weight. Check that a line with return runs when the comparison is true and also when it is false. Then run the cell again.")
            return False
    if results == [results[0]] * 4:
        print(f"The function shipping_cost gives {results[0]!r} for every weight. The body needs an if line that compares the parameter with 2, and an else line, so that the two kinds of parcel get different costs. Then run the cell again.")
        return False
    if results == [9, 9, 5, 5] or results == [9, 9, 9, 5]:
        print("shipping_cost(1) gives 9 and shipping_cost(3.5) gives 5. The two costs are in the wrong blocks, or the comparison points the wrong way. A parcel that weighs less than 2 kilograms costs 5: if weight < 2. Then run the cell again.")
        return False
    if results == [5, 5, 5, 9]:
        print("shipping_cost(2) gives 5 but it must give 9. A parcel of exactly 2 kilograms costs 9. Only a parcel that weighs less than 2 kilograms costs 5, so the comparison must be weight < 2 and not weight <= 2. Then run the cell again.")
        return False
    for weight, result, cost in zip(weights, results, expected):
        if result != cost:
            print(f"shipping_cost({weight}) gives {result!r} but it must give {cost}. A parcel that weighs less than 2 kilograms costs 5, and every other parcel costs 9. Then run the cell again.")
            return False
globals().pop("_workshop_check")()
```

You wrote this function from a description alone. It receives a
value, makes a decision, and gives a result back.
