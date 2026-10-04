---
title: Raising an exception
requires: [quiz:raise-line, verify:positive-amount-function]
---

# Raising an exception

So far, Python found each problem. `float()` found a string that
holds no number, and `open()` found a name that has no file. Your own
code can find a problem too. To **raise** an exception means to make
an exception happen. The word `raise` in your code tells Python to do
it.

Why would you want an exception? Because some values are wrong for
your program, but they are not wrong for Python. Suppose that a row
of the spending file has the amount `-5.00`. `float("-5.00")` works,
and gives `-5.0`. But a purchase cannot cost less than `0`. If the
program continues, it adds a wrong number to the total, and nobody
sees it. It is better to stop at the place where the problem is, with
a message that says what is wrong.

Think of an office that receives forms. A person who finds a form
with no signature does not put it with the others. The person gives
it back, and says why.

A line with `raise` has this form:

```python
raise ValueError("The quantity must be 1 or more.")
```

After the word `raise` comes the type of the exception. Between the
parentheses is the message, a string that you write. Choose the type
that fits the problem. `ValueError` fits a value that has the right
type but cannot be used.

## See it work

The action below adds a cell with a function that checks the quantity
of an order. The cell calls the function two times. The second call
gives it the quantity `0`. The action does not run the cell.

```{cell-insert}
:id: insert-quantity
:title: Add a cell that raises an exception, without running it
:path: {{ notebook }}
:tags: [quantity]
:run: false
def check_quantity(quantity):
    if quantity < 1:
        raise ValueError("The quantity must be 1 or more.")
    return quantity

print(check_quantity(3))
print(check_quantity(0))
print("This line does not run.")
```

Run the cell: click inside it, hold `Shift` and press `Enter`.

The cell shows `3`, from the first call, and then an error message.
The last line of the message is:

```
ValueError: The quantity must be 1 or more.
```

This is the type and the message from the line with `raise`. You
wrote this error message, and Python shows it in the same way as its
own.

The error message has two arrows, because the problem happened inside
a function. The first arrow marks the line of the cell that called
the function. The second arrow marks the line inside the function
where Python stopped.

```{quiz}
:id: raise-line
:type: text
:title: Find the line inside the function
question: "Look at the second arrow in the error message, in the part that shows the lines of the function `check_quantity`. At which line did Python stop? Type the number."
answer: "3"
wrong:
  - { text: "7", explanation: "Line 7 is the line of the cell that called the function. The first arrow marks it. Look at the second arrow, lower in the message." }
  - { text: "2", explanation: "Line 2 is the `if` line. Its comparison was true, so Python continued with the line in its block. The second arrow marks that line." }
  - { text: "4", explanation: "Line 4 is the `return` line. Python never reached it in the second call. Look at the second arrow, lower in the message." }
otherwise: "Type one number only. It is the number after the second arrow `---->` in the error message."
explanation: "The second arrow marks line 3, the line with `raise`. That is where the exception happened."
```

## What happened

In the first call, `quantity` is `3`. The comparison `quantity < 1`
is false, so Python does not run the line with `raise`. The function
returns `3`.

In the second call, `quantity` is `0`. The comparison is true, so
Python runs the line with `raise`. The function ends at that line.
The `return` line does not run, and the call gives nothing back. The
exception goes to the code that called the function. No `try` block
is there to handle it, so the program stops.

An exception that you raise is an exception like every other. Code
that calls the function can handle it with `try` and `except
ValueError:`.

## Your task

Write a function that makes a float from the amount in a row, and
that refuses an amount that is less than `0`.

Your function must be like this:

- Its name is `positive_amount`.

- It has one parameter, with the name `text`. The argument is a
  string, such as `"6.40"`.

- It makes a float from the string with `float()`.

- When the float is less than `0`, the function raises a `ValueError`
  with a message. You choose the words of the message.

- In every other case, the function returns the float. An amount of
  `0` is allowed.

The function has no `try` block. When the string holds no number,
`float()` causes a `ValueError`, and the function lets that exception
go to the code that called it.

