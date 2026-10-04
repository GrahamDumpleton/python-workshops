---
title: A function with a loop
requires: [verify:total-cost-works]
---

# A function with a loop

On this page you write a function yourself, from nothing. The
function uses a loop over a dictionary, with `.items()`.

## What you need to remember about functions

A **function** is a group of lines that has a name. You write the
lines once, and you can use them many times.

- You **define** a function with a line that begins with `def`. The
  line has the name of the function, then parentheses, and it ends
  with a colon.

- To **call** a function means to run its lines. You write the name
  of the function, and then parentheses.

- The names between the parentheses of the `def` line are the
  **parameters**. The code that calls the function gives a value for
  each parameter, between the parentheses of the call.

- The lines under the `def` line that begin with four spaces are the
  **body** of the function.

- A line that begins with `return` ends the function, and gives a
  value back to the code that called the function. `print()` only
  shows a value on the screen. It does not give the value back.

For example, this function has two parameters, and it returns their
sum:

```python
def add(first, second):
    return first + second
```

## The problem

A customer has a basket of products. The dictionary of the basket
says how many of each product the customer buys. A second dictionary
is the price list of the shop. It gives the price of one of each
product.

```python
{"bread": 2, "milk": 1}
{"bread": 3, "milk": 2, "eggs": 4}
```

The first dictionary is a basket: `2` of `"bread"` and `1` of
`"milk"`. The second dictionary is a price list. The total cost of
this basket is `8`: two times `3` for the bread, and one time `2` for
the milk. The customer does not buy eggs, so the price of the eggs is
not used.

## What the function must do

Write a function named `total_cost` that calculates the total cost of
a basket.

- The function has two parameters, in this order: `basket` and
  `price_list`. Both are dictionaries.

- Each key of `basket` is the name of a product, and its value is the
  quantity. Each key of `price_list` is the name of a product, and its
  value is the price of one.

- The function returns the total cost: for each product in `basket`,
  the quantity multiplied by the price of that product in
  `price_list`, all added together.

- The function uses `return` to give the total back. It does not use
  `print()`.

These are examples of what the function must give:

| Call | Result |
|------|--------|
| `total_cost({"bread": 2, "milk": 1}, {"bread": 3, "milk": 2, "eggs": 4})` | `8` |
| `total_cost({"eggs": 3}, {"bread": 3, "milk": 2, "eggs": 4})` | `12` |
| `total_cost({}, {"bread": 3})` | `0` |

The last example has an empty basket, so the total is `0`.

The body of the function has three parts:

1. A name for the total, with the start value `0`.

2. A `for` loop over `basket.items()`, with two loop names. In each
   pass, look up the price of the product in `price_list`, multiply it
   by the quantity, and add the result to the total.

3. A `return` line after the loop, which gives the total back.

Every line of the body begins with four spaces. The line in the block
of the loop is inside the function and inside the loop, so it begins
with eight spaces. The `return` line is after the loop, so it begins
with four spaces.

## Where to write it

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-total-cost
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [total-cost]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`. A cell that only
defines a function shows no output. The check below calls your
function with several baskets, and tells you what it found.

## If you need help

```{hint}
:title: Hint: how to begin
The first line is `def total_cost(basket, price_list):`. The second
line begins with four spaces, and gives the total its start value:
`total = 0`.
```

```{hint}
:title: Hint: the loop
The loop line begins with four spaces:
`for product, quantity in basket.items():`. The line in its block
begins with eight spaces. The price of the product is
`price_list[product]`, so the line is
`total = total + quantity * price_list[product]`.
```

```{hint}
:title: Hint: the last line
The last line is `return total`. It begins with four spaces, so it is
in the body of the function, but after the loop. If it begins with
eight spaces, it is inside the loop, and the function ends in the
first pass.
```

```{hint}
:title: Hint: my cell shows [*] and does not finish
While a cell runs, the square brackets at its left side show a star:
`[*]`. The cell of this task finishes in less than a second. If the
star stays for longer than a few seconds, the cell probably holds a
loop that never ends. Python cannot run any other cell while it
waits.

To stop the loop, you restart the **kernel**. The kernel is the Python
interpreter that runs the cells of your notebook. First correct the
loop in the cell. Then open the `Kernel` menu at the top of the
window, choose `Restart Kernel and Run All Cells…`, and click
`Restart` in the box that appears. Python starts again, forgets every
name, and runs the cells of the notebook again from the top. If Python
stops at a cell that shows an error message, correct that cell, and
choose the same menu item again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: total-cost-not-started
:check: total-cost-works
:expect: The function total_cost does not exist yet
```

````{attempt}
:id: total-cost-not-a-function
:check: total-cost-works
:expect: The name total_cost is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
total_cost = 8
```
````

````{attempt}
:id: total-cost-one-parameter
:check: total-cost-works
:expect: The function total_cost must have two parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket):
    total = 0
    for product, quantity in basket.items():
        total = total + quantity
    return total
```
````

````{attempt}
:id: total-cost-keys-only
:check: total-cost-works
:expect: The function total_cost stopped with a ValueError

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket, price_list):
    total = 0
    for product, quantity in basket:
        total = total + quantity * price_list[product]
    return total
```
````

````{attempt}
:id: total-cost-wrong-lookup
:check: total-cost-works
:expect: The function total_cost stopped with a KeyError

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket, price_list):
    total = 0
    for product, quantity in basket.items():
        total = total + quantity * price_list[quantity]
    return total
```
````

````{attempt}
:id: total-cost-prints
:check: total-cost-works
:expect: shows the result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket, price_list):
    total = 0
    for product, quantity in basket.items():
        total = total + quantity * price_list[product]
    print(total)
```
````

