---
title: Type hints
requires: [quiz:predict-hint, verify:hint-ran]
---

# Type hints

Each field of the dataclass has two parts: a name, and after the
colon a type.

```python
amount: Decimal
```

The part after the colon is a type hint. A **type hint** is a note
in the code that says what type a value should have. The type of
a value is the kind of value that it is: a string, an integer, a
`Decimal`. So `amount: Decimal` says: the attribute `amount` should
be a `Decimal`. And `date: str` says: the attribute `date` should be
a string, because `str` is the name of the type of a string.

A dataclass needs the type hints. The decorator finds the fields by
them: a line with a name, a colon and a type is a field.

There is one fact about type hints that surprises many people:
Python does not check them. A type hint is a note for the person who
reads the code. Python reads the note, keeps it, and does nothing
more with it.

Think of a paper form with a box that has the label "Age in years".
The label says what to write in the box. But the paper cannot stop a
person who writes a word in the box.

Look at this code. The third value should be a `Decimal`, but it is
the string `"fifty-nine"`.

```python
odd_shoes = Purchase("2026-03-09", "Running shoes", "fifty-nine", "clothes")
print(odd_shoes.amount)
```

```{quiz}
:id: predict-hint
:title: Predict what Python does
question: "The field is `amount: Decimal`, and the code gives a string for the amount. What happens when this code runs?"
options:
  - { text: "Python stops with an error message, because `\"fifty-nine\"` is not a `Decimal`", explanation: "That would be useful, but Python does not do it. Python does not check a type hint when the program runs." }
  - { text: "Python turns the string into a `Decimal`", explanation: "Python never changes a value because of a type hint. The words `fifty-nine` also cannot become a number." }
  - { text: "The code runs, and it shows `fifty-nine`", correct: true }
explanation: "Python does not check type hints. The object is made, and its attribute `amount` refers to the string `\"fifty-nine\"`. The type hint only says what the value should be."
```

Run the code, and compare the output with your prediction.

```{attempt}
:id: hint-not-run
:check: hint-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-hint
:title: Add the cell that gives a string for the amount, and run it
:path: {{ notebook }}
:tags: [hint]
:run: true
odd_shoes = Purchase("2026-03-09", "Running shoes", "fifty-nine", "clothes")
print(odd_shoes)
print(odd_shoes.amount)
```

The output is:

```
Purchase(date='2026-03-09', description='Running shoes', amount='fifty-nine', category='clothes')
fifty-nine
```

```{verify}
:id: hint-ran
:label: The cell made a purchase whose amount is a string
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed hint
if getattr(globals().get("odd_shoes"), "amount", None) == "fifty-nine":
    print("The cell ran. Python made the object, and it did not check the type hint.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
getattr(globals().get("odd_shoes"), "amount", None) == "fifty-nine"
```

Python made the object and showed no error message. Look at the
first line of the output: `amount='fifty-nine'` has quotes. Your
method `__repr__` used `!r` for this reason, and the method that the
decorator writes does the same. The quotes show you that the amount
is a string, and not a number. An object that explains itself helps
you to find a mistake such as this one.

The mistake causes an error only later, when the program tries to
add this amount to a number. So you must still give each field a
value of the correct type.

## Why people write type hints

If Python does not check type hints, why do people write them? There
are two reasons.

- A type hint tells the reader what a value is. A person who reads
  `amount: Decimal` knows at once that the amount is an exact
  number, and not a string or a float.

- There are tools that read the type hints of a program and warn
  about mistakes before the program runs. Many editors for code do
  this. These workshops do not use such a tool, but you now know
  what it reads.

You can write a type hint in other places, for example for the
parameters of a function. These workshops write type hints only for
the fields of a dataclass.
