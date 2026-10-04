---
title: Characters by position
requires: [verify:capital-ran, quiz:predict-index, verify:harbour-ran, quiz:predict-slice, verify:month-ran, verify:day-shortened]
---

# Characters by position

The characters of a string are in a fixed order, so each character
has a position. A program can ask for the character at one position:
the first letter of a name, or one digit of a code.

The position of a character is called its **index**. An index is a
whole number. To get one character, write the string, or a name that
refers to it, and then the index between square brackets: `[` and
`]`.

## Python counts from 0

Python does not count the positions from 1. It counts from 0. The
first character has the index `0`, the second character has the index
`1`, and so on.

The floors of a building are a comparison that helps. In many
countries, the floor at the level of the street is floor 0, and the
floor above it is floor 1. The index says how many steps a character
is from the start of the string. The first character is 0 steps from
the start.

This table shows the index of each character of the string
`"Lisbon"`:

| Index | `0` | `1` | `2` | `3` | `4` | `5` |
|-------|-----|-----|-----|-----|-----|-----|
| Character | `L` | `i` | `s` | `b` | `o` | `n` |

Click the action below. It adds a cell that shows the first and the
last character of the string, and runs it.

```{attempt}
:id: capital-not-run
:check: capital-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-capital
:title: Add a cell that shows two characters of a string, and run it
:path: {{ notebook }}
:tags: [capital]
:run: true
capital = "Lisbon"
first_letter = capital[0]
print(first_letter)
print(capital[5])
```

## What happened

1. `capital = "Lisbon"` makes the name `capital` refer to a string.

2. `first_letter = capital[0]` gets the character at index `0`, which
   is `L`. The result is a new string that holds one character, and
   the name `first_letter` refers to it.

3. `print(first_letter)` shows `L`.

4. `print(capital[5])` shows the character at index `5`, which is
   `n`. The string has 6 characters, and its last index is 5. The
   last index is always one less than the length, because the
   counting starts at 0.

The string has no character at index 6. An index after the last
character gives an error. The next workshop shows that error.

```{verify}
:id: capital-ran
:label: Python found the character at index 0
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed capital
if globals().get("first_letter") == "L":
    print("The cell ran. The character at index 0 of the string Lisbon is L.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("first_letter") == "L"
```

Look at this cell. Do not run it yet.

```python
harbour = "Mumbai"
second_letter = harbour[1]
print(second_letter)
```

```{quiz}
:id: predict-index
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "u"
wrong:
  - { text: "M", explanation: "`M` is the character at index 0. Python counts from 0, so index 1 is the second character." }
  - { text: "m", explanation: "The small `m` is at index 2. Count from 0: `M` is at index 0." }
  - { text: "U", explanation: "The letter is correct, but it is a small letter in the string. Python keeps each character exactly as it is." }
  - { text: "\"u\"", explanation: "The character is correct. But `print()` shows a string without its quotes: type only the character." }
  - { text: "'u'", explanation: "The character is correct. But `print()` shows a string without its quotes: type only the character." }
otherwise: "Count the characters of `Mumbai` from 0. Which character is at index 1?"
explanation: "Python counts from 0. `M` is at index 0, and `u` is at index 1."
```

```{attempt}
:id: harbour-not-run
:check: harbour-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-harbour
:title: Add the cell that shows the character at index 1, and run it
:path: {{ notebook }}
:tags: [harbour]
:run: true
harbour = "Mumbai"
second_letter = harbour[1]
print(second_letter)
```

```{verify}
:id: harbour-ran
:label: Python found the character at index 1
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed harbour
if globals().get("second_letter") == "u":
    print("The cell ran. The character at index 1 of the string Mumbai is u.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("second_letter") == "u"
```

## More than one character: a slice

Sometimes a program needs several characters that are next to each
other: the first three letters of a month, or the year at the start
of a date. A part of a string is called a **slice**, like a slice
that is cut from a loaf of bread.

To get a slice, write two indexes between the square brackets, with a
colon between them: `capital[0:3]`.

- The first index says where the slice starts.

- The second index says where the slice stops. The character at the
  second index is not part of the slice.

So `capital[0:3]` holds the characters at the indexes 0, 1 and 2. The
slice stops before index 3. For the string `"Lisbon"`, the result is
`"Lis"`.

This rule has a useful result: the number of characters in the slice
is the second index minus the first index. Here, 3 minus 0 is 3
characters.

Look at this cell. Do not run it yet.

```python
month = "September"
short_month = month[0:3]
print(short_month)
```

