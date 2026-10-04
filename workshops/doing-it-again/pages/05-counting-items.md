---
title: Counting items
requires: [verify:adults-ran, verify:warm-days]
---

# Counting items

Sometimes the question is "how many?". How many people are adults?
How many days were warm? How many prices are above 10? The program
must look at every item, test it, and count the items that pass the
test.

Think of a person who counts the red cars that drive past. The person
looks at every car, but adds 1 to the count only when the car is red.

A program does the same with two things that you already know: a loop
that looks at every item, and an `if` that decides. The `if` is
inside the block of the loop.

1. Before the loop, a name is given the value `0`. This is the count.

2. Inside the loop, an `if` tests the item.

3. Inside the `if`, one line adds `1` to the count.

Click the action below. It adds a cell that counts the adults in a
list of ages, and runs it. In this example, an adult is a person who
is 18 years old or older.

```{attempt}
:id: adults-not-run
:check: adults-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-adults
:title: Add a cell that counts the adults in a list of ages, and run it
:path: {{ notebook }}
:tags: [adults]
:run: true
ages = [34, 12, 67, 8, 19]
adults = 0
for age in ages:
    if age >= 18:
        adults = adults + 1
print(adults)
```

The output is `3`.

```{verify}
:id: adults-ran
:label: The loop counted 3 adults
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed adults
if globals().get("ages") == [34, 12, 67, 8, 19] and globals().get("adults") == 3:
    print("The cell ran. The name adults refers to 3, because three of the five ages are 18 or more.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("ages") == [34, 12, 67, 8, 19] and globals().get("adults") == 3
```

## What happened

The loop made five passes, one for each age. In each pass, the `if`
compared the age with `18`. The operator `>=` means "greater than or
equal to".

| Pass | `age` | `age >= 18` | `adults` after |
|------|-------|-------------|----------------|
| 1 | `34` | `True` | `1` |
| 2 | `12` | `False` | `1` |
| 3 | `67` | `True` | `2` |
| 4 | `8` | `False` | `2` |
| 5 | `19` | `True` | `3` |

Look at the spaces at the beginning of each line:

- The line `if age >= 18:` begins with four spaces. It is in the block
  of the loop, so Python runs it in every pass.

- The line `adults = adults + 1` begins with eight spaces. It is in
  the block of the `if`, and the `if` is in the block of the loop. So
  Python runs it only in the passes where the comparison is true.

- The line `print(adults)` begins without spaces. It is after the
  loop, so Python runs it one time.

A block inside a block gets four more spaces. With eight spaces, the
line adds `1` for some items. With four spaces, the same line would
be outside the `if`, and it would add `1` for every item.

## Your task

These are the temperatures at noon on five days, in degrees Celsius:
18, 23, 21, 17 and 25. A warm day is a day with a temperature above
20. Write a program that counts the warm days.

Your program must do these four things, in this order:

1. Give the name `days` to the list `[18, 23, 21, 17, 25]`.

2. Give the name `warm_days` the start value `0`.

3. Use a `for` loop over `days`. Inside the loop, use an `if` to test
   whether the temperature is greater than `20`. When it is, add `1`
   to `warm_days`.

4. After the loop, show the value of `warm_days` with `print()`.

When the program is correct, the output under the cell is:

```
3
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-warm-days
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [warm-days]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell that counts the adults. Your program has the same
form. The list is different, the count has the name `warm_days`, and
the comparison uses the operator `>`, which means "greater than".
```

```{hint}
:title: Hint: the loop
The loop has three lines. The first line is `for day in days:`. The
second line begins with four spaces: `if day > 20:`. The third line
begins with eight spaces: `warm_days = warm_days + 1`.
```

```{hint}
:title: Hint: my cell shows [*] and does not finish
While a cell runs, the square brackets at its left side show a star:
`[*]`. The loop of this task finishes in less than a second. If the
star stays for longer than a few seconds, the cell probably holds a
loop that never ends. Python cannot run any other cell while it
waits.

To stop the loop, you restart the **kernel**. The kernel is the Python
interpreter that runs the cells of your notebook. First correct the
loop in the cell. Then open the `Kernel` menu at the top of the
window, choose `Restart Kernel and Run All Cells…`, and click
`Restart` in the box that appears. Python starts again, forgets every
name, and runs the cells of the notebook again from the top. If Python
stops at a cell that shows an error message, correct that cell, and
choose the same menu item again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: warm-days-not-started
:check: warm-days
:expect: The name days does not exist yet
```

