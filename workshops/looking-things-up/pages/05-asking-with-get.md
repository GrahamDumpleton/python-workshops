---
title: Asking with get
requires: [verify:points-ran, quiz:predict-points, verify:points-default-ran, verify:price-of]
---

# Asking with get

Sometimes a program does not know whether a key is in a dictionary,
and a missing key is not a mistake. Think of a shop that keeps a
dictionary of the points that each customer has collected. A new
customer has no pair in the dictionary yet. The program must not stop
with a `KeyError` for a new customer. The answer for that customer is
"no points".

For this, a dictionary has the method `get()`. A **method** is a
function that belongs to a value. You write it after the value, with a
dot between them, as you did with `name.upper()` for a string.

`get()` looks up a key, as square brackets do. The difference is what
happens when the key does not exist: `get()` does not stop with an
error. It gives a value that means "nothing was found".

Think of two ways to ask for a book in a library. Square brackets are
like a demand: "Give me this book." If the library does not have the
book, the request fails. `get()` is like a question: "Do you have this
book?" The answer can be "no", and you continue.

## What get gives for a missing key

Click the action below. It adds a cell that uses `get()` two times,
and runs it. The dictionary has a pair for Chen, and no pair for
Diego.

```{attempt}
:id: points-not-run
:check: points-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-points
:title: Add a cell that uses get with a key that exists and a key that does not, and run it
:path: {{ notebook }}
:tags: [points]
:run: true
points = {"Chen": 12, "Fatima": 9}
print(points.get("Chen"))
print(points.get("Diego"))
```

The output is:

```
12
None
```

```{verify}
:id: points-ran
:label: The cell used get with two keys
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed points
if globals().get("points") == {"Chen": 12, "Fatima": 9}:
    print("The cell ran. The method get gave 12 for the key Chen, and None for the key Diego, which is not in the dictionary.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("points") == {"Chen": 12, "Fatima": 9}
```

The key `"Chen"` exists, so `points.get("Chen")` gives its value,
`12`. This is the same result as `points["Chen"]`.

The key `"Diego"` does not exist, so `points.get("Diego")` gives
`None`. `None` is the value that Python uses to mean "no value". There
was no error message, and the dictionary did not change.

## A value of your choice for a missing key

`None` is often not the value that you want. You cannot add `None` to
a number, for example. So `get()` takes a second argument: the value
to give when the key does not exist. This value is called the
**default**. A default is a value that is used when no other value is
given.

```python
points.get("Diego", 0)
```

This line means: "Give me the value of the key `"Diego"`. If that key
does not exist, give me `0`."

Look at this cell. Do not run it yet.

```python
scores = {"Chen": 12, "Fatima": 9}
print(scores.get("Diego", 0))
print(scores.get("Chen", 0))
```

The first line of output is `0`, because the key `"Diego"` does not
exist.

