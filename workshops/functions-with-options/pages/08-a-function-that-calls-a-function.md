---
title: A function that calls a function
requires: [quiz:predict-order-cost, verify:booking-total]
---

# A function that calls a function

The body of a function can call another function. You have already
done this: a body that uses `print()` or `len()` calls a function. A
body can call a function that you wrote in the same way.

This is how large programs are built. Each function does one small
piece of work, and has a name that says what the work is. Another
function uses those small functions as steps. When a calculation is
in one function only, you correct a mistake in one place, and every
function that calls it gets the correction.

A book of recipes is a good comparison. The recipe for a pie says
"make the pastry from page 12". It does not repeat the recipe for the
pastry. Every recipe that needs pastry uses the same page.

## One function as a step of another

Look at this code. Do not run it yet.

```python
def item_cost(price, quantity=1):
    """Return the cost of a number of items."""
    return price * quantity

def order_cost(price, quantity=1, delivery=5):
    """Return the cost of the items plus the delivery."""
    return item_cost(price, quantity) + delivery

print(order_cost(4, 3))
```

The body of `order_cost` calls `item_cost`. Python performs the last
line of the code in these steps:

1. The call `order_cost(4, 3)` starts. The parameter `price` refers to
   `4` and `quantity` refers to `3`. The call gives no third
   argument, so `delivery` gets its default value, `5`.

2. The body of `order_cost` calls `item_cost(price, quantity)`, which
   is `item_cost(4, 3)`. Python stops its work in `order_cost` at
   this point, and runs the body of `item_cost`.

3. `item_cost` returns a value to the place that called it, inside
   `order_cost`.

4. `order_cost` adds `delivery` to that value, and returns the result
   to the last line of the code, where `print()` shows it.

```{quiz}
:id: predict-order-cost
:type: text
:title: Predict the output
question: "What does `print(order_cost(4, 3))` show?"
answer: "17"
wrong:
  - { text: "12", explanation: "`12` is the return value of `item_cost(4, 3)`. The function `order_cost` then adds `delivery`, which has its default value." }
  - { text: "9", explanation: "`9` is 4 plus 5. The call gives a quantity of 3, so `item_cost(4, 3)` returns 4 multiplied by 3." }
  - { text: "60", explanation: "The function `order_cost` adds the delivery to the cost of the items. It does not multiply by it." }
  - { text: "17.0", explanation: "The number is correct. Every value in the calculation is an integer, so the result is an integer, and Python shows it without a decimal point." }
otherwise: "First find the return value of `item_cost(4, 3)`. Then add the default value of `delivery`."
explanation: "`item_cost(4, 3)` returns 12. The parameter `delivery` has its default value, 5. So `order_cost(4, 3)` returns 12 plus 5, which is 17."
```

The names `price` and `quantity` appear in both functions. They are
separate: each function has its own parameters. The function
`order_cost` must give its values to `item_cost` as arguments, in the
call `item_cost(price, quantity)`.

## Your task

A cinema sells tickets. A booking costs the price of the tickets plus
one booking fee. The action below adds a cell that holds two
functions. The first function is complete. The second function is not
finished: it always returns `0`. The action does not run the cell.

```{cell-insert}
:id: insert-booking
:title: Add a cell with two functions for me to complete
:path: {{ notebook }}
:tags: [booking]
:run: false
def ticket_total(tickets, price=12):
    """Return the cost of the tickets."""
    return tickets * price

def booking_total(tickets, price=12, fee=2):
    """Return the cost of the tickets plus the booking fee."""
    # Change the line below this one.
    return 0

print(booking_total(3))
```

Change the line `return 0`. The new line must call `ticket_total()`
to get the cost of the tickets, and then add `fee`. Give both
`tickets` and `price` to `ticket_total()` as arguments. Do not
multiply in `booking_total`: that calculation belongs to
`ticket_total`.

These examples show some calls, and the value that each call returns:

| Call | Return value |
|------|--------------|
| `booking_total(3)` | `38` |
| `booking_total(2, 10)` | `22` |
| `booking_total(1, fee=5)` | `17` |

Then run the cell. The output must be:

```
38
```

```{hint}
:title: Hint: how do I call the other function?
Look at the body of `order_cost` above. It calls `item_cost` with its
own parameters as the arguments, and adds `delivery` to the return
value. Your line has the same form, with `ticket_total`, the
parameters `tickets` and `price`, and the parameter `fee`.
```

```{hint}
:title: Hint: the complete line
The line is `return ticket_total(tickets, price) + fee`. Keep the four
spaces before the word `return`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: booking-not-started
:check: booking-total
:expect: There is no function named booking_total yet
```