````{attempt}
:id: warm-days-wrong-list
:check: warm-days
:expect: The name days refers to [18, 23, 21]

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [18, 23, 21]
```
````

````{attempt}
:id: warm-days-list-only
:check: warm-days
:expect: The name warm_days does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [18, 23, 21, 17, 25]
```
````

````{attempt}
:id: warm-days-nothing-counted
:check: warm-days
:expect: The name warm_days still refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [18, 23, 21, 17, 25]
warm_days = 0
for day in days:
    print(day)
print(warm_days)
```
````

````{attempt}
:id: warm-days-outside-if
:check: warm-days
:expect: That is the number of all the days

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [18, 23, 21, 17, 25]
warm_days = 0
for day in days:
    if day > 20:
        print(day)
    warm_days = warm_days + 1
print(warm_days)
```
````

````{attempt}
:id: warm-days-added-temperature
:check: warm-days
:expect: That is the total of the warm temperatures

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [18, 23, 21, 17, 25]
warm_days = 0
for day in days:
    if day > 20:
        warm_days = warm_days + day
print(warm_days)
```
````

````{attempt}
:id: warm-days-wrong-comparison
:check: warm-days
:expect: but it must refer to 3

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [18, 23, 21, 17, 25]
warm_days = 0
for day in days:
    if day < 20:
        warm_days = warm_days + 1
print(warm_days)
```
````

````{attempt}
:id: warm-days-other-comparison
:check: warm-days
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
days = [18, 23, 21, 17, 25]
warm_days = 0
for temperature in days:
    if temperature >= 21:
        warm_days = warm_days + 1
print(warm_days)
```
````

````{hint}
:title: Show me a solution
:unlock: "warm-days" in failed_checks or "warm-days" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-warm-days-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [warm-days-solution]
:run: true
days = [18, 23, 21, 17, 25]
warm_days = 0
for day in days:
    if day > 20:
        warm_days = warm_days + 1
print(warm_days)
```
````

```{verify}
:id: warm-days
:label: Your loop counts the warm days
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed warm-days; cell-executed warm-days-solution
if "days" not in globals():
    print("The name days does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the list: days = [18, 23, 21, 17, 25]. Then hold Shift and press Enter to run the cell.")
elif days != [18, 23, 21, 17, 25]:
    print(f"The name days refers to {days} but it must refer to the list [18, 23, 21, 17, 25]. Correct the first line of your program. Then run the cell again.")
elif "warm_days" not in globals():
    print("The name warm_days does not exist yet. Add a line before the loop that gives it the start value: warm_days = 0. Check the spelling. Then run the cell again.")
elif warm_days == 3:
    print("Correct. Your loop tested every temperature, and counted the 3 days that were warmer than 20 degrees.")
elif warm_days == 0:
    print("The name warm_days still refers to 0, so the loop does not count anything. Inside the loop, write an if that tests the temperature, and under it a line with eight spaces that adds 1: warm_days = warm_days + 1. Then run the cell again.")
elif warm_days == 5:
    print("The name warm_days refers to 5. That is the number of all the days, so the line that adds 1 runs in every pass. It must be inside the block of the if: give it eight spaces, so that it runs only when the temperature is above 20. Also check that the line warm_days = 0 is before the loop. Then run the cell again.")
elif warm_days == 69:
    print("The name warm_days refers to 69. That is the total of the warm temperatures: 23 plus 21 plus 25. To count the days, add 1 and not the temperature: warm_days = warm_days + 1. Then run the cell again.")
else:
    print(f"The name warm_days refers to {warm_days} but it must refer to 3. Check three things. The line warm_days = 0 must be before the loop. The comparison in the if line must be day > 20. The line that adds 1 must be inside the block of the if. Then run the cell again.")
"days" in globals() and "warm_days" in globals() and days == [18, 23, 21, 17, 25] and warm_days == 3
```
