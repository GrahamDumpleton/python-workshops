---
title: From a loop to a comprehension
requires: [verify:hours-list]
---

# From a loop to a comprehension

On this page you write a list comprehension yourself. You do not have
to remember its form. You can always write it from the loop that it
replaces, in three steps.

Here is a loop that changes lengths in metres to lengths in
centimetres. One metre is 100 centimetres.

```python
lengths_m = [2, 5, 3]
lengths_cm = []
for length in lengths_m:
    lengths_cm.append(length * 100)
```

To write the list comprehension:

1. Write the name of the new list, an equals sign, and a pair of
   square brackets: `lengths_cm = []`.

2. Inside the brackets, write the expression that is between the
   parentheses of `.append()`: `lengths_cm = [length * 100]`.

3. After the expression, write a space and then the first line of the
   loop, without the colon:
   `lengths_cm = [length * 100 for length in lengths_m]`.

The result is one line that does the work of the three lines of the
loop:

```python
lengths_m = [2, 5, 3]
lengths_cm = [length * 100 for length in lengths_m]
```

Both programs give `lengths_cm` the list `[200, 500, 300]`.

## Your task

A travel company has journeys of 1 day, 3 days and 7 days. It needs
the length of each journey in hours. One day is 24 hours.

This loop does the work:

```python
days = [1, 3, 7]
hours = []
for day in days:
    hours.append(day * 24)
print(hours)
```

Write a program that does the same work with a list comprehension.
Your program must do these three things, in this order:

1. Give the name `days` to the list `[1, 3, 7]`.

2. Give the name `hours` to a list comprehension that multiplies each
   item of `days` by 24. You can choose the loop name. A good loop
   name is `day`.

3. Show the value of `hours` with `print()`.

When the program is correct, the output under the cell is:

```
[24, 72, 168]
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-hours
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [hours]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Your program has three lines. The first line makes the list:
`days = [1, 3, 7]`. The last line is `print(hours)`. The line between
them is the list comprehension. Write it from the loop above, with the
three steps at the top of this page.
```

```{hint}
:title: Hint: the list comprehension
The expression between the parentheses of `.append()` is `day * 24`.
The first line of the loop, without the colon, is `for day in days`.
Put both inside square brackets, with the expression first:
`hours = [... for day in days]`. Replace the three dots with the
expression.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: hours-not-started
:check: hours-list
:expect: The name days does not exist yet
```

````{attempt}
:id: hours-wrong-days
:check: hours-list
:expect: The name days refers to [1, 3]

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [1, 3]
```
````

````{attempt}
:id: hours-days-only
:check: hours-list
:expect: The name hours does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [1, 3, 7]
```
````

````{attempt}
:id: hours-not-a-list
:check: hours-list
:expect: is not a list

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [1, 3, 7]
hours = 7 * 24
print(hours)
```
````

````{attempt}
:id: hours-no-expression
:check: hours-list
:expect: the same items as the list days

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [1, 3, 7]
hours = [day for day in days]
print(hours)
```
````

````{attempt}
:id: hours-one-item
:check: hours-list
:expect: The number of items in the list hours is 1

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [1, 3, 7]
hours = [7 * 24]
print(hours)
```
````

````{attempt}
:id: hours-wrong-number
:check: hours-list
:expect: but it must refer to [24, 72, 168]

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [1, 3, 7]
hours = [day * 12 for day in days]
print(hours)
```
````

````{attempt}
:id: hours-other-loop-name
:check: hours-list
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [1, 3, 7]
hours = [24 * d for d in days]
print(hours)
```
````

````{hint}
:title: Show me a solution
:unlock: "hours-list" in failed_checks or "hours-list" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-hours-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [hours-solution]
:run: true
days = [1, 3, 7]
hours = [day * 24 for day in days]
print(hours)
```
````

```{verify}
:id: hours-list
:label: Your list comprehension changes the days to hours
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed hours; cell-executed hours-solution
if "days" not in globals():
    print("The name days does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the list: days = [1, 3, 7]. Then hold Shift and press Enter to run the cell.")
elif days != [1, 3, 7]:
    print(f"The name days refers to {days!r} but it must refer to the list [1, 3, 7]. Correct the first line of your program. Then run the cell again.")
elif "hours" not in globals():
    print("The name hours does not exist yet. Add a line that gives the name hours to a list comprehension: square brackets, with the expression day * 24 first, and then for day in days. Check the spelling. Then run the cell again.")
elif type(hours) is not list:
    print(f"The name hours refers to {hours!r}, which is not a list. A list comprehension has square brackets around it, and the words for and in inside the brackets. Write hours = [day * 24 for day in days]. Then run the cell again.")
elif hours == [24, 72, 168]:
    print("Correct. The name hours refers to [24, 72, 168], one new item for each item of days.")
elif hours == days:
    print("The name hours refers to a list that has the same items as the list days. The expression at the start of the list comprehension says what each new item is. Write day * 24 there, to multiply each item by 24. Then run the cell again.")
elif len(hours) != 3:
    print(f"The number of items in the list hours is {len(hours)}, but it must be 3, one for each item of days. After the expression, write for day in days, so that Python calculates the expression for each item. Then run the cell again.")
else:
    print(f"The name hours refers to {hours!r} but it must refer to [24, 72, 168]. Each new item must be an item of days multiplied by 24. Correct the expression at the start of the list comprehension. Then run the cell again.")
"days" in globals() and "hours" in globals() and days == [1, 3, 7] and type(hours) is list and hours == [24, 72, 168]
```
