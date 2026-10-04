---
title: Numbering the passes
requires: [verify:runners-ran, verify:finishers-ran, verify:queue-fixed]
---

# Numbering the passes

A loop such as `for runner in runners:` gives you each item of a
list, but it does not tell you the position of the item. Sometimes a
program needs both: the item, and a number that says which item it
is. A program that prints a numbered list needs the number `1` for
the first line, `2` for the second line, and so on.

Python has a function for this, named `enumerate()`. To enumerate
things means to give a number to each of them, in order. You write a
list between the parentheses of `enumerate()`. In each pass of the
loop, it gives a tuple of two values: a number, and the next item of
the list.

Think of a person who gives numbered tickets to the people who wait
in a shop. The first person gets a ticket with a number, the next
person gets the next number, and no person is missed.

Click the action below. It adds a cell with a loop that uses
`enumerate()`, and runs it.

```{attempt}
:id: runners-not-run
:check: runners-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-runners
:title: Add a cell that numbers the items of a list, and run it
:path: {{ notebook }}
:tags: [runners]
:run: true
runners = ["Chidi", "Hana", "Pablo"]
for number, runner in enumerate(runners):
    print(number, runner)
```

The output is:

```
0 Chidi
1 Hana
2 Pablo
```

```{verify}
:id: runners-ran
:label: The loop gave a number to each item
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed runners
if globals().get("runners") == ["Chidi", "Hana", "Pablo"] and "number" in globals() and "runner" in globals():
    print("The cell ran. Each pass printed a number and the item that belongs to it.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("runners") == ["Chidi", "Hana", "Pablo"] and "number" in globals() and "runner" in globals()
```

## What happened

The line `for number, runner in enumerate(runners):` has two loop
names, with a comma between them. Before each pass, `enumerate()`
gives a tuple such as `(0, "Chidi")`, and Python unpacks it: the first
loop name refers to the number, and the second loop name refers to
the item.

| Pass | `number` | `runner` |
|------|----------|----------|
| 1 | `0` | `"Chidi"` |
| 2 | `1` | `"Hana"` |
| 3 | `2` | `"Pablo"` |

The numbers begin at `0`, because Python counts from `0`. So each
number is also the index of the item in the list.

## A different first number

People usually count from `1`. A list of the runners in the order in
which they finished a race must begin with the number `1`.

You can tell `enumerate()` where to begin. Write the first number
after the list, with a comma between them: `enumerate(runners, 1)`.

```{attempt}
:id: finishers-not-run
:check: finishers-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-finishers
:title: Add a cell that numbers the items from 1, and run it
:path: {{ notebook }}
:tags: [finishers]
:run: true
finishers = ["Chidi", "Hana", "Pablo"]
for place, finisher in enumerate(finishers, 1):
    print(place, finisher)
```

The output is:

```
1 Chidi
2 Hana
3 Pablo
```

```{verify}
:id: finishers-ran
:label: The loop numbered the items from 1
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed finishers
if globals().get("finishers") == ["Chidi", "Hana", "Pablo"] and "place" in globals() and "finisher" in globals():
    print("The cell ran. The numbers began at 1, because the cell gave 1 to enumerate() as the first number.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("finishers") == ["Chidi", "Hana", "Pablo"] and "place" in globals() and "finisher" in globals()
```

The list did not change. Only the numbers that `enumerate()` gives
are different: `1`, `2` and `3` and not `0`, `1` and `2`. These
numbers are not the indexes of the items.

## Your task

Three people wait in a queue. The loop in the cell below builds the
list `queue_lines`, with one string for each person: the position of
the person, a dot, and the name. The numbers are wrong, because they
begin at `0`.

The cell uses an f-string. An f-string is a string with the letter
`f` before its first quote. Python replaces each name in curly
brackets with the value that the name refers to.

```{cell-insert}
:id: insert-queue
:title: Add a cell with a loop for me to correct
:path: {{ notebook }}
:tags: [queue]
:run: false
queue = ["Farid", "Mei", "Olga"]
queue_lines = []
for position, person in enumerate(queue):
    queue_lines.append(f"{position}. {person}")
print(queue_lines)
```

First run the cell as it is: click inside it, hold `Shift` and press
`Enter`. The output is:

```
['0. Farid', '1. Mei', '2. Olga']
```

Then correct the cell, so that the numbers begin at `1`. Change only
the line that begins with `for`. Run the cell again. When the cell is
correct, the output is:

```
['1. Farid', '2. Mei', '3. Olga']
```

```{hint}
:title: Hint: what must change?
The function `enumerate()` begins at `0` when you give it only the
list. Look at the cell with the names `place` and `finisher`. It
gives `enumerate()` a second value, which is the first number.
```

```{hint}
:title: Hint: the corrected line
Write a comma and the number `1` after the name of the list, inside
the parentheses: `for position, person in enumerate(queue, 1):`.
```

