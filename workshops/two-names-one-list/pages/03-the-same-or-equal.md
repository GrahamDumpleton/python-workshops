---
title: The same list, or an equal list
requires: [verify:trips-ran, quiz:predict-teams, verify:teams-ran]
---

# The same list, or an equal list

On the page before this one, two names referred to one list. When
you read a program, you often need to know whether two names refer
to one list, or to two lists that hold the same items. The two
situations look the same when you print the lists.

Think of two pieces of paper with the same shopping items written on
them. The two papers are **equal**: they hold the same items, in the
same order. But they are not **the same** paper. When you write on
one, the other does not change.

Python has an operator for each question.

- `==` asks whether two values are equal. For two lists, it asks
  whether they hold equal items in the same order. You know this
  operator from the workshop **Making decisions**.

- `is` asks whether two names refer to the same value: one value with
  two labels. `is` is a new operator, and it is a word, not a symbol.

Both operators give a boolean: `True` or `False`.

Click the action below. It adds a cell that makes two lists and three
names, and runs it.

```{attempt}
:id: trips-not-run
:check: trips-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-trips
:title: Add a cell that compares names with is and with ==, and run it
:path: {{ notebook }}
:tags: [trips]
:run: true
first_trip = ["Lima", "Cusco"]
same_trip = first_trip
other_trip = ["Lima", "Cusco"]
print(same_trip is first_trip)
print(other_trip is first_trip)
print(other_trip == first_trip)
```

The output is:

```
True
False
True
```

```{verify}
:id: trips-ran
:label: The cell compared the names with is and with ==
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed trips
if globals().get("first_trip") == ["Lima", "Cusco"] and globals().get("same_trip") is globals().get("first_trip") and globals().get("other_trip") is not globals().get("first_trip"):
    print("The cell ran. The names same_trip and first_trip refer to the same list. The name other_trip refers to another list, which is equal to it.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("first_trip") == ["Lima", "Cusco"] and globals().get("same_trip") is globals().get("first_trip") and globals().get("other_trip") is not globals().get("first_trip")
```

## What happened

1. `first_trip = ["Lima", "Cusco"]` makes a list. The square brackets
   always make a new list.

2. `same_trip = first_trip` ties a second label to that list. No new
   list is made.

3. `other_trip = ["Lima", "Cusco"]` has square brackets on its right
   side, so Python makes a second list. It holds equal items, but it
   is another list.

4. `same_trip is first_trip` is `True`: the two names refer to the
   same list.

5. `other_trip is first_trip` is `False`: these two names refer to
   two lists.

6. `other_trip == first_trip` is `True`: the two lists are equal,
   because they hold equal items in the same order.

## Predict: two lists that are equal

Look at this cell. Do not run it yet. Each of the first two lines has
square brackets on its right side.

```python
red_team = [4, 7]
blue_team = [4, 7]
blue_team.append(9)
print(len(red_team))
```

```{quiz}
:id: predict-teams
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "2"
wrong:
  - { text: "3", explanation: "The two lists are equal at first, but they are two lists. Each pair of square brackets makes a new list. The item `9` is added only to the list that `blue_team` refers to." }
  - { text: "[4, 7]", explanation: "That is the list. The last line shows the number of items of the list, which `len()` gives." }
otherwise: "The last line shows the number of items of the list that `red_team` refers to. How many lists does this cell make? Type one whole number."
explanation: "The cell makes two lists, because it has two pairs of square brackets. The lists are equal at first, but they are not the same list. A change to one list does not change the other list."
```

Run the cell, and compare the output with your prediction. The cell
in your notebook has one more line, which asks whether the two names
refer to the same list.

```{attempt}
:id: teams-not-run
:check: teams-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-teams
:title: Add the cell that makes two equal lists, and run it
:path: {{ notebook }}
:tags: [teams]
:run: true
red_team = [4, 7]
blue_team = [4, 7]
blue_team.append(9)
print(len(red_team))
print(red_team is blue_team)
```

The output is:

```
2
False
```

```{verify}
:id: teams-ran
:label: A change to one of two equal lists leaves the other as it was
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed teams
if globals().get("red_team") == [4, 7] and globals().get("blue_team") == [4, 7, 9]:
    print("The cell ran. The list red_team still has 2 items, and the list blue_team has 3 items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("red_team") == [4, 7] and globals().get("blue_team") == [4, 7, 9]
```

## When to use each operator

Use `==` when you want to know whether two values are equal. This is
the question that a program asks most often.

Use `is` when you want to know whether two names refer to one value.
In this workshop, `is` is a tool to see what Python did. When
`a is b` is `True` for two names `a` and `b`, a change to the list
`a` is also a change to the list `b`.