```{quiz}
:id: predict-slice
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "Sep"
wrong:
  - { text: "Sept", explanation: "The slice stops before index 3. The character at index 3, which is `t`, is not part of the slice." }
  - { text: "ept", explanation: "The slice starts at index 0, and index 0 is the first character, `S`." }
  - { text: "Se", explanation: "The slice holds the characters at the indexes 0, 1 and 2. That is three characters." }
  - { text: "t", explanation: "`t` is the one character at index 3. A slice with two indexes gives all the characters from the first index, and stops before the second index." }
  - { text: "sep", explanation: "The letters are correct, but the first letter is a capital letter in the string. Python keeps each character exactly as it is." }
otherwise: "The slice starts at index 0 and stops before index 3. Count the characters of `September` from 0."
explanation: "The slice holds the characters at the indexes 0, 1 and 2: `S`, `e` and `p`. It stops before index 3."
```

```{attempt}
:id: month-not-run
:check: month-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-month
:title: Add the cell that takes a slice of a string, and run it
:path: {{ notebook }}
:tags: [month]
:run: true
month = "September"
short_month = month[0:3]
print(short_month)
```

```{verify}
:id: month-ran
:label: Python took a slice of three characters
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed month
if globals().get("short_month") == "Sep":
    print("The cell ran. The slice from index 0 to index 3 of the string September is Sep.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("short_month") == "Sep"
```

An index and a slice do not change the string. Each one gives back a
new string, and the name `month` still refers to `"September"`.

## Your task

The action below adds a cell that makes a short form of the name of a
day. The action does not run the cell.

```{cell-insert}
:id: insert-day
:title: Add a cell with a slice for me to change
:path: {{ notebook }}
:tags: [day]
:run: false
weekday = "Wednesday"
short_day = weekday[0:2]
print(short_day)
```

When this cell runs, the output is `We`. Change one number in the
second line so that the short form has three letters. Then run the
cell. The output must be:

```
Wed
```

```{hint}
:title: Hint: which number do I change?
The slice `weekday[0:2]` starts at index 0 and stops before index 2,
so it holds two characters. The first number is correct. Change the
second number, which says where the slice stops.
```

```{hint}
:title: Hint: what does the line look like?
A slice of three characters from the start stops before index 3:
`short_day = weekday[0:3]`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: day-not-started
:check: day-shortened
:expect: The cell has not run yet
```

````{attempt}
:id: day-unchanged
:check: day-shortened
:expect: which has only two characters

```{cell-insert}
:path: {{ notebook }}
:run: true
weekday = "Wednesday"
short_day = weekday[0:2]
print(short_day)
```
````

````{attempt}
:id: day-too-long
:check: day-shortened
:expect: which has four characters

```{cell-insert}
:path: {{ notebook }}
:run: true
weekday = "Wednesday"
short_day = weekday[0:4]
print(short_day)
```
````

````{attempt}
:id: day-wrong-start
:check: day-shortened
:expect: The slice must start at index 0

```{cell-insert}
:path: {{ notebook }}
:run: true
weekday = "Wednesday"
short_day = weekday[1:3]
print(short_day)
```
````

````{attempt}
:id: day-one-index
:check: day-shortened
:expect: but it must refer to the string Wed

```{cell-insert}
:path: {{ notebook }}
:run: true
weekday = "Wednesday"
short_day = weekday[3]
print(short_day)
```
````

````{hint}
:title: Show me a solution
:unlock: "day-shortened" in failed_checks or "day-shortened" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-day-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [day-solution]
:run: true
weekday = "Wednesday"
short_day = weekday[0:3]
print(short_day)
```
````

```{verify}
:id: day-shortened
:label: The short form of the day has three letters
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed day; cell-executed day-solution
if "short_day" not in globals():
    print("The cell has not run yet. Change the second number between the square brackets in the new cell. Then hold Shift and press Enter to run the cell.")
elif short_day == "Wed":
    print("Correct. The slice from index 0 to index 3 holds three characters, and the name short_day refers to the string Wed.")
elif short_day == "We":
    print("The name short_day refers to the string We, which has only two characters. The slice stops before the second index. Change the second number between the square brackets to 3. Then run the cell again.")
elif short_day == "Wedn":
    print("The name short_day refers to the string Wedn, which has four characters. The slice stops before the second index, so the second number must be 3. Then run the cell again.")
elif short_day == "ed":
    print("The name short_day refers to the string ed. The slice must start at index 0, because Python counts from 0. Write weekday[0:3] in the second line. Then run the cell again.")
else:
    print(f"The name short_day refers to [{short_day}] but it must refer to the string Wed. The square brackets show where the value begins and ends. The second line must be short_day = weekday[0:3]. Then run the cell again.")
"short_day" in globals() and short_day == "Wed"
```
