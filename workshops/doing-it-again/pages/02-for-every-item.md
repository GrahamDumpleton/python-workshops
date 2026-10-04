---
title: The same lines for every item
requires: [verify:guests-ran, quiz:predict-drinks, verify:drinks-ran]
---

# The same lines for every item

A **list** is a value that holds several values in order. Each value
in a list is called an **item**. Programs often need to do the same
thing with every item of a list: print every name, add every price,
check every temperature.

You could write one line for each item. For a list of three names,
that is three lines. For a list of three thousand names, it is three
thousand lines, and you must change the program each time that the
list changes.

A **loop** solves this problem. A loop is a piece of code that tells
Python to run the same lines many times. You write the lines once, and
Python repeats them.

Think of a person who writes name cards for a dinner. The instruction
is: "for each guest on the list, write a card". The instruction is one
sentence. It works for a list of three guests, and it works for a list
of three hundred guests.

## The for loop

The loop that works through a list is called the `for` loop. Click the
action below. It adds a cell with a `for` loop, and runs it.

```{attempt}
:id: guests-not-run
:check: guests-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-guests
:title: Add a cell that welcomes every guest on a list, and run it
:path: {{ notebook }}
:tags: [guests]
:run: true
guests = ["Amara", "Kenji", "Sofia"]
for guest in guests:
    print("Welcome,", guest)
```

The output has three lines, one for each guest:

```
Welcome, Amara
Welcome, Kenji
Welcome, Sofia
```

```{verify}
:id: guests-ran
:label: The loop welcomed every guest
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed guests
if globals().get("guests") == ["Amara", "Kenji", "Sofia"] and globals().get("guest") == "Sofia":
    print("The cell ran. The loop printed one line for each of the three guests.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("guests") == ["Amara", "Kenji", "Sofia"] and globals().get("guest") == "Sofia"
```

## What happened

The cell has only one `print()` line, but Python ran that line three
times.

1. `guests = ["Amara", "Kenji", "Sofia"]` makes the name `guests`
   refer to a list of three items.

2. `for guest in guests:` starts the loop. Read it as "for each guest
   in the list of guests". The line ends with a colon, in the same way
   as a line that begins with `if`.

3. `print("Welcome,", guest)` begins with four spaces, so it belongs
   to the loop. Python runs it one time for each item of the list.

The name `guest`, between the words `for` and `in`, is the **loop
name**. You choose the loop name yourself. The loop gives this name a
new value each time:

- The first time, Python makes `guest` refer to `"Amara"`, and then
  runs the `print()` line.

- The second time, Python makes `guest` refer to `"Kenji"`, and runs
  the `print()` line again.

- The third time, Python makes `guest` refer to `"Sofia"`, and runs
  the `print()` line again.

After the last item, the list has no more items, so the loop ends.

Each run of the lines in the loop is called a **pass**. This loop made
three passes, because the list has three items.

## The block of a loop

The lines that a loop repeats are its **block**. A block is a group of
lines that belong together. Each line of the block begins with four
spaces. The spaces are called **indentation**. This is the same rule
as for the block of an `if`.

The block ends at the first line that begins without the four spaces.
Python runs that line only one time, after the loop has ended.

Look at this cell. Do not run it yet. Two lines belong to the block,
and the last line is outside the block.

```python
drinks = ["tea", "coffee"]
for drink in drinks:
    print(drink)
    print("---")
print("done")
```

Predict the complete output of the cell. Type every line that you
think the notebook shows, exactly as it appears. The box has room for
more than one line, so click `Submit` when you have finished.

```{quiz}
:id: predict-drinks
:type: text
:lines: 6
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "tea\n---\ncoffee\n---\ndone"
wrong:
  - { text: "tea\ncoffee\n---\ndone", explanation: "The line `print(\"---\")` begins with four spaces, so it belongs to the block. Python runs it in every pass, not only one time." }
  - { text: "tea\n---\ndone\ncoffee\n---\ndone", explanation: "The line `print(\"done\")` begins without spaces, so it is outside the block. Python runs it only one time, after the loop has ended." }
  - { text: "tea\ncoffee\n---\n---\ndone", explanation: "Python runs the whole block for the first item, and then the whole block for the second item. So `---` appears after each drink." }
  - { text: "tea\n---\ncoffee\n---", explanation: "The loop is correct. But the last line of the cell, `print(\"done\")`, also runs, one time, after the loop has ended." }
  - { text: "drink\n---\ndrink\n---\ndone", explanation: "`print(drink)` shows the value that the loop name `drink` refers to, not the name. In the first pass that value is `tea`." }
otherwise: "The list has two items, so the loop makes two passes. Each pass runs the two lines that begin with four spaces. The last line runs one time, after the loop."
explanation: "The loop makes two passes. Each pass prints the drink and then `---`. After the loop has ended, the last line prints `done` one time."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: drinks-not-run
:check: drinks-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-drinks
:title: Add the cell with two lines in the block of the loop, and run it
:path: {{ notebook }}
:tags: [drinks]
:run: true
drinks = ["tea", "coffee"]
for drink in drinks:
    print(drink)
    print("---")
print("done")
```

```{verify}
:id: drinks-ran
:label: The loop ran its block for every drink
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed drinks
if globals().get("drinks") == ["tea", "coffee"] and globals().get("drink") == "coffee":
    print("The cell ran. Each pass printed two lines, and the last line of the cell printed done one time.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("drinks") == ["tea", "coffee"] and globals().get("drink") == "coffee"
```

The indentation decides what the loop repeats. A line with four spaces
is inside the loop, and runs in every pass. A line without spaces is
after the loop, and runs one time. Many mistakes with loops are
mistakes of indentation, so always check where each line begins.
