---
title: A surprise with decimal numbers
requires: [quiz:predict-decimals, verify:decimals-ran]
---

# A surprise with decimal numbers

Floats have one behaviour that surprises almost every new programmer.
It is better to see it now, on purpose, than to meet it later by
accident.

Predict the value of this simple addition.

```{quiz}
:id: predict-decimals
:title: Predict the value
question: "What does Python show as the value of the expression `0.1 + 0.2`?"
options:
  - { text: "`0.3`", explanation: "This is the answer in mathematics, and it is a sensible prediction. But Python shows a slightly different number. Choose again, then continue reading to learn why." }
  - { text: "`0.30000000000000004`", correct: true }
  - { text: "`0.12`", explanation: "Python does not join the two numbers. It adds them." }
explanation: "Python shows `0.30000000000000004`. The difference from `0.3` is extremely small, but it is there."
```

Run the expression to see it for yourself.

```{attempt}
:id: decimals-not-run
:check: decimals-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-decimals
:title: Add a cell with the expression 0.1 + 0.2, and run it
:path: {{ notebook }}
:tags: [decimals]
:run: true
0.1 + 0.2
```

## Why this happens

Python did not make a mistake, and you did not make one either. The
reason is the way that every computer stores floats.

You already know a similar problem. Try to write one third as a
decimal number: `0.333333...`. The threes never end. However many
digits you write, the number on the paper is a little less than one
third. The decimal system cannot write one third exactly.

A computer stores numbers in a different system, called binary, which
uses only the digits 0 and 1. In binary, the number `0.1` has the same
problem as one third has in decimal: its digits never end. So the
computer stores the nearest number that it can, which is extremely
close to `0.1`, but not exactly equal to it. The same is true for
`0.2`. When Python adds the two stored numbers, the two very small
differences appear in the result.

## What you need to remember

- A float is very close to the number that you wrote, but it is not
  always exactly that number.

- This happens in almost every programming language, not only in
  Python.

- For most work, the difference is too small to matter.

- Integers do not have this problem. Calculations with integers are
  always exact.

For some work the difference does matter, and money is the usual
example. Python has another kind of number for that work. A later
workshop in this course shows it.

```{verify}
:id: decimals-ran
:label: Python calculated 0.1 + 0.2
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed decimals
if (0.1 + 0.2) in Out.values():
    print("The cell ran, and you have seen the surprising value.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
(0.1 + 0.2) in Out.values()
```
