---
title: Showing values with print()
requires: [verify:fruit-ran, quiz:predict-candles, verify:candles-ran, verify:cups-ran]
---

# Showing values with print()

A notebook shows only the value of the last line of a cell. A program
often needs to show more than that: a value from the middle of a
calculation, or several values one after another.

Python has an instruction for this, named `print()`. Write a value
between the parentheses, and Python shows that value. The word comes
from the time when computers printed their results on paper. Today,
`print()` shows the value on the screen.

`print()` works on any line of a cell, and a cell can use it as many
times as you like.

Click the action below. It adds a cell that uses `print()` three
times, and runs it.

```{attempt}
:id: fruit-not-run
:check: fruit-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-fruit
:title: Add a cell that shows three values with print(), and run it
:path: {{ notebook }}
:tags: [fruit]
:run: true
apples = 7
print(apples)
pears = 5
print(pears)
print(apples + pears)
```

The output has three lines: `7`, `5` and `12`.

## What happened

- `print(apples)` shows the value that the name `apples` refers to,
  which is `7`.

- `print(pears)` shows `5`, on a new line. Each `print()` starts a new
  line of output.

- `print(apples + pears)` has an expression between the parentheses.
  Python calculates the expression first, and then shows the result,
  `12`.

`print()` is a **function**: a piece of code that someone has already
written and given a name. To use a function, write its name and then
parentheses, with a value between them. A later part of this course
teaches functions, and how to write your own. For now, you need to
know only how to use this one.

```{verify}
:id: fruit-ran
:label: The cell showed three values
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed fruit
if globals().get("apples") == 7 and globals().get("pears") == 5:
    print("The cell ran. It showed the values 7, 5 and 12.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("apples") == 7 and globals().get("pears") == 5
```

## The value at that moment

`print()` shows the value that a name refers to at the moment when
the line runs. Look at this cell. Do not run it yet.

```python
candles = 4
print(candles)
candles = candles * 2
print(candles)
```

Predict the complete output of the cell. Type every line that you
think the notebook shows, exactly as it appears. The box has room for
more than one line, so click `Submit` when you have finished.

```{quiz}
:id: predict-candles
:type: text
:lines: 3
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "4\n8"
wrong:
  - { text: "8", explanation: "The cell uses `print()` two times, so the output has two lines. What does the first `print(candles)` show?" }
  - { text: "8\n8", explanation: "The first `print(candles)` runs before the name gets its new value. At that moment, `candles` refers to 4." }
  - { text: "4\n4", explanation: "The third line gives the name `candles` a new value before the second `print(candles)` runs." }
  - { pattern: "4[ ,]+8", explanation: "The two values are correct. But each `print()` starts a new line, so the output has two lines." }
otherwise: "Follow the cell line by line. The output has one line for each `print()`."
explanation: "The first `print(candles)` shows 4. Then the name gets a new value, 8, and the second `print(candles)` shows 8."
```

```{attempt}
:id: candles-not-run
:check: candles-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-candles
:title: Add the cell that prints candles two times, and run it
:path: {{ notebook }}
:tags: [candles]
:run: true
candles = 4
print(candles)
candles = candles * 2
print(candles)
```

```{verify}
:id: candles-ran
:label: The cell printed the old value and the new value
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed candles
if globals().get("candles") == 8:
    print("The cell ran. It showed 4, and then 8.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("candles") == 8
```

## Why a cell shows some values without print()

You now know two ways in which a value appears under a cell. They are
different, and the next cell shows both.

```{attempt}
:id: cups-not-run
:check: cups-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-cups
:title: Add a cell that shows one value in both ways, and run it
:path: {{ notebook }}
:tags: [cups]
:run: true
cups = 6
print(cups)
cups
```

The output shows `6` two times.

- The first `6` comes from `print(cups)`. Python shows it because your
  code says so.

- The second `6` is the value of the last line. The notebook shows it,
  with a number in square brackets at its left side. This is a
  convenience of the notebook.

```{verify}
:id: cups-ran
:label: The cell showed the value in both ways
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed cups
if globals().get("cups") == 6:
    print("The cell ran. It showed 6 two times: once from print(), and once as the value of the last line.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("cups") == 6
```

The difference matters later in the course, when you run Python
programs outside a notebook. There, nothing shows the value of the
last line. A program shows only what it prints. So from now on, use
`print()` when you want your program to show a value.

```{hint}
:title: Can print() show more than one value?
Yes. Write the values between the parentheses, with a comma between
them: `print(apples, pears)`. Python shows them on one line, with a
space between them: `7 5`.
```