```{hint}
:title: Hint: my cell shows [*] and does not finish
While a cell runs, the square brackets at its left side show a star:
`[*]`. The loop of this task finishes in less than a second. If the
star stays for longer than a few seconds, the cell probably holds a
loop that never ends. Python cannot run any other cell while it
waits.

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
:id: queue-not-started
:check: queue-fixed
:expect: The cell has not run yet
```

````{attempt}
:id: queue-unchanged
:check: queue-fixed
:expect: The numbers still begin at 0

```{cell-insert}
:path: {{ notebook }}
:run: true
queue = ["Farid", "Mei", "Olga"]
queue_lines = []
for position, person in enumerate(queue):
    queue_lines.append(f"{position}. {person}")
print(queue_lines)
```
````

````{attempt}
:id: queue-changed-list
:check: queue-fixed
:expect: Do not change the first line

```{cell-insert}
:path: {{ notebook }}
:run: true
queue = ["1. Farid", "2. Mei", "3. Olga"]
queue_lines = queue
print(queue_lines)
```
````

````{attempt}
:id: queue-from-two
:check: queue-fixed
:expect: The numbers begin at 2

```{cell-insert}
:path: {{ notebook }}
:run: true
queue = ["Farid", "Mei", "Olga"]
queue_lines = []
for position, person in enumerate(queue, 2):
    queue_lines.append(f"{position}. {person}")
print(queue_lines)
```
````

````{attempt}
:id: queue-too-short
:check: queue-fixed
:expect: The list queue_lines has 2 items

```{cell-insert}
:path: {{ notebook }}
:run: true
queue = ["Farid", "Mei", "Olga"]
queue_lines = []
for position, person in enumerate(queue[1:], 1):
    queue_lines.append(f"{position}. {person}")
print(queue_lines)
```
````

````{attempt}
:id: queue-other-text
:check: queue-fixed
:expect: but it must refer to ['1. Farid', '2. Mei', '3. Olga']

```{cell-insert}
:path: {{ notebook }}
:run: true
queue = ["Farid", "Mei", "Olga"]
queue_lines = []
for position, person in enumerate(queue, 1):
    queue_lines.append(f"{position} {person}")
print(queue_lines)
```
````

````{attempt}
:id: queue-plus-one
:check: queue-fixed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
queue = ["Farid", "Mei", "Olga"]
queue_lines = []
for position, person in enumerate(queue):
    queue_lines.append(f"{position + 1}. {person}")
print(queue_lines)
```
````

````{hint}
:title: Show me a solution
:unlock: "queue-fixed" in failed_checks or "queue-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-queue-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [queue-solution]
:run: true
queue = ["Farid", "Mei", "Olga"]
queue_lines = []
for position, person in enumerate(queue, 1):
    queue_lines.append(f"{position}. {person}")
print(queue_lines)
```
````

```{verify}
:id: queue-fixed
:label: Your loop numbers the people from 1
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed queue; cell-executed queue-solution
if "queue" not in globals() or "queue_lines" not in globals():
    print("The cell has not run yet. Click the action that adds the cell with the loop. Then click inside the cell, hold Shift and press Enter.")
elif queue != ["Farid", "Mei", "Olga"]:
    print(f"The name queue refers to {queue!r}. Do not change the first line of the cell. It must be: queue = [\"Farid\", \"Mei\", \"Olga\"]. Then run the cell again.")
elif queue_lines == ["1. Farid", "2. Mei", "3. Olga"]:
    print("Correct. The numbers now begin at 1, and the list queue_lines holds one numbered line for each person.")
elif queue_lines == ["0. Farid", "1. Mei", "2. Olga"]:
    print("The numbers still begin at 0. Give enumerate() a second value, which is the first number. Write a comma and 1 after the name of the list: enumerate(queue, 1). Then run the cell again.")
elif queue_lines == ["2. Farid", "3. Mei", "4. Olga"]:
    print("The numbers begin at 2, but they must begin at 1. That happens when the cell gives 2 to enumerate(), or when it gives 1 to enumerate() and also adds 1 to position. The loop line must be: for position, person in enumerate(queue, 1). Do not change the line with append. Then run the cell again.")
elif not isinstance(queue_lines, list) or len(queue_lines) != 3:
    print(f"The list queue_lines has {len(queue_lines) if isinstance(queue_lines, list) else 0} items, but it must have 3 items, one for each person. Give the whole list queue to enumerate(): for position, person in enumerate(queue, 1). The line queue_lines = [] must be before the loop. Then run the cell again.")
else:
    print(f"The name queue_lines refers to {queue_lines!r} but it must refer to ['1. Farid', '2. Mei', '3. Olga']. Change only the loop line: for position, person in enumerate(queue, 1). The line with append must stay as it was at the start. Then run the cell again.")
"queue" in globals() and "queue_lines" in globals() and queue == ["Farid", "Mei", "Olga"] and queue_lines == ["1. Farid", "2. Mei", "3. Olga"]
```
