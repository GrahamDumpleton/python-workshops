---
title: Comparing values
requires: [quiz:predict-less-than, quiz:predict-less-or-equal, verify:bag-ran, quiz:predict-capital, verify:reply-ran]
---

# Comparing values

The symbol `>` is one of six symbols that compare two values. Each of
them is called a **comparison operator**. Each one asks a different
question, and each one gives `True` or `False`.

| Operator | The question it asks | Example | Value |
|----------|----------------------|---------|-------|
| `>` | is the left value greater than the right value? | `7 > 5` | `True` |
| `<` | is the left value less than the right value? | `7 < 5` | `False` |
| `>=` | is the left value greater than the right value, or equal to it? | `5 >= 5` | `True` |
| `<=` | is the left value less than the right value, or equal to it? | `7 <= 5` | `False` |
| `==` | are the two values equal? | `5 == 5` | `True` |
| `!=` | are the two values different? | `5 != 5` | `False` |

Three of these need a short explanation.

- `>=` and `<=` are each typed as two characters, with no space
  between them. Mathematics writes them as ≥ and ≤, which a keyboard
  does not have. The symbol `=` always comes second.

- `==` is two equals signs. It asks whether two values are equal. One
  equals sign, `=`, is an assignment, which is a different thing. A
  later page of this workshop compares the two.

- `!=` asks the opposite question to `==`. You can read it as "is not
  equal to".

## The value at the limit

The difference between `<` and `<=` matters when the two values are
equal. An airline accepts a bag of 23 kilograms or less. A bag of
exactly 23 kilograms is accepted, so the correct question is "less
than or equal to".

Look at this cell. Do not run it yet.

```python
bag_weight = 23
print(bag_weight < 23)
print(bag_weight <= 23)
print(bag_weight == 23)
print(bag_weight != 23)
```

```{quiz}
:id: predict-less-than
:type: text
:title: Predict the first line of the output
question: "What does the line `print(bag_weight < 23)` show?"
answer: "False"
wrong:
  - { text: "True", explanation: "The name `bag_weight` refers to 23. The operator `<` asks whether 23 is less than 23. A number is never less than itself." }
  - { text: "false", explanation: "The answer is right, but Python writes the value with a capital letter: `False`." }
  - { text: "23", explanation: "A comparison gives `True` or `False`, not a number." }
otherwise: "The name `bag_weight` refers to 23. Is 23 less than 23? Python answers with `True` or `False`."
explanation: "23 is not less than 23, because the two values are equal. The result is `False`."
```

```{quiz}
:id: predict-less-or-equal
:type: text
:title: Predict the second line of the output
question: "What does the line `print(bag_weight <= 23)` show?"
answer: "True"
wrong:
  - { text: "False", explanation: "The operator `<=` asks whether the left value is less than the right value or equal to it. 23 is equal to 23." }
  - { text: "true", explanation: "The answer is right, but Python writes the value with a capital letter: `True`." }
  - { text: "23", explanation: "A comparison gives `True` or `False`, not a number." }
otherwise: "The operator `<=` asks whether the left value is less than the right value, or equal to it. Python answers with `True` or `False`."
explanation: "23 is equal to 23, so the answer to \"less than or equal to\" is yes. The result is `True`."
```

Run the cell, and compare the first two lines of the output with your
predictions.

```{attempt}
:id: bag-not-run
:check: bag-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-bag
:title: Add a cell that compares the weight of a bag with 23 in four ways, and run it
:path: {{ notebook }}
:tags: [bag]
:run: true
bag_weight = 23
print(bag_weight < 23)
print(bag_weight <= 23)
print(bag_weight == 23)
print(bag_weight != 23)
```

```{verify}
:id: bag-ran
:label: Python compared the weight of the bag with 23
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed bag
if globals().get("bag_weight") == 23:
    print("The cell ran. It shows False, True, True and False.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("bag_weight") == 23
```

The output has four lines: `False`, `True`, `True` and `False`. The
third line is `True` because the two values are equal. The fourth line
is `False` because they are not different.

Many mistakes in programs happen at a limit such as this one. When you
write a comparison, ask yourself what must happen when the two values
are equal.

## Comparing strings

A **string** is a piece of text in quotes, such as `"hello"`. The
operators `==` and `!=` also compare strings. Two strings are equal
only when every character is the same.

Aiko answers a question with the word `Yes`. A program checks the
answer. Look at this cell, and do not run it yet.

```python
reply = "Yes"
print(reply == "yes")
```

```{quiz}
:id: predict-capital
:type: text
:title: Predict the output
question: What does this cell show when it runs?
answer: "False"
wrong:
  - { text: "True", explanation: "Look at the first letter of each string. `Y` and `y` are different characters to Python." }
  - { text: "false", explanation: "The answer is right, but Python writes the value with a capital letter: `False`." }
  - { text: "Yes", explanation: "`Yes` is the value of `reply`. The cell prints the result of the comparison, which is `True` or `False`." }
otherwise: "Compare the two strings letter by letter. A capital letter and a small letter are different characters to Python."
explanation: "A capital letter and a small letter are different characters. `\"Yes\"` begins with `Y` and `\"yes\"` begins with `y`, so the strings are not equal."
```

```{attempt}
:id: reply-not-run
:check: reply-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-reply
:title: Add a cell that compares two strings, and run it
:path: {{ notebook }}
:tags: [reply]
:run: true
reply = "Yes"
print(reply == "yes")
```

```{verify}
:id: reply-ran
:label: Python compared the two strings
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed reply
if globals().get("reply") == "Yes":
    print("The cell ran. The strings are different, because one begins with a capital letter.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("reply") == "Yes"
```

To Python, `"Yes"` and `"yes"` are different strings, because capital
letters matter. A space also matters: `"yes "` with a space at the end
is not equal to `"yes"`.

In these workshops you compare strings only with `==` and `!=`.
