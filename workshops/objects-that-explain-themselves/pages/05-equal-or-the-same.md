---
title: Equal, or the same
requires: [quiz:predict-equal, verify:two-coats-ran, quiz:predict-same, verify:same-coat-ran]
---

# Equal, or the same

Python has two operators that compare two values. You met both in
the workshop **Two names, one list**.

- `==` asks whether two values are equal.

- `is` asks whether two names refer to the same value: one value
  with two names.

Two lists that hold equal items are equal, so `[1, 2] == [1, 2]` is
`True`. Python knows how to compare two lists: it compares the
items, one by one.

Now think about two objects of your class `Purchase`. Mariam bought
one winter coat. Suppose that her program reads that purchase two
times, and makes two objects with the same four values:

```python
coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
same_coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
print(coat == same_coat)
```

Predict the output before you run the code.

```{quiz}
:id: predict-equal
:type: text
:title: Predict the result
question: "What does `print(coat == same_coat)` show?"
answer: "False"
wrong:
  - { text: "True", explanation: "That is what most people expect, because the four values are the same. But Python does not know that the four attributes decide whether two purchases are equal. Nobody has told it. The text under this question says what Python does." }
  - { pattern: "false|FALSE", explanation: "The answer is correct. Python writes this value with a capital letter: `False`." }
  - { pattern: "true|TRUE", explanation: "Python writes this value with a capital letter. It is also not the value that Python shows here: Python does not know how to compare two purchases." }
otherwise: "The operator `==` gives a boolean, so the answer is `True` or `False`."
explanation: "The answer is `False`. The two objects hold the same four values, but Python does not look at the attributes. The class has not said how two purchases are compared."
```

Run the code, and compare the output with your prediction.

```{attempt}
:id: two-coats-not-run
:check: two-coats-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-two-coats
:title: Add a cell that compares two purchases with the same values, and run it
:path: {{ notebook }}
:tags: [two-coats]
:run: true
coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
same_coat = Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes")
print(coat == same_coat)
```

```{verify}
:id: two-coats-ran
:label: The cell compared two purchases with the same values
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed two-coats
if getattr(globals().get("coat"), "description", None) == "Winter coat" and getattr(globals().get("same_coat"), "description", None) == "Winter coat":
    print("The cell ran. The names coat and same_coat refer to two objects that hold the same four values.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
getattr(globals().get("coat"), "description", None) == "Winter coat" and getattr(globals().get("same_coat"), "description", None) == "Winter coat"
```

The output is:

```
False
```

## Why the answer is False

A class that you write starts with no rule for `==`. Python cannot
guess the rule. For one class, two objects are equal when all their
attributes are equal. For another class, only one attribute is
important, such as the number of a ticket.

So, until the class gives a rule, Python uses the only rule that is
always safe: an object is equal only to itself. With this rule, `==`
asks the same question as `is`.

Think of two paper forms that two people filled in with the same
answers. They are two sheets of paper. If you ask "is this the same
sheet?", the answer is no. If you ask "do the two sheets say the
same thing?", the answer is yes. Python now answers only the first
question.

The next cell shows this. It gives a second name, `also_coat`, to
the object that `coat` refers to. The line `also_coat = coat` does
not make a new object.

```python
also_coat = coat
print(coat is same_coat)
print(coat is also_coat)
print(coat == also_coat)
```

Predict the complete output of this cell. Type the three lines that
you think the notebook shows. The box has room for three lines, so
click `Submit` when you have finished.

```{quiz}
:id: predict-same
:type: text
:lines: 3
:title: Predict the output
question: "What does the notebook show under this cell when it runs?"
answer: "False\nTrue\nTrue"
wrong:
  - { text: "True\nTrue\nTrue", explanation: "`coat` and `same_coat` refer to two objects. Each call `Purchase(...)` makes a new object, so `coat is same_coat` is `False`." }
  - { text: "False\nFalse\nFalse", explanation: "The line `also_coat = coat` does not make a new object. It gives a second name to one object. So `coat is also_coat` is `True`, and an object is always equal to itself." }
  - { text: "False\nTrue\nFalse", explanation: "The first two lines are correct. For the third line: `coat` and `also_coat` refer to one object, and an object is always equal to itself." }
  - { text: "False\nFalse\nTrue", explanation: "The line `also_coat = coat` gives a second name to one object. So `coat is also_coat` is `True`." }
otherwise: "Type three lines, and each line is `True` or `False`. `coat` and `same_coat` are two objects. `coat` and `also_coat` are two names for one object."
explanation: "`coat` and `same_coat` are two objects, so `coat is same_coat` is `False`. `coat` and `also_coat` are two names for one object, so `coat is also_coat` is `True`. An object is equal to itself, so `coat == also_coat` is `True`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: same-coat-not-run
:check: same-coat-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-same-coat
:title: Add the cell that uses is, and run it
:path: {{ notebook }}
:tags: [same-coat]
:run: true
also_coat = coat
print(coat is same_coat)
print(coat is also_coat)
print(coat == also_coat)
```

```{verify}
:id: same-coat-ran
:label: The cell asked whether two names refer to one object
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed same-coat
if "coat" in globals() and "also_coat" in globals() and globals()["also_coat"] is globals()["coat"]:
    print("The cell ran. The names coat and also_coat refer to one object.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
"coat" in globals() and "also_coat" in globals() and globals()["also_coat"] is globals()["coat"]
```

The output is:

```
False
True
True
```

For a program that works with spending, this rule is a problem.
Suppose that the program must find a purchase that was typed two
times. It needs `coat == same_coat` to be `True`, because the two
objects describe one purchase.

The class must say when two purchases are equal. The next page shows
how.
