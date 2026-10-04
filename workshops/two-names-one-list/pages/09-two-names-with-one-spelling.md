---
title: Two names with one spelling
requires: [verify:discount-ran, quiz:predict-savings, verify:savings-ran, verify:shelf-fixed]
---

# Two names with one spelling

A local name exists only inside its function. This page is about the
other direction: what a function can do with a global name. The
answer has two parts, and the second part is the last surprise of
this workshop.

## A function can read a global name

When a line of a function uses a name, Python looks first for a local
name with that spelling. If there is none, Python looks for a global
name. So a function can read a global name.

Click the action below. It adds a cell with a function that reads the
global name `discount`, and runs it.

```{attempt}
:id: discount-not-run
:check: discount-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-discount
:title: Add a cell with a function that reads a global name, and run it
:path: {{ notebook }}
:tags: [discount]
:run: true
discount = 5

def final_price(price):
    return price - discount

reduced = final_price(40)
print(reduced)
```

The output is `35`.

```{verify}
:id: discount-ran
:label: The function read the global name discount
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed discount
if globals().get("discount") == 5 and globals().get("reduced") == 35:
    print("The cell ran. The function read the global name discount, and returned 35.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("discount") == 5 and globals().get("reduced") == 35
```

The function has one local name, the parameter `price`. It has no
local name `discount`, so Python used the global name `discount`,
which refers to `5`.

## An assignment inside a function makes a local name

Reading is one thing. Assigning is another. An assignment inside a
function always makes a local name, or moves a local name. This is
true also when a global name with the same spelling exists. The
function then has its own label with that spelling, and the global
label does not move.

Think of two people named Ana: one in your family, and one at the
place where you work. They share a name, but they are two people.
When somebody at work says that Ana has a new telephone number, the
number of the Ana in your family does not change.

Look at this cell. Do not run it yet. The function has no parameter,
so the parentheses in its `def` line and in the call are empty.

```python
savings = 100

def take_ten():
    savings = 90

take_ten()
print(savings)
```

```{quiz}
:id: predict-savings
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "100"
wrong:
  - { text: "90", explanation: "The line `savings = 90` is inside the function, so it makes a local name `savings`. That local name is removed when the function returns. The global name `savings` did not move, and still refers to `100`." }
  - { text: "10", explanation: "No line subtracts. The line inside the function is an assignment of the value `90`, and the last line shows the global name `savings`." }
  - { text: "None", explanation: "The call `take_ten()` gives back `None`, but the cell does not print the result of the call. The last line shows the global name `savings`." }
otherwise: "The last line is outside the function, so it shows the global name `savings`. Does the assignment inside the function move the global name, or make a local name? Type one whole number."
explanation: "An assignment inside a function makes a local name. So `savings = 90` ties a local label `savings` to `90`, and the function ends. The global label `savings` is still tied to `100`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: savings-not-run
:check: savings-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-savings
:title: Add the cell with an assignment inside a function, and run it
:path: {{ notebook }}
:tags: [savings]
:run: true
savings = 100

def take_ten():
    savings = 90

take_ten()
print(savings)
```

The output is `100`.

```{verify}
:id: savings-ran
:label: The assignment inside the function did not move the global name
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed savings
if globals().get("savings") == 100 and callable(globals().get("take_ten")):
    print("The cell ran. The global name savings still refers to 100, because the assignment inside the function made a local name.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("savings") == 100 and callable(globals().get("take_ten"))
```

## What happened

1. `savings = 100` makes the global name `savings`.

2. The call `take_ten()` starts the function.

3. `savings = 90` is an assignment inside a function, so it makes a
   local name `savings`, which refers to `90`. For a moment there are
   two names with one spelling.

4. The function ends. Python removes the local name. The function has
   no `return`, so it gives back `None`.

5. `print(savings)` is outside the function, so it shows the global
   name, which still refers to `100`.

Python showed no error message. The function did nothing that you can
see.

