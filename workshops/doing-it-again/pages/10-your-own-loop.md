---
title: A loop of your own
requires: [verify:nights-program]
---

# A loop of your own

On this page you write a program yourself, from nothing. It uses one
loop to produce three results: a total, a count and the largest
value.

## The problem

Ingrid measures the temperature every night in winter. These are the
temperatures of five nights, in degrees Celsius:

```
-4, -1, -6, -2, -8
```

All the temperatures are below zero. A number with the symbol `-` in
front of it is a negative number, and you write it in Python in the
same way: `-4`.

Write a program that answers three questions:

- What is the total of the five temperatures?

- How many nights were colder than `-3` degrees?

- What was the warmest temperature?

## What the program must do

Your program must do these things, in this order:

1. Give the name `nights` to the list `[-4, -1, -6, -2, -8]`.

2. Give the name `nights_total` the start value `0`.

3. Give the name `cold_nights` the start value `0`.

4. Give the name `warmest` the first item of the list as its start
   value.

5. Use one `for` loop over `nights`. In each pass:

   - add the temperature to `nights_total`

   - if the temperature is less than `-3`, add `1` to `cold_nights`

   - if the temperature is greater than `warmest`, make `warmest`
     refer to the temperature

6. After the loop, show the three results with `print()`, one on each
   line: first `nights_total`, then `cold_nights`, then `warmest`.

The block of the loop holds two `if` lines, one after the other. Both
begin with four spaces. Each `if` has a block of its own, with one
line that begins with eight spaces.

When the program is correct, the output under the cell is:

```
-21
3
-1
```

The three nights that were colder than `-3` degrees are the nights
with `-4`, `-6` and `-8`. A temperature of `-4` is less than `-3`,
because it is colder.

## Where to write it

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-nights
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [nights]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. When
you have written all the lines, run the cell: hold `Shift` and press
`Enter`.

If you see an error message, or the output is not what you expected,
change the program and run the cell again. You can try as many times
as you like.

## If you need help

```{hint}
:title: Hint: how to begin
Write the four lines before the loop first: the list, the two start
values of `0`, and the start value of `warmest`, which is
`nights[0]`. Then write the loop line: `for night in nights:`.
```

```{hint}
:title: Hint: the block of the loop
The block has five lines. One line with four spaces adds to the total:
`nights_total = nights_total + night`. Then `if night < -3:` with four
spaces, and under it `cold_nights = cold_nights + 1` with eight
spaces. Then `if night > warmest:` with four spaces, and under it
`warmest = night` with eight spaces.
```

```{hint}
:title: Hint: I see an IndentationError
An `IndentationError` means that the spaces at the beginning of a line
are wrong. The lines before the loop and the `print()` lines after it
begin without spaces. The lines in the block of the loop begin with
four spaces. The line under each `if` begins with eight spaces.
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
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: nights-not-started
:check: nights-program
:expect: The name nights does not exist yet
```

````{attempt}
:id: nights-wrong-list
:check: nights-program
:expect: The name nights refers to [4, 1, 6, 2, 8]

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [4, 1, 6, 2, 8]
```
````

````{attempt}
:id: nights-list-only
:check: nights-program
:expect: The name nights_total does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
```
````

````{attempt}
:id: nights-no-count
:check: nights-program
:expect: The name cold_nights does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
```
````

````{attempt}
:id: nights-no-warmest
:check: nights-program
:expect: The name warmest does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
```
````

````{attempt}
:id: nights-no-loop
:check: nights-program
:expect: The name nights_total still refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
warmest = nights[0]
```
````

````{attempt}
:id: nights-zero-inside
:check: nights-program
:expect: That is only the last temperature

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
cold_nights = 0
warmest = nights[0]
for night in nights:
    nights_total = 0
    nights_total = nights_total + night
    if night < -3:
        cold_nights = cold_nights + 1
    if night > warmest:
        warmest = night
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{attempt}
:id: nights-total-after-loop
:check: nights-program
:expect: That is only the last temperature

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
warmest = nights[0]
for night in nights:
    if night < -3:
        cold_nights = cold_nights + 1
    if night > warmest:
        warmest = night
nights_total = nights_total + night
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{attempt}
:id: nights-total-wrong
:check: nights-program
:expect: but it must refer to -21

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
warmest = nights[0]
for night in nights:
    nights_total = nights_total - night
    if night < -3:
        cold_nights = cold_nights + 1
    if night > warmest:
        warmest = night
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{attempt}
:id: nights-count-outside-if
:check: nights-program
:expect: That is the number of all the nights

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
warmest = nights[0]
for night in nights:
    nights_total = nights_total + night
    if night < -3:
        print(night)
    cold_nights = cold_nights + 1
    if night > warmest:
        warmest = night
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{attempt}
:id: nights-count-inside-loop
:check: nights-program
:expect: That happens when the line cold_nights = 0 is inside the loop

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
warmest = nights[0]
for night in nights:
    cold_nights = 0
    nights_total = nights_total + night
    if night < -3:
        cold_nights = cold_nights + 1
    if night > warmest:
        warmest = night
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{attempt}
:id: nights-count-wrong-comparison
:check: nights-program
:expect: but it must refer to 3

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
warmest = nights[0]
for night in nights:
    nights_total = nights_total + night
    if night > -3:
        cold_nights = cold_nights + 1
    if night > warmest:
        warmest = night
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{attempt}
:id: nights-warmest-from-zero
:check: nights-program
:expect: That happens when the start value of warmest is 0

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
warmest = 0
for night in nights:
    nights_total = nights_total + night
    if night < -3:
        cold_nights = cold_nights + 1
    if night > warmest:
        warmest = night
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{attempt}
:id: nights-coldest
:check: nights-program
:expect: That is the coldest temperature

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
warmest = nights[0]
for night in nights:
    nights_total = nights_total + night
    if night < -3:
        cold_nights = cold_nights + 1
    if night < warmest:
        warmest = night
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{attempt}
:id: nights-warmest-not-updated
:check: nights-program
:expect: but it must refer to -1

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
warmest = nights[0]
for night in nights:
    nights_total = nights_total + night
    if night < -3:
        cold_nights = cold_nights + 1
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{attempt}
:id: nights-three-loops
:check: nights-program
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
for temperature in nights:
    nights_total = nights_total + temperature
cold_nights = 0
for temperature in nights:
    if temperature <= -4:
        cold_nights = cold_nights + 1
warmest = nights[0]
for temperature in nights:
    if temperature > warmest:
        warmest = temperature
print(nights_total)
print(cold_nights)
print(warmest)
```
````

