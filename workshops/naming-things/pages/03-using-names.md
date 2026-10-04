---
title: Using names in a calculation
requires: [quiz:predict-total, verify:total-ran, verify:more-tickets]
---

# Using names in a calculation

A name can be used in every place where a value can be used. When
Python finds a name in an expression, it uses the value that the name
refers to.

The right side of an assignment can also be an expression. Python
calculates the expression first, and then gives the name to the
result. In this way, a program can remember a result and use it again.

Look at this cell. Do not run it yet.

```python
ticket_price = 12
tickets = 3
total = ticket_price * tickets
total
```

Type the value that you predict the notebook shows under the cell.

```{quiz}
:id: predict-total
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "36"
wrong:
  - { text: "15", explanation: "`15` is 12 plus 3. The operator `*` multiplies." }
  - { text: "123", explanation: "Python does not join the two numbers. The operator `*` multiplies the two values." }
  - { text: "total", explanation: "The notebook shows the value that the name `total` refers to, not the name." }
  - { text: "ticket_price * tickets", explanation: "Python calculates the expression first. The name `total` refers to the result, which is a number." }
otherwise: "The name `ticket_price` refers to 12, and the name `tickets` refers to 3. The third line multiplies the two values."
explanation: "Python uses 12 for `ticket_price` and 3 for `tickets`. It multiplies them, and gives the name `total` to the result, which is 36."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: total-not-run
:check: total-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-total
:title: Add a cell that calculates the total cost of 3 tickets, and run it
:path: {{ notebook }}
:tags: [total]
:run: true
ticket_price = 12
tickets = 3
total = ticket_price * tickets
total
```

```{verify}
:id: total-ran
:label: Python calculated the total cost with names
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed total
if globals().get("total") == 36:
    print("The cell ran. The name total refers to the value 36.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("total") == 36
```

## What happened

Python performed the four lines in order.

1. `ticket_price = 12` makes the name `ticket_price` refer to `12`.

2. `tickets = 3` makes the name `tickets` refer to `3`.

3. `total = ticket_price * tickets` has an expression on the right
   side. Python calculates the expression first. It uses `12` for
   `ticket_price` and `3` for `tickets`, so the result is `36`. Then
   Python makes the name `total` refer to `36`.

4. `total` is the last line, so the notebook shows its value.

Compare this cell with the expression `12 * 3`. Both give 36. But the
cell with names says what the numbers mean, and it has one more
advantage, which the task below shows.

## Your task

Five friends want to go to the cinema, not three. The action below
adds a cell for the five friends. It holds the same code with new
names, and the action does not run it.

```{cell-insert}
:id: insert-more-tickets
:title: Add a cell with the same calculation for me to change
:path: {{ notebook }}
:tags: [more-tickets]
:run: false
seat_price = 12
seats = 3
seats_total = seat_price * seats
seats_total
```

Change the cell so that it calculates the total cost of 5 seats.
Change only one number. Then run the cell: click inside it, hold
`Shift` and press `Enter`. The output must be `60`.

```{hint}
:title: Hint: which number do I change?
The number of seats is in the second line. Change the `3` in the line
`seats = 3` to `5`. Do not change the third line. Python calculates
the total again from the names when the cell runs.
```

If the hint was not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: more-tickets-not-started
:check: more-tickets
:expect: The cell has not run yet
```

````{attempt}
:id: more-tickets-unchanged
:check: more-tickets
:expect: The name seats still refers to 3

```{cell-insert}
:path: {{ notebook }}
:run: true
seat_price = 12
seats = 3
seats_total = seat_price * seats
seats_total
```
````

````{attempt}
:id: more-tickets-total-typed
:check: more-tickets
:expect: The name seats still refers to 3

```{cell-insert}
:path: {{ notebook }}
:run: true
seat_price = 12
seats = 3
seats_total = 60
seats_total
```
````

````{attempt}
:id: more-tickets-wrong-number
:check: more-tickets
:expect: The name seats refers to 12

```{cell-insert}
:path: {{ notebook }}
:run: true
seat_price = 5
seats = 12
seats_total = seat_price * seats
seats_total
```
````

````{hint}
:title: Show me a solution
:unlock: "more-tickets" in failed_checks or "more-tickets" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-more-tickets-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [more-tickets-solution]
:run: true
seat_price = 12
seats = 5
seats_total = seat_price * seats
seats_total
```
````

```{verify}
:id: more-tickets
:label: The cell calculates the total cost of 5 seats
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed more-tickets; cell-executed more-tickets-solution
if "seats" not in globals() or "seats_total" not in globals():
    print("The cell has not run yet. Change the number of seats in the new cell to 5. Then hold Shift and press Enter to run the cell.")
elif seats == 5 and seats_total == 60:
    print("Correct. You changed one number, and Python calculated the new total, 60, from the names.")
elif seats == 3:
    print("The name seats still refers to 3. Change the 3 in the line seats = 3 to 5. Do not type the total yourself. Then run the cell again.")
elif seats != 5:
    print(f"The name seats refers to {seats} but there are 5 friends. Change the number in the line that begins with seats = so that it is 5. Then run the cell again.")
else:
    print(f"The name seats refers to 5, but the total is {seats_total} and it must be 60. The line for the price must be seat_price = 12, and the line for the total must be seats_total = seat_price * seats. Then run the cell again.")
"seats" in globals() and "seats_total" in globals() and seats == 5 and seats_total == 60
```

You changed one number in one place, and the total changed with it.
In a long program, a value such as a price is used in many places.
With a name, you change the value once, and every calculation that
uses the name gets the new value.
