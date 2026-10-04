---
title: A function with no return
requires: [quiz:predict-none, verify:half-ran, quiz:none-cause]
---

# A function with no return

Every call of a function gives a value back. This is true also for a
function that has no `return` in its body. Python needs a value to
give back for such a function, and it uses a special value: `None`.

**`None`** is the value that means "there is no value here". It is a
value of its own, in the same way as `True` and `False` are. It is not
a number, and it is not a string. You write it with a capital `N` and
with no quotes.

Think of the friend who calculates for you. You open your hand
for the piece of paper, but your friend only says the answer aloud.
Your hand stays empty. `None` is the empty hand.

On the last page, the line `shown = show_double(4)` gave a name to
what `show_double` gave back. The function `show_double` has no
`return`, so the name `shown` refers to `None`.

## Predict the output

Look at this cell. Do not run it yet. The function `show_half` prints
its result, and it has no `return`.

```python
def show_half(number):
    print(number / 2)

half = show_half(10)
print(half)
```

The output of this cell has two lines. The first line is `5.0`, which
the `print()` in the body of the function shows during the call. Type
the second line that you predict, exactly as it appears.

```{quiz}
:id: predict-none
:type: text
:title: Predict the second line
question: The first line of the output is `5.0`. What is the second line?
answer: "None"
wrong:
  - { text: "5.0", explanation: "The function shows `5.0` on the screen, but it does not return it. The name `half` refers to the value that the function gives back, and the function has no `return`." }
  - { text: "5", explanation: "The function shows the result on the screen, but it does not return it. The name `half` refers to the value that the function gives back, and the function has no `return`." }
  - { text: "half", explanation: "`print(half)` shows the value that the name `half` refers to, not the name. The function has no `return`. Which value does such a function give back?" }
  - { text: "0", explanation: "The value `0` is a number. A function with no `return` gives back the special value that means that there is no value." }
  - { pattern: "none|NONE|\"None\"|'None'", explanation: "That is the right value. Type it exactly as `print()` shows it: with a capital `N`, small letters after it, and no quotes." }
  - { pattern: ".*([Nn]othing|[Ee]rror|[Ee]mpty).*", explanation: "The line `print(half)` runs with no error, and it shows a value. A function with no `return` gives back the special value that this page describes." }
otherwise: "The function `show_half` has no `return`. Read the first paragraph of this page again: which value does such a function give back?"
explanation: "The function `show_half` has no `return`, so the call gives back `None`. The name `half` refers to `None`, and `print(half)` shows `None`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: half-not-run
:check: half-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-half
:title: Add the cell that gives a name to the result of a function with no return, and run it
:path: {{ notebook }}
:tags: [half]
:run: true
def show_half(number):
    print(number / 2)

half = show_half(10)
print(half)
```

The output is:

```
5.0
None
```

```{verify}
:id: half-ran
:label: The function with no return gave back None
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed half
if "half" in globals() and half is None and callable(globals().get("show_half")):
    print("The cell ran. The function show_half has no return, so the name half refers to None.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
"half" in globals() and half is None and callable(globals().get("show_half"))
```

## What happened

1. The line `half = show_half(10)` calls the function. The body
   prints `5.0`. That is the first line of the output.

2. The body ends, and it has no `return`. Python gives back `None`.

3. The name `half` now refers to `None`. The number `5.0` was shown
   on the screen, and after that it was lost.

4. `print(half)` shows `None`. That is the second line of the output.

## How you will meet None

A function with no `return` is not a mistake. The functions
`show_opening_hours` and `welcome_guest` from earlier pages have the
job of showing text, and they have nothing to give back. Nobody gives
a name to the result of such a function.

`None` becomes a problem when a function was meant to give a result
back, but it prints the result and does not return it. There are two usual
signs.

The first sign is the word `None` in the output, in a place where you
expected a number.

The second sign is a `TypeError`. The program tries to calculate with
the result, but the result is `None`, and Python cannot calculate with
`None`. For example, the line `print(half + 1)` stops with an error
message that has this last line:

```
TypeError: unsupported operand type(s) for +: 'NoneType' and 'int'
```

The word `NoneType` in the message is the type of the value `None`.
The message says that Python cannot add `None` and an integer.

When you see either of these signs, look at the function that gave
the value. Its body probably uses `print()` where it needs `return`.

```{quiz}
:id: none-cause
:title: Finding the cause
question: "A function calculates a price. The program gives the name `price` to the result of a call, and then runs `price * 2`. Python stops with a `TypeError`, and the message holds the word `NoneType`. What is the most probable cause?"
options:
  - { text: "The function shows the price with `print()`, and it has no `return`", correct: true }
  - { text: "The function has too many parameters", explanation: "The wrong number of arguments also gives a `TypeError`, but that message does not hold the word `NoneType`, and Python stops at the call, not at the calculation." }
  - { text: "The name `price` does not exist", explanation: "A name that does not exist gives a `NameError`. Here the name exists, and it refers to `None`." }
explanation: "The word `NoneType` says that the calculation used the value `None`. A function gives back `None` when its body has no `return`. The function must return the price, not print it."
```
