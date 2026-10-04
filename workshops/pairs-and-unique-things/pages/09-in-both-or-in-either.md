---
title: In both, or in either
requires: [verify:days-ran, quiz:predict-either, verify:numbers-ran, verify:clubs]
---

# In both, or in either

Many questions are about two groups. Which people came on Monday and
also on Friday? Which people came on one of the two days, or on both?
With lists, each of these questions needs a loop and an `if`. With
sets, each question is one operator.

- The operator `&` gives a new set with the values that are in both
  sets. Read `a & b` as "in `a` and in `b`".

- The operator `|` gives a new set with the values that are in either
  set: in the first set, in the second set, or in both. Read `a | b`
  as "in `a` or in `b`". A value that is in both sets appears in the
  result only once, because the result is a set.

The character `&` is called an ampersand. The character `|` is a
vertical line. On many keyboards it is on the same key as the
backslash, `\`.

Think of two friends who compare the films that they have seen. The
films that both friends have seen are the answer of `&`. The films
that one friend or the other friend has seen are the answer of `|`.

Click the action below. It adds a cell with two sets of people, and
runs it. The set `monday` holds the people who came to a class on
Monday. The set `friday` holds the people who came on Friday.

```{attempt}
:id: days-not-run
:check: days-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-days
:title: Add a cell that compares two sets of people, and run it
:path: {{ notebook }}
:tags: [days]
:run: true
monday = {"Amara", "Kenji", "Sofia"}
friday = {"Kenji", "Sofia", "Tariq"}
both_days = monday & friday
either_day = monday | friday
print(sorted(both_days))
print(sorted(either_day))
```

The output is:

```
['Kenji', 'Sofia']
['Amara', 'Kenji', 'Sofia', 'Tariq']
```

```{verify}
:id: days-ran
:label: The two operators made two new sets
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed days
if globals().get("both_days") == {"Kenji", "Sofia"} and globals().get("either_day") == {"Amara", "Kenji", "Sofia", "Tariq"}:
    print("The cell ran. The set both_days holds 2 names, and the set either_day holds 4 names.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("both_days") == {"Kenji", "Sofia"} and globals().get("either_day") == {"Amara", "Kenji", "Sofia", "Tariq"}
```

## What happened

1. The first two lines create two sets of three strings.

2. `both_days = monday & friday` makes a new set. Kenji and Sofia are
   in both sets, so the new set holds these two names.

3. `either_day = monday | friday` makes another new set. It holds
   every name that is in one of the two sets. Kenji and Sofia are in
   both sets, but the new set holds each of them only once. So the new
   set has four names, and not six.

4. The two `print()` lines use `sorted()`, because a set has no order.

The sets `monday` and `friday` do not change. Each operator makes a
new set.

## Predict

Look at this cell. Do not run it yet.

```python
either_number = {1, 2, 3} | {3, 4}
print(len(either_number))
```

```{quiz}
:id: predict-either
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "4"
wrong:
  - { text: "5", explanation: "The first set has three items and the second set has two items. But `3` is in both sets, and the result is a set, so it holds `3` only once." }
  - { text: "1", explanation: "One value, `3`, is in both sets. That is the answer for the operator `&`. The operator `|` gives every value that is in either set." }
  - { text: "{1, 2, 3, 4}", explanation: "That is the new set. The cell prints `len()` of the set, which is the number of its items." }
otherwise: "The operator `|` gives every value that is in the first set or in the second set. Write these values, each one only once, and count them."
explanation: "The new set holds `1`, `2`, `3` and `4`. The value `3` is in both sets, but a set holds it only once. So the set has `4` items."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: numbers-not-run
:check: numbers-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-numbers
:title: Add the cell that joins two sets of numbers, and run it
:path: {{ notebook }}
:tags: [numbers]
:run: true
either_number = {1, 2, 3} | {3, 4}
print(len(either_number))
```

```{verify}
:id: numbers-ran
:label: The new set holds four numbers
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed numbers
if globals().get("either_number") == {1, 2, 3, 4}:
    print("The cell ran. The set either_number holds the four numbers 1, 2, 3 and 4.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("either_number") == {1, 2, 3, 4}
```

## Your task

A school has a swimming club and a chess club. Find the pupils who are
in both clubs, and the pupils who are in one club or more.

Your program must do these five things, in this order:

1. Give the name `swimming` to the set
   `{"Mei", "Omar", "Lucia", "Ravi"}`.

2. Give the name `chess` to the set `{"Omar", "Ravi", "Zanele"}`.

3. Give the name `in_both` to a set of the pupils who are in both
   clubs. Use an operator and the names `swimming` and `chess`.

4. Give the name `in_any` to a set of the pupils who are in either
   club. Use an operator and the names `swimming` and `chess`.

5. Show the pupils who are in both clubs, in order, with
   `print(sorted(in_both))`.

When the program is correct, the output under the cell is:

```
['Omar', 'Ravi']
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-clubs
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [clubs]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. Then
run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell with the sets `monday` and `friday`. Your program has
the same form: two lines that create the sets, two lines that use the
operators, and one `print()` line.
```

```{hint}
:title: Hint: the operators
The operator `&` gives the values that are in both sets:
`in_both = swimming & chess`. The operator `|` gives the values that
are in either set: `in_any = swimming | chess`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: clubs-not-started
:check: clubs
:expect: The name swimming does not exist yet
```

````{attempt}
:id: clubs-a-list
:check: clubs
:expect: The name swimming refers to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
swimming = ["Mei", "Omar", "Lucia", "Ravi"]
```
````

````{attempt}
:id: clubs-wrong-names
:check: clubs
:expect: The set swimming holds these items

```{cell-insert}
:path: {{ notebook }}
:run: true
swimming = {"Mei", "Omar", "Lucia"}
```
````

````{attempt}
:id: clubs-one-set
:check: clubs
:expect: The name chess does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
swimming = {"Mei", "Omar", "Lucia", "Ravi"}
```
````

````{attempt}
:id: clubs-no-result
:check: clubs
:expect: The name in_both does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
swimming = {"Mei", "Omar", "Lucia", "Ravi"}
chess = {"Omar", "Ravi", "Zanele"}
```
````

````{attempt}
:id: clubs-swapped
:check: clubs
:expect: The two operators are in the wrong places

```{cell-insert}
:path: {{ notebook }}
:run: true
swimming = {"Mei", "Omar", "Lucia", "Ravi"}
chess = {"Omar", "Ravi", "Zanele"}
in_both = swimming | chess
in_any = swimming & chess
print(sorted(in_both))
```
````

````{attempt}
:id: clubs-both-wrong
:check: clubs
:expect: The set in_both holds all five pupils

```{cell-insert}
:path: {{ notebook }}
:run: true
swimming = {"Mei", "Omar", "Lucia", "Ravi"}
chess = {"Omar", "Ravi", "Zanele"}
in_both = swimming | chess
in_any = swimming | chess
print(sorted(in_both))
```
````

````{attempt}
:id: clubs-sorted-list
:check: clubs
:expect: The name in_both refers to a list

```{cell-insert}
:path: {{ notebook }}
:run: true
swimming = {"Mei", "Omar", "Lucia", "Ravi"}
chess = {"Omar", "Ravi", "Zanele"}
in_both = sorted(swimming & chess)
in_any = swimming | chess
print(in_both)
```
````

````{attempt}
:id: clubs-any-wrong
:check: clubs
:expect: The set in_any holds only the pupils who are in both clubs

```{cell-insert}
:path: {{ notebook }}
:run: true
swimming = {"Mei", "Omar", "Lucia", "Ravi"}
chess = {"Omar", "Ravi", "Zanele"}
in_both = swimming & chess
in_any = swimming & chess
print(sorted(in_both))
```
````

````{attempt}
:id: clubs-other-order
:check: clubs
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
swimming = {"Mei", "Omar", "Lucia", "Ravi"}
chess = {"Omar", "Ravi", "Zanele"}
in_both = chess & swimming
in_any = chess | swimming
print(sorted(in_both))
```
````

````{hint}
:title: Show me a solution
:unlock: "clubs" in failed_checks or "clubs" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-clubs-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [clubs-solution]
:run: true
swimming = {"Mei", "Omar", "Lucia", "Ravi"}
chess = {"Omar", "Ravi", "Zanele"}
in_both = swimming & chess
in_any = swimming | chess
print(sorted(in_both))
```
````

```{verify}
:id: clubs
:label: Your program finds the pupils in both clubs and in either club
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed clubs; cell-executed clubs-solution
def _workshop_check():
    wanted = {"swimming": {"Mei", "Omar", "Lucia", "Ravi"}, "chess": {"Omar", "Ravi", "Zanele"}}
    both = wanted["swimming"] & wanted["chess"]
    either = wanted["swimming"] | wanted["chess"]
    for name in ("swimming", "chess"):
        if name not in globals():
            print(f"The name {name} does not exist yet. Write your program under the comment in the new cell, and create the two sets first. Check the spelling of the name. Then hold Shift and press Enter to run the cell.")
            return False
        value = globals()[name]
        if isinstance(value, (list, tuple)):
            kind = "list" if isinstance(value, list) else "tuple"
            print(f"The name {name} refers to a {kind}. The operators & and | need sets. Write the items between braces, in the same way as the task shows them. Then run the cell again.")
            return False
        if not isinstance(value, set):
            print(f"The name {name} refers to {value!r}, which is not a set. Write the items between braces, with commas between them. Then run the cell again.")
            return False
        if value != wanted[name]:
            print(f"The set {name} holds these items: {sorted(value, key=repr)}, but it must hold these: {sorted(wanted[name])}. Check the spelling and the capital letters of each string. Then run the cell again.")
            return False
    for name in ("in_both", "in_any"):
        if name not in globals():
            print(f"The two sets are correct. The name {name} does not exist yet. Add the two lines that use the operators: in_both = swimming & chess and in_any = swimming | chess. Then run the cell again.")
            return False
        value = globals()[name]
        if isinstance(value, list):
            print(f"The name {name} refers to a list. The function sorted() gives back a list, so use it only in the print() line. The name {name} must refer to the set that the operator gives. Then run the cell again.")
            return False
        if not isinstance(value, set):
            print(f"The name {name} refers to {value!r}, which is not a set. Use an operator between the two sets, such as swimming & chess. Then run the cell again.")
            return False
    in_both = globals()["in_both"]
    in_any = globals()["in_any"]
    if in_both == either and in_any == both:
        print("The two operators are in the wrong places. The set in_both holds all five pupils, and the set in_any holds only two. The operator & gives the values that are in both sets, and the operator | gives the values that are in either set. Then run the cell again.")
        return False
    if in_both == either:
        print("The set in_both holds all five pupils. That is the result of the operator |. For the pupils who are in both clubs, use the operator &: in_both = swimming & chess. Then run the cell again.")
        return False
    if in_both != both:
        print(f"The set in_both holds these items: {sorted(in_both, key=repr)}, but it must hold ['Omar', 'Ravi']. Use the operator & between the two sets: in_both = swimming & chess. Then run the cell again.")
        return False
    if in_any == both:
        print("The set in_any holds only the pupils who are in both clubs. That is the result of the operator &. For the pupils who are in either club, use the operator |: in_any = swimming | chess. Then run the cell again.")
        return False
    if in_any != either:
        print(f"The set in_any holds these items: {sorted(in_any, key=repr)}, but it must hold all five pupils. Use the operator | between the two sets: in_any = swimming | chess. Then run the cell again.")
        return False
    print("Correct. The set in_both holds Omar and Ravi, who are in both clubs. The set in_any holds all five pupils.")
    return True
globals().pop("_workshop_check")()
```
