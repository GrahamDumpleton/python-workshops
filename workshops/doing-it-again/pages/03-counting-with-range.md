---
title: Counting with range()
requires: [verify:laps-ran, quiz:predict-tens, verify:tens-ran]
---

# Counting with range()

Sometimes there is no list. You want to repeat some lines a fixed
number of times, or you need the numbers 1, 2, 3 and so on.

You could write a list of numbers yourself, such as `[0, 1, 2]`. But
that does not work well for a thousand numbers. Python has a function
that gives the numbers to a loop, one after another. Its name is
`range()`. A function is a piece of code that someone has already
written and given a name, such as `print()`.

Write a whole number between the parentheses. `range(3)` gives three
numbers: `0`, `1` and `2`.

Click the action below. It adds a cell that uses `range(3)`, and runs
it.

```{attempt}
:id: laps-not-run
:check: laps-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-laps
:title: Add a cell with a loop that makes 3 passes, and run it
:path: {{ notebook }}
:tags: [laps]
:run: true
for lap in range(3):
    print("Lap", lap)
```

The output is:

```
Lap 0
Lap 1
Lap 2
```

```{verify}
:id: laps-ran
:label: The loop made 3 passes
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed laps
if globals().get("lap") == 2:
    print("The cell ran. The loop made 3 passes, with the numbers 0, 1 and 2.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("lap") == 2
```

## What happened

The loop made three passes. In each pass, the loop name `lap` referred
to the next number.

Two facts about `range(3)` are important:

- The numbers begin at `0`, not at `1`. Python counts from `0`, in the
  same way as it counts the items of a list.

- The numbers stop before `3`. The number `3` itself is not included.

So `range(3)` gives exactly three numbers, and the loop makes exactly
three passes. If you only want to repeat some lines three times, you
do not need to use the loop name in the block at all.

## A different first number

`range()` also accepts two numbers. The first number is where to
begin. The second number is where to stop, and it is not included.
`range(1, 4)` gives the numbers `1`, `2` and `3`.

Look at this cell. Do not run it yet.

```python
for number in range(1, 4):
    print(number * 10)
```

Predict the complete output of the cell. Type every line that you
think the notebook shows.

```{quiz}
:id: predict-tens
:type: text
:lines: 5
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "10\n20\n30"
wrong:
  - { text: "10\n20\n30\n40", explanation: "The second number of `range(1, 4)` is where to stop, and it is not included. The last value of `number` is 3." }
  - { text: "0\n10\n20\n30", explanation: "The first number of `range(1, 4)` is where to begin. The first value of `number` is 1, not 0." }
  - { text: "1\n2\n3", explanation: "These are the values of `number`. But the cell prints `number * 10`." }
  - { text: "1\n2\n3\n4", explanation: "The cell prints `number * 10`, and the number 4 is not included. `range(1, 4)` stops before 4." }
  - { pattern: "10[ ,]+20[ ,]+30", explanation: "The three values are correct. But each `print()` starts a new line, so the output has three lines." }
otherwise: "`range(1, 4)` gives the numbers 1, 2 and 3. Each pass prints the number multiplied by 10, on a line of its own."
explanation: "`range(1, 4)` begins at 1 and stops before 4. The loop makes three passes, and prints 10, 20 and 30."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: tens-not-run
:check: tens-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-tens
:title: Add the cell that uses range(1, 4), and run it
:path: {{ notebook }}
:tags: [tens]
:run: true
for number in range(1, 4):
    print(number * 10)
```

```{verify}
:id: tens-ran
:label: The loop used the numbers 1, 2 and 3
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed tens
if globals().get("number") == 3:
    print("The cell ran. The loop used the numbers 1, 2 and 3, and printed 10, 20 and 30.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("number") == 3
```

To remember the rule, read `range(1, 4)` as "from 1, and stop before
4".
