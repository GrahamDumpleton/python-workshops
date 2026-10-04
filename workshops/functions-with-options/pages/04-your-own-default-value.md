---
title: Your own default value
requires: [verify:delivery-function]
---

# Your own default value

On the last page you added a default value to a function that was
already written. On this page you write a complete function that has
a default value.

To repeat the idea: a **default value** is the value that Python uses
for a parameter when the call gives no argument for it. You write it
in the `def` line, after the name of the parameter and the symbol `=`.

## The problem

A shop sends orders to the homes of its customers. The shop adds the
cost of the delivery to the total of each order. The delivery usually
costs 5. A delivery to a place that is far away costs more.

## What the function must do

Write a function that follows these rules exactly:

- The name of the function is `with_delivery`.

- It has two parameters. The first is named `total`. The second is
  named `delivery`, and it has the default value `5`.

- It returns `total` plus `delivery`.

Under the function, write one more line that shows the result of a
call: `print(with_delivery(20))`.

These examples show some calls, and the value that each call returns:

| Call | Return value |
|------|--------------|
| `with_delivery(20)` | `25` |
| `with_delivery(20, 8)` | `28` |

When your cell is correct, the output under it is:

```
25
```

## Where to write it

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-delivery
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [delivery]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type the `def` line.
Press `Enter` at the end of the line. The notebook starts the next
line with four spaces for you, because the line belongs to the body.
When you have written the function, start a new line that has no
spaces before it, and write the line with `print()`. Then run the
cell: hold `Shift` and press `Enter`.

If you see an error message, or the output is not what you expected,
change the cell and run it again. You can try as many times as you
like.

## If you need help

```{hint}
:title: Hint: the def line
The `def` line has the word `def`, the name of the function, and the
two parameters between parentheses, with a comma between them. The
second parameter has `=5` after its name. The line ends with a colon:
`def with_delivery(total, delivery=5):`.
```

```{hint}
:title: Hint: the body
The body has one line. It begins with four spaces and the word
`return`, and then the expression that adds the two parameters:
`return total + delivery`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: delivery-not-started
:check: delivery-function
:expect: There is no function named with_delivery yet
```

````{attempt}
:id: delivery-one-parameter
:check: delivery-function
:expect: The function with_delivery does not accept two arguments

```{cell-insert}
:path: {{ notebook }}
:run: true
def with_delivery(total):
    return total + 5

print(with_delivery(20))
```
````

````{attempt}
:id: delivery-misspelled
:check: delivery-function
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def with_delivery(total, delivery=5):
    return total + delivry
```
````

````{attempt}
:id: delivery-no-default
:check: delivery-function
:expect: so the parameter delivery needs a default value

```{cell-insert}
:path: {{ notebook }}
:run: true
def with_delivery(total, delivery):
    return total + delivery

print(with_delivery(20, 5))
```
````

````{attempt}
:id: delivery-prints
:check: delivery-function
:expect: but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def with_delivery(total, delivery=5):
    print(total + delivery)

with_delivery(20)
```
````

````{attempt}
:id: delivery-no-return
:check: delivery-function
:expect: The function with_delivery returns None

```{cell-insert}
:path: {{ notebook }}
:run: true
def with_delivery(total, delivery=5):
    cost = total + delivery

print(with_delivery(20))
```
````

````{attempt}
:id: delivery-multiplied
:check: delivery-function
:expect: with_delivery(20, 8) gives 160 but it must give 28

```{cell-insert}
:path: {{ notebook }}
:run: true
def with_delivery(total, delivery=5):
    return total * delivery

print(with_delivery(20))
```
````

````{attempt}
:id: delivery-wrong-default
:check: delivery-function
:expect: with_delivery(20) gives 28 but it must give 25

```{cell-insert}
:path: {{ notebook }}
:run: true
def with_delivery(total, delivery=8):
    return total + delivery

print(with_delivery(20))
```
````

````{attempt}
:id: delivery-other-way
:check: delivery-function
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def with_delivery(total, delivery=5):
    cost = delivery + total
    return cost

print(with_delivery(20))
```
````

````{hint}
:title: Show me a solution
:unlock: "delivery-function" in failed_checks or "delivery-function" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-delivery-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [delivery-solution]
:run: true
def with_delivery(total, delivery=5):
    return total + delivery

print(with_delivery(20))
```
````

```{verify}
:id: delivery-function
:label: The function with_delivery adds a delivery cost that has a default value
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed delivery; cell-executed delivery-solution
def _workshop_check():
    import contextlib, io
    function = globals().get("with_delivery")
    if not callable(function):
        print("There is no function named with_delivery yet. Write it under the comment in the new cell, and check the spelling of its name. Then hold Shift and press Enter to run the cell.")
        return False
    import inspect
    try:
        inspect.signature(function).bind(20, 8)
    except TypeError:
        print("The function with_delivery does not accept two arguments. It must have two parameters, total and delivery: def with_delivery(total, delivery=5): Then run the cell again.")
        return False
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown):
            two = function(20, 8)
            other = function(1, 2)
    except Exception as error:
        print(f"The function with_delivery stopped with a {type(error).__name__} when the check called with_delivery(20, 8). Check that the body uses the same names as the def line: total and delivery. Then run the cell again.")
        return False
    try:
        with contextlib.redirect_stdout(shown):
            one = function(20)
    except Exception as error:
        print(f"The call with_delivery(20) stopped with a {type(error).__name__}. The call gives one argument, so the parameter delivery needs a default value. Change the def line to def with_delivery(total, delivery=5): Then run the cell again.")
        return False
    if two is None and "28" in shown.getvalue():
        print("The function with_delivery shows the result with print(), but it does not return it. The code that calls the function gets None. Change the line in the body so that it begins with return: return total + delivery. Then run the cell again.")
        return False
    if two is None:
        print("The function with_delivery returns None. That means the body has no line that begins with return. Add the line return total + delivery to the body, with four spaces before it. Then run the cell again.")
        return False
    for call, result, expected in (("with_delivery(20, 8)", two, 28), ("with_delivery(1, 2)", other, 3)):
        if result != expected:
            print(f"{call} gives {result!r} but it must give {expected}. The function must add its two parameters: return total + delivery. Then run the cell again.")
            return False
    if one != 25:
        print(f"with_delivery(20) gives {one!r} but it must give 25. The default value of the parameter delivery must be 5. Then run the cell again.")
        return False
    print("Correct. with_delivery(20) gives 25, because delivery has the default value 5. with_delivery(20, 8) gives 28.")
    return True
globals().pop("_workshop_check")()
```
