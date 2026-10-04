---
title: Exact money with Decimal
requires: [verify:exact-sum-shown, verify:from-float-shown, quiz:predict-decimal, verify:decimal-total]
---

# Exact money with Decimal

Python has a second kind of number with a decimal point, for the
cases where the result must be exact. Its name is `Decimal`.

A `Decimal` keeps a number digit by digit, in the way that you write
it on paper. `Decimal("0.1")` is exactly one tenth. So a sum of
`Decimal` values is the sum that you get on paper.

Think of two ways to know how much water is in a jug. You can look at
the marks on the side of the jug: the answer is close, but it is
never exact. Or you can count the full cups as you pour them in: the
answer is exact. A float is like the marks on the jug. A `Decimal` is
like the count of cups.

`Decimal` is not ready to use when Python starts. It is in the module
`decimal`. A module is a file of Python code that someone has already
written, and the module `decimal` comes with Python. The line
`from decimal import Decimal` gets the name `Decimal` from the module,
so that your code can use it. You need this line one time in a
notebook.

You make a `Decimal` from a string: `Decimal("6.40")`. You then use
it like any other number, with `+`, `-`, `*` and the comparison
operators.

```{attempt}
:id: exact-sum-not-shown
:check: exact-sum-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-exact-sum
:title: Add a cell that adds 0.1 and 0.2 as Decimal values, and run it
:path: {{ notebook }}
:tags: [exact-sum]
:run: true
from decimal import Decimal

exact_sum = Decimal("0.1") + Decimal("0.2")
print(exact_sum)
print(exact_sum == Decimal("0.3"))
```

The output is:

```
0.3
True
```

```{verify}
:id: exact-sum-shown
:label: The cell added 0.1 and 0.2 as Decimal values
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed exact-sum
if "Decimal" in globals() and str(globals().get("exact_sum")) == "0.3":
    print("The cell ran. As Decimal values, 0.1 + 0.2 is exactly 0.3.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
"Decimal" in globals() and str(globals().get("exact_sum")) == "0.3"
```

On the last page, the same sum with floats gave
`0.30000000000000004`, and the comparison with `0.3` gave `False`.
With `Decimal`, the sum is `0.3`, and the comparison gives `True`.

## Always from a string

Look at the quotes in `Decimal("0.1")`. The value between the
parentheses is a string, and this is important. `Decimal(0.1)`,
without the quotes, also runs, but it gives a different number.

```{attempt}
:id: from-float-not-shown
:check: from-float-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-from-float
:title: Add a cell that makes a Decimal from a string and from a float, and run it
:path: {{ notebook }}
:tags: [from-float]
:run: true
from_string = Decimal("0.1")
from_float = Decimal(0.1)
print(from_string)
print(from_float)
```

The output is:

```
0.1
0.1000000000000000055511151231257827021181583404541015625
```

```{verify}
:id: from-float-shown
:label: The cell made a Decimal from a string and from a float
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed from-float
if str(globals().get("from_string")) == "0.1" and globals().get("from_float") is not None:
    print("The cell ran. A Decimal made from the string is exactly 0.1. A Decimal made from the float is not.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
str(globals().get("from_string")) == "0.1" and globals().get("from_float") is not None
```

Without the quotes, `0.1` is a float. The float is not exact already,
before `Decimal` receives it. `Decimal` then keeps that float exactly,
with its small difference. The long number in the output is the
number that the float `0.1` really holds.

So the rule is: always make a `Decimal` from a string. This fits your
data well. Every amount that your program reads from the file is a
string already, so the amount never needs to be a float at all.

## A Decimal keeps the digits

A `Decimal` remembers how many digits come after the point.
`Decimal("42.00")` is shown as `42.00`, and `Decimal("42")` is shown
as `42`. The two values are equal. Only the way that they are shown
is different.

