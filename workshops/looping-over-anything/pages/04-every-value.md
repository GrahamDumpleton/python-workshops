---
title: Every value of a dictionary
requires: [verify:seats-ran, verify:rain-total]
---

# Every value of a dictionary

A loop over a dictionary gives the keys. Sometimes a program needs
only the values, and the keys do not matter. To add up all the
numbers in a dictionary, you need each number, but you do not need to
know which key it belongs to.

A dictionary has a method for this, named `.values()`. A **method**
is a function that belongs to a value. You write it after the value,
with a dot between them. The method `.values()` gives all the values
of the dictionary, without the keys, and a `for` loop can work
through them.

Think of a receipt from a shop. To find the total, you read down the
column of prices and add them. You do not read the names of the
products.

Click the action below. It adds a cell that adds up the values of a
dictionary, and runs it.

```{attempt}
:id: seats-not-run
:check: seats-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-seats
:title: Add a cell that adds up the values of a dictionary, and run it
:path: {{ notebook }}
:tags: [seats]
:run: true
seats = {"bus": 40, "tram": 120, "taxi": 4}
seats_total = 0
for seat_count in seats.values():
    print(seat_count)
    seats_total = seats_total + seat_count
print("The total is", seats_total)
```

The output is:

```
40
120
4
The total is 164
```

```{verify}
:id: seats-ran
:label: The loop added up the values of the dictionary
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed seats
if globals().get("seats") == {"bus": 40, "tram": 120, "taxi": 4} and globals().get("seats_total") == 164:
    print("The cell ran. The loop went through the three values, and the name seats_total refers to 164.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("seats") == {"bus": 40, "tram": 120, "taxi": 4} and globals().get("seats_total") == 164
```

## What happened

1. `seats = {"bus": 40, "tram": 120, "taxi": 4}` makes the name
   `seats` refer to a dictionary. Each key is a kind of vehicle, and
   each value is its number of seats.

2. `seats_total = 0` gives the total its start value, before the
   loop.

3. `for seat_count in seats.values():` starts the loop. The
   expression `seats.values()` gives the values of the dictionary.
   Before each pass, Python makes the loop name `seat_count` refer to
   the next value.

4. The two lines of the block show the value and add it to the total.

5. The last line begins without spaces, so it runs one time, after
   the loop.

| Pass | `seat_count` | `seats_total` after the pass |
|------|--------------|------------------------------|
| 1 | `40` | `40` |
| 2 | `120` | `160` |
| 3 | `4` | `164` |

The keys `"bus"`, `"tram"` and `"taxi"` do not appear in the output.
The loop name never refers to a key in this loop.

Remember the parentheses after `values`. They tell Python to run the
method.

## Your task

A dictionary holds the rain that fell in three months, in
millimetres. Write a program that calculates the total rain of the
three months.

Your program must do these four things, in this order:

1. Give the name `rainfall` to the dictionary
   `{"March": 62, "April": 48, "May": 75}`.

2. Give the name `rain_total` the start value `0`.

3. Use a `for` loop over `rainfall.values()` that adds each value to
   `rain_total`. You can choose the loop name. A good loop name is
   `millimetres`.

4. After the loop, show the value of `rain_total` with `print()`.

When the program is correct, the output under the cell is:

```
185
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-rainfall
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [rainfall]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. The
line in the block of the loop must begin with four spaces. Then run
the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell with the seats. Your program has the same four
parts: the dictionary, the start value, the loop with one line in its
block, and the `print()` line after the loop. Use the names `rainfall`
and `rain_total`.
```

```{hint}
:title: Hint: the loop
The loop has two lines. The first line is
`for millimetres in rainfall.values():`. The second line begins with
four spaces, and adds the value to the total:
`rain_total = rain_total + millimetres`.
```

```{hint}
:title: Hint: I see a TypeError
A `TypeError` here usually means that the loop is over the keys. The
line `for millimetres in rainfall:` gives the keys, which are strings
such as `"March"`. Python cannot add a string to a number. Write
`rainfall.values()` in the loop line, with the parentheses.
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
:id: rainfall-not-started
:check: rain-total
:expect: The name rainfall does not exist yet
```

