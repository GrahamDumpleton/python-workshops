---
title: Returning two values
requires: [verify:film-ran, quiz:predict-return, verify:long-ran, verify:first-and-last]
---

# Returning two values

A **function** is a piece of code with a name. You define a function
with `def`, and the lines of the function run when you call it. The
line that begins with `return` ends the function and gives a value
back to the code that called it. That value is the **return value**.

A function has one return value. But some questions have an answer
with two parts. How long is a film of 135 minutes? The answer is 2
hours and 15 minutes. The two numbers belong together, and the
function must give both of them back.

A tuple solves this problem. A tuple is one value, so a function can
return it. The tuple holds the two parts of the answer.

Think of a question to a ticket office: "When does the train leave,
and from which platform?" You get one answer that has two parts.

## A function that returns a tuple

To return two values, write both after `return`, with a comma between
them. Python makes a tuple from values that have commas between them.
The parentheses are not needed here, and most programmers do not write
them after `return`.

Click the action below. It adds a cell that defines a function and
calls it. The operator `//` divides and gives the whole number of
times that `60` fits. The operator `%` gives the remainder, which is
the part that is left.

```{attempt}
:id: film-not-run
:check: film-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-film
:title: Add a cell with a function that returns two values, and run it
:path: {{ notebook }}
:tags: [film]
:run: true
def hours_and_minutes(total_minutes):
    hours = total_minutes // 60
    minutes = total_minutes % 60
    return hours, minutes

length = hours_and_minutes(135)
print(length)

film_hours, film_minutes = hours_and_minutes(135)
print(film_hours)
print(film_minutes)
```

The output is:

```
(2, 15)
2
15
```

```{verify}
:id: film-ran
:label: The function returned a tuple of two values
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed film
if globals().get("length") == (2, 15) and globals().get("film_hours") == 2 and globals().get("film_minutes") == 15:
    print("The cell ran. The function returned the tuple (2, 15), and the second call unpacked the tuple into two names.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("length") == (2, 15) and globals().get("film_hours") == 2 and globals().get("film_minutes") == 15
```

## What happened

1. The four lines that begin with `def` define the function
   `hours_and_minutes`. It has one parameter, `total_minutes`.

2. `return hours, minutes` returns one tuple that holds two values.

3. `length = hours_and_minutes(135)` calls the function, and gives the
   name `length` to the return value. `print(length)` shows that the
   return value is the tuple `(2, 15)`.

4. `film_hours, film_minutes = hours_and_minutes(135)` calls the
   function again, and unpacks the tuple in the same line. The name
   `film_hours` refers to `2`, and the name `film_minutes` refers to
   `15`.

The fourth step is the usual way to call a function that returns two
values. Each part of the answer gets a clear name, in one line.

## Predict

Look at this cell. Do not run it yet. It calls the same function with
another argument.

```python
long_hours, long_minutes = hours_and_minutes(200)
print(long_minutes)
```

```{quiz}
:id: predict-return
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "20"
wrong:
  - { text: "3", explanation: "`3` is the number of hours. That is the first value of the tuple, and the name `long_hours` refers to it. The cell prints `long_minutes`, which refers to the second value." }
  - { text: "(3, 20)", explanation: "`(3, 20)` is the tuple that the function returns. The first line unpacks it into two names, and the cell prints only `long_minutes`." }
  - { text: "200", explanation: "`200` is the argument. The function divides it into hours and minutes, and the cell prints the minutes that are left." }
  - { text: "3.33", explanation: "The function does not use `/`. It uses `//` for the whole hours and `%` for the minutes that are left." }
