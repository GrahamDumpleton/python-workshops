---
title: Reading the documentation
requires: [verify:middle-food-ran, verify:average-food]
---

# Reading the documentation

The **documentation** of Python is a set of web pages that describes
Python and every module of the standard library. For each function,
it says what the function does, which arguments it takes and what it
returns.

## Why you need it

You have used four modules. The standard library has many more, and
nobody remembers all of them. Programmers who have used Python for
many years read the documentation every day. To know how to find a
function is more useful than to remember many functions.

The documentation is written for people who already program. Some
sentences on every page will be difficult to read now. That is normal,
and you do not need to read every sentence. On this page you learn
which parts to look at.

## How the page of a module is built

The page of each module has the same parts. As an example, this is
the page of a module that you have not used yet. Its name is
`statistics`, and it calculates with lists of numbers:

[statistics: Mathematical statistics functions](https://docs.python.org/3/library/statistics.html#averages-and-measures-of-central-location)

The link opens in a new tab of your browser. Look for these parts:

- **Tables of names.** Near the top of the page, the tables list the
  functions of the module. Each row has the name of a function, and
  one line that says what the function does. This is the place to
  begin when you look for a function.

- **The entry of each function.** Below the tables, under the heading
  "Function details", every function has an entry. Click a name in a
  table to go to its entry.

- **The first line of an entry.** It shows how to call the function.
  For example, `statistics.median(data)` says that the function
  `median` is in the module `statistics`, and that it takes one
  argument. The name `data` tells you what kind of argument: here, a
  list of numbers.

- **The text of an entry.** It says what the function returns. The
  first sentence is usually enough.

- **The examples.** A line that begins with `>>>` is code that a
  person typed. The line under it is the result that Python showed.
  You do not type the `>>>` yourself.

The entry of `median` has this example:

```
>>> median([1, 3, 5])
3
```

It tells you that `median([1, 3, 5])` gives `3`. The median of a list
of numbers is the value in the middle, when the numbers are in order.
The example writes `median` with no `statistics` and no dot before it.
So it expects that the name was imported with
`from statistics import median`.

## Use the function that you read about

In January, Mariam made six purchases of food. Click the action below.
It adds a cell that makes a list of the six amounts and calculates
their median, and runs the cell.

```{attempt}
:id: middle-food-not-run
:check: middle-food-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-middle-food
:title: Add a cell that calculates the median of six amounts, and run it
:path: {{ notebook }}
:tags: [middle-food]
:run: true
import statistics

food_amounts = [6.40, 11.25, 14.30, 9.85, 58.60, 7.20]
middle_food = statistics.median(food_amounts)
print(f"{middle_food:.2f}")
```

The output is:

```
10.55
```

```{verify}
:id: middle-food-ran
:label: The cell calculated the median of the amounts
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed middle-food
if type(globals().get("middle_food")) is float and round(globals().get("middle_food"), 2) == 10.55 and globals().get("food_amounts") == [6.40, 11.25, 14.30, 9.85, 58.60, 7.20]:
    print("The cell ran. The median of the six amounts is 10.55.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
type(globals().get("middle_food")) is float and round(globals().get("middle_food"), 2) == 10.55 and globals().get("food_amounts") == [6.40, 11.25, 14.30, 9.85, 58.60, 7.20]
```

A list of six amounts has no single value in the middle. For such a
list, `median()` gives the number that is halfway between the two
middle values, which are `9.85` and `11.25` here.

## Your task

Mariam asks another question: what is the average amount of her six
purchases of food? The average of a list of numbers is their total
divided by how many numbers there are.

The module `statistics` has a function that calculates the average.
This page does not tell you its name. Find it in the documentation:

1. Open the
   [page of the module `statistics`](https://docs.python.org/3/library/statistics.html#averages-and-measures-of-central-location).

2. Look at the first table, under the heading "Averages and measures
   of central location". Read the line beside each name. Look for the
   word "average".

3. Click the name of the function to read its entry, and look at its
   first example.

Then write one line that does this:

- It calls the function that you found, with the list `food_amounts`
  as the argument. The module `statistics` is imported already, so
  write `statistics`, a dot, and the name of the function.

- It gives the result the name `average_food`.

The action below adds a new cell for your line.

```{cell-insert}
:id: insert-average-food
:title: Add a cell for my line
:path: {{ notebook }}
:tags: [average-food]
:run: false
# Write your line below this one.

```

Click on the empty line under the comment, and type your line. Then
run the cell: hold `Shift` and press `Enter`. To see the result with
two digits after the decimal point, you can add the line
`print(f"{average_food:.2f}")` under your line.

```{hint}
:title: Hint: where the function is in the table
The function is in the first row of the first table. The line beside
its name is: Arithmetic mean ("average") of data. "Mean" is the word
that mathematics uses for this kind of average.
```

```{hint}
:title: Hint: the name of the function
The name of the function is `mean`. The line is
`average_food = statistics.mean(food_amounts)`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: average-food-not-started
:check: average-food
:expect: The name average_food does not exist yet
```

````{attempt}
:id: average-food-function
:check: average-food
:expect: refers to the function itself

```{cell-insert}
:path: {{ notebook }}
:run: true
average_food = statistics.mean
```
````

````{attempt}
:id: average-food-median
:check: average-food
:expect: That is the median

```{cell-insert}
:path: {{ notebook }}
:run: true
average_food = statistics.median(food_amounts)
```
````

````{attempt}
:id: average-food-total
:check: average-food
:expect: That is the total of the six amounts

```{cell-insert}
:path: {{ notebook }}
:run: true
average_food = 6.40 + 11.25 + 14.30 + 9.85 + 58.60 + 7.20
```
````

````{attempt}
:id: average-food-text
:check: average-food
:expect: refers to the string

```{cell-insert}
:path: {{ notebook }}
:run: true
average_food = f"{statistics.mean(food_amounts):.2f}"
```
````

````{attempt}
:id: average-food-other
:check: average-food
:expect: but the average of the six amounts is 17.93

```{cell-insert}
:path: {{ notebook }}
:run: true
average_food = statistics.mode(food_amounts)
```
````

````{attempt}
:id: average-food-by-hand
:check: average-food
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
average_food = (6.40 + 11.25 + 14.30 + 9.85 + 58.60 + 7.20) / 6
```
````

````{hint}
:title: Show me a solution
:unlock: "average-food" in failed_checks or "average-food" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-average-food-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [average-food-solution]
:run: true
average_food = statistics.mean(food_amounts)
print(f"{average_food:.2f}")
```
````

```{verify}
:id: average-food
:label: The name average_food refers to the average of the six amounts
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed average-food; cell-executed average-food-solution
def _workshop_check():
    if "average_food" not in globals():
        print("The name average_food does not exist yet. Find the function in the documentation, and write your line under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    value = globals()["average_food"]
    if callable(value):
        print("The name average_food refers to the function itself, and not to its result. Call the function: write parentheses after its name, with the list food_amounts between them. Then run the cell again.")
        return False
    if type(value) is str:
        print(f"The name average_food refers to the string {value!r} but it must refer to a number. Give the name the result of the function, and use an f-string only inside print(). Then run the cell again.")
        return False
    if type(value) not in (int, float):
        print(f"The name average_food refers to {value!r} but it must refer to a number. Call the function that you found with the list food_amounts as the argument. Then run the cell again.")
        return False
    if round(value, 2) == 10.55:
        print("The name average_food refers to 10.55. That is the median, the value in the middle, which the cell above calculated. The task asks for the average. In the table of the documentation, look for the word average, and call that function. Then run the cell again.")
        return False
    if round(value, 2) == 107.6:
        print("The name average_food refers to 107.60. That is the total of the six amounts. The average is the total divided by 6. The module statistics has a function that calculates the average in one call. Find it in the table of the documentation, and call it with the list food_amounts. Then run the cell again.")
        return False
    if round(value, 2) != 17.93:
        print(f"The name average_food refers to {value!r} but the average of the six amounts is 17.93. In the first table of the documentation, look for the word average, and call that function with the list food_amounts. Then run the cell again.")
        return False
    print("Correct. The average of the six amounts is 17.93, which is what statistics.mean(food_amounts) gives.")
    return True
globals().pop("_workshop_check")()
```

The average, `17.93`, is much larger than the median, `10.55`. One
large purchase at the supermarket, `58.60`, raises the average. It
does not change the value in the middle. This is why the module has
more than one function for "a typical value".

## Where to find every module

This page lists all the modules of the standard library, in groups:

[The Python Standard Library](https://docs.python.org/3/library/index.html)

When you need something that many programs need, look there first.
Often the code is ready already.
