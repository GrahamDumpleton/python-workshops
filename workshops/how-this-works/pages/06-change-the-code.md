---
title: Change the code yourself
requires: [verify:number-changed]
---

# Change the code yourself

So far, every piece of code came from an action. In this course you
will also change code, and later write code, yourself. Typing code
yourself is how you learn to program. The actions are there to save
you time on the parts that are not the lesson.

On this page you make your first change to a piece of code.

Add the cell below. This time the action runs it for you.

```{cell-insert}
:id: insert-number-cell
:title: Add a cell that doubles a number, and run it
:path: {{ notebook }}
:tags: [number-cell]
:run: true
number = 5
number * 2
```

The cell has two lines of code. The first line gives the name `number`
to the value `5`. The second line multiplies `number` by 2. The output
is `10`. A later workshop explains names properly. For now, you only
need to change one thing.

Look at the check at the end of this page. It ran when the cell ran,
and it shows the mark `✗`, because the number is still `5`. That is
expected. The check passes when you have done the task below.

## Your task

Change the `5` in the first line to a different number. Then run the
cell again.

1. Click inside the cell, at the end of the first line.

2. Delete the `5`, and type a different number, for example `8`.

3. Run the cell: hold `Shift` and press `Enter`.

The output changes. If you typed `8`, the output is now `16`.

You can change the number and run the cell as many times as you like.
Each time, Python runs the code as it is now, and shows a new output.

If you have a problem with this task, click `Next`. The next page
shows the help that you can use.

```{attempt}
:id: number-still-five
:check: number-changed
:expect: The value of number is still 5
```

````{attempt}
:id: number-is-eight
:check: number-changed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
number = 8
number * 2
```
````

```{verify}
:id: number-changed
:label: The number is no longer 5
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed number-cell
if globals().get("number", 5) == 5:
    print("The value of number is still 5. Change the 5 in the first line of the cell to a different number. Then run the cell again.")
else:
    print("You changed the number, and Python used your new value.")
globals().get("number", 5) != 5
```
