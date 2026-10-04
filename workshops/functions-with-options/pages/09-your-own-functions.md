---
title: Two functions of your own
requires: [verify:camping-functions]
---

# Two functions of your own

On this page you write two functions yourself, from nothing. They use
every idea of this workshop: default values, a keyword argument,
docstrings, and a function that calls another function.

## The problem

Some friends stay at a campsite. The campsite asks one price for each
night, for the whole group. One night usually costs 30. The friends
divide the cost equally between them. Usually two people go.

## What the program must do

Write these three parts, in this order.

**The first function** calculates the cost of a number of nights.

- Its name is `nights_cost`.

- It has two parameters. The first is named `nights`. The second is
  named `price`, and it has the default value `30`.

- It has a docstring that says what the function returns.

- It returns `nights` multiplied by `price`.

**The second function** calculates the cost for each person.

- Its name is `cost_per_person`.

- It has three parameters. The first is named `nights`. The second is
  named `price`, and it has the default value `30`. The third is named
  `people`, and it has the default value `2`.

- It has a docstring that says what the function returns.

- It calls `nights_cost()` to get the cost of the nights, and it
  returns that cost divided by `people`. Use the operator `/` to
  divide.

**The last two lines** use the functions. Six nights for four people,
at the default price:

- Call `cost_per_person()` with `6` as a positional argument and
  `people=4` as a keyword argument. Give the result the name `share`.

- Show the value of `share` with `print()`.

These examples show some calls, and the value that each call returns:

| Call | Return value |
|------|--------------|
| `nights_cost(2)` | `60` |
| `nights_cost(2, 10)` | `20` |
| `cost_per_person(4)` | `60.0` |
| `cost_per_person(4, people=4)` | `30.0` |
| `cost_per_person(4, 20, 2)` | `40.0` |

The operator `/` always gives a float, so the results of
`cost_per_person()` have a decimal point.

When the program is correct, the output under the cell is:

```
45.0
```

## Where to write it

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-camping
:title: Add a cell for my two functions
:path: {{ notebook }}
:tags: [camping]
:run: false
# Write your two functions and your two lines below this one.

```

Leave an empty line between the two functions, and one more before
the last two lines. The empty lines make the cell easier to read. The
last two lines begin with no spaces, because they are not in the body
of a function.

Run the cell when you have written a part of the program, and click
`Check` to see whether that part is correct. You can try as many
times as you like.

## If you need help

```{hint}
:title: Hint: the first function
The first function has the same form as `ticket_total` on the last
page. It has a `def` line with two parameters, a docstring, and a
`return` line: `def nights_cost(nights, price=30):`, then
`"""Return the cost of the nights."""`, then
`return nights * price`. The second and third lines each begin with
four spaces.
```

```{hint}
:title: Hint: the second function
The `def` line is
`def cost_per_person(nights, price=30, people=2):`. The `return` line
calls the first function with two of the parameters as arguments, and
divides the return value by the third parameter:
`return nights_cost(nights, price) / people`.
```

```{hint}
:title: Hint: the last two lines
The call names the parameter that it wants to change, and leaves the
price at its default value: `share = cost_per_person(6, people=4)`.
The last line is `print(share)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: camping-not-started
:check: camping-functions
:expect: There is no function named nights_cost yet
```

````{attempt}
:id: camping-no-default
:check: camping-functions
:expect: The call nights_cost(2) stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def nights_cost(nights, price):
    """Return the cost of the nights."""
    return nights * price
```
````

````{attempt}
:id: camping-prints
:check: camping-functions
:expect: nights_cost(2, 10) gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def nights_cost(nights, price=30):
    """Show the cost of the nights."""
    print(nights * price)
```
````

````{attempt}
:id: camping-adds
:check: camping-functions
:expect: nights_cost(2, 10) gives 12 but it must give 20

```{cell-insert}
:path: {{ notebook }}
:run: true
def nights_cost(nights, price=30):
    """Return the cost of the nights."""
    return nights + price
```
````

````{attempt}
:id: camping-other-name
:check: camping-functions
:expect: The call nights_cost(3, price=5) stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def nights_cost(nights, cost=30):
    """Return the cost of the nights."""
    return nights * cost
```
````

````{attempt}
:id: camping-one-function
:check: camping-functions
:expect: There is no function named cost_per_person yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def nights_cost(nights, price=30):
    """Return the cost of the nights."""
    return nights * price
```
````

````{attempt}
:id: camping-price-not-given
:check: camping-functions
:expect: cost_per_person(4, 20, 2) gives 60.0 but it must give 40.0

```{cell-insert}
:path: {{ notebook }}
:run: true
def cost_per_person(nights, price=30, people=2):
    """Return the cost of the nights for each person."""
    return nights_cost(nights) / people
```
````

````{attempt}
:id: camping-wrong-people
:check: camping-functions
:expect: cost_per_person(4) gives 120.0 but it must give 60.0

```{cell-insert}
:path: {{ notebook }}
:run: true
def cost_per_person(nights, price=30, people=1):
    """Return the cost of the nights for each person."""
    return nights_cost(nights, price) / people
```
````

````{attempt}
:id: camping-no-docstring
:check: camping-functions
:expect: The function cost_per_person works, but it has no docstring

