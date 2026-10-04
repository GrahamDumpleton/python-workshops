---
title: One equals sign or two
requires: [quiz:predict-pages-compare, quiz:predict-pages-value, verify:pages-ran, quiz:which-equals]
---

# One equals sign or two

Python uses the equals sign in two ways, and people often confuse them.
Almost every person who learns Python types one of them where the
other is needed.

| Code | Name | What it does |
|------|------|--------------|
| `pages_read = 200` | assignment | an instruction: make the name `pages_read` refer to `200` |
| `pages_read == 200` | comparison | a question: is the value of `pages_read` equal to `200`? |

An assignment changes what a name refers to, and it has no value to
show. A comparison changes nothing. It only gives `True` or `False`.

A way to remember the difference: one sign gives a value, and two
signs compare two values.

## Predict

Dawit reads a book that has 200 pages. Look at this cell, and do not
run it yet.

```python
pages_read = 120
print(pages_read == 200)
print(pages_read)
```

The output has two lines. Predict each of them.

```{quiz}
:id: predict-pages-compare
:type: text
:title: Predict the first line of the output
question: "What does the line `print(pages_read == 200)` show?"
answer: "False"
wrong:
  - { text: "True", explanation: "The name `pages_read` refers to 120. The operator `==` asks whether 120 is equal to 200." }
  - { text: "200", explanation: "The operator `==` does not give the name a value. It asks a question, and the result is `True` or `False`." }
  - { text: "120", explanation: "The line prints the result of the comparison, which is `True` or `False`." }
  - { text: "false", explanation: "The answer is right, but Python writes the value with a capital letter: `False`." }
otherwise: "The operator `==` asks whether the two values are equal. Python answers with `True` or `False`."
explanation: "The name `pages_read` refers to 120, and 120 is not equal to 200, so the comparison gives `False`."
```

```{quiz}
:id: predict-pages-value
:type: text
:title: Predict the second line of the output
question: "What does the line `print(pages_read)` show?"
answer: "120"
wrong:
  - { text: "200", explanation: "The second line of the cell has two equals signs, so it is a comparison. A comparison does not change the value of a name." }
  - { text: "False", explanation: "`False` is the result of the comparison in the second line. The third line prints the value of the name `pages_read`." }
otherwise: "The second line of the cell is a comparison, not an assignment. Which value does the name `pages_read` still refer to?"
explanation: "A comparison changes nothing. The name `pages_read` still refers to 120, the value that the assignment in the first line gave it."
```

Run the cell, and compare the output with your predictions.

```{attempt}
:id: pages-not-run
:check: pages-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-pages
:title: Add a cell that has an assignment and a comparison, and run it
:path: {{ notebook }}
:tags: [pages]
:run: true
pages_read = 120
print(pages_read == 200)
print(pages_read)
```

```{verify}
:id: pages-ran
:label: The comparison did not change the value of the name
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed pages
if globals().get("pages_read") == 120:
    print("The cell ran. The name pages_read still refers to 120 after the comparison.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("pages_read") == 120
```

## One equals sign in a condition

A condition is a question, so it needs `==`. This `if` line has only
one equals sign, which is a mistake:

```python
if pages_read = 200:
    print("You have finished the book.")
```

Python cannot perform a cell that holds this line. It stops before it
performs any line of the cell, and the last line of the error message
is:

```
SyntaxError: invalid syntax. Maybe you meant '==' or ':=' instead of '='?
```

A `SyntaxError` means that Python cannot read the code, because it
does not follow the rules of the language. Here the message also
suggests the correction: `==`. The other symbol that it names, `:=`,
is not used in these workshops.

When you see this message, look for a condition that has one equals
sign, and add the second one.

```{quiz}
:id: which-equals
:title: Which line is correct?
question: "A program must print a message only when the name `tickets` refers to the value `0`. Which line begins that decision correctly?"
options:
  - { text: "`if tickets = 0:`", explanation: "One equals sign is an assignment. A condition asks a question, so it needs two equals signs. Python stops with a `SyntaxError` at this line." }
  - { text: "`if tickets == 0:`", correct: true }
  - { text: "`tickets = 0`", explanation: "This line is an assignment. It makes the name `tickets` refer to 0, and it asks no question." }
explanation: "A condition is a question, and the operator that asks whether two values are equal is `==`. The line also needs the word `if` at the start and the symbol `:` at the end."
```