otherwise: "How many times does `60` fit in `200`? How many minutes are left after those whole hours? The cell prints the minutes that are left."
explanation: "`60` fits three times in `200`, which is `180` minutes, and `20` minutes are left. The function returns `(3, 20)`. The name `long_minutes` refers to the second value, `20`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: long-not-run
:check: long-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-long
:title: Add the cell that calls the function with 200, and run it
:path: {{ notebook }}
:tags: [long]
:run: true
long_hours, long_minutes = hours_and_minutes(200)
print(long_minutes)
```

```{verify}
:id: long-ran
:label: The call with 200 gave 3 hours and 20 minutes
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed long
if globals().get("long_hours") == 3 and globals().get("long_minutes") == 20:
    print("The cell ran. The name long_hours refers to 3 and the name long_minutes refers to 20.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("long_hours") == 3 and globals().get("long_minutes") == 20
```

## Your task

Write a function with the name `first_and_last`. It has one parameter,
with the name `items`. The argument is a list that has one item or
more. The function returns two values: the first item of the list, and
the last item of the list.

These are two examples of what the function must return:

| Call | Return value |
|------|--------------|
| `first_and_last(["Mon", "Tue", "Wed"])` | `('Mon', 'Wed')` |
| `first_and_last([4, 8, 15, 16])` | `(4, 16)` |

The function must return the values with `return`. It must not show
them with `print()`.

Remember that the index `0` gives the first item of a list, and the
index `-1` gives the last item, for a list of any length.

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-first-and-last
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [first-and-last]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`. A cell that only
defines a function shows no output. To try your function, add a line
under it, without spaces at the beginning, such as
`print(first_and_last([4, 8, 15, 16]))`.

```{hint}
:title: Hint: how to begin
Look at the function `hours_and_minutes`. Your function has the same
form. The first line is `def first_and_last(items):`. The lines under
it begin with four spaces.
```

```{hint}
:title: Hint: the return line
The first item is `items[0]` and the last item is `items[-1]`. Write
both after `return`, with a comma between them:
`return items[0], items[-1]`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: first-and-last-not-started
:check: first-and-last
:expect: The function first_and_last does not exist yet
```

````{attempt}
:id: first-and-last-not-a-function
:check: first-and-last
:expect: The name first_and_last is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
first_and_last = (4, 16)
```
````

````{attempt}
:id: first-and-last-no-parameter
:check: first-and-last
:expect: must have one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last():
    return 4, 16
```
````

````{attempt}
:id: first-and-last-fixed-index
:check: first-and-last
:expect: stopped with an error of the type IndexError

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last(items):
    return items[0], items[3]
```
````

````{attempt}
:id: first-and-last-prints
:check: first-and-last
:expect: shows the values with print(), but it does not return them

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last(items):
    print(items[0], items[-1])
```
````

````{attempt}
:id: first-and-last-no-return
:check: first-and-last
:expect: gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last(items):
    first = items[0]
    last = items[-1]
```
````

````{attempt}
:id: first-and-last-a-list
:check: first-and-last
:expect: returns a list

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last(items):
    return [items[0], items[-1]]
```
````

````{attempt}
:id: first-and-last-one-value
:check: first-and-last
:expect: The function returns one value

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last(items):
    return items[0]
```
````

````{attempt}
:id: first-and-last-three-values
:check: first-and-last
:expect: a tuple of 3 values

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last(items):
    return items[0], items[1], items[-1]
```
````

````{attempt}
:id: first-and-last-second-item
:check: first-and-last
:expect: but it must give (4, 16)

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last(items):
    return items[0], items[1]
```
````

````{attempt}
:id: first-and-last-fixed-values
:check: first-and-last
:expect: but it must give ('Mon', 'Wed')

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last(items):
    return 4, 16
```
````

````{attempt}
:id: first-and-last-other-way
:check: first-and-last
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def first_and_last(values):
    first = values[0]
    last = values[len(values) - 1]
    return (first, last)
```
````

````{hint}
:title: Show me a solution
:unlock: "first-and-last" in failed_checks or "first-and-last" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-first-and-last-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [first-and-last-solution]
:run: true
def first_and_last(items):
    return items[0], items[-1]

print(first_and_last([4, 8, 15, 16]))
```
````

```{verify}
:id: first-and-last
:label: Your function returns the first item and the last item
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed first-and-last; cell-executed first-and-last-solution
def _workshop_check():
    import contextlib, io
    if "first_and_last" not in globals():
        print("The function first_and_last does not exist yet. Write it under the comment in the new cell. Check the spelling of the name. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["first_and_last"]
    if not callable(function):
        print("The name first_and_last is not a function. It refers to another value. Define the function with a line that begins with def: def first_and_last(items): and write the return line under it. Then run the cell again.")
        return False
    cases = [([4, 8, 15, 16], (4, 16)), (["Mon", "Tue", "Wed"], ("Mon", "Wed")), ([7], (7, 7)), (["a", "b"], ("a", "b"))]
    for argument, expected in cases:
        call = f"first_and_last({argument!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(list(argument))
        except TypeError:
            print(f"The call {call} stopped with an error of the type TypeError. The function first_and_last must have one parameter, and the argument is a list. The first line must be: def first_and_last(items): and the lines under it must use the name items. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The call {call} stopped with an error of the type {type(error).__name__}. The list in this call has {len(argument)} items. The function must work for a list of any length, so use the index 0 for the first item and the index -1 for the last item. Then run the cell again.")
            return False
        if result is None and shown.getvalue().strip() != "":
            print("The function first_and_last shows the values with print(), but it does not return them. The code that calls the function gets None. Replace print() with a return line: return items[0], items[-1]. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None. That means the function has no return line, or Python does not reach it. Add a last line to the function, with four spaces at its beginning: return items[0], items[-1]. Then run the cell again.")
            return False
        if isinstance(result, list):
            print(f"{call} gives {result!r}. The function returns a list, because the values are between square brackets. Return a tuple: write the two values after return with a comma between them, and no square brackets. Then run the cell again.")
            return False
        if not isinstance(result, tuple):
            print(f"{call} gives {result!r}. The function returns one value, but it must return two values: the first item and the last item. Write both after return, with a comma between them: return items[0], items[-1]. Then run the cell again.")
            return False
        if len(result) != 2:
            print(f"{call} gives {result!r}, which is a tuple of {len(result)} values. The function must return a tuple of two values: the first item and the last item. Then run the cell again.")
            return False
        if result != expected:
            print(f"{call} gives {result!r} but it must give {expected!r}. The first value must be the first item of the list, items[0]. The second value must be the last item of the list, items[-1]. The function must use its parameter, so that it works for every list. Then run the cell again.")
            return False
    print("Correct. first_and_last([4, 8, 15, 16]) gives (4, 16), and the function also works for lists of other lengths.")
    return True
globals().pop("_workshop_check")()
```
