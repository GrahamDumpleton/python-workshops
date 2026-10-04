---
title: Adding up a total
requires: [verify:basket-ran, quiz:predict-parcels, verify:parcels-ran, verify:walks-total]
---

# Adding up a total

A loop often has to produce one result from all the items of a list.
The most common result is a total: the sum of all the prices, all the
distances, or all the hours.

Think of how you add up prices with a calculator. The calculator
shows `0` at the start. You add the first price, and the calculator
shows the total so far. You add the next price to that total. After
the last price, the calculator shows the total of them all.

A program does the same, with three parts:

1. Before the loop, a name is given the value `0`. This is the start
   value of the total.

2. Inside the loop, each pass adds one item to the total.

3. After the loop, the name refers to the total of all the items.

Click the action below. It adds a cell that adds up the prices in a
basket, and runs it.

```{attempt}
:id: basket-not-run
:check: basket-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-basket
:title: Add a cell that adds up three prices, and run it
:path: {{ notebook }}
:tags: [basket]
:run: true
basket = [3, 8, 5]
basket_total = 0
for price in basket:
    basket_total = basket_total + price
    print("Added", price, "and the total is now", basket_total)
print("The total is", basket_total)
```

The output is:

```
Added 3 and the total is now 3
Added 8 and the total is now 11
Added 5 and the total is now 16
The total is 16
```

```{verify}
:id: basket-ran
:label: The loop added up the three prices
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed basket
if globals().get("basket_total") == 16:
    print("The cell ran. The name basket_total refers to 16, the total of the three prices.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("basket_total") == 16
```

## What happened

The line `basket_total = basket_total + price` gives the name
`basket_total` a new value that uses its old value. Python calculates
the right side first, with the old total, and then makes the name
refer to the result.

| Pass | `price` | `basket_total` before | `basket_total` after |
|------|---------|-----------------------|----------------------|
| 1 | `3` | `0` | `3` |
| 2 | `8` | `3` | `11` |
| 3 | `5` | `11` | `16` |

Each pass begins with the total that the pass before it left. That
works only because the line `basket_total = 0` is before the loop, so
Python runs it one time.

The last line begins without spaces, so it is after the loop. Python
runs it one time, when the total is complete.

## Where the start value goes

The place of the line that gives the start value matters. Look at this
cell. Do not run it yet. It has a mistake: the line `weight = 0` is
inside the loop.

```python
parcels = [2, 9, 4]
for parcel in parcels:
    weight = 0
    weight = weight + parcel
print(weight)
```

```{quiz}
:id: predict-parcels
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "4"
wrong:
  - { text: "15", explanation: "`15` is the total of the three numbers. But the line `weight = 0` is inside the loop, so every pass starts again from 0." }
  - { text: "0", explanation: "Each pass sets `weight` to 0, but then the next line of the block adds the item. What is the value after the last pass?" }
  - { text: "2", explanation: "`2` is the value after the first pass. The loop makes three passes, and each pass replaces the value." }
otherwise: "Follow the last pass. The name `parcel` refers to 4. The block sets `weight` to 0, and then adds 4."
explanation: "Every pass sets `weight` to 0 again, so the total of the earlier passes is lost. After the last pass, `weight` is 0 plus 4."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: parcels-not-run
:check: parcels-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-parcels
:title: Add the cell that has the start value inside the loop, and run it
:path: {{ notebook }}
:tags: [parcels]
:run: true
parcels = [2, 9, 4]
for parcel in parcels:
    weight = 0
    weight = weight + parcel
print(weight)
```

```{verify}
:id: parcels-ran
:label: The cell with the mistake gave only the last item
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed parcels
if globals().get("parcels") == [2, 9, 4] and globals().get("weight") == 4:
    print("The cell ran. The name weight refers to 4, which is only the last item, because every pass started again from 0.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("parcels") == [2, 9, 4] and globals().get("weight") == 4
```

Python did not show an error message, because the cell is correct
Python. It only gives the wrong answer. So remember the rule: the line
that gives the start value goes before the loop.

## Your task

Mariam walks every day. On four days she walked 4, 7, 2 and 6
kilometres. Write a program that calculates the total distance.

Your program must do these four things, in this order:

1. Give the name `walks` to the list `[4, 7, 2, 6]`.

2. Give the name `walks_total` the start value `0`.

3. Use a `for` loop over `walks` that adds each distance to
   `walks_total`. You can choose the loop name. A good loop name is
   `walk`.

