---
title: The parts of an error message
requires: [quiz:place-which-line, verify:place-fixed]
---

# The parts of an error message

An error message has many lines, and all of them are in English. You
do not need to read every word. An error message always has the same
parts, in the same places. When you know where each part is, you can
find the information that you need quickly.

Three parts matter:

1. **The type of the error.** This is one word, such as `NameError`.
   It says what kind of problem Python found.

2. **The line.** This is the line of your cell where Python stopped.

3. **The message.** This is a short sentence that gives the details.

Programmers call an error message of this kind a **traceback**. The
word means that the message helps you to trace the error back to the
line where it happened. You will see the word at the top of the
message.

## A cell with a mistake

The action below adds a cell that has a mistake in it. The cell is
meant to join the name of a city and the name of a country. The action
does not run the cell.

```{cell-insert}
:id: insert-place
:title: Add a cell that has a mistake in it, without running it
:path: {{ notebook }}
:tags: [place]
:run: false
city = "Nairobi"
country = Kenya
place = city + ", " + country
print(place)
```

Run the cell: click inside it, hold `Shift` and press `Enter`. Keep
the error message on the screen while you read the next section.

## Read the message from the last line

Start at the bottom of the error message. The last line is this:

```
NameError: name 'Kenya' is not defined
```

The last line holds two of the three parts.

- The word before the colon `:` is the type of the error. Here it is
  `NameError`.

- The text after the colon is the message. Here it is
  `name 'Kenya' is not defined`.

Now look above the last line. The error message shows the lines of
your cell, with a number before each line. An arrow points at one of
them:

```
----> 2 country = Kenya
```

The arrow `---->` marks the line where Python stopped. The number
after the arrow is the number of the line in the cell. The same number
is higher in the message too, after the word `line`.

The first line of the error message shows the type of the error again,
and the words `Traceback (most recent call last)`. You can ignore
those words for now.

So the order to read is: the last line first, for the type and the
message, and then the arrow, for the line. In the long programs that
you write later in this course, an error message can have many more
lines. The last line still holds the type and the message, so this
order always works.

```{quiz}
:id: place-which-line
:type: text
:title: Find the line
question: "Look at the error message under your cell. At which line of the cell did Python stop? Type the number."
answer: "2"
wrong:
  - { text: "1", explanation: "The arrow does not point at line 1. Python performed line 1 without a problem. Look for the arrow `---->` and read the number after it." }
  - { text: "3", explanation: "Line 3 uses the name `country`, but Python never reached line 3. Look for the arrow `---->` and read the number after it." }
  - { text: "4", explanation: "Python never reached line 4. Look for the arrow `---->` and read the number after it." }
otherwise: "Type one number only. It is the number after the arrow `---->` in the error message."
explanation: "The arrow points at line 2, `country = Kenya`. Python stopped there."
```

## Why Python stopped

The type of the error is `NameError`, so Python found a name that has
no value. The message says that the name is `Kenya`.

But `Kenya` was not meant to be a name. It was meant to be text. Text
in Python is a string, and a string is written between quotes. Without
the quotes, Python reads the word `Kenya` as a name, and looks for its
value. No assignment has created that name, so Python stops.

This is a different mistake from the one on the last page, where a
name had a spelling mistake. The type of the error is the same,
because the problem for Python is the same: a name that has no value.

## Your task

Correct the second line of the cell, so that `Kenya` is a string. Then
run the cell again. The output must be `Nairobi, Kenya`.

```{hint}
:title: Hint: what do I change?
Look at the first line of the cell: `city = "Nairobi"`. The text
`Nairobi` has a quote `"` before it and a quote `"` after it. The
second line needs the same.
```

```{hint}
:title: Hint: how to correct it
Change the second line to `country = "Kenya"`. Then run the cell
again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run the cell, or after you have clicked `Check`.

```{attempt}
:id: place-not-fixed
:check: place-fixed
:expect: The name place does not exist yet
```

````{attempt}
:id: place-small-letter
:check: place-fixed
:expect: but it must refer to the text Nairobi, Kenya

```{cell-insert}
:path: {{ notebook }}
:run: true
city = "Nairobi"
country = "kenya"
place = city + ", " + country
print(place)
```
````

````{hint}
:title: Show me a solution
:unlock: "place-fixed" in failed_checks or "place-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-place-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [place-solution]
:run: true
city = "Nairobi"
country = "Kenya"
place = city + ", " + country
print(place)
```
````

```{verify}
:id: place-fixed
:label: The cell runs without an error and shows Nairobi, Kenya
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed place; cell-executed place-solution
if "place" not in globals():
    print("The name place does not exist yet. That means Python has not performed the third line of the cell without an error. Put quotes around the word Kenya in the second line. Then run the cell.")
elif place == "Nairobi, Kenya":
    print("Correct. The cell runs without an error, and the name place refers to the text Nairobi, Kenya.")
else:
    print(f"The name place refers to the text {place} but it must refer to the text Nairobi, Kenya. Capital letters and small letters are different. The second line must give the name country the text Kenya, with a capital K and with quotes around it. Do not change the other lines. Then run the cell again.")
"place" in globals() and place == "Nairobi, Kenya"
```
