---
title: How long is a string?
requires: [verify:planet-ran, quiz:predict-length, verify:morning-ran]
---

# How long is a string?

A string is a row of characters, so it has a length: the number of
characters in it. A program often needs that number. A form accepts a
password only when it has enough characters. A message must fit on a
small screen.

Python counts the characters for you, with the function `len()`. The
name is short for "length". A function is a piece of code that
someone has already written and given a name. To use a function,
write its name and then parentheses, with a value between them. You
already know one function, `print()`.

The two functions do different work. `print()` shows a value on the
screen. `len()` shows nothing. It gives a value back to your code:
the number of characters. You can give that number a name, use it in
a calculation, or show it with `print()`.

Click the action below. It adds a cell that counts the characters of
a string, and runs it.

```{attempt}
:id: planet-not-run
:check: planet-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-planet
:title: Add a cell that counts the characters of a string, and run it
:path: {{ notebook }}
:tags: [planet]
:run: true
planet = "Jupiter"
planet_length = len(planet)
print(planet_length)
```

## What happened

1. `planet = "Jupiter"` makes the name `planet` refer to a string.

2. `planet_length = len(planet)` has an expression on the right side.
   Python counts the characters of the string: `J`, `u`, `p`, `i`,
   `t`, `e`, `r`. The function gives back the number `7`, and the
   name `planet_length` refers to it. The quotes are not counted,
   because they are not part of the string.

3. `print(planet_length)` shows `7`.

```{verify}
:id: planet-ran
:label: Python counted the characters of the string
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed planet
if globals().get("planet_length") == 7:
    print("The cell ran. The string Jupiter has 7 characters.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("planet_length") == 7
```

## Predict the length

Look at this cell. Do not run it yet.

```python
morning = "good morning"
morning_length = len(morning)
print(morning_length)
```

Type the number that you predict the notebook shows under the cell.

```{quiz}
:id: predict-length
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "12"
wrong:
  - { text: "11", explanation: "`11` is the number of letters. The space between the two words is also a character, and `len()` counts it." }
  - { text: "14", explanation: "The two quotes are not part of the string, so `len()` does not count them." }
  - { text: "2", explanation: "`len()` counts characters, not words." }
otherwise: "Count every character between the quotes, one by one. A space is also a character."
explanation: "The string has 11 letters and 1 space. A space is a character, so the length is 12."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: morning-not-run
:check: morning-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-morning
:title: Add the cell that counts the characters of two words, and run it
:path: {{ notebook }}
:tags: [morning]
:run: true
morning = "good morning"
morning_length = len(morning)
print(morning_length)
```

```{verify}
:id: morning-ran
:label: Python counted the space as a character
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed morning
if globals().get("morning_length") == 12:
    print("The cell ran. The string has 12 characters: 11 letters and 1 space.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("morning_length") == 12
```

To Python, every character has the same importance. A letter, a
digit, a space and a full stop each count as one character.
