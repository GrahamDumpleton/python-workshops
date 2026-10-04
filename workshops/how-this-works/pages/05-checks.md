---
title: Checks
requires: [verify:third-cell-ran]
---

# Checks

Each page so far has ended with a box that has a `Check` button. That
box is a **check**. A check tests whether you have done the step that
the page asks for.

A check has three possible marks:

- `○` means that the check has not run yet.

- `✓` means that the check passed. The step is done.

- `✗` means that the check failed. The step is not done yet, and a
  message under the check says what to do.

Most checks run by themselves when you do the step. You can also click
the `Check` button to run a check at any time.

## A failed check is useful

A check that fails is not a problem. You have not broken anything. A
failed check is information: it tells you what is missing, so that you
can fix it. Every programmer sees failed checks many times each day.

To see this, you will now make a check fail on purpose.

First, add a new cell. The action does not run the cell.

```{cell-insert}
:id: insert-third-cell
:title: Add a cell that asks Python for 7 * 6, without running it
:path: {{ notebook }}
:tags: [third-cell]
:run: false
7 * 6
```

Now go to the check at the end of this page, and click its `Check`
button. Do this before you run the cell.

The check fails, and shows the mark `✗`. Read the message under it.
The message says what is missing: the cell has not run yet.

## Make the check pass

Now do what the message says. Click inside the new cell in the
notebook. Then hold `Shift` and press `Enter`, or click the run button
`▶`.

The output `42` appears under the cell. In Python, the symbol `*`
means "multiply", so `7 * 6` is 7 multiplied by 6.

Look at the check again. It ran by itself when the cell ran, and now
it shows the mark `✓`.

If you have a problem running the cell yourself, this action runs it
for you.

```{attempt}
:id: third-cell-not-run
:check: third-cell-ran
:expect: The cell has not run yet
```

```{cell-run}
:id: run-third-cell
:title: Run the cell for me
:path: {{ notebook }}
:cell: third-cell
```

```{verify}
:id: third-cell-ran
:label: The cell ran and gave the output 42
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed third-cell
if 42 in Out.values():
    print("The cell ran, and Python calculated 42.")
else:
    print("The cell has not run yet. Click inside the cell that holds 7 * 6. Then hold Shift and press Enter.")
42 in Out.values()
```
