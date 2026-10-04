---
title: A default value
requires: [quiz:predict-default, verify:quantity-default]
---

# A default value

A parameter can have a **default value**: a value that Python uses
for the parameter when the call gives no argument for it.

A default value is useful when one value is the usual one. Most
greetings begin with `Hello`. Without a default value, every call
must give `"Hello"` again. With a default value, a call gives the
greeting only when it wants a different one.

A cafe is a good comparison. When you order a coffee and say nothing
about the size, you get the medium size. You name a size only when you
want a different one. The medium size is the default.

## How to write a default value

You write a default value in the `def` line. After the name of the
parameter, write the symbol `=` and then the value.

```python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

print(greet("Aiko"))
print(greet("Aiko", "Good evening"))
```

The output of this code is:

```
Hello, Aiko!
Good evening, Aiko!
```

## What happened

- In the `def` line, `greeting="Hello"` gives the parameter `greeting`
  the default value `"Hello"`. The parameter `name` has no default
  value.

- The call `greet("Aiko")` gives one argument. It goes to the first
  parameter, `name`. The call gives no argument for `greeting`, so
  Python uses the default value, `"Hello"`.

- The call `greet("Aiko", "Good evening")` gives two arguments. The
  second argument goes to `greeting`, and Python does not use the
  default value.

A call must always give an argument for a parameter that has no
default value. So `greet()`, with no argument, stops with an error:
Python has no value for `name`.

In the `def` line, the parameters that have a default value come
after the parameters that have none. Python does not accept
`def greet(greeting="Hello", name):`.

```{quiz}
:id: predict-default
:type: text
:title: Predict the output
question: 'The function `greet` is defined as above. What does `print(greet("Tariq"))` show?'
answer: "Hello, Tariq!"
wrong:
  - { text: "Hello, Tariq", explanation: "The words are correct. The f-string also has an exclamation mark at its end, and Python keeps it." }
  - { text: "Tariq", explanation: "The function returns the whole f-string: the greeting, a comma, a space, the name and an exclamation mark." }
  - { pattern: "[\"'].*[\"']", explanation: "`print()` shows a string without its quotes. Type the text only." }
  - { pattern: ", Tariq!?", explanation: "The call gives no greeting, but the parameter `greeting` is not empty. Python uses its default value." }
otherwise: "The call gives one argument, which goes to `name`. The parameter `greeting` gets its default value. Put the two values in the f-string."
explanation: "The call gives no argument for `greeting`, so Python uses the default value `\"Hello\"`. The f-string gives `Hello, Tariq!`."
```

## Your task

The action below adds a cell that holds a function for a shop. The
function calculates the price of a number of items. The action does
not run the cell.

```{cell-insert}
:id: insert-quantity
:title: Add a cell with the function total_price for me to change
:path: {{ notebook }}
:tags: [quantity]
:run: false
def total_price(price, quantity):
    return price * quantity

print(total_price(4, 3))
print(total_price(4))
```

The last line calls the function with one argument, but the function
has two parameters and no default value. If you run the cell now,
Python shows `12` and then stops at the last line with a `TypeError`.
The last line of the error message is:

```
TypeError: total_price() missing 1 required positional argument: 'quantity'
```

The message says that the call gave no value for `quantity`.

Most customers buy one of an item. Change the `def` line so that the
parameter `quantity` has the default value `1`. Do not change the
other lines. Then run the cell. The output must be:

```
12
4
```

```{hint}
:title: Hint: where does the default value go?
The default value goes in the `def` line, directly after the name of
the parameter. Look at `greeting="Hello"` in the function `greet`
above. Your parameter is `quantity`, and its default value is the
number `1`.
```

```{hint}
:title: Hint: the complete line
The first line of the cell must be
`def total_price(price, quantity=1):`. Check that the colon is still
at the end of the line.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: quantity-not-started
:check: quantity-default
:expect: There is no function named total_price yet
```

````{attempt}
:id: quantity-unchanged
:check: quantity-default
:expect: so the parameter quantity needs a default value

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_price(price, quantity):
    return price * quantity

print(total_price(4, 3))
```
````

````{attempt}
:id: quantity-misspelled
:check: quantity-default
:expect: stopped with a NameError when the check called total_price(4, 3)

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_price(price, quantity=1):
    return price * quantty
```
````

````{attempt}
:id: quantity-wrong-default
:check: quantity-default
:expect: total_price(5) gives 0 but it must give 5

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_price(price, quantity=0):
    return price * quantity

print(total_price(4, 3))
print(total_price(4))
```
````

````{attempt}
:id: quantity-wrong-body
:check: quantity-default
:expect: total_price(4, 3) gives 7 but it must give 12

```{cell-insert}
:path: {{ notebook }}
:run: true
def total_price(price, quantity=1):
    return price + quantity

print(total_price(4, 3))
print(total_price(4))
```
````

````{hint}
:title: Show me a solution
:unlock: "quantity-default" in failed_checks or "quantity-default" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-quantity-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [quantity-solution]
:run: true
def total_price(price, quantity=1):
    return price * quantity

print(total_price(4, 3))
print(total_price(4))
```
````

```{verify}
:id: quantity-default
:label: The parameter quantity has the default value 1
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed quantity; cell-executed quantity-solution
def _workshop_check():
    import contextlib, io
    function = globals().get("total_price")
    if not callable(function):
        print("There is no function named total_price yet. Change the def line in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown):
            two = function(4, 3)
    except Exception as error:
        print(f"The function total_price stopped with a {type(error).__name__} when the check called total_price(4, 3). The function must still work with two arguments. The def line must be def total_price(price, quantity=1): and the body must be return price * quantity. Then run the cell again.")
        return False
    try:
        with contextlib.redirect_stdout(shown):
            one = function(5)
    except Exception as error:
        print(f"The call total_price(5) stopped with a {type(error).__name__}. The call gives one argument, so the parameter quantity needs a default value. Change the def line to def total_price(price, quantity=1): Then run the cell again.")
        return False
    if two != 12:
        print(f"total_price(4, 3) gives {two!r} but it must give 12. Do not change the body of the function. It must be return price * quantity. Then run the cell again.")
        return False
    if one != 5:
        print(f"total_price(5) gives {one!r} but it must give 5. The default value of quantity must be 1, so that a call with one argument gives the price of one item. Then run the cell again.")
        return False
    print("Correct. total_price(4, 3) gives 12, and total_price(5) gives 5, because quantity has the default value 1.")
    return True
globals().pop("_workshop_check")()
```

The function now works for both calls. A call that gives a quantity
uses it, and a call that gives none gets the usual value.
