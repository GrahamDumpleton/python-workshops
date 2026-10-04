---
title: Try and except
requires: [verify:gift-handled, quiz:predict-letters, verify:letters-ran, verify:to-amount-function]
---

# Try and except

You can tell Python what to do when an exception happens. Then the
exception does not stop the program. To **handle** an exception means
to give Python other lines to run when the exception happens, so that
the program continues.

Think of a person who sorts letters in a post office. One letter has
no address. The person does not stop work and go home. The person
puts that letter in a separate box, and continues with the next
letter.

Python has two words for this, `try` and `except`. Each of them
begins a block:

```python
try:
    amount = float(text)
except ValueError:
    print("The amount is not a number.")
```

- The block under `try:` holds the lines that can go wrong. Python
  tries to run them.

- The line `except ValueError:` names a type of exception. The block
  under it holds the lines to run when an exception of that type
  happens in the `try` block.

The word `except` here means "but if this goes wrong". The lines of
the two blocks begin with four spaces, as in an `if` and an `else`.

## See it work

The cell below tries to make a float from the string `"unknown"`,
which is the amount that stopped the program on the last page.

```{attempt}
:id: gift-not-handled
:check: gift-handled
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-gift
:title: Add a cell that handles the exception, and run it
:path: {{ notebook }}
:tags: [gift]
:run: true
gift_text = "unknown"
try:
    gift_amount = float(gift_text)
    print("The amount is a number.")
except ValueError:
    print("The amount is not a number.")
gift_checked = True
print("The program continues.")
```

The output is:

```
The amount is not a number.
The program continues.
```

```{verify}
:id: gift-handled
:label: The cell handled the exception
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed gift
if globals().get("gift_checked") == True:
    print("The cell ran. It handled the ValueError, and the program continued.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("gift_checked") == True
```

## What happened

There is no error message under the cell. Python did these things:

1. Python began the `try` block. It called `float("unknown")`, and
   that call caused a `ValueError`.

2. Python left the `try` block at once. The second line of the block,
   which prints `The amount is a number.`, did not run. The name
   `gift_amount` did not get a value.

3. Python looked at the `except` line. The type there is `ValueError`,
   which is the type of the exception that happened. So Python ran
   the `except` block.

4. Python continued with the lines after the two blocks.

When no exception happens in the `try` block, Python runs the whole
`try` block, and does not run the `except` block.

## Predict the output

Look at this cell. Do not run it yet. The string `"ten"` does not
hold a number that `float()` can read.

```python
try:
    print("A")
    ten_amount = float("ten")
    print("B")
except ValueError:
    print("C")
letters_done = True
print("D")
```

```{quiz}
:id: predict-letters
:type: text
:case: false
:title: Predict the letters
question: "Which letters does the cell show? Type the letters in the order in which they appear, with no spaces between them."
answer: "ACD"
wrong:
  - { text: "ABCD", explanation: "The line that prints `B` does not run. The exception happens in the line before it, and Python leaves the `try` block at once." }
  - { text: "AC", explanation: "The line that prints `D` is after the two blocks. Python handled the exception, so the program continues, and that line runs." }
  - { text: "CD", explanation: "The line that prints `A` is before the line that causes the exception. Python ran it before anything went wrong." }
  - { text: "ABD", explanation: "`float(\"ten\")` causes a `ValueError`. Python leaves the `try` block before the line that prints `B`, and runs the `except` block, which prints `C`." }
  - { text: "AD", explanation: "The `except` line names `ValueError`, and a `ValueError` is what happened. So Python runs the `except` block, which prints `C`." }
  - { text: "A", explanation: "The exception does not stop the program, because the `except` block handles it. Python runs the `except` block, and then the line after the two blocks." }
otherwise: "Follow the cell line by line. The exception happens in the line that calls `float()`. Which lines of the `try` block ran before it? Which block runs next? Which line comes after the two blocks?"
explanation: "Python prints `A`. Then `float(\"ten\")` causes a `ValueError`, so Python leaves the `try` block and does not print `B`. The `except` block prints `C`. Then the program continues after the two blocks, and prints `D`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: letters-not-run
:check: letters-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-letters
:title: Add the cell that prints the letters, and run it
:path: {{ notebook }}
:tags: [letters]
:run: true
try:
    print("A")
    ten_amount = float("ten")
    print("B")
except ValueError:
    print("C")
