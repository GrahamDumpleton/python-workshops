---
title: Spaces at the start of a line
requires: [verify:water-fixed]
---

# Spaces at the start of a line

In most writing, spaces at the start of a line change nothing. In
Python, they have a meaning. The spaces at the start of a line are
called **indentation**, and a line that starts with spaces is an
**indented** line.

Python uses indentation to show that some lines belong together, as
one group. The next workshop, **Making decisions**, uses indentation
on purpose, and explains it. Until then, every line that you write
starts at the left edge of the cell, with no spaces before it.

When a line has spaces before it and Python does not expect a group
there, Python cannot read the cell. It shows an `IndentationError`.

An `IndentationError` means that the spaces at the start of a line are
wrong. This mistake is common, because it is not always visible at
first: one extra space is small. It often happens when you copy a line
from another place.

## A cell with a mistake

The action below adds a cell that has a mistake in it. The cell is
meant to calculate how many glasses can be filled from 2 litres of
water, when 1 litre fills 4 glasses. The action does not run the cell.

```{cell-insert}
:id: insert-water
:title: Add a cell that has a mistake in it, without running it
:path: {{ notebook }}
:tags: [water]
:run: false
water_litres = 2
water_glasses = water_litres * 4
    print("Glasses of water:", water_glasses)
```

Run the cell: click inside it, hold `Shift` and press `Enter`.

## Read the message

Start at the last line:

```
IndentationError: unexpected indent
```

- The type of the error is `IndentationError`.

- The message is `unexpected indent`. "Unexpected" means that Python
  did not expect it. "Indent" is a short word for indentation. So the
  message says: "this line starts with spaces, and I did not expect
  spaces here".

- The line is in the first line of the error message, after the word
  `line`. It is line 3. Under it, the error message shows the line of
  code, and the symbol `^`.

This error message has the same form as the message for a
`SyntaxError`. That is because an `IndentationError` is a kind of
`SyntaxError`: Python finds it when it reads the cell, before any line
runs. So the first two lines of this cell did not run.

## Your task

Correct line 3: remove the spaces at the start of the line. Then run
the cell again. The output must be `Glasses of water: 8`.

```{hint}
:title: Hint: how do I remove the spaces?
Click in line 3, immediately before the word `print`. Press the
`Backspace` key until the word `print` is at the left edge of the
cell, directly under the first letter of the line above it.
```

```{hint}
:title: Hint: I removed too much
If line 3 moved up and joined line 2, press `Enter` to separate the
two lines again. Each of the three lines must be on its own line, and
each must start at the left edge.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run the cell, or after you have clicked `Check`.

```{attempt}
:id: water-not-fixed
:check: water-fixed
:expect: The name water_glasses does not exist yet
```

````{attempt}
:id: water-wrong-value
:check: water-fixed
:expect: but it must refer to 8

```{cell-insert}
:path: {{ notebook }}
:run: true
water_litres = 2
water_glasses = water_litres * 2
print("Glasses of water:", water_glasses)
```
````

````{hint}
:title: Show me a solution
:unlock: "water-fixed" in failed_checks or "water-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-water-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [water-solution]
:run: true
water_litres = 2
water_glasses = water_litres * 4
print("Glasses of water:", water_glasses)
```
````

```{verify}
:id: water-fixed
:label: The cell runs without an error and shows 8 glasses of water
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed water; cell-executed water-solution
if "water_glasses" not in globals():
    print("The name water_glasses does not exist yet. That means no line of the cell has run. When one line starts with spaces that Python does not expect, Python finds the error before it runs any line. Remove every space before the word print in the third line, so that the line starts at the left edge. Then run the cell.")
elif water_glasses == 8:
    print("Correct. Every line starts at the left edge now, and the name water_glasses refers to 8.")
else:
    print(f"The name water_glasses refers to {water_glasses} but it must refer to 8. The first line must be water_litres = 2, and the second line must be water_glasses = water_litres * 4. Change only the spaces in the third line. Then run the cell again.")
"water_glasses" in globals() and water_glasses == 8
```