````{hint}
:title: Show me a solution
:unlock: "nights-program" in failed_checks or "nights-program" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-nights-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [nights-solution]
:run: true
nights = [-4, -1, -6, -2, -8]
nights_total = 0
cold_nights = 0
warmest = nights[0]
for night in nights:
    nights_total = nights_total + night
    if night < -3:
        cold_nights = cold_nights + 1
    if night > warmest:
        warmest = night
print(nights_total)
print(cold_nights)
print(warmest)
```
````

```{verify}
:id: nights-program
:label: Your loop gives the total, the count and the warmest temperature
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed nights; cell-executed nights-solution
if "nights" not in globals():
    print("The name nights does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the list: nights = [-4, -1, -6, -2, -8]. Then hold Shift and press Enter to run the cell.")
elif nights != [-4, -1, -6, -2, -8]:
    print(f"The name nights refers to {nights} but it must refer to the list [-4, -1, -6, -2, -8]. Check that every number has the symbol - in front of it. Then run the cell again.")
elif "nights_total" not in globals():
    print("The name nights_total does not exist yet. Add a line before the loop that gives it the start value: nights_total = 0. Check the spelling. Then run the cell again.")
elif "cold_nights" not in globals():
    print("The name cold_nights does not exist yet. Add a line before the loop that gives it the start value: cold_nights = 0. Check the spelling. Then run the cell again.")
elif "warmest" not in globals():
    print("The name warmest does not exist yet. Add a line before the loop that gives it the first item of the list as its start value: warmest = nights[0]. Check the spelling. Then run the cell again.")
elif nights_total == -21 and cold_nights == 3 and warmest == -1:
    print("Correct. Your loop gives all three results: the total is -21, the number of cold nights is 3, and the warmest temperature is -1.")
elif nights_total == 0:
    print("The name nights_total still refers to 0, so nothing is added to it. Write a for loop over nights. Inside the loop, write a line that begins with four spaces and adds the temperature to the total: nights_total = nights_total + night. Then run the cell again.")
elif nights_total == -8:
    print("The name nights_total refers to -8. That is only the last temperature. There are two usual reasons. The line nights_total = 0 may be inside the loop: move it before the loop, so that it runs one time. Or the line that adds the temperature may begin without spaces, so that it runs one time after the loop: give it four spaces. Then run the cell again.")
elif nights_total != -21:
    print(f"The name nights_total refers to {nights_total} but it must refer to -21. Start with nights_total = 0 before the loop, and add each temperature inside the loop: nights_total = nights_total + night. Then run the cell again.")
elif cold_nights == 5:
    print("The total is correct. The name cold_nights refers to 5. That is the number of all the nights, so the line that adds 1 runs in every pass. It must be inside the block of the if: give it eight spaces, so that it runs only when the temperature is less than -3. Then run the cell again.")
elif cold_nights == 1:
    print("The total is correct. The name cold_nights refers to 1. That happens when the line cold_nights = 0 is inside the loop, so that every pass starts the count again. It also happens when the if is after the loop, so that it tests only the last temperature. The line cold_nights = 0 must be before the loop, and the if must be inside the loop, with four spaces. Then run the cell again.")
elif cold_nights != 3:
    print(f"The total is correct. The name cold_nights refers to {cold_nights} but it must refer to 3. Check that cold_nights = 0 is before the loop, that the comparison in the if line is night < -3, and that the line under the if adds 1: cold_nights = cold_nights + 1. Then run the cell again.")
elif warmest == 0:
    print("The total and the count are correct. The name warmest refers to 0, which is not a temperature in the list. That happens when the start value of warmest is 0: every temperature is below 0, so the comparison is never true. Start from the first item of the list: warmest = nights[0]. Then run the cell again.")
elif warmest == -8:
    print("The total and the count are correct. The name warmest refers to -8. That is the coldest temperature, not the warmest. The comparison must test whether the temperature is greater than the warmest so far: if night > warmest. Then run the cell again.")
else:
    print(f"The total and the count are correct. The name warmest refers to {warmest} but it must refer to -1. Start with warmest = nights[0] before the loop. Inside the loop, write if night > warmest with four spaces, and under it warmest = night with eight spaces. Then run the cell again.")
all(name in globals() for name in ("nights", "nights_total", "cold_nights", "warmest")) and nights == [-4, -1, -6, -2, -8] and nights_total == -21 and cold_nights == 3 and warmest == -1
```
