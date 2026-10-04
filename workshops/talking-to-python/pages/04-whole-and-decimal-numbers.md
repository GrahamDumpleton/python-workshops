---
title: Whole numbers and decimal numbers
requires: [verify:first-division-ran, quiz:predict-division, verify:second-division-ran]
---

# Whole numbers and decimal numbers

The last usual calculation is division. A keyboard has no `÷` key, so
Python uses the slash symbol:

- `/` divides the first number by the second.

Division shows something important about numbers in Python. Run this
expression, which divides 7 by 2.

```{attempt}
:id: first-division-not-run
:check: first-division-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-first-division
:title: Add a cell with the expression 7 / 2, and run it
:path: {{ notebook }}
:tags: [first-division]
:run: true
7 / 2
```

The value is `3.5`. Python writes the decimal part of a number after a
point: `3.5` means three and a half. Python always uses a point here,
and never a comma, even if you write `3,5` in your own country.

```{verify}
:id: first-division-ran
:label: Python calculated 7 / 2
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed first-division
if 3.5 in Out.values():
    print("The cell ran, and the value is 3.5.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
3.5 in Out.values()
```

## Two kinds of number

Python has two kinds of number, and it treats them differently.

- An **integer** is a whole number, with no decimal point. `7`, `2`
  and `30` are integers. Use integers for things that you count, such
  as people or days.

- A **float** is a number with a decimal point. `3.5` is a float. Use
  floats for things that you measure, such as a distance or a
  temperature. The name is short for "floating point number", which
  describes how a computer stores such a number.

You can see which kind a number is by looking at it. If it has a
decimal point, it is a float. If it does not, it is an integer.

Now predict the value of another division. This time, the second
number divides the first one exactly. Type the value exactly as you
think Python shows it.

```{quiz}
:id: predict-division
:type: text
:title: Predict the value
question: "What does Python show as the value of the expression `8 / 2`?"
answer: "4.0"
wrong:
  - { text: "4", explanation: "The mathematics is correct, but Python does not show `4` here. Look at the value of `7 / 2` above: which kind of number is it? The operator `/` always produces that kind." }
  - { text: "4,0", explanation: "This is very close. Python writes the decimal part after a point, never after a comma." }
  - { pattern: "4\\.00+", explanation: "This is very close. Python shows only one digit after the point here." }
otherwise: "8 divided by 2 is exactly 4. Think about which kind of number the operator `/` produces, and how Python writes that kind."
explanation: "The operator `/` always produces a float, even when the division is exact. Python shows that the value is a float by writing `4.0`."
```

Run the expression and see.

```{attempt}
:id: second-division-not-run
:check: second-division-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-second-division
:title: Add a cell with the expression 8 / 2, and run it
:path: {{ notebook }}
:tags: [second-division]
:run: true
8 / 2
```

The value is `4.0`, not `4`. The two numbers that you divided were
integers, but the result of `/` is always a float. The `.0` at the end
is how Python tells you that this value is a float.

The other three operators behave differently. With `+`, `-` and `*`,
two integers always give an integer. This is why `6 * 5` gave `30`,
and not `30.0`.

```{verify}
:id: second-division-ran
:label: Python calculated 8 / 2 as a float
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed second-division
if any(type(value) is float and value == 4.0 for value in Out.values()):
    print("The cell ran, and the value is the float 4.0.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
any(type(value) is float and value == 4.0 for value in Out.values())
```