```{quiz}
:id: predict-decimal
:type: text
:title: Predict the result
question: "What does `print(Decimal(\"2.80\") + Decimal(\"42.00\"))` show?"
answer: "44.80"
wrong:
  - { text: "44.8", explanation: "That is what floats show. Both `Decimal` values have two digits after the point, and the sum keeps two digits after the point." }
  - { text: "2.8042.00", explanation: "The two strings are not joined. `Decimal()` turns each string into a number first, and `+` then adds the two numbers." }
  - { text: "44,80", explanation: "The digits are correct. Python writes the decimal point as a point, and not as a comma." }
  - { text: "Decimal('44.80')", explanation: "The number is correct. `print()` shows a `Decimal` as the number alone: type the number only." }
otherwise: "Add 2.80 and 42.00 on paper, and keep two digits after the point."
explanation: "The sum is `44.80`. It is exact, and it keeps the two digits after the point, in the way that people write money."
```

## Your task

Add up the seven amounts for transport again, and this time use
`Decimal`. The list `transport_amounts` from the last page still
exists.

- Make a name `decimal_total` that starts at `Decimal("0")`.

- Use a `for` loop over `transport_amounts`. For each string, make a
  `Decimal` from the string, and add it to `decimal_total`.

- After the loop, the last line of the cell is `print(decimal_total)`.

When your code is correct, the output under the cell is:

```
181.30
```

```{cell-insert}
:id: insert-decimal-total
:title: Add a cell for my code
:path: {{ notebook }}
:tags: [decimal-total]
:run: false
# Write the code that adds up transport_amounts with Decimal below this line.

```

Click on the empty line under the comment, and type your code. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: what changes
The code has the same shape as your code on the last page. Two things
change. The total starts at `Decimal("0")` and not at `0`. Inside the
loop, you use `Decimal(text)` where you used `float(text)`.
```

```{hint}
:title: Hint: the lines
The first line is `decimal_total = Decimal("0")`. The second line is
`for text in transport_amounts:`.

The line inside the loop is
`decimal_total = decimal_total + Decimal(text)`.

The name `text` refers to a string already, so you write it without
quotes. Do not write `Decimal(float(text))`: that makes the `Decimal`
from a float, and the result is not exact.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: decimal-total-not-started
:check: decimal-total
:expect: The name decimal_total does not exist yet
```

````{attempt}
:id: decimal-total-float
:check: decimal-total
:expect: That is a float, and not a Decimal

```{cell-insert}
:path: {{ notebook }}
:run: true
decimal_total = 0
for text in transport_amounts:
    decimal_total = decimal_total + float(text)
print(decimal_total)
```
````

````{attempt}
:id: decimal-total-not-decimal
:check: decimal-total
:expect: but it must be a Decimal

```{cell-insert}
:path: {{ notebook }}
:run: true
decimal_total = ""
for text in transport_amounts:
    decimal_total = decimal_total + text
print(decimal_total)
```
````

````{attempt}
:id: decimal-total-from-float
:check: decimal-total
:expect: made from a float

```{cell-insert}
:path: {{ notebook }}
:run: true
decimal_total = Decimal("0")
for text in transport_amounts:
    decimal_total = decimal_total + Decimal(float(text))
print(decimal_total)
```
````

````{attempt}
:id: decimal-total-zero
:check: decimal-total
:expect: is still 0

```{cell-insert}
:path: {{ notebook }}
:run: true
decimal_total = Decimal("0")
for text in transport_amounts:
    Decimal(text)
print(decimal_total)
```
````

````{attempt}
:id: decimal-total-other
:check: decimal-total
:expect: but the seven amounts add up to 181.30

```{cell-insert}
:path: {{ notebook }}
:run: true
decimal_total = Decimal("0")
for text in transport_amounts:
    decimal_total = Decimal(text)
print(decimal_total)
```
````

````{attempt}
:id: decimal-total-from-zero
:check: decimal-total
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
decimal_total = 0
for text in transport_amounts:
    decimal_total += Decimal(text)
print(decimal_total)
```
````

````{hint}
:title: Show me a solution
:unlock: "decimal-total" in failed_checks or "decimal-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-decimal-total-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [decimal-total-solution]
:run: true
decimal_total = Decimal("0")
for text in transport_amounts:
    decimal_total = decimal_total + Decimal(text)

print(decimal_total)
```
````

```{verify}
:id: decimal-total
:label: Your code adds up the seven amounts exactly
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed decimal-total; cell-executed decimal-total-solution
def _workshop_check():
    import decimal
    if "decimal_total" not in globals():
        print("The name decimal_total does not exist yet. Write your code under the comment in the new cell, and check the spelling of the name. Then hold Shift and press Enter to run the cell.")
        return False
    value = globals()["decimal_total"]
    if isinstance(value, float):
        print(f"decimal_total is {value!r}. That is a float, and not a Decimal. Start with decimal_total = Decimal(\"0\"), and use Decimal(text) inside the loop where you used float(text) before. Then run the cell again.")
        return False
    if not isinstance(value, decimal.Decimal):
        print(f"decimal_total is {value!r} but it must be a Decimal. Start with decimal_total = Decimal(\"0\"), and add Decimal(text) to it inside the loop. Then run the cell again.")
        return False
    if value == decimal.Decimal("181.30"):
        print("Correct. decimal_total is exactly 181.30, the same total that you get on paper.")
        return True
    if value == 0:
        print("decimal_total is still 0. The loop must change it. Inside the loop, give the name a new value each time: decimal_total = decimal_total + Decimal(text). Then run the cell again.")
        return False
    if value.is_finite() and round(float(value), 2) == 181.3:
        print("decimal_total is very close to 181.30, but it is not exactly 181.30. That happens when a Decimal is made from a float. Make each Decimal from the string itself: Decimal(text), and not Decimal(float(text)). Then run the cell again.")
        return False
    print(f"decimal_total is {value} but the seven amounts add up to 181.30. Start with decimal_total = Decimal(\"0\"), loop over every string of transport_amounts, and add Decimal(text) one time for each string. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

The total is `181.30`: exact, and with two digits after the point.
From here on, your program keeps every amount of money as a
`Decimal`.
