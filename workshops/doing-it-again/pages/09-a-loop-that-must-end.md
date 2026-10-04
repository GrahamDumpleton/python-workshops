---
title: A loop that must end
requires: [verify:bucket-ran, quiz:why-never-ends, verify:bottle-fixed]
---

# A loop that must end

A `for` loop over a list always ends, because the list has a last
item. A `while` loop has no such protection. It ends only when its
condition becomes false.

If the condition can never become false, the loop never ends. Python
runs the block again and again, and the cell never finishes. This is a
common mistake, and its usual reason is small: the line that changes
the value is missing from the block.

Running a loop that never ends is not useful, so this page shows the
mistake in a safe way. The loop gets a **safety limit**: a second
condition that stops the loop after a fixed number of passes, whatever
happens.

## A loop with the mistake, and a safety limit

A bucket holds 10 litres. The loop below is meant to add 2 litres in
each pass, until the bucket is full. But the line that adds the water
is missing.

```python
bucket = 0
bucket_passes = 0
while bucket < 10 and bucket_passes < 1000:
    bucket_passes = bucket_passes + 1
```

The name `bucket_passes` counts the passes. The condition has two
parts, joined with the word `and`. A condition with `and` is true only
when both parts are true.

- `bucket < 10` is the real condition: the bucket is not full yet.

- `bucket_passes < 1000` is the safety limit: the loop has made fewer
  than 1000 passes.

When one of the two parts becomes false, the whole condition is
false, and the loop ends. So this loop can never make more than 1000
passes.

Click the action below. It adds the cell, with some lines after the
loop that report what happened, and runs it.

```{attempt}
:id: bucket-not-run
:check: bucket-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-bucket
:title: Add a cell with a loop that only the safety limit can stop, and run it
:path: {{ notebook }}
:tags: [bucket]
:run: true
bucket = 0
bucket_passes = 0
while bucket < 10 and bucket_passes < 1000:
    bucket_passes = bucket_passes + 1
if bucket < 10:
    print("The safety limit stopped the loop after", bucket_passes, "passes.")
    print("Without the safety limit, this loop would never end.")
else:
    print("The bucket is full after", bucket_passes, "passes.")
```

The output is:

```
The safety limit stopped the loop after 1000 passes.
Without the safety limit, this loop would never end.
```

```{verify}
:id: bucket-ran
:label: The safety limit stopped the loop
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed bucket
if globals().get("bucket") == 0 and globals().get("bucket_passes") == 1000:
    print("The cell ran. The safety limit stopped the loop after 1000 passes, and the name bucket still refers to 0.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("bucket") == 0 and globals().get("bucket_passes") == 1000
```

## What happened

The loop made 1000 passes, and Python made them in much less than a
second. In every pass, `bucket` was `0`, because no line in the block
changes it. So `bucket < 10` was true in every pass, and it would be
true for ever.

After 1000 passes, `bucket_passes < 1000` became false, and the loop
ended. The `if` after the loop then tested why the loop ended. The
bucket was still not full, so the safety limit was the reason.

```{quiz}
:id: why-never-ends
:title: The reason
question: "Without the safety limit, the condition of this loop is only `bucket < 10`. Why does that condition stay true in every pass?"
options:
  - { text: "Because no line in the block changes the value of `bucket`", correct: true }
  - { text: "Because 10 is too large a number for a loop", explanation: "The size of the number does not matter. The condition stays true because the value of `bucket` never changes." }
  - { text: "Because a `while` loop never ends", explanation: "A `while` loop ends when its condition becomes false. The loop on the page before this one ended after 4 passes." }
explanation: "The block must change something that the condition uses. Here the condition uses `bucket`, and no line in the block gives `bucket` a new value."
```

## Your task

A bottle holds 750 millilitres. The loop below is meant to add 250
millilitres in each pass, until the bottle is full. It has the same
mistake: the line that adds the water is missing. It also has a safety
limit, so the cell always finishes when you run it.

```{cell-insert}
:id: insert-bottle
:title: Add a cell with a loop for me to correct
:path: {{ notebook }}
:tags: [bottle]
:run: false
bottle = 0
bottle_passes = 0
while bottle < 750 and bottle_passes < 1000:
    # A line is missing here. It must add 250 to bottle.
    bottle_passes = bottle_passes + 1
if bottle < 750:
    print("The safety limit stopped the loop after", bottle_passes, "passes.")
else:
    print("The bottle is full after", bottle_passes, "passes.")
```

First run the cell as it is: click inside it, hold `Shift` and press
`Enter`. The output says that the safety limit stopped the loop.

Then correct the cell. Add one line inside the block of the loop that
adds `250` to the value of `bottle`. Do not change the other lines.
Run the cell again. When the cell is correct, the output is:

```
The bottle is full after 3 passes.
```

```{hint}
:title: Hint: what does the line look like?
The line gives the name `bottle` a new value that uses its old value,
in the same way as `saved = saved + 30` on the page before this one.
Write it under the comment. It must begin with four spaces, so that it
is in the block of the loop.
```

