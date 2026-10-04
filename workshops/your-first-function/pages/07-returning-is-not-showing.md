---
title: Returning is not showing
requires: [verify:doubles-defined, quiz:predict-give-only, verify:give-only-ran, verify:given-ran, verify:minutes-function]
---

# Returning is not showing

This page is about one difference: the difference between `return`
and `print()`. It is the idea that people who learn to program most
often get wrong, so this page explains it slowly.

- `print()` shows a value on the screen, for a person to read. The
  program does not get the value.

- `return` gives a value back to the code that called the function,
  for the program to use. It shows nothing on the screen.

People often confuse the two in a notebook, because in both cases
a number can appear under the cell. But they do different things, and
one cannot replace the other.

Think again of the friend who calculates for you. Your friend can
give you the answer in two ways.

- Your friend says the answer aloud. Everybody in the room hears it.
  But you have nothing in your hand, and you cannot give the answer
  to another person later. This is `print()`.

- Your friend writes the answer on a piece of paper, gives the paper
  to you, and says nothing. Nobody hears anything. But you have
  the answer, and you can use it. This is `return`.

## Two functions that look almost the same

Click the action below. It adds a cell that defines two functions,
and runs it. Both functions multiply a number by `2`. The first
function prints the result. The second function returns the result.

```{attempt}
:id: doubles-not-defined
:check: doubles-defined
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-doubles
:title: Add a cell that defines one function that prints and one function that returns, and run it
:path: {{ notebook }}
:tags: [doubles]
:run: true
def show_double(number):
    print(number * 2)

def give_double(number):
    return number * 2
```

```{verify}
:id: doubles-defined
:label: Python knows the functions show_double and give_double
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed doubles
if callable(globals().get("show_double")) and callable(globals().get("give_double")):
    print("The cell ran. Python now knows the two functions show_double and give_double.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
callable(globals().get("show_double")) and callable(globals().get("give_double"))
```

The cell only defines the two functions, so it shows no output.

## What each function shows

First, the function that prints. This cell calls `show_double`, and
then prints a line of text:

```python
show_double(4)
print("The end")
```

Its output has two lines. The body of `show_double` prints `8`, and
then the cell prints `The end`:

```
8
The end
```

Now look at the same cell with the other function. Do not run it yet.

```python
give_double(4)
print("The end")
```

Predict the complete output of this cell. Type every line that you
think the notebook shows, exactly as it appears. The box has room for
more than one line, so click `Submit` when you have finished.

```{quiz}
:id: predict-give-only
:type: text
:lines: 2
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "The end"
wrong:
  - { text: "8\nThe end", explanation: "That is the output of the cell with `show_double`. The function `give_double` has no `print()` in its body. It returns `8` to the first line of the cell, and that line does nothing with the value." }
  - { text: "8", explanation: "The function `give_double` returns `8`, but `return` shows nothing. The only `print()` that runs is in the second line of the cell." }
  - { text: "The end\n8", explanation: "The function `give_double` has no `print()` in its body, so the value `8` does not appear in any position. The only `print()` that runs is in the second line of the cell." }
  - { pattern: '"The end"|the end|The End', explanation: "The words are correct. Type the line exactly as `print()` shows it: with a capital `T`, and with no quotes." }
otherwise: "Look for every `print()` that runs. The body of `give_double` has no `print()`. It has only `return`."
explanation: "The call `give_double(4)` returns `8` to the first line of the cell. That line does nothing with the value, so the value is lost. A `return` shows nothing. The only output is `The end`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: give-only-not-run
:check: give-only-ran
:expect: The cell has not run yet. Click the action above
```

```{cell-insert}
:id: insert-give-only
:title: Add the cell that calls give_double and does not use the result, and run it
:path: {{ notebook }}
:tags: [give-only]
:run: true
give_double(4)
print("The end")
```

```{verify}
:id: give-only-ran
:label: The cell that calls give_double and does not use the result has run
:substrate: contents
:trigger: cell-executed give-only
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} give-only
```

The output is only `The end`.

The function calculated `8` and gave it back. The line
`give_double(4)` did not give the value a name, and did not print it,
so the value was lost. To see a return value, the code that calls the
function must print it: `print(give_double(4))`.