4. After the loop, show the value of `walks_total` with `print()`.

When the program is correct, the output under the cell is:

```
19
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-walks
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [walks]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. The
line in the block of the loop must begin with four spaces. When you
press `Enter` after the colon, the notebook adds the four spaces for
you. To write a line after the loop, remove the spaces at the
beginning of the line. Then run the cell: hold `Shift` and press
`Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell with the basket. Your program has the same four
parts: the list, the start value, the loop with one line in its
block, and the `print()` line after the loop. Use the names `walks`
and `walks_total`.
```

```{hint}
:title: Hint: the loop
The loop has two lines. The first line is `for walk in walks:`. The
second line begins with four spaces, and adds the distance to the
total: `walks_total = walks_total + walk`.
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
:id: walks-not-started
:check: walks-total
:expect: The name walks does not exist yet
```

````{attempt}
:id: walks-wrong-list
:check: walks-total
:expect: The name walks refers to [4, 7, 2]

```{cell-insert}
:path: {{ notebook }}
:run: true
walks = [4, 7, 2]
```
````

````{attempt}
:id: walks-list-only
:check: walks-total
:expect: The name walks_total does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
walks = [4, 7, 2, 6]
```
````

````{attempt}
:id: walks-nothing-added
:check: walks-total
:expect: The name walks_total still refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
walks = [4, 7, 2, 6]
walks_total = 0
for walk in walks:
    print(walk)
print(walks_total)
```
````

````{attempt}
:id: walks-zero-inside
:check: walks-total
:expect: That is only the last distance

```{cell-insert}
:path: {{ notebook }}
:run: true
walks = [4, 7, 2, 6]
for walk in walks:
    walks_total = 0
    walks_total = walks_total + walk
print(walks_total)
```
````

````{attempt}
:id: walks-added-after-loop
:check: walks-total
:expect: That is only the last distance

```{cell-insert}
:path: {{ notebook }}
:run: true
walks = [4, 7, 2, 6]
walks_total = 0
for walk in walks:
    print(walk)
walks_total = walks_total + walk
print(walks_total)
```
````

````{attempt}
:id: walks-subtracted
:check: walks-total
:expect: but it must refer to 19

```{cell-insert}
:path: {{ notebook }}
:run: true
walks = [4, 7, 2, 6]
walks_total = 0
for walk in walks:
    walks_total = walks_total - walk
print(walks_total)
```
````

````{attempt}
:id: walks-other-loop-name
:check: walks-total
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
walks = [4, 7, 2, 6]
walks_total = 0
for distance in walks:
    walks_total = distance + walks_total
print(walks_total)
```
````

````{hint}
:title: Show me a solution
:unlock: "walks-total" in failed_checks or "walks-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-walks-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [walks-solution]
:run: true
walks = [4, 7, 2, 6]
walks_total = 0
for walk in walks:
    walks_total = walks_total + walk
print(walks_total)
```
````

```{verify}
:id: walks-total
:label: Your loop adds up the four distances
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed walks; cell-executed walks-solution
if "walks" not in globals():
    print("The name walks does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the list: walks = [4, 7, 2, 6]. Then hold Shift and press Enter to run the cell.")
elif walks != [4, 7, 2, 6]:
    print(f"The name walks refers to {walks} but it must refer to the list [4, 7, 2, 6]. Correct the first line of your program. Then run the cell again.")
elif "walks_total" not in globals():
    print("The name walks_total does not exist yet. Add a line before the loop that gives it the start value: walks_total = 0. Check the spelling. Then run the cell again.")
elif walks_total == 19:
    print("Correct. Your loop added the four distances, and the name walks_total refers to 19.")
elif walks_total == 0:
    print("The name walks_total still refers to 0, so the loop does not add anything to it. Inside the loop, write a line that begins with four spaces and adds the distance to the total: walks_total = walks_total + walk. Then run the cell again.")
elif walks_total == 6:
    print("The name walks_total refers to 6. That is only the last distance. There are two usual reasons. The line walks_total = 0 may be inside the loop: move it before the loop, so that it runs one time. Or the line that adds the distance may begin without spaces, so that it runs one time after the loop: give it four spaces. Then run the cell again.")
else:
    print(f"The name walks_total refers to {walks_total} but it must refer to 19. Start with walks_total = 0 before the loop, and add each distance inside the loop: walks_total = walks_total + walk. Then run the cell again.")
"walks" in globals() and "walks_total" in globals() and walks == [4, 7, 2, 6] and walks_total == 19
```
