---
title: A calculation of your own
requires: [verify:total-cost]
---

# A calculation of your own

Until now, every expression came from an action, and you changed some
of them. On this page you write an expression yourself, from nothing.
This is the first complete piece of Python that is your own.

## The problem

Three friends go to the cinema. They buy tickets and drinks.

- One ticket costs 12.

- One drink costs 4.

- They buy 3 tickets and 2 drinks.

Write one expression that calculates the total cost.

The expression must do the calculation. Do not calculate the answer in
your head and type only the final number. The purpose of the task is
to tell Python how to calculate it.

## Where to write it

The action below adds a new cell for your expression.

```{cell-insert}
:id: insert-own-calculation
:title: Add a cell for my expression
:path: {{ notebook }}
:tags: [own-calculation]
:run: false
# Write your expression on the line below this one.

```

The cell is not completely empty. Its first line begins with the
symbol `#`. A line that begins with `#` is a **comment**. A comment is
a note for the people who read the code. Python ignores it. Comments
in these workshops tell you where to write.

Click on the empty line under the comment, and type your expression.
Then run the cell: hold `Shift` and press `Enter`.

If the output is not what you expected, change the expression and run
the cell again. You can try as many times as you like.

## If you need help

```{hint}
:title: Hint: how to begin
Divide the problem into two smaller parts: the cost of all the
tickets, and the cost of all the drinks. Each part is a
multiplication. The total cost is the two parts added together.
```

```{hint}
:title: Hint: one part of the expression
The cost of the tickets is the expression `3 * 12`. Write a similar
expression for the drinks. Then join the two expressions with the
operator `+`. You do not need parentheses, because Python multiplies
before it adds.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.
Compare the solution with your own cell, and find what is different.

```{attempt}
:id: total-not-started
:check: total-cost
:expect: No cell has produced the correct total yet
```

````{attempt}
:id: total-tickets-only
:check: total-cost
:expect: That is the cost of the 3 tickets only

```{cell-insert}
:path: {{ notebook }}
:run: true
3 * 12
```
````

````{attempt}
:id: total-drinks-only
:check: total-cost
:expect: That is the cost of the 2 drinks only

```{cell-insert}
:path: {{ notebook }}
:run: true
2 * 4
```
````

````{attempt}
:id: total-added-first
:check: total-cost
:expect: Multiply each number of things by its own price

```{cell-insert}
:path: {{ notebook }}
:run: true
(3 + 2) * (12 + 4)
```
````

````{attempt}
:id: total-all-added
:check: total-cost
:expect: That happens when all four numbers are added

```{cell-insert}
:path: {{ notebook }}
:run: true
3 + 12 + 2 + 4
```
````

````{attempt}
:id: total-other-order
:check: total-cost
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
2 * 4 + 3 * 12
```
````

````{hint}
:title: Show me a solution
:unlock: "total-cost" in failed_checks or "total-cost" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-own-calculation-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [own-calculation-solution]
:run: true
3 * 12 + 2 * 4
```
````

```{verify}
:id: total-cost
:label: Your expression calculates the total cost
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed own-calculation; cell-executed own-calculation-solution
if 44 in Out.values():
    print("Correct. The total cost is 44.")
elif _ == 36:
    print("Your expression gives 36. That is the cost of the 3 tickets only. Add the cost of the 2 drinks to the expression. Then run the cell again.")
elif _ == 8:
    print("Your expression gives 8. That is the cost of the 2 drinks only. Add the cost of the 3 tickets to the expression. Then run the cell again.")
elif _ == 80:
    print("Your expression gives 80. That happens when the two numbers of things are added first, and the two prices are added first. Multiply each number of things by its own price. Then add the two results.")
elif _ == 21:
    print("Your expression gives 21. That happens when all four numbers are added. Multiply the number of tickets by the price of one ticket, and do the same for the drinks. Then add the two results.")
else:
    print("No cell has produced the correct total yet. Write your expression under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
44 in Out.values()
```
