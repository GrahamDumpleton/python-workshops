---
title: Giving a result back
requires: [verify:area-ran, quiz:predict-areas, verify:areas-added, verify:average-function]
---

# Giving a result back

Every function that you have written so far shows text on the screen.
After the text is on the screen, the program cannot use it. The
program cannot add it to another number, compare it, or give it a
name.

Compare that with `len()`. The call `len("tea")` shows nothing. It
gives the value `3` back to the line that called it, and that line
can use the value: `len("tea") + 1` is `4`.

Your functions can do the same. The word `return` in the body of a
function gives a value back to the code that called the function. The
value that a function gives back is its **return value**.

Think of a friend who is good with numbers. You give your friend two
numbers and ask for the area of a room. Your friend calculates it,
writes the answer on a piece of paper, and gives the paper to you.
Now you have the answer, and you can use it for the next thing that
you need to calculate.

Click the action below. It adds a cell with a function that returns a
value, and runs it.

```{attempt}
:id: area-not-run
:check: area-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-area
:title: Add a cell with a function that returns a value, and run it
:path: {{ notebook }}
:tags: [area]
:run: true
def area(width, height):
    return width * height

floor_area = area(4, 3)
print(floor_area)
```

The output is:

```
12
```

```{verify}
:id: area-ran
:label: The function area gave its result back
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed area
if globals().get("floor_area") == 12:
    print("The cell ran. The function area returned 12, and the name floor_area refers to that value.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("floor_area") == 12
```

## What happened

The body of the function has one line: `return width * height`. The
function has no `print()`.

The line `floor_area = area(4, 3)` is an assignment, so Python
calculates its right side first. The right side is a call.

1. Python makes the parameter `width` refer to `4`, and the parameter
   `height` refer to `3`.

2. Python runs the body. It calculates `width * height`, which is
   `12`. The word `return` ends the function and gives `12` back.

3. Back in the cell, the call `area(4, 3)` now has the value `12`.
   You can read the line as `floor_area = 12`. Python makes the name
   `floor_area` refer to `12`.

4. The last line prints the value of `floor_area`.

The function did not show `12`. The `print()` line of the cell did.
The function only gave the value back.

## A call is a value

A call of a function that returns a value can be used in every place
where a value can be used: in an assignment, in a calculation, or
between the parentheses of `print()`. Look at this line. Do not run it
yet.

```python
print(area(2, 5) + area(1, 1))
```

```{quiz}
:id: predict-areas
:type: text
:title: Predict the output
question: What does the notebook show when this line runs?
answer: "11"
wrong:
  - { text: "10", explanation: "`10` is the return value of the first call only. The line adds the return value of the second call to it." }
  - { text: "101", explanation: "The two return values are numbers, so the operator `+` adds them. It does not join them." }
  - { text: "9", explanation: "The function multiplies its two arguments. The first call gives 2 times 5, and the second call gives 1 times 1." }
  - { pattern: "10 *(\\+|and|,|\\n)? *1", explanation: "The two return values are correct. But the line adds them, and `print()` shows the one result." }
otherwise: "Calculate each call first. `area(2, 5)` returns 2 times 5. `area(1, 1)` returns 1 times 1. Then the line adds the two return values."
explanation: "The first call returns `10` and the second call returns `1`. Python adds the two return values, and `print()` shows `11`."
```

Run the line, and compare the output with your prediction.

```{attempt}
:id: areas-not-added
:check: areas-added
:expect: The cell has not run yet. Click the action above
```

```{cell-insert}
:id: insert-areas
:title: Add a cell that adds two return values, and run it
:path: {{ notebook }}
:tags: [areas]
:run: true
print(area(2, 5) + area(1, 1))
```

```{verify}
:id: areas-added
:label: The cell that adds two return values has run
:substrate: contents
:trigger: cell-executed areas
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} areas
```

Python calculated the two calls first, then added the two return
values, and then gave the result to `print()`.

## Your task

Write a function with the name `average`. It has two parameters, with
the names `first` and `second`. It returns the average of the two
numbers: the two numbers added together, and the result divided by
`2`.

| The call | The return value |
|----------|------------------|
| `average(4, 10)` | `7.0` |
| `average(1, 2)` | `1.5` |

The function must return the value. It must not print it.

Under the function, write one line that calls the function and prints
the return value, so that you can see that it works:
`print(average(4, 10))`. The output must be `7.0`.

```{cell-insert}
:id: insert-average
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [average]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function and
the `print()` line. Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: the first line
The `def` line holds the two parameters, with a comma between them:
`def average(first, second):`.
```

