---
title: Code that Python cannot read
requires: [quiz:slices-predict-output, verify:slices-fixed]
---

# Code that Python cannot read

Every language has rules for how its sentences are written. In
English, "The cat on sat the mat" breaks the rules, and a reader has
to stop and think about what it means.

Python has rules of the same kind. They are called its **syntax**: the
rules for how code is written. The syntax says where quotes, commas
and parentheses go, and in which order the parts of a line appear.

Python follows its syntax exactly. When a line breaks the rules,
Python cannot read the line, and it shows a `SyntaxError`.

A `SyntaxError` means that the code is not written in the way that
Python requires. Most often, one symbol is missing: a comma, a quote
or a parenthesis.

## Python reads the whole cell first

A `SyntaxError` is different from the other errors in one important
way.

Before Python runs a cell, it reads every line of the cell, to check
that it can understand all of them. Only then does it start to perform
the first line. A `SyntaxError` is found during that first reading. So
when a cell has a `SyntaxError`, Python does not run any line of the
cell.

The other errors that you have seen, `NameError`, `TypeError` and
`IndexError`, happen later, while the cell runs. Python finds them
only when it reaches the line.

Look at this cell. Do not run it yet. The third line breaks a rule of
the syntax: `print()` needs a comma between two values, and the comma
is missing.

```python
print("The cell has started.")
slices = 8
print("Slices:" slices)
slices_left = slices - 3
print("Slices left:", slices_left)
```

```{quiz}
:id: slices-predict-output
:title: Predict the output
question: "The mistake is in the third line. What does the notebook show under this cell when it runs?"
options:
  - { text: "The text `The cell has started.` and then an error message", explanation: "This is what happens with a `NameError` or a `TypeError`, which Python finds when it reaches the line. A `SyntaxError` is found before any line runs, so the first line does not run." }
  - { text: "Only an error message", correct: true }
  - { text: "The output of every line except the third line", explanation: "Python does not continue after an error. With a `SyntaxError`, it does not start at all." }
explanation: "Python reads the whole cell before it runs the first line. It finds the `SyntaxError` during that reading, so no line of the cell runs, and the notebook shows only the error message."
```

## A cell with a mistake

The action below adds the cell to your notebook, and does not run it.

```{cell-insert}
:id: insert-slices
:title: Add a cell that has a mistake in it, without running it
:path: {{ notebook }}
:tags: [slices]
:run: false
print("The cell has started.")
slices = 8
print("Slices:" slices)
slices_left = slices - 3
print("Slices left:", slices_left)
```

Run the cell: click inside it, hold `Shift` and press `Enter`. Compare
the output with your prediction. The text `The cell has started.` is
not there.

## Read the message

The error message for a `SyntaxError` is shorter than the others, and
it looks a little different. It has the same three parts.

- **The type and the message** are in the last line:

  ```
  SyntaxError: invalid syntax. Perhaps you forgot a comma?
  ```

  "Invalid" means not allowed. Python also makes a suggestion here:
  perhaps a comma is missing.

- **The line** is in the first line of the error message, after the
  word `line`. Here it is line 3. Under it, the message shows the line
  of code itself. There is no arrow `---->` this time.

- Under the line of code, the symbol `^` points up at the place where
  Python could not continue to read. The mistake is at that place, or
  a little before or after it.

## Your task

Correct line 3: add the comma that is missing between the two values.
Then run the cell again. The output must have three lines, and the
last line is `Slices left: 5`.

```{hint}
:title: Hint: where does the comma go?
Look at the last line of the cell:
`print("Slices left:", slices_left)`. It has a comma after the closing
quote of the string. Line 3 needs a comma in the same place.
```

```{hint}
:title: Hint: how to correct it
Change the third line to `print("Slices:", slices)`. Then run the cell
again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run the cell, or after you have clicked `Check`.

```{attempt}
:id: slices-not-fixed
:check: slices-fixed
:expect: The name slices_left does not exist yet
```

````{attempt}
:id: slices-wrong-value
:check: slices-fixed
:expect: but it must refer to 5

```{cell-insert}
:path: {{ notebook }}
:run: true
print("The cell has started.")
slices = 8
print("Slices:", slices)
slices_left = slices - 2
print("Slices left:", slices_left)
```
````

````{hint}
:title: Show me a solution
:unlock: "slices-fixed" in failed_checks or "slices-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-slices-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [slices-solution]
:run: true
print("The cell has started.")
slices = 8
print("Slices:", slices)
slices_left = slices - 3
print("Slices left:", slices_left)
```
````

```{verify}
:id: slices-fixed
:label: The cell runs without an error and shows the slices that are left
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed slices; cell-executed slices-solution
if "slices_left" not in globals():
    print("The name slices_left does not exist yet. That means no line of the cell has run. When one line breaks the rules of the syntax, Python finds the error before it runs any line. Add a comma after the closing quote in the third line. Then run the cell.")
elif slices_left == 5:
    print("Correct. Python can read every line of the cell now, and the name slices_left refers to 5.")
else:
    print(f"The name slices_left refers to {slices_left} but it must refer to 5. The second line must be slices = 8, and the fourth line must be slices_left = slices - 3. Change only the third line. Then run the cell again.")
"slices_left" in globals() and slices_left == 5
```

## Two more causes of a SyntaxError

You do not need to run anything for this section. It shows the two
other mistakes that cause most `SyntaxError` messages, so that you
know them when you meet them.

**A quote that is missing.** A string needs a quote at its start and
at its end. This line has no quote at the end:

```python
message = "Hello
```

The last line of the error message is:

```
SyntaxError: unterminated string literal (detected at line 1)
```

"Unterminated" means that it has no end. "String literal" means a
string that is written in the code. So the message says: "this string
has no end".

**A parenthesis that is missing.** Every `(` needs a `)`. The first
line of this code has no `)` at the end:

```python
total = (2 + 3
print(total)
```

The last line of the error message is:

```
SyntaxError: '(' was never closed
```

When the parenthesis is missing in the last line of a cell, the
notebook shows a different message, which ends with the words
`incomplete input`. It means the same: the code stops before it is
complete.

```{hint}
:title: Is the mistake always exactly where the symbol ^ points?
No. The symbol `^` shows the part of the line that Python could not
understand, and the mistake is near it. In the cell on this page, the
symbol `^` is under the first quote of the string `"Slices:"`, but
the comma is missing after the string. Read the whole line that
Python shows, and look near the symbol.
```
