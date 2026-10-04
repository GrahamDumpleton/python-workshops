---
title: One list, two names
requires: [quiz:predict-monday, verify:monday-ran]
---

# One list, two names

The workshop **Naming things** gave you a picture of a name: a name
is a label that is tied to a value. An assignment ties the label on
its left side to a value. Two labels can be tied to the same value.

With numbers, you never needed to think about this picture. With
lists, you need it, because a list is a value that can change.

## The problem

Meera writes a shopping list for Monday. For Tuesday she wants the
same list, with one more item. She writes this cell. Do not run it
yet.

```python
monday = ["bread", "milk"]
tuesday = monday
tuesday.append("rice")
print(len(monday))
```

Remember that `append` adds one item to the end of a list, and that
`len()` gives the number of items of a list. The last line shows the
number of items of the list for Monday.

```{quiz}
:id: predict-monday
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "3"
wrong:
  - { text: "2", explanation: "This is the answer that most people expect, because the cell seems to add the item only to the list for Tuesday. But the line `tuesday = monday` does not make a second list. Run the cell, and then read the explanation under it." }
  - { text: "4", explanation: "The list starts with 2 items, and the cell adds 1 item. No line adds a fourth item." }
  - { text: "three", explanation: "Type the answer as Python shows it: a number written with a digit." }
otherwise: "The last line shows the number of items of the list that `monday` refers to. Type one whole number."
explanation: "The line `tuesday = monday` makes no copy. It ties the label `tuesday` to the same list as the label `monday`. So the item `\"rice\"` is added to the only list that exists, and that list now has 3 items."
```

Run the cell, and compare the output with your prediction. The cell
in your notebook has two more lines at its end, which show the list
under each of its names.

```{attempt}
:id: monday-not-run
:check: monday-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-monday
:title: Add the cell that seems to make a second list, and run it
:path: {{ notebook }}
:tags: [monday]
:run: true
monday = ["bread", "milk"]
tuesday = monday
tuesday.append("rice")
print(len(monday))
print(monday)
print(tuesday)
```

The output is:

```
3
['bread', 'milk', 'rice']
['bread', 'milk', 'rice']
```

```{verify}
:id: monday-ran
:label: The change appears under both names
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed monday
if globals().get("monday") == ["bread", "milk", "rice"] and globals().get("tuesday") is globals().get("monday"):
    print("The cell ran. The names monday and tuesday refer to one list, which now has 3 items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("monday") == ["bread", "milk", "rice"] and globals().get("tuesday") is globals().get("monday")
```

## What happened

Meera wanted two lists. The cell made only one list. Follow the
labels, line by line.

1. `monday = ["bread", "milk"]` makes a list, and ties the label
   `monday` to it.

2. `tuesday = monday` has a name on its right side. Python finds the
   value that `monday` refers to, which is the list. Then it ties the
   label `tuesday` to that same list. Python does not make a second
   list. Now two labels are tied to one list.

3. `tuesday.append("rice")` adds an item to the list that `tuesday`
   refers to. That is the only list that exists.

4. `monday` refers to that same list, so `len(monday)` is `3`.

An assignment never copies a value. It only ties a name to a value.

## An everyday comparison

Think of one shopping list on a piece of paper, on the door of a
refrigerator. Meera calls it "my list". Her brother calls it "the
paper on the door". These are two names for one piece of paper. When
her brother writes "rice" on the paper, Meera's list has "rice" on it
too, because there is only one paper.

To have two lists, somebody must write the items again on a second
piece of paper. A later page shows how Python does that.

## Why you did not see this before

The workshop **Naming things** used numbers. A number can never
change. A line such as `old_price = 50` does not change the number
`40`: it moves a label to another number. So with numbers, two labels
on one value never cause a surprise.

A list can change. `append` does not move a label. It changes the
list itself, and every name that refers to that list shows the
change.
