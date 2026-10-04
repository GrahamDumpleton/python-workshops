---
title: The type often says enough
requires: [quiz:type-index, quiz:type-no-output, quiz:type-name]
---

# The type often says enough

You have now met five types of error. The message part of an error
message is in English, and it sometimes uses difficult words, such as
"concatenate" or "unterminated". You do not always need those words.

The type of the error is one word, and it is always the same word for
the same kind of problem. When you know what each type means, the type
and the line are often enough to find the mistake.

## The five types

| Type of the error | What it means | What to look at |
|-------------------|---------------|-----------------|
| `NameError` | a name has no value | the spelling of the name, and quotes that are missing around text |
| `TypeError` | a value has the wrong type for what the code does with it | a string and a number that are used together |
| `IndexError` | an index is outside the string | the number between the square brackets |
| `SyntaxError` | Python cannot read the code | a comma, a quote or a parenthesis that is missing |
| `IndentationError` | the spaces at the start of a line are wrong | spaces before the first word of the line |

There is one more difference to remember.

- With a `SyntaxError` or an `IndentationError`, no line of the cell
  runs. Python finds the error when it reads the cell.

- With a `NameError`, a `TypeError` or an `IndexError`, the lines
  before the error run. Python finds the error when it reaches the
  line.

Python has more types of error than these five. You meet others later
in the course. You read all of them in the same way: the last line
first, for the type and the message, and then the line that Python
marks.

## Three questions

No cell runs for these questions. Each question gives you only a part
of an error message.

```{quiz}
:id: type-index
:title: Only the type
question: "A cell stops with an error. You read only the type: `IndexError`. What do you look at first in the line that Python marks?"
options:
  - { text: "The spelling of each name", explanation: "A name with a spelling mistake gives a `NameError`. An `IndexError` is about an index." }
  - { text: "The number between the square brackets", correct: true }
  - { text: "The spaces at the start of the line", explanation: "Spaces at the start of a line give an `IndentationError`. An `IndexError` is about an index." }
explanation: "An `IndexError` means that an index is outside the string. The index is the number between the square brackets, so you look there first."
```

```{quiz}
:id: type-no-output
:title: No output at all
question: "The first line of a cell is `print(\"Start\")`. You run the cell. The notebook shows an error message, but it does not show the text `Start`. Which type of error is it?"
options:
  - { text: "`NameError`", explanation: "Python finds a `NameError` when it reaches the line. The first line of the cell would run before that, and show its text." }
  - { text: "`SyntaxError`", correct: true }
  - { text: "`TypeError`", explanation: "Python finds a `TypeError` when it reaches the line. The first line of the cell would run before that, and show its text." }
explanation: "Python finds a `SyntaxError` when it reads the cell, before any line runs. So the first line did not run, and its text is not in the output."
```

```{quiz}
:id: type-name
:title: The last line
question: "The last line of an error message is `NameError: name 'Total' is not defined`. The first line of the cell is `total = 40`. What is the most likely mistake?"
options:
  - { text: "A line uses `Total`, with a capital letter, but the name is `total`", correct: true }
  - { text: "The number `40` is too large", explanation: "A number that is too large does not give a `NameError`. A `NameError` is about a name that has no value." }
  - { text: "A comma is missing", explanation: "A comma that is missing gives a `SyntaxError`. A `NameError` is about a name that has no value." }
explanation: "Capital letters and small letters are different in a name. `Total` and `total` are two different names, and only `total` has a value."
```