```{hint}
:title: Hint: the body
The body is one line that begins with four spaces and with the word
`return`. Python divides before it adds, so put the addition in
parentheses: `return (first + second) / 2`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: average-not-started
:check: average-function
:expect: The function average does not exist yet
```

````{attempt}
:id: average-not-a-function
:check: average-function
:expect: it is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
average = (4 + 10) / 2
print(average)
```
````

````{attempt}
:id: average-one-parameter
:check: average-function
:expect: has 1 parameter, but it must have two

```{cell-insert}
:path: {{ notebook }}
:run: true
def average(first):
    return (first + 10) / 2

print(average(4))
```
````

````{attempt}
:id: average-stops
:check: average-function
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def average(first, second):
    return (first + secnd) / 2
```
````

````{attempt}
:id: average-prints
:check: average-function
:expect: shows the result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def average(first, second):
    print((first + second) / 2)

average(4, 10)
```
````

````{attempt}
:id: average-no-return
:check: average-function
:expect: gives nothing back

```{cell-insert}
:path: {{ notebook }}
:run: true
def average(first, second):
    result = (first + second) / 2

average(4, 10)
```
````

````{attempt}
:id: average-no-parentheses
:check: average-function
:expect: Python divides before it adds

```{cell-insert}
:path: {{ notebook }}
:run: true
def average(first, second):
    return first + second / 2

print(average(4, 10))
```
````

````{attempt}
:id: average-fixed
:check: average-function
:expect: The body must calculate the result from the two parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
def average(first, second):
    return 7.0

print(average(4, 10))
```
````

````{attempt}
:id: average-wrong
:check: average-function
:expect: but it must give 7.0

```{cell-insert}
:path: {{ notebook }}
:run: true
def average(first, second):
    return first + second

print(average(4, 10))
```
````

````{attempt}
:id: average-other-way
:check: average-function
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def average(a, b):
    total = a + b
    return total / 2

print(average(4, 10))
```
````

````{hint}
:title: Show me a solution
:unlock: "average-function" in failed_checks or "average-function" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-average-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [average-solution]
:run: true
def average(first, second):
    return (first + second) / 2

print(average(4, 10))
```
````

```{verify}
:id: average-function
:label: Your function average returns the average of two numbers
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed average; cell-executed average-solution
def _workshop_check():
    import contextlib, inspect, io
    if "average" not in globals():
        print("The function average does not exist yet. Write it under the comment in the new cell. The first line is def average(first, second): and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["average"]
    if not callable(function):
        print("The name average exists, but it is not a function. A function begins with a line that has the word def, the name, the parameters in parentheses and a colon: def average(first, second): Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 2
    if count != 2:
        found = "no parameter" if count == 0 else "1 parameter" if count == 1 else f"{count} parameters"
        print(f"The function average has {found}, but it must have two. Write both names between the parentheses of the def line, with a comma between them: def average(first, second): Then run the cell again.")
        return False
    results = []
    printed = []
    for first, second in ((4, 10), (1, 2)):
        output = io.StringIO()
        try:
            with contextlib.redirect_stdout(output):
                results.append(function(first, second))
        except Exception as error:
            print(f"The call average({first}, {second}) stopped with a {type(error).__name__}. Read the last line of the error message under your cell. The body must use the same names as the parameters in the def line. Correct the body, and run the cell again.")
            return False
        printed.append(output.getvalue().strip())
    if results == [7.0, 1.5]:
        print("Correct. average(4, 10) gives 7.0 and average(1, 2) gives 1.5. Your function returns its result, so the code that calls it can use the value.")
        return True
    if results[0] is None and printed[0] in ("7.0", "7"):
        print("The function average shows the result with print(), but it does not return it. The code that calls the function receives nothing. Replace the print() line in the body with a line that begins with the word return: return (first + second) / 2. Then run the cell again.")
        return False
    if results[0] is None:
        print("The call average(4, 10) gives nothing back. The body needs a line that begins with the word return, and then the value to give back: return (first + second) / 2. Then run the cell again.")
        return False
    if results == [9.0, 2.0]:
        print("average(4, 10) gives 9.0 but it must give 7.0. Python divides before it adds, so your body divides only the second number by 2. Put the addition in parentheses: return (first + second) / 2. Then run the cell again.")
        return False
    if results[0] == 7.0:
        print(f"average(4, 10) gives 7.0, which is correct. But average(1, 2) gives {results[1]!r} and it must give 1.5. The body must calculate the result from the two parameters: return (first + second) / 2. Then run the cell again.")
        return False
    print(f"average(4, 10) gives {results[0]!r} but it must give 7.0. Add the two parameters, and divide the result by 2: return (first + second) / 2. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

Your function gives its result back. The next page explains why that
matters, and why `return` is different from `print()`.