| The call | What happens |
|----------|--------------|
| `positive_amount("6.40")` | returns `6.4` |
| `positive_amount("0")` | returns `0.0` |
| `positive_amount("-5.00")` | raises a `ValueError` with your message |
| `positive_amount("unknown")` | `float()` causes a `ValueError` |

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-positive-amount
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [positive-amount]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`.

To try your function, add a line under it that begins without spaces:

```python
print(positive_amount("6.40"))
```

You can also try `positive_amount("-5.00")`, to see your own error
message under the cell.

```{hint}
:title: Hint: the parts of the function
The function `check_quantity` at the top of this page has nearly the
same form. Your function has one more line at the start of the body,
which makes the float: `amount = float(text)`. Then comes an `if`
line that compares `amount` with `0`.
```

```{hint}
:title: Hint: the if and the raise
The `if` line is `if amount < 0:` and it begins with four spaces. The
line in its block begins with eight spaces:
`raise ValueError("The amount must not be less than 0.")`. The last
line of the body begins with four spaces: `return amount`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: positive-not-started
:check: positive-amount-function
:expect: The function positive_amount does not exist yet
```

````{attempt}
:id: positive-not-a-function
:check: positive-amount-function
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
positive_amount = 6.4
```
````

````{attempt}
:id: positive-two-parameters
:check: positive-amount-function
:expect: but it has 2

```{cell-insert}
:path: {{ notebook }}
:run: true
def positive_amount(text, limit):
    return float(text)
```
````

````{attempt}
:id: positive-compares-string
:check: positive-amount-function
:expect: stopped with a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def positive_amount(text):
    if text < 0:
        raise ValueError("The amount must not be less than 0.")
    return float(text)
```
````

````{attempt}
:id: positive-prints
:check: positive-amount-function
:expect: shows the float with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def positive_amount(text):
    amount = float(text)
    if amount < 0:
        raise ValueError("The amount must not be less than 0.")
    print(amount)
```
````

````{attempt}
:id: positive-string
:check: positive-amount-function
:expect: That is a string, and not a float

```{cell-insert}
:path: {{ notebook }}
:run: true
def positive_amount(text):
    amount = float(text)
    if amount < 0:
        raise ValueError("The amount must not be less than 0.")
    return text
```
````

````{attempt}
:id: positive-no-raise
:check: positive-amount-function
:expect: It must raise a ValueError

```{cell-insert}
:path: {{ notebook }}
:run: true
def positive_amount(text):
    amount = float(text)
    return amount
```
````

````{attempt}
:id: positive-prints-message
:check: positive-amount-function
:expect: shows a message with print(), but it does not raise an exception

```{cell-insert}
:path: {{ notebook }}
:run: true
def positive_amount(text):
    amount = float(text)
    if amount < 0:
        print("The amount must not be less than 0.")
    else:
        return amount
```
````

````{attempt}
:id: positive-other-type
:check: positive-amount-function
:expect: raises a TypeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def positive_amount(text):
    amount = float(text)
    if amount < 0:
        raise TypeError("The amount must not be less than 0.")
    return amount
```
````

````{attempt}
:id: positive-refuses-zero
:check: positive-amount-function
:expect: An amount of 0 is allowed

```{cell-insert}
:path: {{ notebook }}
:run: true
def positive_amount(text):
    amount = float(text)
    if amount <= 0:
        raise ValueError("The amount must be more than 0.")
    return amount
```
````

````{attempt}
:id: positive-hides-unknown
:check: positive-amount-function
:expect: must not handle the ValueError from float()

```{cell-insert}
:path: {{ notebook }}
:run: true
def positive_amount(text):
    try:
        amount = float(text)
    except ValueError:
        return None
    if amount < 0:
        raise ValueError("The amount must not be less than 0.")
    return amount
```
````

````{hint}
:title: Show me a solution
:unlock: "positive-amount-function" in failed_checks or "positive-amount-function" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-positive-amount-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [positive-amount-solution]
:run: true
def positive_amount(text):
    amount = float(text)
    if amount < 0:
        raise ValueError("The amount must not be less than 0.")
    return amount

print(positive_amount("6.40"))
print(positive_amount("0"))
try:
    print(positive_amount("-5.00"))
except ValueError:
    print("The amount -5.00 was refused.")
```
````

