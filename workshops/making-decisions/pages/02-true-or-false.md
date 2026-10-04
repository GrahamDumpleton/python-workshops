---
title: True or false
requires: [quiz:predict-is-hot, verify:is-hot-ran, quiz:what-is-a-boolean]
---

# True or false

A program often has to choose what to do. A ticket machine asks for
less money when the traveller is a child. A shop adds a delivery cost
only when the order is small. A program that always performs the same
lines cannot do these things.

Before a program can choose, it must ask a question. The questions
that a program asks have only two possible answers: yes or no. "Is the
traveller younger than 12?" "Is the order smaller than 50?"

You ask such questions every day. Before you go outside you ask "Is it
raining?". The answer is yes or no, and the answer decides whether you
take an umbrella.

## Asking Python a question

In Python, you ask a question of this kind with a **comparison**: an
expression that compares two values. This comparison asks whether the
value of `temperature_today` is greater than `25`:

```python
temperature_today > 25
```

The symbol `>` means "is greater than". You may know it from
mathematics.

A comparison is an expression, so Python calculates it, and the result
is a value. Python does not answer "yes" or "no". It answers with one
of two special values: `True` for yes, and `False` for no.

Look at this cell. Do not run it yet.

```python
temperature_today = 31
is_hot = temperature_today > 25
print(is_hot)
```

The first line is an assignment: it makes the name `temperature_today`
refer to the value `31`. The second line is also an assignment. Python
calculates the comparison on the right side first, and then gives the
name `is_hot` to the result. The third line shows that result.

```{quiz}
:id: predict-is-hot
:type: text
:title: Predict the output
question: What does this cell show when it runs? Type the output exactly as Python shows it.
answer: "True"
wrong:
  - { text: "true", explanation: "The answer is right, but Python writes the value with a capital letter: `True`." }
  - { text: "TRUE", explanation: "The answer is right, but Python writes the value with only the first letter as a capital: `True`." }
  - { text: "yes", explanation: "The answer to the question is yes, but Python does not show the word yes. It shows one of the two values `True` and `False`." }
  - { text: "Yes", explanation: "The answer to the question is yes, but Python does not show the word yes. It shows one of the two values `True` and `False`." }
  - { text: "False", explanation: "The name `temperature_today` refers to 31, and 31 is greater than 25, so the answer to the question is yes." }
  - { text: "31", explanation: "`31` is the value of `temperature_today`. The cell prints `is_hot`, which refers to the result of the comparison." }
  - { text: "is_hot", explanation: "`print()` shows the value that the name refers to, not the name." }
otherwise: "The comparison asks whether 31 is greater than 25. Python answers with `True` or with `False`."
explanation: "31 is greater than 25, so the result of the comparison is `True`. The name `is_hot` refers to that value, and `print()` shows it."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: is-hot-not-run
:check: is-hot-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-is-hot
:title: Add a cell that asks whether the temperature is greater than 25, and run it
:path: {{ notebook }}
:tags: [is-hot]
:run: true
temperature_today = 31
is_hot = temperature_today > 25
print(is_hot)
```

```{verify}
:id: is-hot-ran
:label: Python answered the question with True
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed is-hot
if globals().get("is_hot") is True:
    print("The cell ran. The name is_hot refers to the value True.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("is_hot") is True
```

## A new type of value

You already know three types of value: integers such as `31`, floats
such as `2.5`, and strings such as `"hello"`. The values `True` and
`False` belong to a fourth type. A value of this type is called a
**boolean**. The type has only these two values.

Two details are important when you write a boolean:

- `True` and `False` begin with a capital letter. Python does not know
  `true` or `false`.

- They have no quotes. `"True"` in quotes is a string, which is text.
  `True` without quotes is a boolean.

A boolean is a value like any other value, so a name can refer to it,
as `is_hot` does in the cell above.

```{quiz}
:id: what-is-a-boolean
:title: The result of a comparison
question: "The name `price` refers to `40`. What is the value of the comparison `price > 100`?"
options:
  - { text: "`40`", explanation: "`40` is the value of `price`. The comparison asks a question about that value, and the result is the answer to the question." }
  - { text: "`True`", explanation: "40 is less than 100, so the answer to the question \"is `price` greater than 100?\" is no." }
  - { text: "`False`", correct: true }
explanation: "A comparison always gives a boolean. 40 is not greater than 100, so the value is `False`."
```
