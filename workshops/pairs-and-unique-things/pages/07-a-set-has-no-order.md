---
title: A set has no order
requires: [verify:show-set-ran, verify:dice-ran, quiz:predict-equal, verify:equal-ran]
---

# A set has no order

A list remembers the order of its items. The first item stays the
first item, and you can ask for it with the index `0`.

A set does not remember any order. A set knows only which values it
holds. It has no first item and no last item.

This follows from what a set is for. A set answers the question "is
this value here?". For that question, the order does not matter.
Because a set does not have to keep an order, Python can store the
values in a way that finds a value very quickly, also in a large set.

Think of coins in a bag. You can say which coins are in the bag, and
you can ask whether the bag holds a certain coin. But no coin is the
first coin.

## What you see when you print a set

Click the action below. It adds a cell that makes a set from the
visits of the page before, prints the set itself, and runs.

```{attempt}
:id: show-set-not-run
:check: show-set-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-show-set
:title: Add a cell that prints a set, and run it
:path: {{ notebook }}
:tags: [show-set]
:run: true
shown_visitors = set(["Amara", "Kenji", "Amara", "Sofia", "Kenji", "Amara"])
print(shown_visitors)
```

Python shows a set between braces, `{` and `}`, with commas between
the items. The output has the three names, for example:

```
{'Sofia', 'Amara', 'Kenji'}
```

The order of the names on your screen is probably different from this
example. It may also be different from the order in the list. When you
run the same code another day, the order can change again. All of
these outputs show the same set.

```{verify}
:id: show-set-ran
:label: The cell printed a set
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed show-set
if globals().get("shown_visitors") == {"Amara", "Kenji", "Sofia"}:
    print("The cell ran. The output shows the three names between braces. The order of the names has no meaning.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("shown_visitors") == {"Amara", "Kenji", "Sofia"}
```

Two rules follow from this:

- Never write a program that depends on the order in which a set shows
  its items. When you need an order, use `sorted()`. It gives back a
  list, and a list has an order.

- A set has no index. The expression `shown_visitors[0]` stops with a
  `TypeError`, because a set has no item at position `0`.

## Writing a set with braces

You can also write a set directly. Write the items between braces,
with commas between them. Click the action below. It adds a cell that
creates a set of integers, and runs it. Two of the integers are
written twice.

```{attempt}
:id: dice-not-run
:check: dice-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-dice
:title: Add a cell that creates a set with braces, and run it
:path: {{ notebook }}
:tags: [dice]
:run: true
dice = {4, 1, 4, 6, 1}
print(len(dice))
print(sorted(dice))
```

The output is:

```
3
[1, 4, 6]
```

The code has five numbers between the braces, but the set holds only
three items, because a set holds each value only once.

```{verify}
:id: dice-ran
:label: The set dice holds three different numbers
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed dice
if globals().get("dice") == {1, 4, 6}:
    print("The cell ran. The set dice holds the three different numbers 1, 4 and 6.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("dice") == {1, 4, 6}
```

A **dictionary** also uses braces. A dictionary holds pairs, and each
pair is written as a key, a colon and a value: `{"tea": 3}`. A set has
no colons: `{"tea", "coffee"}`. Python looks for the colons to decide
which of the two you wrote.

One case needs care. Empty braces, `{}`, have no colon and no item,
and Python reads them as an empty dictionary. To make a set that holds
no items, write `set()`.

## Predict

The operator `==` tests whether two values are equal. Two lists are
equal only when they have the same items in the same order, so
`[3, 1, 2] == [1, 2, 3]` is `False`.

Look at this cell. Do not run it yet. It compares two sets that are
written with the same items in a different order.

```python
same_values = {3, 1, 2} == {1, 2, 3}
print(same_values)
```

```{quiz}
:id: predict-equal
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "True"
wrong:
  - { text: "False", explanation: "That is the answer for two lists. A set has no order, so the order in which you write the items does not matter. Both sets hold the same three values." }
  - { text: "true", explanation: "The answer is correct, but Python writes this value with a capital letter: `True`." }
otherwise: "The comparison gives a boolean: `True` or `False`. Two sets are equal when they hold the same values. Does the order matter for a set?"
explanation: "A set has no order, so two sets are equal when they hold the same values. Both sets hold `1`, `2` and `3`, so the result is `True`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: equal-not-run
:check: equal-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-equal
:title: Add the cell that compares two sets, and run it
:path: {{ notebook }}
:tags: [equal]
:run: true
same_values = {3, 1, 2} == {1, 2, 3}
print(same_values)
```

```{verify}
:id: equal-ran
:label: The two sets are equal
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed equal
if globals().get("same_values") is True:
    print("The cell ran. The two sets hold the same values, so they are equal, and the output is True.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("same_values") is True
```