````{attempt}
:id: booking-unchanged
:check: booking-total
:expect: The function booking_total still returns 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def ticket_total(tickets, price=12):
    """Return the cost of the tickets."""
    return tickets * price

def booking_total(tickets, price=12, fee=2):
    """Return the cost of the tickets plus the booking fee."""
    # Change the line below this one.
    return 0

print(booking_total(3))
```
````

````{attempt}
:id: booking-misspelled
:check: booking-total
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def booking_total(tickets, price=12, fee=2):
    """Return the cost of the tickets plus the booking fee."""
    return tickets_total(tickets, price) + fee
```
````

````{attempt}
:id: booking-no-fee
:check: booking-total
:expect: That is the cost of the tickets without the booking fee

```{cell-insert}
:path: {{ notebook }}
:run: true
def booking_total(tickets, price=12, fee=2):
    """Return the cost of the tickets plus the booking fee."""
    return ticket_total(tickets, price)

print(booking_total(3))
```
````

````{attempt}
:id: booking-no-price
:check: booking-total
:expect: booking_total(2, 10) gives 26 but it must give 22

```{cell-insert}
:path: {{ notebook }}
:run: true
def booking_total(tickets, price=12, fee=2):
    """Return the cost of the tickets plus the booking fee."""
    return ticket_total(tickets) + fee

print(booking_total(3))
```
````

````{attempt}
:id: booking-fixed-fee
:check: booking-total
:expect: booking_total(1, fee=5) gives 14 but it must give 17

```{cell-insert}
:path: {{ notebook }}
:run: true
def booking_total(tickets, price=12, fee=2):
    """Return the cost of the tickets plus the booking fee."""
    return ticket_total(tickets, price) + 2

print(booking_total(3))
```
````

````{attempt}
:id: booking-two-lines
:check: booking-total
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def booking_total(tickets, price=12, fee=2):
    """Return the cost of the tickets plus the booking fee."""
    cost = ticket_total(tickets, price=price)
    return cost + fee

print(booking_total(3))
```
````

````{hint}
:title: Show me a solution
:unlock: "booking-total" in failed_checks or "booking-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-booking-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [booking-solution]
:run: true
def ticket_total(tickets, price=12):
    """Return the cost of the tickets."""
    return tickets * price

def booking_total(tickets, price=12, fee=2):
    """Return the cost of the tickets plus the booking fee."""
    return ticket_total(tickets, price) + fee

print(booking_total(3))
```
````

```{verify}
:id: booking-total
:label: The function booking_total calls ticket_total and adds the fee
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed booking; cell-executed booking-solution
def _workshop_check():
    import contextlib, io
    function = globals().get("booking_total")
    if not callable(function):
        print("There is no function named booking_total yet. Change the line return 0 in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown):
            plain = function(3)
            priced = function(2, 10)
            other_fee = function(1, fee=5)
    except Exception as error:
        print(f"The function booking_total stopped with a {type(error).__name__} when the check called it. Check the spelling of ticket_total, tickets, price and fee in your line, and do not change the def lines. The line must be return ticket_total(tickets, price) + fee. Then run the cell again.")
        return False
    if plain == 0 and priced == 0:
        print("The function booking_total still returns 0. Change the line return 0 so that it calls ticket_total() and adds the fee. Then run the cell again.")
        return False
    if plain == 36:
        print("booking_total(3) gives 36 but it must give 38. That is the cost of the tickets without the booking fee. Add the parameter fee to the return value of ticket_total(). Then run the cell again.")
        return False
    if plain != 38:
        print(f"booking_total(3) gives {plain!r} but it must give 38. Three tickets cost 36 at the default price, and the default fee is 2. The line must be return ticket_total(tickets, price) + fee. Then run the cell again.")
        return False
    if priced != 22:
        print(f"booking_total(2, 10) gives {priced!r} but it must give 22. The call gives the price 10, but ticket_total() did not get it. Give both parameters to it as arguments: ticket_total(tickets, price). Then run the cell again.")
        return False
    if other_fee != 17:
        print(f"booking_total(1, fee=5) gives {other_fee!r} but it must give 17. The call gives the fee 5. Add the parameter fee in your line, not the number 2. Then run the cell again.")
        return False
    print("Correct. booking_total(3) gives 38, booking_total(2, 10) gives 22 and booking_total(1, fee=5) gives 17.")
    return True
globals().pop("_workshop_check")()
```

The function `booking_total` does not know how the cost of tickets is
calculated. It asks `ticket_total` for it. If the cinema changes that
calculation one day, only `ticket_total` changes.