## Compare this with the function that changed a list

On the page **A function that changes its argument**, a function did
change something that belonged to its caller. On this page, a
function could not. The difference is the difference between the two
actions that you learned on the page **Values that can change**.

- `items.append("bag")` changes a value. The value is a list that
  the caller can also see, so the caller sees the change.

- `savings = 90` moves a label. Inside a function, the label is a
  local name, so the caller sees nothing.

The correct way to give a new value to the caller is the return
value. The function returns the new value, and the code that calls
the function assigns it to the global name.

Python also has a statement named `global`, which lets a function
assign to a global name. These workshops do not use it. A program is
easier to understand when each function takes its values as arguments
and gives its result as a return value, because then the `def` line
and the `return` line show everything that goes in and comes out.

## Your task

A shop has 20 bottles of water on a shelf. The function `sell_five`
is meant to reduce the number by 5. The cell below has the mistake of
this page.

```{cell-insert}
:id: insert-shelf
:title: Add a cell with the mistake for me to correct
:path: {{ notebook }}
:tags: [shelf]
:run: false
def sell_five(stock):
    stock = stock - 5

shelf = 20
sell_five(shelf)
print(shelf)
```

First run the cell as it is: click inside it, hold `Shift` and press
`Enter`. The output is `20`. The parameter `stock` is a local name.
The assignment inside the function moved that local label to `15`,
and then the function ended.

Then correct the cell, with two changes.

- The function `sell_five` must return the new number. For example,
  `sell_five(20)` must return `15`, and `sell_five(8)` must return
  `3`.

- The line with the call must assign the return value to the global
  name `shelf`.

Leave the lines `shelf = 20` and `print(shelf)` as they are. Run the
cell again. When the cell is correct, the output is `15`.

```{hint}
:title: Hint: what to look at
The function calculates the new number, but it does not give it back.
A function gives a value back with `return`. Then look at the line
`sell_five(shelf)`: it calls the function, but it does nothing with
the value that comes back.
```

```{hint}
:title: Hint: the two changes
Add a third line to the function, with four spaces at its start:
`return stock`.

Change the line with the call to an assignment. The name `shelf` goes
on the left side, and the call `sell_five(shelf)` goes on the right
side.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: shelf-not-started
:check: shelf-fixed
:expect: The function sell_five does not exist yet
```

````{attempt}
:id: shelf-not-a-function
:check: shelf-fixed
:expect: The name sell_five does not refer to a function

```{cell-insert}
:path: {{ notebook }}
:run: true
sell_five = 15
print(sell_five)
```
````

````{attempt}
:id: shelf-no-parameter
:check: shelf-fixed
:expect: must have exactly one parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def sell_five():
    return 15

shelf = 20
shelf = sell_five()
print(shelf)
```
````

````{attempt}
:id: shelf-stops
:check: shelf-fixed
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def sell_five(stock):
    stock = stock - five
    return stock

print("The function is defined, but this cell does not call it.")
```
````

````{attempt}
:id: shelf-unchanged
:check: shelf-fixed
:expect: does not return a value

```{cell-insert}
:path: {{ notebook }}
:run: true
def sell_five(stock):
    stock = stock - 5

shelf = 20
sell_five(shelf)
print(shelf)
```
````

````{attempt}
:id: shelf-prints
:check: shelf-fixed
:expect: shows the new number with print()

```{cell-insert}
:path: {{ notebook }}
:run: true
def sell_five(stock):
    stock = stock - 5
    print(stock)

shelf = 20
sell_five(shelf)
print(shelf)
```
````

````{attempt}
:id: shelf-wrong-amount
:check: shelf-fixed
:expect: sell_five(20) gives 10 but it must give 15

```{cell-insert}
:path: {{ notebook }}
:run: true
def sell_five(stock):
    stock = stock - 10
    return stock

shelf = 20
shelf = sell_five(shelf)
print(shelf)
```
````

