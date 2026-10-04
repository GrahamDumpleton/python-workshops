---
title: What is calculated first?
requires: [quiz:predict-order, verify:order-ran, verify:parentheses-used]
---

# What is calculated first?

An expression can have more than one operator. Then there is a
question: which part does Python calculate first? The answer changes
the result, so you need to know the rule.

Look at this expression. Do not run it yet.

```python
2 + 3 * 4
```

There are two possible ways to calculate it. If the addition is first,
the result is 5 multiplied by 4, which is 20. If the multiplication is
first, the result is 2 plus 12, which is 14.

Which of the two does Python choose? Type the value that you predict.

```{quiz}
:id: predict-order
:type: text
:title: Predict the value
question: "What is the value of the expression `2 + 3 * 4`?"
answer: "14"
wrong:
  - { text: "20", explanation: "This is the result if the addition is first. Python does the multiplication first." }
  - { text: "24", explanation: "This is 2 multiplied by 3 multiplied by 4. The first operator in the expression is `+`, not `*`." }
otherwise: "The value is one of the two results that the text above describes: 20 or 14."
explanation: "Python multiplies before it adds. It calculates `3 * 4` first, which is 12, and then adds 2."
```

Run the expression, and compare the output with your prediction.

```{attempt}
:id: order-not-run
:check: order-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-order
:title: Add a cell with the expression 2 + 3 * 4, and run it
:path: {{ notebook }}
:tags: [order]
:run: true
2 + 3 * 4
```

```{verify}
:id: order-ran
:label: Python calculated 2 + 3 * 4
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed order
if 14 in Out.values():
    print("The cell ran, and the value is 14.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
14 in Out.values()
```

## The rule

Python follows the same rule as mathematics:

1. First, it does every multiplication and division, from left to
   right.

2. Then, it does every addition and subtraction, from left to right.

The position in the expression does not decide the order. In
`2 + 3 * 4`, the addition is written first, but the multiplication is
calculated first.

## Changing the order

Sometimes you want the addition to be first. To say so, put
**parentheses** around that part of the expression. Parentheses are
the round brackets `(` and `)`. Python always calculates the part
inside parentheses before the rest.

## Your task

The action below adds the same expression again, in a new cell. This
time the action does not run it.

```{cell-insert}
:id: insert-parentheses
:title: Add the expression 2 + 3 * 4 again, without running it
:path: {{ notebook }}
:tags: [parentheses]
:run: false
2 + 3 * 4
```

Change the expression in the new cell so that its value is `20`. Do
not change the numbers or the operators. Only add parentheses. Then
run the cell: click inside it, hold `Shift` and press `Enter`.

```{hint}
:title: Hint: where do the parentheses go?
The value is 20 when the addition is calculated first. Put the
parentheses around the part that must be calculated first. That part
is the addition and its two numbers.
```

```{hint}
:title: Hint: how to type the parentheses
Click in the cell, immediately before the `2`, and type `(`. Then
click immediately after the `3`, and type `)`. Some notebooks add the
closing `)` for you when you type `(`. If that happens, delete the
extra `)` and type it in the correct place.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: parentheses-not-added
:check: parentheses-used
:expect: The multiplication is still calculated first
```

````{attempt}
:id: parentheses-unchanged
:check: parentheses-used
:expect: The multiplication is still calculated first

```{cell-insert}
:path: {{ notebook }}
:run: true
2 + 3 * 4
```
````

````{attempt}
:id: parentheses-wrong-place
:check: parentheses-used
:expect: The multiplication is still calculated first

```{cell-insert}
:path: {{ notebook }}
:run: true
2 + (3 * 4)
```
````

````{hint}
:title: Show me a solution
:unlock: "parentheses-used" in failed_checks or "parentheses-used" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-parentheses-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [parentheses-solution]
:run: true
(2 + 3) * 4
```
````

```{verify}
:id: parentheses-used
:label: The expression now has the value 20
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed parentheses; cell-executed parentheses-solution
if 20 in Out.values():
    print("The addition is now calculated first, so the value is 20.")
elif _ == 14:
    print("The last cell that ran gives 14. The multiplication is still calculated first. If you added parentheses, they are in the wrong place. Put them around the addition and its two numbers, so that Python calculates the addition first. Then run the cell.")
else:
    print("No cell has produced the value 20 yet. Put parentheses around the addition, so that Python calculates it first. Then run the cell.")
20 in Out.values()
```
