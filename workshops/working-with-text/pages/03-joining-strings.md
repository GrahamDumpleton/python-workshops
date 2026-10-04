---
title: Joining strings
requires: [verify:joined-ran, quiz:predict-digits, verify:digits-ran, verify:space-added]
---

# Joining strings

A program often builds a long text from short pieces: a greeting and
a name, or a first name and a family name. Python can join two
strings into one new string.

To join two strings, write the operator `+` between them. An
**operator** is a symbol that tells Python which calculation to do
with the values beside it. Between two numbers, `+` adds. Between two
strings, `+` joins: the new string holds the characters of the first
string, and then the characters of the second string.

A piece of code such as `"rain" + "coat"` is an **expression**: a
piece of code that Python calculates to produce a value.

Railway carriages are a good comparison. To join two trains, you
connect the second train behind the first train. No carriage changes,
and nothing is added between them.

Click the action below. It adds a cell that joins two strings, and
runs it.

```{attempt}
:id: joined-not-run
:check: joined-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-joined
:title: Add a cell that joins two strings, and run it
:path: {{ notebook }}
:tags: [joined]
:run: true
first_word = "rain"
second_word = "coat"
joined_word = first_word + second_word
print(joined_word)
```

## What happened

1. The first two lines make the names `first_word` and `second_word`
   refer to two strings.

2. `joined_word = first_word + second_word` has an expression on the
   right side. Both values are strings, so the operator `+` joins
   them. The result is the new string `"raincoat"`, and the name
   `joined_word` refers to it.

3. `print(joined_word)` shows `raincoat`.

```{verify}
:id: joined-ran
:label: Python joined two strings
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed joined
if globals().get("joined_word") == "raincoat":
    print("The cell ran. The name joined_word refers to the string raincoat.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("joined_word") == "raincoat"
```

## Digits in a string

Look at this cell. Do not run it yet. Both values are strings,
because both are between quotes.

```python
left_digits = "3"
right_digits = "4"
print(left_digits + right_digits)
```

Type the output that you predict the notebook shows under the cell.

```{quiz}
:id: predict-digits
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "34"
wrong:
  - { text: "7", explanation: "`7` is the result for the numbers 3 and 4. These two values are between quotes, so they are strings. Between two strings, the operator `+` joins." }
  - { text: "\"34\"", explanation: "The characters are correct. But `print()` shows a string without its quotes: type only the characters." }
  - { text: "'34'", explanation: "The characters are correct. But `print()` shows a string without its quotes: type only the characters." }
  - { text: "3 4", explanation: "The operator `+` does not put a space between the two strings. It joins them directly." }
  - { text: "3 + 4", explanation: "Python calculates the expression between the parentheses first. `print()` shows the result." }
otherwise: "Both values are strings, not numbers. What does the operator `+` do between two strings?"
explanation: "Both values are strings, so the operator `+` joins them. The result is the string `\"34\"`, and `print()` shows it without the quotes."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: digits-not-run
:check: digits-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-digits
:title: Add the cell that joins two strings of digits, and run it
:path: {{ notebook }}
:tags: [digits]
:run: true
left_digits = "3"
right_digits = "4"
print(left_digits + right_digits)
```

```{verify}
:id: digits-ran
:label: Python joined the two strings of digits
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed digits
if globals().get("left_digits") == "3" and globals().get("right_digits") == "4":
    print("The cell ran. It showed 34, because the operator + joins two strings.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("left_digits") == "3" and globals().get("right_digits") == "4"
```

Python does not look inside a string to decide what `+` means. It
looks only at the kind of each value. Two numbers are added. Two
strings are joined.

A string and a number cannot be joined with `+`. Python stops and
shows an error message, because it cannot know whether you want to
add or to join. The next page shows the correct way to put a number
into text.

## Your task

The operator `+` adds nothing between the two strings. A space
between two words is also a character, and you must put it there
yourself. A string that holds one space is written `" "`.

The action below adds a cell that joins a first name and a family
name. The action does not run the cell.

```{cell-insert}
:id: insert-full-name
:title: Add a cell that joins two names for me to change
:path: {{ notebook }}
:tags: [full-name]
:run: false
given_name = "Yuki"
last_name = "Tanaka"
full_name = given_name + last_name
print(full_name)
```

When this cell runs, the output is `YukiTanaka`. Change the third
line so that the two names have one space between them. Do not change
the first two lines. Then run the cell. The output must be:

```
Yuki Tanaka
```

```{hint}
:title: Hint: where does the space go?
You can use the operator `+` more than once in one expression. The
third line must join three strings: the first name, then a string
that holds one space, then the family name.
```

```{hint}
:title: Hint: what does the line look like?
The string that holds one space is `" "`: a quote, one space and a
quote. Write it between the two names, with a `+` on each side:
`full_name = given_name + " " + last_name`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: space-not-started
:check: space-added
:expect: The cell has not run yet
```

````{attempt}
:id: space-unchanged
:check: space-added
:expect: has no space between the two names

```{cell-insert}
:path: {{ notebook }}
:run: true
given_name = "Yuki"
last_name = "Tanaka"
full_name = given_name + last_name
print(full_name)
```
````

````{attempt}
:id: space-two
:check: space-added
:expect: has more than one space

```{cell-insert}
:path: {{ notebook }}
:run: true
given_name = "Yuki"
last_name = "Tanaka"
full_name = given_name + "  " + last_name
print(full_name)
```
````

````{attempt}
:id: space-at-end
:check: space-added
:expect: but it must refer to the string Yuki Tanaka

```{cell-insert}
:path: {{ notebook }}
:run: true
given_name = "Yuki"
last_name = "Tanaka"
full_name = given_name + last_name + " "
print(full_name)
```
````

````{attempt}
:id: space-in-name
:check: space-added
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
given_name = "Yuki"
last_name = "Tanaka"
full_name = given_name + " Tanaka"
print(full_name)
```
````

````{hint}
:title: Show me a solution
:unlock: "space-added" in failed_checks or "space-added" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-full-name-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [full-name-solution]
:run: true
given_name = "Yuki"
last_name = "Tanaka"
full_name = given_name + " " + last_name
print(full_name)
```
````

```{verify}
:id: space-added
:label: The full name has one space between the two names
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed full-name; cell-executed full-name-solution
if "full_name" not in globals():
    print("The cell has not run yet. Change the third line of the new cell. Then hold Shift and press Enter to run the cell.")
elif full_name == "Yuki Tanaka":
    print("Correct. The name full_name refers to the string Yuki Tanaka, with one space between the two names.")
elif full_name == "YukiTanaka":
    print("The name full_name refers to the string YukiTanaka, which has no space between the two names. Join three strings in the third line: given_name, then a string that holds one space, then last_name. Then run the cell again.")
elif isinstance(full_name, str) and full_name.split() == ["Yuki", "Tanaka"] and full_name.strip() == full_name:
    print("The name full_name has more than one space between the two names. The string between the two names must hold exactly one space. Then run the cell again.")
else:
    print(f"The name full_name refers to [{full_name}] but it must refer to the string Yuki Tanaka. The square brackets show where the value begins and ends. The third line must join given_name, then a string that holds one space, then last_name. Then run the cell again.")
"full_name" in globals() and full_name == "Yuki Tanaka"
```
