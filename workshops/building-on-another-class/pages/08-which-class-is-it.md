---
title: Which class is it?
requires: [quiz:predict-isinstance, verify:isinstance-shown, verify:subscriptions-total]
---

# Which class is it?

A list can hold purchases and subscriptions together. Sometimes your
code needs to know which is which. For example, to find what Mariam
pays every month, the code must add up the subscriptions only, and
not the other purchases.

The function `isinstance()` answers this question. It comes with
Python. You give it an object and a class:

```python
isinstance(phone_plan, Subscription)
```

It gives `True` when the object was made from that class, or from a
child class of that class. If not, it gives `False`.

The name of the function is made of the words "is" and "instance".
Programmers also say "instance" for an object, so the call above
asks: "is `phone_plan` an instance of `Subscription`?". These
workshops say "object".

## Predict

Look at this code. Do not run it yet. The object `rent` is a
`Purchase`. The object `bus_march` is a `Subscription`, and the fifth
value, `3`, is its number of months.

```python
rent = Purchase("2026-03-01", "Rent for March", Decimal("650.00"), "rent")
bus_march = Subscription("2026-03-03", "Monthly bus pass", Decimal("42.00"), "transport", 3)
print(isinstance(bus_march, Subscription))
print(isinstance(bus_march, Purchase))
print(isinstance(rent, Subscription))
print(isinstance(rent, Purchase))
```

The code shows four lines. Each line is `True` or `False`.

```{quiz}
:id: predict-isinstance
:title: Predict the four lines
question: "What does this code show?"
options:
  - { text: "`True`, `False`, `False`, `True`", explanation: "The first, third and fourth lines are correct. For the second line, remember that `Subscription` is a child class of `Purchase`. A subscription is a purchase." }
  - { text: "`True`, `True`, `True`, `True`", explanation: "The third line is `False`. The object `rent` was made from the class `Purchase`. A purchase is not always a subscription." }
  - { text: "`True`, `True`, `False`, `True`", correct: true }
explanation: "`bus_march` was made from `Subscription`, so the first line is `True`. `Subscription` is a child class of `Purchase`, so `bus_march` is also a `Purchase`, and the second line is `True`. `rent` was made from `Purchase`, which is the parent class and not the child class, so the third line is `False`. The fourth line is `True`."
```

Run the code, and compare the output with your prediction.

```{attempt}
:id: isinstance-not-shown
:check: isinstance-shown
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-isinstance
:title: Add a cell that asks which class each object was made from, and run it
:path: {{ notebook }}
:tags: [isinstance]
:run: true
rent = Purchase("2026-03-01", "Rent for March", Decimal("650.00"), "rent")
bus_march = Subscription("2026-03-03", "Monthly bus pass", Decimal("42.00"), "transport", 3)
print(isinstance(bus_march, Subscription))
print(isinstance(bus_march, Purchase))
print(isinstance(rent, Subscription))
print(isinstance(rent, Purchase))
```

The output is:

```
True
True
False
True
```

```{verify}
:id: isinstance-shown
:label: The cell asked which class each object was made from
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed isinstance
if getattr(globals().get("rent"), "category", None) == "rent" and getattr(globals().get("bus_march"), "months", None) == 3:
    print("The cell ran. A subscription is a Subscription and also a Purchase. A purchase is a Purchase only.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
getattr(globals().get("rent"), "category", None) == "rent" and getattr(globals().get("bus_march"), "months", None) == 3
```

The second line is the important one. An object of a child class is
also an object of the parent class. That is what inheritance means: a
subscription is a purchase. It does not work in the other direction:
a purchase is not always a subscription.

## Your task

Write a function with the name `subscriptions_total`. It has one
parameter, with the name `purchases`, which is a list of objects.
Some of the objects are subscriptions and some are other purchases.
The function returns the amounts of the subscriptions added together.
It does not add the amount of an object that is not a subscription.

| The list holds | The return value |
|----------------|------------------|
| a rent of `650.00`, a subscription of `42.00`, a subscription of `18.00`, and shoes for `59.00` | `60.00` |
| an empty list | `0` |

Start the total at `Decimal("0")`, because the amounts are `Decimal`
values. Use a `for` loop over the list, and inside the loop use `if`
with `isinstance()`.

The function must return the value. It must not print it.

Click the action below. It adds a cell with a comment for your
function, and a list to try the function with.

