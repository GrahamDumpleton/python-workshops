---
title: Run a cell yourself
requires: [verify:ran-it-yourself]
---

# Run a cell yourself

Two pages ago, the action ran the cell for you. You can also run a
cell yourself. You need to know how, because later workshops ask you
to write your own code and run it.

The action below adds a new cell, and this time it does not run it.

```{cell-insert}
:id: insert-second-cell
:title: Add a cell that asks Python for 10 - 4, without running it
:path: {{ notebook }}
:tags: [second-cell]
:run: false
10 - 4
```

Look at the new cell. There is no output under it. The square brackets
at the left are empty, `[ ]`, because the cell has not run.

## How to run a cell

There are two ways to run a cell. Use the one that you prefer.

**With the keyboard.** Click inside the cell, on the code. Then hold
the `Shift` key, and press the `Enter` key.

**With the mouse.** Click inside the cell, on the code. Then click the
run button at the top of the notebook. The run button looks like a
triangle that points to the right: `▶`.

Run the cell now, in one of these two ways.

After the cell runs, the output `6` appears under it, and the square
brackets hold a number.

The notebook also moves to the next cell. If there is no next cell,
the notebook adds a new empty cell at the end. This is normal. You can
leave the empty cell there.

```{hint}
:title: What does [*] mean?
While a cell is running, the square brackets show a star: `[*]`. The
star means that Python is still working on that cell. Most cells in
these workshops finish so quickly that you do not see the star.
```

If you have a problem running the cell yourself, this action runs it
for you. Try the keyboard or the mouse first.

```{attempt}
:id: second-cell-not-run
:check: ran-it-yourself
:expect: The cell has not run yet
```

```{cell-run}
:id: run-second-cell
:title: Run the cell for me
:path: {{ notebook }}
:cell: second-cell
```

```{verify}
:id: ran-it-yourself
:label: The cell ran and gave the output 6
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed second-cell
if 6 in Out.values():
    print("The cell ran, and Python calculated 6.")
else:
    print("The cell has not run yet. Click inside the cell that holds 10 - 4. Then hold Shift and press Enter.")
6 in Out.values()
```
