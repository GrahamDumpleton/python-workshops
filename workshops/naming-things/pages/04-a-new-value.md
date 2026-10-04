---
title: Giving a name a new value
requires: [quiz:predict-temperature, verify:temperature-ran, quiz:predict-steps, verify:steps-ran, verify:savings-added]
---

# Giving a name a new value

A name does not have to refer to the same value for ever. Values in
the real world change: a temperature rises, a price falls, a count
grows. A program must be able to follow those changes.

To give a name a new value, write another assignment with the same
name. From that line on, the name refers to the new value. Python
forgets that the name referred to the old value.

Look at this cell. Do not run it yet.

```python
temperature = 18
temperature = 21
temperature
```

```{quiz}
:id: predict-temperature
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "21"
wrong:
  - { text: "18", explanation: "`18` was the first value. The second assignment made the name refer to a new value." }
  - { text: "39", explanation: "Python does not add the two values. The second assignment replaces the first value." }
otherwise: "The name `temperature` is assigned two times. Which value does it refer to after the second assignment?"
explanation: "The second assignment makes the name `temperature` refer to 21. The name no longer refers to 18."
```

```{attempt}
:id: temperature-not-run
:check: temperature-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-temperature
:title: Add a cell that assigns the name temperature two times, and run it
:path: {{ notebook }}
:tags: [temperature]
:run: true
temperature = 18
temperature = 21
temperature
```

```{verify}
:id: temperature-ran
:label: The name temperature refers to its new value
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed temperature
if globals().get("temperature") == 21:
    print("The cell ran. The name temperature now refers to 21.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("temperature") == 21
```

## A new value that uses the old value

Often the new value depends on the old value. A person has walked 4000
steps today, and then walks 500 more. The new count is the old count
plus 500.

Look at the second line of this cell.

```python
steps = 4000
steps = steps + 500
steps
```

In mathematics, `steps = steps + 500` is impossible: no number is
equal to itself plus 500. But in Python the symbol `=` is an
instruction, and Python performs it in two parts. First it calculates
the right side. Then it makes the name on the left refer to the
result.

```{quiz}
:id: predict-steps
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "4500"
wrong:
  - { text: "4000", explanation: "`4000` is the first value. The second line gives the name a new value." }
  - { text: "500", explanation: "The right side is `steps + 500`, not only `500`. Python uses the old value of `steps` in the calculation." }
  - { text: "4,500", explanation: "The number is correct. Python shows it without a comma: type it in digits only." }
  - { text: "4.500", explanation: "The number is correct. Python shows it without a point: type it in digits only." }
otherwise: "Python calculates the right side first, and the name `steps` refers to 4000 at that moment. Then the name gets the result."
explanation: "Python calculates `steps + 500` with the old value, 4000. The result is 4500, and the name `steps` now refers to it."
```

```{attempt}
:id: steps-not-run
:check: steps-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-steps
:title: Add a cell that adds 500 to the name steps, and run it
:path: {{ notebook }}
:tags: [steps]
:run: true
steps = 4000
steps = steps + 500
steps
```

```{verify}
:id: steps-ran
:label: Python added 500 to the old value of steps
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed steps
if globals().get("steps") == 4500:
    print("The cell ran. The name steps now refers to 4500.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("steps") == 4500
```

## Your task

Mei has saved 200. This week she saves 50 more. The action below adds
a cell that knows only the first amount.

```{cell-insert}
:id: insert-savings
:title: Add a cell with the savings for me to change
:path: {{ notebook }}
:tags: [savings]
:run: false
savings = 200
# Write your line on the line below this one.

savings
```

The second line of the cell begins with the symbol `#`, so it is a
comment: a note for the reader, which Python ignores. Click on the
empty line under the comment, and write one line that adds 50 to the
value of `savings`. Use the name `savings` in the calculation. Then
run the cell. The output must be `250`.

```{hint}
:title: Hint: what does the line look like?
Look at the second line of the cell with the steps:
`steps = steps + 500`. Your line has the same form, with the name
`savings` and the number `50`.
```

If the hint was not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: savings-not-started
:check: savings-added
:expect: The cell has not run yet
```

````{attempt}
:id: savings-unchanged
:check: savings-added
:expect: The name savings still refers to 200

```{cell-insert}
:path: {{ notebook }}
:run: true
savings = 200
# Write your line on the line below this one.

savings
```
````

````{attempt}
:id: savings-replaced
:check: savings-added
:expect: That happens when the line is savings = 50

```{cell-insert}
:path: {{ notebook }}
:run: true
savings = 200
savings = 50
savings
```
````

````{attempt}
:id: savings-subtracted
:check: savings-added
:expect: but it must refer to 250

```{cell-insert}
:path: {{ notebook }}
:run: true
savings = 200
savings = savings - 50
savings
```
````

````{hint}
:title: Show me a solution
:unlock: "savings-added" in failed_checks or "savings-added" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-savings-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [savings-solution]
:run: true
savings = 200
savings = savings + 50
savings
```
````

```{verify}
:id: savings-added
:label: The name savings refers to 250
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed savings; cell-executed savings-solution
if "savings" not in globals():
    print("The cell has not run yet. Write your line under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
elif savings == 250:
    print("Correct. The name savings now refers to 250.")
elif savings == 200:
    print("The name savings still refers to 200. Write a line under the comment that adds 50 to it: the name, then =, then the name again, then + 50. Then run the cell again.")
elif savings == 50:
    print("The name savings refers to 50. That happens when the line is savings = 50, which replaces the old value. Use the old value in the calculation: savings = savings + 50. Then run the cell again.")
else:
    print(f"The name savings refers to {savings} but it must refer to 250. The first line must be savings = 200, and your line must add 50 to savings. Then run the cell again.")
"savings" in globals() and savings == 250
```
