---
title: If you need help
requires: [verify:number-changed-with-help]
---

# If you need help

When a page asks you to change or write code, it also gives you help.
The help comes in steps, so that you can take only as much as you
need.

This page shows the help for the task on the page before: to change
the `5` to a different number. Perhaps you have already done that
task. Open each box on this page anyway, to see how the help works.

## Hints

First there are **hints**. A hint is a box that is closed until you
click it. Click the title of each hint below to open it.

```{hint}
:title: Hint: I cannot find where to type
Look in the notebook for the cell that begins with `number = 5`. Click
on that line, immediately after the `5`. A thin vertical line appears
there. That line is the cursor, and it shows where your typing will
go. Press the `Backspace` key once to delete the `5`. Then type your
new number.
```

```{hint}
:title: Hint: the output did not change
Changing the code does not change the output. The output only changes
when the cell runs again. Click inside the cell, then hold `Shift` and
press `Enter`.
```

## A solution

After the hints there is a solution. The solution is also a box that
is closed until you click it. Inside it there is an action. The action
adds a new cell that already holds a working answer, and runs it. Use
a solution if the hints were not enough. Then compare the solution
with your own cell, to see what is different.

A solution box is locked at first, and shows a small lock beside its
title. It opens only after the check for the task has run one time or
more. This gives you a reason to try the task before you look at an
answer. The check for this task ran on the page before, so the
solution below is open to you now.

````{hint}
:id: number-solution-box
:title: Show me a solution
:unlock: "number-changed" in failed_checks or "number-changed" in passed_checks
:locked: This opens after the check for the task has run
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it.

```{cell-insert}
:id: insert-number-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [number-solution]
:run: true
number = 8
number * 2
```
````

Using a hint or a solution is not cheating. They are part of the
workshop. Try the task yourself first, because that is when you learn
the most.

In later workshops, the hints and the solution are on the same page as
the task, above its check. Here is the check for the task again. It
passes when the number is no longer `5`, with or without the help.

```{verify}
:id: number-changed-with-help
:label: The number is no longer 5
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed number-cell; cell-executed number-solution
if globals().get("number", 5) == 5:
    print("The value of number is still 5. Use the hints above to change the number yourself, or open the solution and click its action.")
else:
    print("The number is changed, and Python used the new value.")
globals().get("number", 5) != 5
```