```{hint}
:title: Hint: my cell shows [*] and does not finish
While a cell runs, the square brackets at its left side show a star:
`[*]`. The loop of this task finishes in less than a second, because
it has a safety limit. If the star stays for longer than a few
seconds, the cell probably holds a loop that never ends. That can
happen when the safety limit has been removed from the `while` line.
Python cannot run any other cell while it waits.

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
:id: bottle-not-started
:check: bottle-fixed
:expect: The cell has not run yet
```

````{attempt}
:id: bottle-unchanged
:check: bottle-fixed
:expect: The name bottle still refers to 0

```{cell-insert}
:path: {{ notebook }}
:run: true
bottle = 0
bottle_passes = 0
while bottle < 750 and bottle_passes < 1000:
    # A line is missing here. It must add 250 to bottle.
    bottle_passes = bottle_passes + 1
if bottle < 750:
    print("The safety limit stopped the loop after", bottle_passes, "passes.")
else:
    print("The bottle is full after", bottle_passes, "passes.")
```
````

````{attempt}
:id: bottle-line-after-loop
:check: bottle-fixed
:expect: so the condition bottle < 750 never became false

```{cell-insert}
:path: {{ notebook }}
:run: true
bottle = 0
bottle_passes = 0
while bottle < 750 and bottle_passes < 1000:
    # A line is missing here. It must add 250 to bottle.
    bottle_passes = bottle_passes + 1
bottle = bottle + 250
if bottle < 750:
    print("The safety limit stopped the loop after", bottle_passes, "passes.")
else:
    print("The bottle is full after", bottle_passes, "passes.")
```
````

````{attempt}
:id: bottle-subtracted
:check: bottle-fixed
:expect: so the condition bottle < 750 never became false

```{cell-insert}
:path: {{ notebook }}
:run: true
bottle = 0
bottle_passes = 0
while bottle < 750 and bottle_passes < 1000:
    bottle = bottle - 250
    bottle_passes = bottle_passes + 1
if bottle < 750:
    print("The safety limit stopped the loop after", bottle_passes, "passes.")
else:
    print("The bottle is full after", bottle_passes, "passes.")
```
````

````{attempt}
:id: bottle-wrong-amount
:check: bottle-fixed
:expect: The loop ended after 4 passes

```{cell-insert}
:path: {{ notebook }}
:run: true
bottle = 0
bottle_passes = 0
while bottle < 750 and bottle_passes < 1000:
    bottle = bottle + 200
    bottle_passes = bottle_passes + 1
if bottle < 750:
    print("The safety limit stopped the loop after", bottle_passes, "passes.")
else:
    print("The bottle is full after", bottle_passes, "passes.")
```
````

````{hint}
:title: Show me a solution
:unlock: "bottle-fixed" in failed_checks or "bottle-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-bottle-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [bottle-solution]
:run: true
bottle = 0
bottle_passes = 0
while bottle < 750 and bottle_passes < 1000:
    bottle = bottle + 250
    bottle_passes = bottle_passes + 1
if bottle < 750:
    print("The safety limit stopped the loop after", bottle_passes, "passes.")
else:
    print("The bottle is full after", bottle_passes, "passes.")
```
````

```{verify}
:id: bottle-fixed
:label: The loop ends because the bottle is full
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed bottle; cell-executed bottle-solution
if "bottle" not in globals() or "bottle_passes" not in globals():
    print("The cell has not run yet. Click inside the new cell, then hold Shift and press Enter to run it. If the cell shows an error message, read its last line, correct the cell, and run it again.")
elif bottle == 750 and bottle_passes == 3:
    print("Correct. Each pass adds 250 to bottle, so the condition becomes false after 3 passes, and the loop ends without the safety limit.")
elif bottle == 0:
    print("The name bottle still refers to 0, so the safety limit stopped the loop. Add a line inside the block of the loop that adds 250 to bottle: four spaces, and then bottle = bottle + 250. Then run the cell again.")
elif bottle_passes >= 1000:
    print(f"The safety limit stopped the loop after {bottle_passes} passes, and the name bottle refers to {bottle}, so the condition bottle < 750 never became false. Check two things. Your line must begin with four spaces, so that it is inside the loop. It must add 250 to the old value: bottle = bottle + 250. Then run the cell again.")
else:
    print(f"The loop ended after {bottle_passes} passes, and the name bottle refers to {bottle}. It must end after 3 passes, with bottle at 750. Your line must add exactly 250 in each pass: bottle = bottle + 250. Do not change the other lines. Then run the cell again.")
"bottle" in globals() and "bottle_passes" in globals() and bottle == 750 and bottle_passes == 3
```

You corrected the loop, and the safety limit was not needed. A
correct `while` loop does not need a safety limit. But while you are
learning, a limit is a good protection. With a limit, a cell that
holds this mistake still finishes, and it can tell you what went
wrong.

In these workshops, the loops that you write yourself are `for` loops,
which always end.