```{quiz}
:id: predict-points
:type: text
:title: Predict the second line
question: "What is the second line of output, from `print(scores.get(\"Chen\", 0))`?"
answer: "12"
wrong:
  - { text: "0", explanation: "The default `0` is used only when the key does not exist. The key `\"Chen\"` exists, so `get()` gives its value." }
  - { text: "None", explanation: "`get()` gives `None` only when the key does not exist and no default is given. The key `\"Chen\"` exists." }
  - { text: "Chen", explanation: "`\"Chen\"` is the key. `get()` gives the value that belongs to the key." }
otherwise: 'The key `"Chen"` is in the dictionary. What value does the dictionary keep for it?'
explanation: 'The key `"Chen"` exists, so `get()` gives its value, `12`. The default is not used.'
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: points-default-not-run
:check: points-default-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-points-default
:title: Add the cell that uses get with a default, and run it
:path: {{ notebook }}
:tags: [points-default]
:run: true
scores = {"Chen": 12, "Fatima": 9}
print(scores.get("Diego", 0))
print(scores.get("Chen", 0))
```

```{verify}
:id: points-default-ran
:label: The cell used get with a default
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed points-default
if globals().get("scores") == {"Chen": 12, "Fatima": 9}:
    print("The cell ran. The method get gave the default 0 for the key Diego, and the value 12 for the key Chen.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("scores") == {"Chen": 12, "Fatima": 9}
```

`get()` never changes the dictionary. After this cell, the dictionary
`scores` still has no pair for Diego.

## Your task

Write a function that gives the price of an item from a dictionary of
prices. An item that is not in the dictionary has the price `0`.

A reminder about functions: the line that begins with `def` gives the
name of the function and its **parameters**, which are the names for
the values that the function is given. The lines of the function begin
with four spaces. The line that begins with `return` gives the result
back.

Your function must be like this:

- Its name is `price_of`.

- It has two parameters, in this order: `prices`, which is a
  dictionary, and `item`, which is a key.

- It returns the value of the key `item` in the dictionary `prices`.
  When the key does not exist, it returns `0`.

Two examples, with the dictionary `{"tea": 2, "soup": 4}`:

| Call | Return value |
|------|--------------|
| `price_of({"tea": 2, "soup": 4}, "soup")` | `4` |
| `price_of({"tea": 2, "soup": 4}, "cake")` | `0` |

The function must work with any dictionary and any key, not only with
these.

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-price-of
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [price-of]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`. The cell shows no
output, because it only defines the function. The check calls your
function with several dictionaries and keys.

```{hint}
:title: Hint: how to begin
The first line of your function is `def price_of(prices, item):`. The
function needs only one more line, which begins with four spaces and
with the word `return`.
```

```{hint}
:title: Hint: the line that returns
Inside the function, the dictionary has the name `prices` and the key
has the name `item`. Use `get()` with the default `0`:
`return prices.get(item, 0)`. Write `item` without quotes, because it
is a name and not a string.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: price-of-not-started
:check: price-of
:expect: The function price_of does not exist yet
```

````{attempt}
:id: price-of-not-a-function
:check: price-of
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
price_of = {"tea": 2, "soup": 4}.get("soup", 0)
```
````

````{attempt}
:id: price-of-one-parameter
:check: price-of
:expect: but it has 1

```{cell-insert}
:path: {{ notebook }}
:run: true
def price_of(item):
    return {"tea": 2, "soup": 4}.get(item, 0)
```
````

````{attempt}
:id: price-of-square-brackets
:check: price-of
:expect: stopped with a KeyError

```{cell-insert}
:path: {{ notebook }}
:run: true
def price_of(prices, item):
    return prices[item]
```
````

````{attempt}
:id: price-of-prints
:check: price-of
:expect: shows the price with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def price_of(prices, item):
    print(prices.get(item, 0))
```
````

````{attempt}
:id: price-of-no-default
:check: price-of
:expect: gives None but it must give 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def price_of(prices, item):
    return prices.get(item)
```
````

````{attempt}
:id: price-of-no-return
:check: price-of
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def price_of(prices, item):
    price = prices.get(item, 0)
```
````

````{attempt}
:id: price-of-other-error
:check: price-of
:expect: stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def price_of(prices, item):
    return prices.get(item, 0) + "0"
```
````

````{attempt}
:id: price-of-quoted-item
:check: price-of
:expect: gives 0 but it must give 4

```{cell-insert}
:path: {{ notebook }}
:run: true
def price_of(prices, item):
    return prices.get("item", 0)
```
````

````{attempt}
:id: price-of-with-if
:check: price-of
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def price_of(prices, item):
    if item in prices:
        return prices[item]
    return 0
```
````

````{hint}
:title: Show me a solution
:unlock: "price-of" in failed_checks or "price-of" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-price-of-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [price-of-solution]
:run: true
def price_of(prices, item):
    return prices.get(item, 0)

print(price_of({"tea": 2, "soup": 4}, "soup"))
print(price_of({"tea": 2, "soup": 4}, "cake"))
```
````

```{verify}
:id: price-of
:label: Your function gives the price, or 0 for a missing key
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed price-of; cell-executed price-of-solution
def _workshop_check():
    import contextlib, inspect, io
    if "price_of" not in globals():
        print("The function price_of does not exist yet. Write it under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    price_of = globals()["price_of"]
    if not callable(price_of):
        print("The name price_of exists, but its value is not a function. Begin your cell with the line def price_of(prices, item): and write the line that returns under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(price_of).parameters)
    except (TypeError, ValueError):
        count = 2
    if count != 2:
        print(f"The function price_of must have two parameters, the dictionary and then the key, but it has {count}. Make the first line def price_of(prices, item): and use only those two names inside the function. Then run the cell again.")
        return False
    cases = [
        ({"tea": 2, "soup": 4}, "soup", 4),
        ({"tea": 2, "soup": 4}, "cake", 0),
        ({"pen": 7, "ink": 15}, "ink", 15),
        ({"pen": 7, "ink": 15}, "tea", 0),
    ]
    for prices, item, expected in cases:
        call = f"price_of({prices!r}, {item!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = price_of(dict(prices), item)
        except KeyError:
            print(f"The function price_of stopped with a KeyError when the check called {call}. The key is not in the dictionary, and square brackets cannot look up a key that does not exist. Use get() with the default 0 instead. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function price_of stopped with a {type(error).__name__} when the check called {call}. Run the same call in a cell of your own, and read the error message from the last line. Then correct the function and run the cell again.")
            return False
        if result is None and shown.getvalue().strip() == str(expected):
            print("The function price_of shows the price with print(), but it does not return it. The code that calls the function gets None. Replace print() with a line that begins with return. Then run the cell again.")
            return False
        if result is None and expected == 0:
            print(f"{call} gives None but it must give 0. The key is not in the dictionary. Give get() a second argument, the default 0, so that a missing key gives 0. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {expected}. A function with no return line gives None. Add a line that begins with return and gives the value from the dictionary. Then run the cell again.")
            return False
        if result != expected:
            print(f"{call} gives {result!r} but it must give {expected}. Look up the key with the parameter item, written without quotes, in the dictionary prices. Then run the cell again.")
            return False
    print("Correct. Your function gives the price of an item that is in the dictionary, and 0 for an item that is not.")
    return True
globals().pop("_workshop_check")()
```
