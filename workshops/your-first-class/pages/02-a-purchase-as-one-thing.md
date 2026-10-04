---
title: A purchase as one thing
requires: [quiz:predict-key, verify:rows-made]
---

# A purchase as one thing

A purchase has four parts: a date, a description, an amount and a
category. For you, the four parts are one thing. This page shows what
goes wrong when a program has no type for that one thing.

## A purchase as a dictionary

In the workshop **Where the money went**, each purchase was a
dictionary. A dictionary holds pairs of a key and a value, and the
four keys were strings:

```python
coat_row = {"date": "2026-01-17", "description": "Winter coat", "amount": Decimal("74.90"), "category": "clothes"}
```

The amount is a `Decimal`, which is an exact number for money. You
make one from a string, `Decimal("74.90")`, after the line
`from decimal import Decimal`.

This works, but it has two problems.

**The first problem is that every dictionary writes the four keys
again.** Nothing says which keys a purchase must have. Look at this
second dictionary. One of its keys has a mistake.

```python
bread_row = {"date": "2026-01-03", "description": "Bread and milk", "ammount": Decimal("6.40"), "category": "food"}
```

The expression `"amount" in bread_row` asks if the dictionary has the
key `"amount"`. Predict what it gives, and type your answer.

```{quiz}
:id: predict-key
:type: text
:title: Predict the output
question: 'What does `print("amount" in bread_row)` show?'
answer: "False"
wrong:
  - { text: "True", explanation: "Read the third key of `bread_row` letter by letter. It is `\"ammount\"`, with the letter `m` two times. That is a different string from `\"amount\"`." }
  - { text: "false", explanation: "The value is right. Python writes it with a capital letter: `False`." }
  - { pattern: ".*[Ee]rror.*", explanation: "The operator `in` does not stop the program. It gives `True` or `False`." }
otherwise: "The operator `in` gives `True` when the dictionary has the key, and `False` when it does not. Read the third key of `bread_row` letter by letter."
explanation: "The third key of `bread_row` is `\"ammount\"`, with the letter `m` two times. So the dictionary has no key `\"amount\"`, and the answer is `False`."
```

Click the action below. It adds a cell that makes the two dictionaries
and tests both, and runs it.

```{attempt}
:id: rows-not-made
:check: rows-made
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-rows
:title: Add a cell that makes two purchases as dictionaries, and run it
:path: {{ notebook }}
:tags: [rows]
:run: true
from decimal import Decimal

coat_row = {"date": "2026-01-17", "description": "Winter coat", "amount": Decimal("74.90"), "category": "clothes"}
bread_row = {"date": "2026-01-03", "description": "Bread and milk", "ammount": Decimal("6.40"), "category": "food"}
print("amount" in coat_row)
print("amount" in bread_row)
```

The output is:

```
True
False
```

```{verify}
:id: rows-made
:label: The cell made the two dictionaries
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rows
if isinstance(globals().get("bread_row"), dict) and isinstance(globals().get("coat_row"), dict):
    print("The cell ran. Python made both dictionaries, and showed no error message for the key with the mistake.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
isinstance(globals().get("bread_row"), dict) and isinstance(globals().get("coat_row"), dict)
```

## What happened

Python made both dictionaries and showed no error message. For
Python, `"ammount"` is a key like any other key.

The mistake stays hidden until some other line reads
`bread_row["amount"]`. That line can be far away, in code that adds
up a total. Python stops there with a `KeyError`, and you must search
for the place where the dictionary was made.

**The second problem is that the code that works on a purchase is
somewhere else.** Think of a function that gives the month of a
purchase:

```python
def month_of(row):
    return row["date"][:7]
```

Nothing connects this function to a purchase. The function accepts any
dictionary, and a reader of the program must search for the functions
that are meant for a purchase.

## A type of your own

Python lets you describe a new type of value. Every value has a
**type**, which is the kind of value that it is: an integer, a
string, a list. You can add a type with the name `Purchase`.

A **class** is a description of a new type of value, written by you.
It says what data each value of that type holds, and what each value
can do.

An **object** is a value made from a class.

Think of a paper form with four empty spaces: date, description,
amount and category. The empty form is like the class. It holds no
purchase. It only says which four things every purchase has. Each
form that someone has completed is like an object. You can complete
as many forms as you like, and every one of them has the same four
spaces.

A class solves both problems:

- The names `date`, `description`, `amount` and `category` are written
  one time, in the class. Code that makes a purchase gives four
  values, and Python stops at once when one of them is missing.

- The functions that work on a purchase are written inside the class.
  They belong to every purchase.

On the next page, you see a class and make an object from it.
