---
title: An index past the end
requires: [quiz:letter-which-line, verify:letter-fixed]
---

# An index past the end

Each character of a string has a position, which is called its
**index**. You write the index between square brackets after the
string: `word[0]`. Python starts to count at 0, so the first character
has the index 0.

A string has a fixed number of characters. If you ask for an index
that the string does not have, Python cannot give you a character. It
stops, and it shows an `IndexError`.

An `IndexError` means that an index is outside the string.

Imagine a street with six houses, which have the numbers 0 to 5. A
letter that is addressed to house number 6 cannot be delivered,
because that house does not exist.

## Why this mistake is common

The string `"Python"` has six characters. The function `len()` gives
that number: `len("Python")` is `6`. But the counting starts at 0, so
the six characters have the indexes 0, 1, 2, 3, 4 and 5.

| Character | `P` | `y` | `t` | `h` | `o` | `n` |
|-----------|-----|-----|-----|-----|-----|-----|
| Index     | 0   | 1   | 2   | 3   | 4   | 5   |

The index of the last character is always one less than the number of
characters. Many programmers forget this, and use the number of
characters as the index.

## Predict the line

Look at this cell. Do not run it yet. It is meant to show the last
letter of the word.

```python
word = "Python"
last_letter = word[6]
print("The last letter is", last_letter)
```

```{quiz}
:id: letter-which-line
:type: text
:title: Predict the line
question: "At which line of the cell does Python stop with an `IndexError`? Type the number."
answer: "2"
wrong:
  - { text: "1", explanation: "Line 1 is an assignment that gives the name `word` to a string. Nothing is wrong with it." }
  - { text: "3", explanation: "Line 3 only shows a value. Python stops before it reaches line 3. Which line uses an index?" }
  - { text: "6", explanation: "`6` is the index that the cell uses, not the number of a line. The cell has three lines. Which line uses the index?" }
otherwise: "Type one number only. Which line has square brackets with an index between them?"
explanation: "Line 2 asks for the character at index 6. The string `\"Python\"` has the indexes 0 to 5, so index 6 does not exist."
```

## A cell with a mistake

The action below adds the cell to your notebook, and does not run it.

```{cell-insert}
:id: insert-letter
:title: Add a cell that has a mistake in it, without running it
:path: {{ notebook }}
:tags: [letter]
:run: false
word = "Python"
last_letter = word[6]
print("The last letter is", last_letter)
```

Run the cell: click inside it, hold `Shift` and press `Enter`.

Read the error message. Start at the last line:

```
IndexError: string index out of range
```

- The type of the error is `IndexError`.

- The message is `string index out of range`. "Out of range" means
  outside the numbers that are possible. For this string, the possible
  indexes are 0 to 5.

- The arrow `---->` points at line 2. Compare it with your prediction.

## Your task

Correct the index in line 2, so that the cell shows the last letter of
the word. Then run the cell again. The output must be
`The last letter is n`.

```{hint}
:title: Hint: which index do I use?
Look at the table above. Find the letter `n`, and read the index under
it.
```

```{hint}
:title: Hint: how to correct it
The last letter, `n`, has the index 5. Change the second line to
`last_letter = word[5]`. Then run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run the cell, or after you have clicked `Check`.

```{attempt}
:id: letter-not-fixed
:check: letter-fixed
:expect: The name last_letter does not exist yet
```

````{attempt}
:id: letter-wrong-index
:check: letter-fixed
:expect: The name last_letter refers to the letter o

```{cell-insert}
:path: {{ notebook }}
:run: true
word = "Python"
last_letter = word[4]
print("The last letter is", last_letter)
```
````

````{hint}
:title: Show me a solution
:unlock: "letter-fixed" in failed_checks or "letter-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-letter-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [letter-solution]
:run: true
word = "Python"
last_letter = word[5]
print("The last letter is", last_letter)
```
````

```{verify}
:id: letter-fixed
:label: The cell runs without an error and shows the last letter
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed letter; cell-executed letter-solution
if "last_letter" not in globals():
    print("The name last_letter does not exist yet. That means Python has not performed the second line of the cell without an error. The word has 6 letters, and their indexes are 0 to 5. Change the index in the second line to the index of the last letter. Then run the cell.")
elif last_letter == "n":
    print("Correct. The cell runs without an error, and the name last_letter refers to the letter n.")
else:
    print(f"The name last_letter refers to the letter {last_letter} but the last letter of the word Python is n. Counting starts at 0, so the index of the last of 6 letters is 5. Check also that the first line is still word = \"Python\". Then run the cell again.")
"last_letter" in globals() and last_letter == "n"
```
