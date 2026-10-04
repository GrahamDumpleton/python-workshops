---
title: A cell shows only its last value
requires: [quiz:predict-two-lines, verify:two-lines-ran]
---

# A cell shows only its last value

So far, each cell has held one expression. A cell can hold more than
one line of code. Python then performs the lines in order, from the
first line to the last, as page two of this workshop described for a
program.

But there is a rule about the output that you need to know.

Look at this cell. It has two expressions, on two lines. The value of
the first is 11, and the value of the second is 100.

```python
3 + 8
25 * 4
```

Predict the output of the cell. Type everything that you think the
notebook shows under the cell, exactly as it appears. The box has room
for more than one line, so click `Submit` when you have finished.

```{quiz}
:id: predict-two-lines
:type: text
:lines: 2
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "100"
wrong:
  - { text: "11", explanation: "`11` is the value of the first line. The notebook shows the value of the last line." }
  - { pattern: "11\\D+100", explanation: "Python calculates both values, but the notebook shows only one of them. Which one do you think it is?" }
  - { text: "111", explanation: "`111` is the two values added together. Python does not add them. The two lines are separate expressions." }
otherwise: "The values of the two lines are 11 and 100. Does the notebook show the first, the second, or both?"
explanation: "Python calculates both expressions. The notebook shows only the value of the last line of the cell."
```

Run the cell and see.

```{attempt}
:id: two-lines-not-run
:check: two-lines-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-two-lines
:title: Add the cell with two expressions, and run it
:path: {{ notebook }}
:tags: [two-lines]
:run: true
3 + 8
25 * 4
```

The output is `100`. Python did calculate `3 + 8`. It calculated the
value 11, and then, because nothing in the code said what to do with
that value, Python discarded it. The notebook shows a value only for
the last line of a cell.

This rule explains something that can look like a mistake: you write
several calculations in one cell, and only one answer appears. The
other calculations did run. The notebook did not show their values.

This rule belongs to the notebook, not to the Python language. Python
calculates every line in the same way wherever it runs. Showing the
value of the last line is something that the notebook does for you.
Later in the course you use Python in other places, and they show
values differently.

For now, the solution is to put each expression that you want to see
in a cell of its own. The next workshop shows another way: an
instruction that tells Python to show a value, wherever it is in the
cell. That instruction works in every place where you use Python, not
only in a notebook.

```{verify}
:id: two-lines-ran
:label: The cell with two expressions ran
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed two-lines
if 100 in Out.values():
    print("The cell ran. Its output is 100, the value of its last line.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
100 in Out.values()
```
