---
title: Your own function
requires: [verify:basket-cost]
---

# Your own function

On this page you write a function that uses a dictionary and a list
together. It uses three things that you know: a lookup that is safe
when a key does not exist, a loop that adds up a total, and a function
that returns its result.

There is no new idea on this page, and there is no cell to copy from.
Read the task with care before you start.

## Your task

A shop keeps its prices in a dictionary. Each key is the name of an
item, and the value is the price of one of that item. A customer has a
basket, which is a list of the names of the items that the customer
takes. The same name can be in the list more than one time.

Write a function that calculates the cost of a basket.

Your function must be like this:

- Its name is `basket_cost`.

- It has two parameters, in this order: `prices`, which is the
  dictionary of prices, and `basket`, which is the list of names.

- It returns the total of the prices of all the items in `basket`.

- An item of the basket that is not a key of `prices` adds `0` to the
  total. The function must not stop with a `KeyError`.

- A basket that is an empty list has the cost `0`.

Three examples:

| Call | Return value | Why |
|------|--------------|-----|
| `basket_cost({"bread": 3, "milk": 2}, ["milk", "milk", "bread"])` | `7` | 2 + 2 + 3 |
| `basket_cost({"bread": 3, "milk": 2}, ["bread", "salt"])` | `3` | 3 + 0, because `"salt"` is not a key |
| `basket_cost({"bread": 3, "milk": 2}, [])` | `0` | the basket is empty |

The function must work with any dictionary of prices and any list,
not only with these.

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-basket-cost
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [basket-cost]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`.

A cell that only defines a function shows no output. To try your
function, add a line under it that calls the function and shows the
result. This line begins without spaces, so it is not part of the
function:

```python
print(basket_cost({"bread": 3, "milk": 2}, ["milk", "milk", "bread"]))
```

The check calls your function with several dictionaries and lists.

```{hint}
:title: Hint: the parts of the function
The function has four parts. The first line is
`def basket_cost(prices, basket):`. Then a total starts from `0`. Then
a `for` loop over `basket` adds the price of each item to the total.
After the loop, a line returns the total.
```

```{hint}
:title: Hint: the price of one item
Inside the loop, the loop name refers to the name of one item. If the
loop is `for item in basket:`, the price of that item is
`prices.get(item, 0)`. The default `0` is the price of an item that is
not a key. Add that price to the total:
`total = total + prices.get(item, 0)`.
```

```{hint}
:title: Hint: where the return line goes
The line `return total` comes after the loop. It begins with four
spaces, because it is part of the function. It does not begin with
eight spaces, because it is not part of the loop. A `return` line
inside the loop would end the function in the first pass.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: basket-cost-not-started
:check: basket-cost
:expect: The function basket_cost does not exist yet
```

````{attempt}
:id: basket-cost-not-a-function
:check: basket-cost
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
basket_cost = 7
```
````

````{attempt}
:id: basket-cost-one-parameter
:check: basket-cost
:expect: but it has 1

```{cell-insert}
:path: {{ notebook }}
:run: true
def basket_cost(basket):
    total = 0
    for item in basket:
        total = total + {"bread": 3, "milk": 2}.get(item, 0)
    return total
```
````

````{attempt}
:id: basket-cost-square-brackets
:check: basket-cost
:expect: stopped with a KeyError

```{cell-insert}
:path: {{ notebook }}
:run: true
def basket_cost(prices, basket):
    total = 0
    for item in basket:
        total = total + prices[item]
    return total
```
````

````{attempt}
:id: basket-cost-get-no-default
:check: basket-cost
:expect: stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def basket_cost(prices, basket):
    total = 0
    for item in basket:
        total = total + prices.get(item)
    return total
```
````

````{attempt}
:id: basket-cost-prints
:check: basket-cost
:expect: shows the total with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def basket_cost(prices, basket):
    total = 0
    for item in basket:
        total = total + prices.get(item, 0)
    print(total)
```
````

````{attempt}
:id: basket-cost-no-return
:check: basket-cost
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def basket_cost(prices, basket):
    total = 0
    for item in basket:
        total = total + prices.get(item, 0)