````{attempt}
:id: total-cost-no-return
:check: total-cost-works
:expect: gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket, price_list):
    total = 0
    for product, quantity in basket.items():
        total = total + quantity * price_list[product]
```
````

````{attempt}
:id: total-cost-return-in-loop
:check: total-cost-works
:expect: That is the cost of the first product only

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket, price_list):
    total = 0
    for product, quantity in basket.items():
        total = total + quantity * price_list[product]
        return total
```
````

````{attempt}
:id: total-cost-quantities-only
:check: total-cost-works
:expect: That is the quantities added together

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket, price_list):
    total = 0
    for product, quantity in basket.items():
        total = total + quantity
    return total
```
````

````{attempt}
:id: total-cost-all-prices
:check: total-cost-works
:expect: but it must give 8

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket, price_list):
    total = 0
    for product, price in price_list.items():
        total = total + price
    return total
```
````

````{attempt}
:id: total-cost-fixed-value
:check: total-cost-works
:expect: but it must give 15

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket, price_list):
    return 8
```
````

````{attempt}
:id: total-cost-with-keys
:check: total-cost-works
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_cost(basket, price_list):
    cost_so_far = 0
    for thing in basket:
        cost_so_far = cost_so_far + basket[thing] * price_list[thing]
    return cost_so_far
```
````

````{hint}
:title: Show me a solution
:unlock: "total-cost-works" in failed_checks or "total-cost-works" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-total-cost-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [total-cost-solution]
:run: true
def total_cost(basket, price_list):
    total = 0
    for product, quantity in basket.items():
        total = total + quantity * price_list[product]
    return total
```
````

```{verify}
:id: total-cost-works
:label: Your function gives the total cost of a basket
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed total-cost; cell-executed total-cost-solution
def _workshop_check():
    import contextlib, inspect, io
    if "total_cost" not in globals():
        print("The function total_cost does not exist yet. Write it under the comment in the new cell. Its first line is def total_cost(basket, price_list) with a colon at the end. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["total_cost"]
    if not callable(function):
        print("The name total_cost is not a function. It refers to another value, so a line in a cell gave that name a value with the symbol =. Define the function with a line that begins with def. The line is def total_cost(basket, price_list) with a colon at the end. Then run the cell again.")
        return False
    try:
        inspect.signature(function).bind({}, {})
    except TypeError:
        print("The function total_cost must have two parameters: basket and price_list. Write both names between the parentheses of the def line, with a comma between them. The line is def total_cost(basket, price_list) with a colon at the end. Then run the cell again.")
        return False
    except ValueError:
        pass
    price_list = {"bread": 3, "milk": 2, "eggs": 4}
    cases = [({"bread": 2, "milk": 1}, 8), ({"eggs": 3, "bread": 1}, 15), ({}, 0), ({"milk": 5}, 10)]
    for basket, expected in cases:
        call = f"total_cost({basket!r}, {price_list!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(dict(basket), dict(price_list))
        except ValueError:
            print(f"The function total_cost stopped with a ValueError when the check called {call}. That usually means that the loop has two loop names but the loop is over the dictionary and not over its items. Write basket.items() in the loop line, with the parentheses. Then run the cell again.")
            return False
        except KeyError:
            print(f"The function total_cost stopped with a KeyError when the check called {call}. A KeyError means that the function looked up a key that is not in the dictionary. Look up the price with the name of the product, which is the first loop name: price_list[product]. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function total_cost stopped with a {type(error).__name__} when the check called {call}. Run a cell that calls the function in the same way, and read the last line of the error message. Correct the function. Then run the cell again.")
            return False
        if result is None and shown.getvalue().strip() == str(expected):
            print(f"The function total_cost shows the result with print(), but it does not return it. {call} shows {expected} on the screen and gives None back. Replace the print() line with a return line: return total. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {expected}. A function gives None when it has no return line. Add a return line after the loop, with four spaces: return total. Then run the cell again.")
            return False
        if result != expected and len(basket) > 1 and result == list(basket.values())[0] * price_list[list(basket)[0]]:
            print(f"{call} gives {result!r} but it must give {expected}. That is the cost of the first product only. The return line is inside the loop, so the function ends in the first pass. Give the return line four spaces and not eight, so that it runs after the loop. Then run the cell again.")
            return False
        if result != expected and result == sum(basket.values()):
            print(f"{call} gives {result!r} but it must give {expected}. That is the quantities added together. Multiply each quantity by the price of the product before you add it: total = total + quantity * price_list[product]. Then run the cell again.")
            return False
        if result != expected:
            print(f"{call} gives {result!r} but it must give {expected}. For each product in basket, multiply the quantity by price_list[product], and add the result to the total. Use the parameters basket and price_list, and no other dictionary. Then run the cell again.")
            return False
    print("Correct. Your function loops over the items of the basket, and returns the total cost. For example, total_cost({'bread': 2, 'milk': 1}, {'bread': 3, 'milk': 2, 'eggs': 4}) gives 8.")
    return True
globals().pop("_workshop_check")()
```

## Use your function

A function is useful when other code calls it. The action below adds
a cell that calls `total_cost` with a basket and a price list. Run
the cell yourself: click inside it, hold `Shift` and press `Enter`.

```{cell-insert}
:id: insert-use-total-cost
:title: Add a cell that calls my function
:path: {{ notebook }}
:tags: [use-total-cost]
:run: false
shopping = {"rice": 2, "tea": 1, "soap": 3}
shop_prices = {"rice": 5, "tea": 4, "soap": 2, "salt": 1}
print(total_cost(shopping, shop_prices))
```

The output is `20`: two times `5`, one time `4`, and three times `2`.
Change the quantities in `shopping` and run the cell again, to see a
different total.
