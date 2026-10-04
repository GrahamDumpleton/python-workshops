---
title: Repeating with while
requires: [quiz:predict-weeks, verify:saving-ran]
---

# Repeating with while

A `for` loop knows how many passes it makes before it starts: one pass
for each item of the list, or one pass for each number of `range()`.

Sometimes you do not know the number of passes. You want to repeat
some lines until something happens: until you have saved enough
money, until a tank is full, until a game is over.

Think of filling a glass with a spoon. You do not decide the number of
spoons before you start. Before each spoon, you look at the glass.
While the glass is not full, you add one more spoon. When the glass is
full, you stop.

Python has a second loop for this, the `while` loop. A `while` loop
has a **condition**: an expression whose value is `True` or `False`,
such as a comparison. Before each pass, Python calculates the
condition.

- If the condition is `True`, Python runs the block, and then
  calculates the condition again.

- If the condition is `False`, the loop ends, and Python continues
  with the first line after the block.

A `while` line looks like an `if` line: the word `while`, then the
condition, then a colon, and an indented block under it. The
difference is that an `if` runs its block one time at most, and a
`while` runs its block again and again.

## Saving for a bicycle

Thabo wants to buy a bicycle that costs 100. He saves 30 each week.
This cell calculates how many weeks he needs. Do not run it yet.

```python
saved = 0
weeks = 0
while saved < 100:
    saved = saved + 30
    weeks = weeks + 1
print(weeks)
```

Follow the passes yourself, on paper if that helps. Before each pass,
ask: is `saved` less than `100`?

```{quiz}
:id: predict-weeks
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "4"
wrong:
  - { text: "3", explanation: "After 3 passes, `saved` is 90. That is still less than 100, so the condition is still true, and the loop makes one more pass." }
  - { text: "5", explanation: "After 4 passes, `saved` is 120. The condition `saved < 100` is then false, so the loop ends before a fifth pass." }
  - { text: "120", explanation: "`120` is the final value of `saved`. The cell prints `weeks`, which counts the passes." }
  - { text: "100", explanation: "The cell prints `weeks`, which counts the passes of the loop. It does not print the amount." }
otherwise: "Each pass adds 30 to `saved` and adds 1 to `weeks`. The loop continues while `saved` is less than 100. Count the passes."
explanation: "The value of `saved` goes from 0 to 30, 60, 90 and 120. After the fourth pass, 120 is not less than 100, so the loop ends. The name `weeks` refers to 4."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: saving-not-run
:check: saving-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-saving
:title: Add the cell with the while loop, and run it
:path: {{ notebook }}
:tags: [saving]
:run: true
saved = 0
weeks = 0
while saved < 100:
    saved = saved + 30
    weeks = weeks + 1
print(weeks)
```

```{verify}
:id: saving-ran
:label: The while loop ended after 4 passes
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed saving
if globals().get("weeks") == 4 and globals().get("saved") == 120:
    print("The cell ran. The loop made 4 passes, and ended when saved reached 120.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("weeks") == 4 and globals().get("saved") == 120
```

## What happened

| Before pass | `saved` | `saved < 100` | What Python does |
|-------------|---------|---------------|------------------|
| 1 | `0` | `True` | runs the block |
| 2 | `30` | `True` | runs the block |
| 3 | `60` | `True` | runs the block |
| 4 | `90` | `True` | runs the block |
| 5 | `120` | `False` | ends the loop |

The loop ended because the block changes the value of `saved`. Each
pass adds `30`, so after some passes the condition `saved < 100`
becomes false.

This is the most important fact about a `while` loop. The loop
continues until its condition becomes false. So the block must change
something that the condition uses, and the condition must be able to
become false. The next page shows what happens when it cannot.