```{cell-insert}
:path: {{ notebook }}
:run: true
def cost_per_person(nights, price=30, people=2):
    return nights_cost(nights, price) / people
```
````

````{attempt}
:id: camping-no-share
:check: camping-functions
:expect: The name share does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def cost_per_person(nights, price=30, people=2):
    """Return the cost of the nights for each person."""
    return nights_cost(nights, price) / people

print(cost_per_person(6, people=4))
```
````

````{attempt}
:id: camping-share-positional
:check: camping-functions
:expect: The value 4 went to the parameter price

```{cell-insert}
:path: {{ notebook }}
:run: true
share = cost_per_person(6, 4)
print(share)
```
````

````{attempt}
:id: camping-share-wrong
:check: camping-functions
:expect: The name share refers to 90.0 but it must refer to 45.0

```{cell-insert}
:path: {{ notebook }}
:run: true
share = cost_per_person(6)
print(share)
```
````

````{attempt}
:id: camping-other-way
:check: camping-functions
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def nights_cost(nights, price=30):
    """Return the cost of a number of nights at the campsite.

    One night costs 30 when the call gives no price.
    """
    cost = nights * price
    return cost

def cost_per_person(nights, price=30, people=2):
    """Return the cost of the nights for one person."""
    cost = nights_cost(nights, price=price)
    return cost / people

share = cost_per_person(people=4, nights=6)
print(share)
```
````

````{hint}
:title: Show me a solution
:unlock: "camping-functions" in failed_checks or "camping-functions" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-camping-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [camping-solution]
:run: true
def nights_cost(nights, price=30):
    """Return the cost of the nights."""
    return nights * price

def cost_per_person(nights, price=30, people=2):
    """Return the cost of the nights for each person."""
    return nights_cost(nights, price) / people

share = cost_per_person(6, people=4)
print(share)
```
````

```{verify}
:id: camping-functions
:label: Your two functions calculate the cost for each person
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed camping; cell-executed camping-solution
def _workshop_check():
    import contextlib, io
    shown = io.StringIO()
    steps = (
        ("nights_cost", "nights_cost(2, 10)", (2, 10), {}, 20, "The function must have two parameters and multiply them. The def line must be def nights_cost(nights, price=30): and the last line of the body must be return nights * price."),
        ("nights_cost", "nights_cost(2)", (2,), {}, 60, "The call gives one argument, so the parameter price needs the default value 30: def nights_cost(nights, price=30):"),
        ("nights_cost", "nights_cost(3, price=5)", (3,), {"price": 5}, 15, "The second parameter must have the name price, so that a call can name it: def nights_cost(nights, price=30):"),
        ("cost_per_person", "cost_per_person(4, 20, 2)", (4, 20, 2), {}, 40.0, "The function must have three parameters. It must give nights and price to nights_cost() and divide the result by people: return nights_cost(nights, price) / people."),
        ("cost_per_person", "cost_per_person(4)", (4,), {}, 60.0, "The parameter price must have the default value 30, and the parameter people must have the default value 2: def cost_per_person(nights, price=30, people=2):"),
        ("cost_per_person", "cost_per_person(4, people=4)", (4,), {"people": 4}, 30.0, "The third parameter must have the name people, so that a call can name it: def cost_per_person(nights, price=30, people=2):"),
    )
    for name, call, args, kwargs, expected, advice in steps:
        function = globals().get(name)
        if not callable(function):
            print(f"There is no function named {name} yet. Write it in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
            return False
        try:
            with contextlib.redirect_stdout(shown):
                result = function(*args, **kwargs)
        except Exception as error:
            print(f"The call {call} stopped with a {type(error).__name__}. {advice} Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None. That means the body of {name} has no line that begins with return, or it shows the result with print() and does not return it. The last line of the body must begin with the word return. Then run the cell again.")
            return False
        if result != expected:
            print(f"{call} gives {result!r} but it must give {expected!r}. {advice} Then run the cell again.")
            return False
    for name in ("nights_cost", "cost_per_person"):
        text = getattr(globals()[name], "__doc__", None)
        if not isinstance(text, str) or text.strip() == "":
            print(f"The function {name} works, but it has no docstring. Add a string that says what the function returns as the first line of its body, directly under the def line, with three double quote characters on each side. Then run the cell again.")
            return False
    if "share" not in globals():
        print("Both functions work. The name share does not exist yet. Under the functions, add the line share = cost_per_person(6, people=4) and then the line print(share). Then run the cell again.")
        return False
    share = globals()["share"]
    if share == 12.0:
        print("The name share refers to 12.0. The value 4 went to the parameter price, because the second positional argument goes to the second parameter. Name the parameter in the call: share = cost_per_person(6, people=4). Then run the cell again.")
        return False
    if share != 45.0:
        print(f"The name share refers to {share!r} but it must refer to 45.0. Six nights at the default price cost 180, and 180 divided by 4 people is 45.0. The line must be share = cost_per_person(6, people=4). Then run the cell again.")
        return False
    print("Correct. Both functions work and have docstrings, and each of the 4 people pays 45.0 for 6 nights.")
    return True
globals().pop("_workshop_check")()
```