```{cell-insert}
:id: insert-subscriptions-total
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [subscriptions-total]
:run: false
# Write the function subscriptions_total below this line.


march_purchases = [
    Purchase("2026-03-01", "Rent for March", Decimal("650.00"), "rent"),
    Subscription("2026-03-03", "Monthly bus pass", Decimal("42.00"), "transport", 3),
    Subscription("2026-03-06", "Phone bill", Decimal("18.00"), "phone", 24),
    Purchase("2026-03-09", "Running shoes", Decimal("59.00"), "clothes"),
]
print(subscriptions_total(march_purchases))
```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`.

When your function is correct, the output under the cell is:

```
60.00
```

````{hint}
:title: Hint: the shape of the function
The function has the same shape as a loop that adds up a total:

```python
def subscriptions_total(purchases):
    total = Decimal("0")
    for purchase in purchases:
        # The lines that add an amount go here.
    return total
```

Inside the loop, add the amount only when the object is a
subscription.
````

````{hint}
:title: Hint: the lines inside the loop
Inside the loop, the test is `isinstance(purchase, Subscription)`,
and the amount of the object is `purchase.amount`:

```python
        if isinstance(purchase, Subscription):
            total = total + purchase.amount
```

The `return` line comes after the loop. It begins with four spaces,
so that it is not inside the loop.
````

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: subscriptions-total-not-started
:check: subscriptions-total
:expect: The function subscriptions_total does not exist yet
```

````{attempt}
:id: subscriptions-total-no-class
:check: subscriptions-total
:expect: The check needs the class Purchase

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total(purchases):
    total = Decimal("0")
    for purchase in purchases:
        if isinstance(purchase, Subscription):
            total = total + purchase.amount
    return total

kept_subscription_class = Subscription
del Subscription
```
````

````{attempt}
:id: subscriptions-total-not-a-function
:check: subscriptions-total
:expect: it is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
Subscription = kept_subscription_class
subscriptions_total = Decimal("60.00")
```
````

````{attempt}
:id: subscriptions-total-no-parameter
:check: subscriptions-total
:expect: but it must have one

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total():
    return Decimal("60.00")
```
````

````{attempt}
:id: subscriptions-total-stops
:check: subscriptions-total
:expect: stopped with an AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total(purchases):
    total = Decimal("0")
    for purchase in purchases:
        if isinstance(purchase, Subscription):
            total = total + purchase.amout
    return total
```
````

````{attempt}
:id: subscriptions-total-prints
:check: subscriptions-total
:expect: shows the result with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total(purchases):
    total = Decimal("0")
    for purchase in purchases:
        if isinstance(purchase, Subscription):
            total = total + purchase.amount
    print(total)
```
````

````{attempt}
:id: subscriptions-total-no-return
:check: subscriptions-total
:expect: gives nothing back

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total(purchases):
    total = Decimal("0")
    for purchase in purchases:
        if isinstance(purchase, Subscription):
            total = total + purchase.amount
```
````

````{attempt}
:id: subscriptions-total-everything
:check: subscriptions-total
:expect: That is the total of every object in the list

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total(purchases):
    total = Decimal("0")
    for purchase in purchases:
        if isinstance(purchase, Purchase):
            total = total + purchase.amount
    return total
```
````

````{attempt}
:id: subscriptions-total-early-return
:check: subscriptions-total
:expect: The return line must come after the loop

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total(purchases):
    total = Decimal("0")
    for purchase in purchases:
        if isinstance(purchase, Subscription):
            total = total + purchase.amount
        return total
```
````

````{attempt}
:id: subscriptions-total-fixed
:check: subscriptions-total
:expect: The function must work for every list

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total(purchases):
    return Decimal("60.00")
```
````

````{attempt}
:id: subscriptions-total-wrong
:check: subscriptions-total
:expect: but it must give 60.00

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total(purchases):
    total = Decimal("0")
    for purchase in purchases:
        if isinstance(purchase, Subscription):
            total = total + 1
    return total
```
````

````{attempt}
:id: subscriptions-total-other-way
:check: subscriptions-total
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def subscriptions_total(items):
    result = 0
    for item in items:
        if isinstance(item, Subscription):
            result += item.amount
    return result
```
````

````{hint}
:title: Show me a solution
:unlock: "subscriptions-total" in failed_checks or "subscriptions-total" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-subscriptions-total-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [subscriptions-total-solution]
:run: true
def subscriptions_total(purchases):
    total = Decimal("0")
    for purchase in purchases:
        if isinstance(purchase, Subscription):
            total = total + purchase.amount
    return total

march_purchases = [
    Purchase("2026-03-01", "Rent for March", Decimal("650.00"), "rent"),
    Subscription("2026-03-03", "Monthly bus pass", Decimal("42.00"), "transport", 3),
    Subscription("2026-03-06", "Phone bill", Decimal("18.00"), "phone", 24),
    Purchase("2026-03-09", "Running shoes", Decimal("59.00"), "clothes"),
]
print(subscriptions_total(march_purchases))
```
````