```{verify}
:id: positive-amount-function
:label: Your function positive_amount returns a float, and raises a ValueError for an amount less than 0
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed positive-amount; cell-executed positive-amount-solution
def _workshop_check():
    import contextlib, inspect, io
    if "positive_amount" not in globals():
        print("The function positive_amount does not exist yet. Write it under the comment in the new cell. The first line is def positive_amount(text): and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["positive_amount"]
    if not callable(function):
        print("The name positive_amount exists, but its value is not a function. Begin your cell with the line def positive_amount(text): and write the lines of the function under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function positive_amount must have one parameter, the string, but it has {count}. Make the first line def positive_amount(text): Then run the cell again.")
        return False
    for text, expected in [("6.40", 6.4), ("12.5", 12.5), ("0", 0.0)]:
        call = f"positive_amount({text!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(text)
        except ValueError:
            if expected == 0.0:
                print(f"The function positive_amount raises a ValueError when the check calls {call}. An amount of 0 is allowed. Only an amount that is less than 0 is refused, so the comparison must be amount < 0 and not amount <= 0. Then run the cell again.")
            else:
                print(f"The function positive_amount stopped with a ValueError when the check called {call}. That amount is not less than 0, so the function must return the float. Check the comparison in the if line: if amount < 0: Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function positive_amount stopped with a {type(error).__name__} when the check called {call}. That comes from a mistake in the body. The parameter is a string, so make a float from it first, and compare the float with 0: amount = float(text) and then if amount < 0: Then run the cell again.")
            return False
        printed = shown.getvalue().strip()
        if result is None and printed != "":
            print(f"The function positive_amount shows the float with print(), but it does not return it. The call {call} puts {printed} on the screen, and the code that calls the function gets None. Make the last line of the body return amount. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {expected!r}. A function gives None when no line with return runs. Make the last line of the body return amount, with four spaces before it. Then run the cell again.")
            return False
        if type(result) is str:
            print(f"{call} gives {result!r}. That is a string, and not a float. The function must return what float() gives, not the parameter. Then run the cell again.")
            return False
        if result != expected:
            print(f"{call} gives {result!r} but it must give {expected!r}. The function must return the float that float(text) gives, with no change. Then run the cell again.")
            return False
    for text in ["-5.00", "-0.5"]:
        call = f"positive_amount({text!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(text)
        except ValueError:
            result = ValueError
        except Exception as error:
            print(f"The function positive_amount raises a {type(error).__name__} when the check calls {call}, but it must raise a ValueError. Write the type ValueError after the word raise. Then run the cell again.")
            return False
        if result is ValueError:
            pass
        elif result is None and shown.getvalue().strip() != "":
            print(f"When the check calls {call}, the function shows a message with print(), but it does not raise an exception. The code that calls the function cannot see what print() shows, so it continues as if nothing were wrong. Replace print with raise ValueError, and keep the message in the parentheses. Then run the cell again.")
            return False
        else:
            print(f"{call} gives {result!r}. It must raise a ValueError, because the amount is less than 0. After the line that makes the float, add an if line that compares the float with 0, and under it a line with raise ValueError and a message in parentheses. Then run the cell again.")
            return False
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown):
            result = function("unknown")
    except ValueError:
        print("Correct. positive_amount('6.40') gives 6.4, and positive_amount('-5.00') raises a ValueError with your message.")
        return True
    except Exception as error:
        print(f"The function positive_amount stopped with a {type(error).__name__} when the check called positive_amount('unknown'). The call of float() must be the first line of the body, with nothing around it. Then run the cell again.")
        return False
    print(f"positive_amount('unknown') gives {result!r}. The function must not handle the ValueError from float(). Remove the try block and the except block, so that the exception goes to the code that calls the function. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

## Handle it or raise it

A function that finds wrong data has two choices.

- It can handle the problem, as `to_amount()` does when it returns
  `None`. This is right when the function knows what to do.

- It can raise an exception, as `positive_amount()` does. This is
  right when only the code that calls the function knows what to do.
  That code can skip the row, or stop, or ask a person.

A function that raises an exception never lets a wrong value pass
without notice.