There is one thing in a notebook that can hide this difference. A
notebook shows the value of the last line of a cell. So when a call
such as `give_double(4)` is the last line of a cell, the notebook
shows `8` under it. The notebook shows that value, not the function.
In the cell above, the call is not the last line, so nothing is shown
for it.

## What the program gets

The program cannot use a value again after it is on the screen. The
program can use a value that was returned. This cell calls both functions and gives
a name to what each call gives back.

```{attempt}
:id: given-not-run
:check: given-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-given
:title: Add a cell that uses what each function gives back, and run it
:path: {{ notebook }}
:tags: [given]
:run: true
shown = show_double(4)
given = give_double(4)
print(given + 1)
```

The output is:

```
8
9
```

```{verify}
:id: given-ran
:label: The program used the return value of give_double
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed given
if globals().get("given") == 8:
    print("The cell ran. The name given refers to 8, the return value of give_double(4), and the program added 1 to it.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("given") == 8
```

Read the output line by line.

1. The `8` comes from the first line of the cell. The call
   `show_double(4)` ran the body of the function, and the `print()`
   in that body showed `8`.

2. The second line of the cell shows nothing. `give_double(4)`
   returned `8`, and the name `given` now refers to `8`.

3. The `9` comes from the third line of the cell. The program used
   the value of `given` in a calculation.

The name `given` refers to a number that the program can use. The
name `shown` does not refer to `8`. The function `show_double` put
the `8` on the screen and gave nothing back. The next page shows what
`shown` refers to.

| | `print()` | `return` |
|---|---|---|
| What it does | shows a value on the screen | gives a value back to the code that called the function |
| Who the value is for | a person who reads the screen | the program |
| Can the program use the value afterwards? | no | yes |
| Where it can be written | on every line | only in the body of a function |

A function that calculates something almost always returns the result.
Then the code that calls it decides what to do with the value: print
it, add it to a total, or compare it.

## Your task

Write a function with the name `to_minutes`. It has one parameter,
with the name `hours`. It returns the number of minutes in that many
hours: the value of the parameter multiplied by `60`.

| The call | The return value |
|----------|------------------|
| `to_minutes(2)` | `120` |
| `to_minutes(3)` | `180` |

Under the function, write two lines that use it:

1. A line that calls the function with the argument `2`, and gives
   the name `film_minutes` to the return value.

2. A line that prints `film_minutes`.

The output under the cell must be `120`, one time.

```{cell-insert}
:id: insert-minutes
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [minutes]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function and
the two lines under it. Then run the cell: hold `Shift` and press
`Enter`.

```{hint}
:title: Hint: the function
The function has two lines. The first line is
`def to_minutes(hours):`. The body is one line that begins with four
spaces and with the word `return`: `return hours * 60`. The body has
no `print()`.
```

```{hint}
:title: Hint: the two lines under the function
Both lines begin without spaces. The first line is an assignment with
a call on its right side: `film_minutes = to_minutes(2)`. The second
line is `print(film_minutes)`.
```

```{hint}
:title: Hint: the output is 120 and then None
The word `None` in the output means that your function prints the
result and does not return it. The body of the function must use
`return`, not `print()`. The next page explains `None`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: minutes-not-started
:check: minutes-function
:expect: The function to_minutes does not exist yet
```

````{attempt}
:id: minutes-not-a-function
:check: minutes-function
:expect: it is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
to_minutes = 2 * 60
print(to_minutes)
```
````

````{attempt}
:id: minutes-no-parameter
:check: minutes-function
:expect: has no parameter, but it must have exactly one

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_minutes():
    return 2 * 60

print(to_minutes())
```
````

````{attempt}
:id: minutes-stops
:check: minutes-function
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_minutes(hours):
    return hour * 60
```
````

````{attempt}
:id: minutes-prints
:check: minutes-function
:expect: shows the result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_minutes(hours):
    print(hours * 60)

to_minutes(2)
```
````

````{attempt}
:id: minutes-no-return
:check: minutes-function
:expect: gives nothing back

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_minutes(hours):
    minutes = hours * 60

print(to_minutes(2))
```
````