````{attempt}
:id: rainfall-wrong-dictionary
:check: rain-total
:expect: but it must refer to the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
rainfall = {"March": 62, "April": 48}
```
````

````{attempt}
:id: rainfall-dictionary-only
:check: rain-total
:expect: The name rain_total does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
rainfall = {"March": 62, "April": 48, "May": 75}
```
````

````{attempt}
:id: rainfall-nothing-added
:check: rain-total
:expect: The name rain_total still refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
rainfall = {"March": 62, "April": 48, "May": 75}
rain_total = 0
for millimetres in rainfall.values():
    print(millimetres)
print(rain_total)
```
````

````{attempt}
:id: rainfall-zero-inside
:check: rain-total
:expect: That is only the last value

```{cell-insert}
:path: {{ notebook }}
:run: true
rainfall = {"March": 62, "April": 48, "May": 75}
for millimetres in rainfall.values():
    rain_total = 0
    rain_total = rain_total + millimetres
print(rain_total)
```
````

````{attempt}
:id: rainfall-subtracted
:check: rain-total
:expect: but it must refer to 185

```{cell-insert}
:path: {{ notebook }}
:run: true
rainfall = {"March": 62, "April": 48, "May": 75}
rain_total = 0
for millimetres in rainfall.values():
    rain_total = rain_total - millimetres
print(rain_total)
```
````

````{attempt}
:id: rainfall-with-keys
:check: rain-total
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
rainfall = {"March": 62, "April": 48, "May": 75}
rain_total = 0
for month in rainfall:
    rain_total = rainfall[month] + rain_total
print(rain_total)
```
````

````{hint}
:title: Show me a solution
:unlock: "rain-total" in failed_checks or "rain-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-rainfall-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [rainfall-solution]
:run: true
rainfall = {"March": 62, "April": 48, "May": 75}
rain_total = 0
for millimetres in rainfall.values():
    rain_total = rain_total + millimetres
print(rain_total)
```
````

```{verify}
:id: rain-total
:label: Your loop adds up the values of the dictionary
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rainfall; cell-executed rainfall-solution
if "rainfall" not in globals():
    print("The name rainfall does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the dictionary: rainfall = {\"March\": 62, \"April\": 48, \"May\": 75}. Then hold Shift and press Enter to run the cell.")
elif rainfall != {"March": 62, "April": 48, "May": 75}:
    print(f"The name rainfall refers to {rainfall!r}", "but it must refer to the dictionary {\"March\": 62, \"April\": 48, \"May\": 75}. Correct the first line of your program. Then run the cell again.")
elif "rain_total" not in globals():
    print("The name rain_total does not exist yet. Add a line before the loop that gives it the start value: rain_total = 0. Check the spelling. Then run the cell again.")
elif rain_total == 185:
    print("Correct. Your loop added the three values of the dictionary, and the name rain_total refers to 185.")
elif rain_total == 0:
    print("The name rain_total still refers to 0, so the loop does not add anything to it. Inside the loop, write a line that begins with four spaces and adds the value to the total: rain_total = rain_total + millimetres. If the cell showed a TypeError, the loop is over the keys: write rainfall.values() in the loop line. Then run the cell again.")
elif rain_total == 75:
    print("The name rain_total refers to 75. That is only the last value. There are two usual reasons. The line rain_total = 0 may be inside the loop: move it before the loop, so that it runs one time. Or the line that adds the value may begin without spaces, so that it runs one time after the loop: give it four spaces. Then run the cell again.")
else:
    print(f"The name rain_total refers to {rain_total!r} but it must refer to 185. Start with rain_total = 0 before the loop, and add each value inside the loop: rain_total = rain_total + millimetres. Then run the cell again.")
"rainfall" in globals() and "rain_total" in globals() and rainfall == {"March": 62, "April": 48, "May": 75} and rain_total == 185
```