letters_done = True
print("D")
```

The output is:

```
A
C
D
```

```{verify}
:id: letters-ran
:label: The cell that prints the letters has run
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed letters
if globals().get("letters_done") == True:
    print("The cell ran. It shows A, C and D, and it does not show B.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("letters_done") == True
```

## Your task

Write a function that makes a float from a string, and that does not
stop when the string does not hold a number.

Your function must be like this:

- Its name is `to_amount`.

- It has one parameter, with the name `text`. The argument is a
  string, such as the third field of a row.

- When `float()` can make a float from the string, the function
  returns that float.

- When `float()` causes a `ValueError`, the function returns `None`.
  `None` is the value that means "there is no value here".

| The call | The return value |
|----------|------------------|
| `to_amount("6.40")` | `6.4` |
| `to_amount("650")` | `650.0` |
| `to_amount("unknown")` | `None` |
| `to_amount("")` | `None` |

The function must return the result. It must not print it.

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-to-amount
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [to-amount]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`.

A cell that only defines a function shows no output. To try your
function, add lines under it that call the function and show the
result. These lines begin without spaces:

```python
print(to_amount("6.40"))
print(to_amount("unknown"))
```

When the function is correct, these two lines show `6.4` and then
`None`.

```{hint}
:title: Hint: the parts of the function
The first line is `def to_amount(text):`. The body has a `try` block
and an `except` block. The words `try:` and `except ValueError:`
begin with four spaces, because they are in the body of the function.
The lines of their blocks begin with eight spaces.
```

```{hint}
:title: Hint: what goes in each block
The `try` block holds one line, which returns the float:
`return float(text)`. The `except` block holds one line, which
returns the other result: `return None`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: to-amount-not-started
:check: to-amount-function
:expect: The function to_amount does not exist yet
```

````{attempt}
:id: to-amount-not-a-function
:check: to-amount-function
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
to_amount = 6.4
```
````

````{attempt}
:id: to-amount-no-parameter
:check: to-amount-function
:expect: but it has 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_amount():
    return 6.4
```
````

````{attempt}
:id: to-amount-no-try
:check: to-amount-function
:expect: stopped with a ValueError

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_amount(text):
    return float(text)
```
````

````{attempt}
:id: to-amount-other-error
:check: to-amount-function
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_amount(text):
    try:
        return float(txt)
    except ValueError:
        return None
```
````

````{attempt}
:id: to-amount-prints
:check: to-amount-function
:expect: shows the float with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_amount(text):
    try:
        print(float(text))
    except ValueError:
        print(None)
```
````

````{attempt}
:id: to-amount-no-return
:check: to-amount-function
:expect: A function gives None when no line with return runs

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_amount(text):
    try:
        amount = float(text)
    except ValueError:
        amount = None
```
````

````{attempt}
:id: to-amount-string
:check: to-amount-function
:expect: That is a string, and not a float

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_amount(text):
    try:
        amount = float(text)
        return text
    except ValueError:
        return None
```
````

````{attempt}
:id: to-amount-zero
:check: to-amount-function
:expect: but it must give None

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_amount(text):
    try:
        return float(text)
    except ValueError:
        return 0
```
````

````{attempt}
:id: to-amount-one-return
:check: to-amount-function
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_amount(text):
    try:
        number = float(text)
    except ValueError:
        number = None
    return number
```
````

````{hint}
:title: Show me a solution
:unlock: "to-amount-function" in failed_checks or "to-amount-function" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-to-amount-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [to-amount-solution]
:run: true
def to_amount(text):
    try:
        return float(text)
    except ValueError:
        return None

print(to_amount("6.40"))
print(to_amount("unknown"))
```
````

```{verify}
:id: to-amount-function
:label: Your function to_amount gives a float, or None for a string that holds no number
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed to-amount; cell-executed to-amount-solution
def _workshop_check():
    import contextlib, inspect, io
    if "to_amount" not in globals():
        print("The function to_amount does not exist yet. Write it under the comment in the new cell. The first line is def to_amount(text): and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["to_amount"]
    if not callable(function):
        print("The name to_amount exists, but its value is not a function. Begin your cell with the line def to_amount(text): and write the lines of the function under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function to_amount must have one parameter, the string, but it has {count}. Make the first line def to_amount(text): Then run the cell again.")
        return False
    cases = [("6.40", 6.4), ("650", 650.0), ("unknown", None), ("", None), ("12.5", 12.5), ("ten", None)]
    for text, expected in cases:
        call = f"to_amount({text!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = function(text)
        except ValueError:
            print(f"The function to_amount stopped with a ValueError when the check called {call}. The line that calls float() must be inside a try block, and the function needs an except ValueError: block that returns None. Then run the cell again.")
            return False
        except Exception as error:
            print(f"The function to_amount stopped with a {type(error).__name__} when the check called {call}. That is not an exception from the data. It comes from a mistake in the body. Check the spelling of each name in the body, run the same call in a cell of your own, and read the error message from the last line. Then correct the function and run the cell again.")
            return False
        printed = shown.getvalue().strip()
        if expected is not None and result is None and printed != "":
            print(f"The function to_amount shows the float with print(), but it does not return it. The call {call} puts {printed} on the screen, and the code that calls the function gets None. Replace each print() in the body with a line that begins with return. Then run the cell again.")
            return False
        if expected is not None and result is None:
            print(f"{call} gives None but it must give {expected!r}. A function gives None when no line with return runs. In the try block, return the float: return float(text). Then run the cell again.")
            return False
        if expected is not None and type(result) is str:
            print(f"{call} gives {result!r}. That is a string, and not a float. The function must return what float() gives, not the parameter: return float(text). Then run the cell again.")
            return False
        if expected is None and result is not None:
            print(f"{call} gives {result!r} but it must give None. The except block must return None, so that the code that calls the function can tell that the string holds no number. Then run the cell again.")
            return False
        if result != expected:
            print(f"{call} gives {result!r} but it must give {expected!r}. In the try block, return the float that float(text) gives. Then run the cell again.")
            return False
    print("Correct. to_amount('6.40') gives 6.4, and to_amount('unknown') gives None. Your function handles the ValueError.")
    return True
globals().pop("_workshop_check")()
```

Your function handles the exception in one place. Code that calls
`to_amount()` never stops because of an amount that cannot be read.