```{verify}
:id: subscriptions-total
:label: Your function adds up the amounts of the subscriptions only
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed subscriptions-total; cell-executed subscriptions-total-solution
def _workshop_check():
    import contextlib, decimal, inspect, io
    if "subscriptions_total" not in globals():
        print("The function subscriptions_total does not exist yet. Write it under the comment in the new cell. The first line is def subscriptions_total(purchases): and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["subscriptions_total"]
    if not callable(function):
        print("The name subscriptions_total exists, but it is not a function. A function begins with a line that has the word def, the name, the parameter in parentheses and a colon: def subscriptions_total(purchases): Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        found = "no parameter" if count == 0 else f"{count} parameters"
        print(f"The function subscriptions_total has {found}, but it must have one, which is the list of objects. Write def subscriptions_total(purchases): Then run the cell again.")
        return False
    number = decimal.Decimal
    try:
        with contextlib.redirect_stdout(io.StringIO()):
            parent = globals()["Purchase"]
            child = globals()["Subscription"]
            cases = [
                [
                    parent("2026-02-01", "Rent for February", number("650.00"), "rent"),
                    child("2026-02-04", "Monthly bus pass", number("42.00"), "transport", 3),
                    child("2026-02-06", "Phone bill", number("18.00"), "phone", 24),
                    parent("2026-02-09", "Book", number("13.99"), "hobbies"),
                ],
                [
                    parent("2026-02-20", "Guitar strings", number("12.00"), "hobbies"),
                    parent("2026-02-26", "Socks", number("6.50"), "clothes"),
                ],
                [
                    child("2026-02-04", "Monthly bus pass", number("42.00"), "transport", 3),
                ],
            ]
    except Exception:
        print("The check needs the class Purchase, and the class Subscription with the attribute months, and it could not make an object of each. Return to the pages A class, again and An attribute of its own. On each page, click the first action again to run its cell. Then return to this page and run your cell again.")
        return False
    results = []
    printed = []
    for case in cases:
        output = io.StringIO()
        try:
            with contextlib.redirect_stdout(output):
                results.append(function(case))
        except Exception as error:
            kind = type(error).__name__
            article = "an" if kind[0] in "AEIOU" else "a"
            print(f"The call subscriptions_total(...) with a list of {len(case)} objects stopped with {article} {kind}. Read the last line of the error message under your cell. The amount of an object is its attribute amount, for example purchase.amount. Correct the body, and run the cell again.")
            return False
        printed.append(output.getvalue().strip())
    def value(result):
        if isinstance(result, (int, float, decimal.Decimal)) and not isinstance(result, bool):
            return round(float(result), 2)
        return None
    def show(result):
        return str(result) if value(result) is not None else repr(result)
    values = [value(result) for result in results]
    if values == [60.0, 0.0, 42.0]:
        print("Correct. For a rent, two subscriptions of 42.00 and 18.00, and a book, your function gives 60.00. For a list with no subscription it gives 0.")
        return True
    if results[0] is None and printed[0] in ("60.00", "60.0", "60"):
        print("The function subscriptions_total shows the result with print(), but it does not return it. The code that calls the function receives nothing. Replace the print() line in the body with return total. Then run the cell again.")
        return False
    if results[0] is None:
        print("The call subscriptions_total(...) gives nothing back. The function needs a line that begins with the word return, after the loop: return total. Then run the cell again.")
        return False
    if values[0] == 723.99:
        print("For a rent of 650.00, two subscriptions of 42.00 and 18.00, and a book for 13.99, your function gives 723.99. That is the total of every object in the list. Add an amount only when the object is a subscription: if isinstance(purchase, Subscription): Then run the cell again.")
        return False
    if values[0] == 0.0:
        print("For a list that holds two subscriptions of 42.00 and 18.00, your function gives 0. The return line must come after the loop, and not inside it: it begins with four spaces. Also check that the if line tests isinstance(purchase, Subscription). Then run the cell again.")
        return False
    if values[0] == 60.0:
        other = f"for a list with no subscription it gives {show(results[1])} and it must give 0" if values[1] != 0.0 else f"for a list with one subscription of 42.00 it gives {show(results[2])} and it must give 42.00"
        print(f"For a rent, two subscriptions of 42.00 and 18.00, and a book, your function gives 60.00, which is correct. But {other}. The function must work for every list: use a loop over the parameter purchases. Then run the cell again.")
        return False
    print(f"For a rent, two subscriptions of 42.00 and 18.00, and a book, your function gives {show(results[0])} but it must give 60.00. Inside the loop, add purchase.amount to the total when isinstance(purchase, Subscription) is True. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

Your function works on a list that holds objects of two classes. It
uses `isinstance()` to choose the objects that it needs.