````{attempt}
:id: minutes-fixed
:check: minutes-function
:expect: The body must calculate the result from the parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_minutes(hours):
    return 120

print(to_minutes(2))
```
````

````{attempt}
:id: minutes-wrong
:check: minutes-function
:expect: but it must give 120

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_minutes(hours):
    return hours + 60

print(to_minutes(2))
```
````

````{attempt}
:id: minutes-no-name
:check: minutes-function
:expect: The name film_minutes does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_minutes(hours):
    return hours * 60

print(to_minutes(2))
```
````

````{attempt}
:id: minutes-wrong-argument
:check: minutes-function
:expect: The name film_minutes refers to 180

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_minutes(hours):
    return hours * 60

film_minutes = to_minutes(3)
print(film_minutes)
```
````

````{hint}
:title: Show me a solution
:unlock: "minutes-function" in failed_checks or "minutes-function" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-minutes-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [minutes-solution]
:run: true
def to_minutes(hours):
    return hours * 60

film_minutes = to_minutes(2)
print(film_minutes)
```
````

```{verify}
:id: minutes-function
:label: Your function to_minutes returns its result, and your program uses it
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed minutes; cell-executed minutes-solution
def _workshop_check():
    import contextlib, inspect, io
    if "to_minutes" not in globals():
        print("The function to_minutes does not exist yet. Write it under the comment in the new cell. The first line is def to_minutes(hours): and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["to_minutes"]
    if not callable(function):
        print("The name to_minutes exists, but it is not a function. A function begins with a line that has the word def, the name, the parameter in parentheses and a colon: def to_minutes(hours): Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        found = "no parameter" if count == 0 else f"{count} parameters"
        print(f"The function to_minutes has {found}, but it must have exactly one. The number of hours must arrive through the parameter. The def line must be: def to_minutes(hours): Then run the cell again.")
        return False
    results = []
    printed = []
    for hours in (2, 3):
        output = io.StringIO()
        try:
            with contextlib.redirect_stdout(output):
                results.append(function(hours))
        except Exception as error:
            print(f"The call to_minutes({hours}) stopped with a {type(error).__name__}. Read the last line of the error message under your cell. The body must use the same name as the parameter in the def line. Correct the body, and run the cell again.")
            return False
        printed.append(output.getvalue().strip())
    if results[0] is None and printed[0] == "120":
        print("The function to_minutes shows the result with print(), but it does not return it. The number 120 appears on the screen, but the code that calls the function receives nothing, so the name film_minutes cannot refer to 120. Replace the print() line in the body with a line that begins with the word return: return hours * 60. Then run the cell again.")
        return False
    if results[0] is None:
        print("The call to_minutes(2) gives nothing back. The body needs a line that begins with the word return, and then the value to give back: return hours * 60. Then run the cell again.")
        return False
    if results[0] != 120:
        print(f"to_minutes(2) gives {results[0]!r} but it must give 120. One hour has 60 minutes, so the body multiplies the parameter by 60: return hours * 60. Then run the cell again.")
        return False
    if results[1] != 180:
        print(f"to_minutes(2) gives 120, which is correct. But to_minutes(3) gives {results[1]!r} and it must give 180. The body must calculate the result from the parameter: return hours * 60. Then run the cell again.")
        return False
    if "film_minutes" not in globals():
        print("The function to_minutes is correct. The name film_minutes does not exist yet. Under the function, add a line that begins without spaces and gives the name to the return value: film_minutes = to_minutes(2). Then run the cell again.")
        return False
    if globals()["film_minutes"] != 120:
        print(f"The function to_minutes is correct. The name film_minutes refers to {globals()['film_minutes']!r} but it must refer to 120. Under the function, write the line film_minutes = to_minutes(2), and run the cell again.")
        return False
    print("Correct. to_minutes(2) gives 120 and to_minutes(3) gives 180. Your function returns its result, so the name film_minutes can refer to the value 120.")
    return True
globals().pop("_workshop_check")()
```

Your function returns the number of minutes, and the cell decides
what to do with it. A function that returns its result can be used by
every part of a program.
