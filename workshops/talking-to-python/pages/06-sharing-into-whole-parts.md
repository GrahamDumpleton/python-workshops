---
title: Sharing into whole parts
requires: [verify:sweets-ran, verify:hours-found, verify:minutes-found]
---

# Sharing into whole parts

Some things cannot be divided into decimal parts. Imagine that you
have 17 sweets to share between 5 children. The operator `/` gives
`3.4`, but you cannot give a child 3.4 sweets.

The useful answer has two parts: each child gets 3 whole sweets, and 2
sweets remain. Python has one operator for each part of that answer.

- `//` divides, and keeps only the whole part of the result. This is
  called **whole number division**. Python also calls it floor
  division.

- `%` divides, and gives only what remains. This value is called the
  **remainder**.

The symbol `%` often means "per cent" in other places. In Python, it
has nothing to do with per cent. It always means the remainder.

The two actions below each add a cell, one for each operator, and run it. Click both.

```{attempt}
:id: sweets-not-run
:check: sweets-ran
:expect: Run both cells
```

```{cell-insert}
:id: insert-sweets-each
:title: Add a cell with 17 // 5, and run it
:path: {{ notebook }}
:tags: [sweets-each]
:run: true
17 // 5
```

```{cell-insert}
:id: insert-sweets-left
:title: Add a cell with 17 % 5, and run it
:path: {{ notebook }}
:tags: [sweets-left]
:run: true
17 % 5
```

The first cell gives `3`: each child gets 3 sweets. The second cell
gives `2`: 2 sweets remain. Both values are integers, because both
numbers in each expression are integers.

```{verify}
:id: sweets-ran
:label: Python calculated the sweets for each child and the remainder
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed sweets-left
if 3 in Out.values() and 2 in Out.values():
    print("Both cells ran. The values are 3 and 2.")
else:
    print("Run both cells. Click each of the two actions above.")
3 in Out.values() and 2 in Out.values()
```

## Your task

A train journey takes 400 minutes. How long is the journey in hours
and minutes? There are 60 minutes in one hour.

This is the same kind of problem as the sweets. The number of whole
hours is the whole part of 400 divided by 60. The minutes that remain
are the remainder.

**Step 1.** The action below adds a cell with the expression
`17 // 5`, and does not run it. Change the two numbers so that the
expression calculates the whole hours in 400 minutes. Then run the
cell.

```{cell-insert}
:id: insert-hours
:title: Add the expression 17 // 5 for you to change
:path: {{ notebook }}
:tags: [hours]
:run: false
17 // 5
```

```{hint}
:title: Hint: which numbers do I use?
The first number is the amount that you want to divide: the minutes of
the journey. The second number is the size of each part: the minutes in
one hour.
```

```{attempt}
:id: hours-not-started
:check: hours-found
:expect: No cell has produced the correct number of hours yet
```

````{attempt}
:id: hours-unchanged
:check: hours-found
:expect: That is the result for the sweets

```{cell-insert}
:path: {{ notebook }}
:run: true
17 // 5
```
````

````{attempt}
:id: hours-one-slash
:check: hours-found
:expect: has a decimal point

```{cell-insert}
:path: {{ notebook }}
:run: true
400 / 60
```
````

````{hint}
:title: Show me a solution for step 1
:unlock: "hours-found" in failed_checks or "hours-found" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-hours-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [hours-solution]
:run: true
400 // 60
```
````

```{verify}
:id: hours-found
:label: You calculated the whole hours
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed hours; cell-executed hours-solution
if 6 in Out.values():
    print("Correct. The journey has 6 whole hours.")
elif _ == 3:
    print("The last cell that ran gives 3. That is the result for the sweets, 17 // 5. Change 17 to the minutes of the journey, and change 5 to the minutes in one hour. Then run the cell again.")
elif type(_) is float:
    print("The last cell that ran gives a value that has a decimal point. The operator / gives a float. Use the operator //, with two slashes, to keep only the whole hours. Then run the cell again.")
else:
    print("No cell has produced the correct number of hours yet. Change the expression to divide 400 by 60 with the operator //. Then run the cell.")
6 in Out.values()
```

**Step 2.** Now do the same for the minutes that remain. The action
below adds a cell with the expression `17 % 5`. Change the two numbers,
then run the cell.

```{cell-insert}
:id: insert-minutes
:title: Add the expression 17 % 5 for you to change
:path: {{ notebook }}
:tags: [minutes]
:run: false
17 % 5
```

```{hint}
:title: Hint: which operator do I use?
Step 1 used the operator `//`, which keeps the whole part. The operator
`%` gives what remains. Use the same two numbers as in step 1, with `%`
between them.
```

```{attempt}
:id: minutes-not-started
:check: minutes-found
:expect: That is the number of whole hours
```

````{attempt}
:id: minutes-unchanged
:check: minutes-found
:expect: That is the remainder for the sweets

```{cell-insert}
:path: {{ notebook }}
:run: true
17 % 5
```
````

````{attempt}
:id: minutes-reversed
:check: minutes-found
:expect: No cell has produced the correct number of minutes yet

```{cell-insert}
:path: {{ notebook }}
:run: true
60 % 400
```
````

````{hint}
:title: Show me a solution for step 2
:unlock: "minutes-found" in failed_checks or "minutes-found" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-minutes-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [minutes-solution]
:run: true
400 % 60
```
````

```{verify}
:id: minutes-found
:label: You calculated the minutes that remain
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed minutes; cell-executed minutes-solution
if 40 in Out.values():
    print("Correct. 40 minutes remain, so the journey takes 6 hours and 40 minutes.")
elif _ == 6:
    print("The last cell that ran gives 6. That is the number of whole hours. For the minutes that remain, use the same two numbers with the operator %. Then run the cell.")
elif _ == 2:
    print("The last cell that ran gives 2. That is the remainder for the sweets, 17 % 5. Change 17 to the minutes of the journey, and change 5 to the minutes in one hour. Then run the cell again.")
else:
    print("No cell has produced the correct number of minutes yet. Divide 400 by 60 with the operator %, with 400 as the first number. Then run the cell.")
40 in Out.values()
```