````{attempt}
:id: shelf-call-not-assigned
:check: shelf-fixed
:expect: the global name shelf still refers to 20

```{cell-insert}
:path: {{ notebook }}
:run: true
def sell_five(stock):
    stock = stock - 5
    return stock

shelf = 20
sell_five(shelf)
print(shelf)
```
````

````{attempt}
:id: shelf-called-twice
:check: shelf-fixed
:expect: the global name shelf refers to 10

```{cell-insert}
:path: {{ notebook }}
:run: true
def sell_five(stock):
    stock = stock - 5
    return stock

shelf = 20
shelf = sell_five(shelf)
shelf = sell_five(shelf)
print(shelf)
```
````

````{attempt}
:id: shelf-other-way
:check: shelf-fixed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def sell_five(stock):
    return stock - 5

shelf = 20
shelf = sell_five(shelf)
print(shelf)
```
````

````{hint}
:title: Show me a solution
:unlock: "shelf-fixed" in failed_checks or "shelf-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-shelf-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [shelf-solution]
:run: true
def sell_five(stock):
    stock = stock - 5
    return stock

shelf = 20
shelf = sell_five(shelf)
print(shelf)
```
````

```{verify}
:id: shelf-fixed
:label: The function returns the new number, and the name shelf refers to it
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed shelf; cell-executed shelf-solution
def _workshop_check():
    import contextlib, io
    if "sell_five" not in globals():
        print("The function sell_five does not exist yet. Click inside the new cell, then hold Shift and press Enter to run it. If the cell shows an error message, read its last line, correct the cell, and run it again.")
        return False
    sell_five = globals()["sell_five"]
    if not callable(sell_five):
        print("The name sell_five does not refer to a function. That happens when a line assigns another value to the name sell_five. Run the cell that holds the line def sell_five(stock): again.")
        return False
    for start, wanted in ((20, 15), (8, 3)):
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = sell_five(start)
        except TypeError:
            print(f"The check called sell_five({start}) and the function stopped with a TypeError. That usually means that the def line has more than one parameter, or no parameter. The function must have exactly one parameter, which is a number. Keep the line def sell_five(stock): as it was. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The check called sell_five({start}) and the function stopped with a {type(error).__name__}. Add a line under your cell that calls the function in the same way, run the cell, and read the last line of the error message. Correct the function, and run the cell again.")
            return False
        if result is None and shown.getvalue().strip() == str(wanted):
            print("The function sell_five shows the new number with print(), but it does not return it. The code that calls the function gets None. Replace print(stock) with return stock, so that the function gives the new number back. Then run the cell again.")
            return False
        if result is None:
            print("The function sell_five does not return a value, so the code that calls it gets None. The assignment inside the function moves only the local name stock. Add a third line to the function, with four spaces at its start: return stock. Then run the cell again.")
            return False
        if result != wanted:
            print(f"sell_five({start}) gives {result!r} but it must give {wanted}. The function must subtract 5 from the number that it is given, and return the result. Then run the cell again.")
            return False
    shelf = globals().get("shelf")
    if shelf == 20:
        print("The function sell_five is correct now, but the global name shelf still refers to 20. The line sell_five(shelf) calls the function and does nothing with the return value. Change that line to an assignment: shelf = sell_five(shelf). Then run the cell again.")
        return False
    if shelf != 15:
        print(f"The function sell_five is correct now, but the global name shelf refers to {shelf!r}, and it must refer to 15. The cell must have the line shelf = 20, then one line shelf = sell_five(shelf), and then print(shelf). Then run the cell again.")
        return False
    print("Correct. sell_five(20) gives 15, and the assignment made the global name shelf refer to the return value.")
    return True
globals().pop("_workshop_check")()
```

You corrected the cell. The function returns the new value, and the
caller decides which name refers to it. This form works for every
kind of value, and a reader of the cell can see where the name
`shelf` gets its new value.
