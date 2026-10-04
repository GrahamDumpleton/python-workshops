---
title: Errors are normal
requires: [verify:bread-fixed]
---

# Errors are normal

Python performs the lines of a cell in order, one after another.
Sometimes it reaches a line that it cannot perform. Python does not
guess what you meant. It stops at that line, and it shows an **error
message**: a message that says what went wrong, and where.

An error message is help. Without it, you would have to search the
whole program for the mistake. With it, Python tells you the line
where it stopped, and the reason.

Imagine that you write directions to your home for a friend. The
friend follows them one by one, and reaches an instruction that is
impossible: "Turn left at the bridge", but there is no bridge. A good
friend stops there, calls you, and says which instruction was the
problem. Python does the same.

People who have programmed for twenty years see error messages every
day. The difference between them and a new programmer is small: they
have learned to read the message calmly. That is what you learn in
this workshop.

## A cell with a mistake

The action below adds a cell that has a mistake in it. The cell is
meant to show the price of one loaf of bread, and then the cost of
four loaves. The action does not run the cell.

```{cell-insert}
:id: insert-bread
:title: Add a cell that has a mistake in it, without running it
:path: {{ notebook }}
:tags: [bread]
:run: false
bread_price = 2.5
print("The price of one loaf is", bread_price)
bread_cost = bread_prise * 4
print("The cost of four loaves is", bread_cost)
```

The second line and the fourth line use `print()` with two values,
and a comma between them. `print()` then shows both values on one
line, with a space between them.

Run the cell: click inside it, hold `Shift` and press `Enter`.

## What happened

Look at the output under the cell. It has two parts.

The first part is this line:

```
The price of one loaf is 2.5
```

This is the output of the second line of the cell. So Python performed
the first line and the second line without a problem.

The second part has a coloured background. This is the error message.
Python stopped at the third line of the cell, and it never reached the
fourth line. For that reason the output does not show the cost of four
loaves.

Nothing is broken. Your notebook still works, and Python is ready to
run the cell again.

Read the last line of the error message first. It is this:

```
NameError: name 'bread_prise' is not defined
```

A `NameError` means that Python found a name that has no value. The
message says which name: `bread_prise`. "Not defined" means that no
assignment has given this name a value.

## Your task

Correct the mistake in the cell. Then run the cell again. When the
cell is correct, the error message goes away, and the output has two
lines. The second line is `The cost of four loaves is 10.0`.

```{hint}
:title: Hint: where is the mistake?
The error message says that the name `bread_prise` is not defined.
Look at the first line of the cell. Which name did that line create?
Compare the two names letter by letter.
```

```{hint}
:title: Hint: how to correct it
The first line creates the name `bread_price`, with a `c`. The third
line uses `bread_prise`, with an `s`. Change `bread_prise` in the third
line to `bread_price`. Then run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run the cell, or after you have clicked `Check`.

```{attempt}
:id: bread-not-fixed
:check: bread-fixed
:expect: The name bread_cost does not exist yet
```

````{attempt}
:id: bread-wrong-value
:check: bread-fixed
:expect: but it must refer to 10.0

```{cell-insert}
:path: {{ notebook }}
:run: true
bread_price = 2.5
print("The price of one loaf is", bread_price)
bread_cost = bread_price + 4
print("The cost of four loaves is", bread_cost)
```
````

````{hint}
:title: Show me a solution
:unlock: "bread-fixed" in failed_checks or "bread-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-bread-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [bread-solution]
:run: true
bread_price = 2.5
print("The price of one loaf is", bread_price)
bread_cost = bread_price * 4
print("The cost of four loaves is", bread_cost)
```
````

```{verify}
:id: bread-fixed
:label: The cell runs without an error and calculates the cost of four loaves
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed bread; cell-executed bread-solution
if "bread_cost" not in globals():
    print("The name bread_cost does not exist yet. That means Python has not performed the third line of the cell without an error. Correct the spelling of the name in the third line, so that it is the same as the name in the first line. Then run the cell.")
elif bread_cost == 10.0:
    print("Correct. The cell runs without an error, and the name bread_cost refers to 10.0.")
else:
    print(f"The name bread_cost refers to {bread_cost} but it must refer to 10.0. The first line must be bread_price = 2.5, and the third line must multiply bread_price by 4. Change only the spelling of the name. Then run the cell again.")
"bread_cost" in globals() and bread_cost == 10.0
```

You have now done the three steps that a programmer does with every
error: run the code, read the message, and correct the mistake. The
rest of this workshop repeats these three steps with other types of
error.
