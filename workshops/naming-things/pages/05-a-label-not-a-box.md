---
title: A name is a label
requires: [quiz:predict-new-price, verify:labels-ran]
---

# A name is a label

It helps to have a picture in your mind of what a name is. The picture
that matches Python is a **label**: a small piece of paper with a name
written on it, tied to a value.

- An assignment ties the label to a value.

- An assignment with the same name moves the label to another value.

- Two labels can be tied to the same value.

Many people imagine a different picture: a box that has the name
written on it and holds the value inside. Python does not work like a
box, and the difference matters when one name is assigned to another.

Look at this cell. Do not run it yet.

```python
old_price = 40
new_price = old_price
old_price = 50
new_price
```

The second line assigns one name to another name. The third line then
gives `old_price` a new value. The question is what happens to
`new_price`.

```{quiz}
:id: predict-new-price
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "40"
wrong:
  - { text: "50", explanation: "The line `new_price = old_price` does not connect the two names. It ties the label `new_price` to the value 40. When `old_price` moves to 50, `new_price` stays on 40." }
  - { text: "90", explanation: "Python does not add the two values. The last line shows the value that `new_price` refers to." }
  - { text: "old_price", explanation: "The notebook shows a value, not a name. Which value does `new_price` refer to?" }
otherwise: "Follow the labels line by line. Which value is the label `new_price` tied to after the second line? Does the third line move that label?"
explanation: "The second line ties the label `new_price` to the value 40. The third line moves only the label `old_price`. So `new_price` still refers to 40."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: labels-not-run
:check: labels-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-labels
:title: Add a cell that assigns one name to another name, and run it
:path: {{ notebook }}
:tags: [labels]
:run: true
old_price = 40
new_price = old_price
old_price = 50
new_price
```

```{verify}
:id: labels-ran
:label: The name new_price still refers to 40
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed labels
if globals().get("new_price") == 40 and globals().get("old_price") == 50:
    print("The cell ran. The name new_price refers to 40, and the name old_price refers to 50.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("new_price") == 40 and globals().get("old_price") == 50
```

## What happened

Follow the labels, line by line.

1. `old_price = 40` ties the label `old_price` to the value `40`.

2. `new_price = old_price` has a name on the right side. Python finds
   the value that `old_price` refers to, which is `40`. Then it ties
   the label `new_price` to that same value. Now two labels are tied
   to one value.

3. `old_price = 50` moves the label `old_price` to the value `50`.
   Nothing in this line mentions `new_price`, so that label does not
   move.

4. `new_price` still refers to `40`.

An assignment never connects two names to each other. It only ties
the name on the left to a value. The right side is used once, to find
that value, at the moment when the line runs.

With numbers, the box picture would give the same answer here. The
label picture becomes important later in the course, when you work
with values that can change. You do not need to understand that now.
Remember the picture: a name is a label that is tied to a value.