```
````

````{attempt}
:id: basket-cost-return-in-loop
:check: basket-cost
:expect: That is the price of the first item only

```{cell-insert}
:path: {{ notebook }}
:run: true
def basket_cost(prices, basket):
    total = 0
    for item in basket:
        total = total + prices.get(item, 0)
        return total
```
````

````{attempt}
:id: basket-cost-counts-items
:check: basket-cost
:expect: gives 3 but it must give 7

```{cell-insert}
:path: {{ notebook }}
:run: true
def basket_cost(prices, basket):
    total = 0
    for item in basket:
        total = total + 1
    return total
```
````

````{attempt}
:id: basket-cost-with-if
:check: basket-cost
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def basket_cost(prices, basket):
    cost = 0
    for name in basket:
        if name in prices:
            cost = cost + prices[name]
    return cost
```
````

````{hint}
:title: Show me a solution
:unlock: "basket-cost" in failed_checks or "basket-cost" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-basket-cost-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [basket-cost-solution]
:run: true
def basket_cost(prices, basket):
    total = 0
    for item in basket:
        total = total + prices.get(item, 0)
    return total

print(basket_cost({"bread": 3, "milk": 2}, ["milk", "milk", "bread"]))
print(basket_cost({"bread": 3, "milk": 2}, ["bread", "salt"]))
print(basket_cost({"bread": 3, "milk": 2}, []))
```
````

```{verify}
:id: basket-cost
:label: Your function gives the cost of a basket
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed basket-cost; cell-executed basket-cost-solution
def _workshop_check():
    import contextlib, inspect, io
    if "basket_cost" not in globals():
        print("The function basket_cost does not exist yet. Write it under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    basket_cost = globals()["basket_cost"]
    if not callable(basket_cost):
        print("The name basket_cost exists, but its value is not a function. Begin your cell with the line def basket_cost(prices, basket): and write the lines of the function under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(basket_cost).parameters)
    except (TypeError, ValueError):
        count = 2
    if count != 2:
        print(f"The function basket_cost must have two parameters, the dictionary and then the list, but it has {count}. Make the first line def basket_cost(prices, basket): and use only those two names for the dictionary and the list. Then run the cell again.")
        return False
    cases = [
        ({"bread": 3, "milk": 2}, ["milk", "milk", "bread"], 7),
        ({"bread": 3, "milk": 2}, ["bread", "salt"], 3),
        ({"bread": 3, "milk": 2}, [], 0),
        ({"pen": 7, "ink": 15}, ["ink", "pen", "ink", "cup"], 37),
    ]
    for prices, basket, expected in cases:
        call = f"basket_cost({prices!r}, {basket!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = basket_cost(dict(prices), list(basket))
        except KeyError:
            print(f"The function basket_cost stopped with a KeyError when the check called {call}. An item of the basket is not a key of the dictionary, and square brackets cannot look up a key that does not exist. Use get() with the default 0 instead. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function basket_cost stopped with a {type(error).__name__} when the check called {call}. If you use get(), give it the default 0, because Python cannot add None to a number. You can also run the same call in a cell of your own, and read the error message from the last line. Then correct the function and run the cell again.")
            return False
        if result is None and shown.getvalue().strip() == str(expected):
            print("The function basket_cost shows the total with print(), but it does not return it. The code that calls the function gets None. Replace print() with a line that begins with return. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {expected}. A function with no return line gives None. After the loop, add a line that begins with four spaces and returns the total. Then run the cell again.")
            return False
        if result != expected and len(basket) > 1 and result == prices.get(basket[0], 0):
            print(f"{call} gives {result!r} but it must give {expected}. That is the price of the first item only. The return line is probably inside the loop, so the function ends in the first pass. Give the return line four spaces and not eight, so that it runs after the loop. Then run the cell again.")
            return False
        if result != expected:
            print(f"{call} gives {result!r} but it must give {expected}. Start a total from 0 before the loop. In the loop, add the price of each item, which is the value of that item in the dictionary prices, or 0 when the item is not a key. Return the total after the loop. Then run the cell again.")
            return False
    print("Correct. Your function adds up the prices of the items in a basket, and an item that has no price adds 0.")
    return True
globals().pop("_workshop_check")()
```
