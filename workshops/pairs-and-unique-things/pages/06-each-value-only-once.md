---
title: Each value only once
requires: [quiz:predict-visitors, verify:visitors-ran]
---

# Each value only once

A list keeps every item that you give it. When the same value is added
three times, the list holds it three times. Often that is what you
want. But some questions are about the different values, and not about
how many times each one appears. How many different people visited the
library this week? Which drinks did the customers order?

A value that appears more than once is called a **duplicate**. To
answer these questions, the program must remove the duplicates.

A **set** is a value that holds several values, and holds each value
only once. A set has no duplicates. When you give a set a value that
it already holds, the set stays as it is.

Think of the list of members of a club. A member can visit the club
many times, but each name is on the list of members only once.

## From a list to a set

The function `set()` makes a set from a list. Write the list, or its
name, between the parentheses. The new set holds every different value
of the list, one time each. The list does not change.

Look at this cell. Do not run it yet. The list `visits` has one item
for each visit to a library. Some people visited more than once.

```python
visits = ["Amara", "Kenji", "Amara", "Sofia", "Kenji", "Amara"]
visitors = set(visits)
print(len(visits))
print(len(visitors))
```

The first `print()` line shows `6`, because the list has six items.

```{quiz}
:id: predict-visitors
:type: text
:title: Predict the output
question: "What does the second `print()` line, `print(len(visitors))`, show?"
answer: "3"
wrong:
  - { text: "6", explanation: "`6` is the number of items of the list. The set holds each name only once, so it has fewer items than the list." }
  - { text: "2", explanation: "Two names appear more than once, but the question is how many different names the list has. Count each name one time, including the name that appears only once." }
  - { text: "1", explanation: "One name appears only once, but the set holds every different name. Count each name of the list one time." }
otherwise: "Count the different names in the list. Count each name one time, also when it appears more than once."
explanation: "The list has three different names: `Amara`, `Kenji` and `Sofia`. The set holds each of them one time, so `len(visitors)` is `3`."
```

Run the cell, and compare the output with your prediction. The cell
has one more line, which is explained below.

```{attempt}
:id: visitors-not-run
:check: visitors-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-visitors
:title: Add the cell that makes a set from a list, and run it
:path: {{ notebook }}
:tags: [visitors]
:run: true
visits = ["Amara", "Kenji", "Amara", "Sofia", "Kenji", "Amara"]
visitors = set(visits)
print(len(visits))
print(len(visitors))
print(sorted(visitors))
```

The output is:

```
6
3
['Amara', 'Kenji', 'Sofia']
```

```{verify}
:id: visitors-ran
:label: The set holds each visitor only once
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed visitors
if globals().get("visitors") == {"Amara", "Kenji", "Sofia"} and len(globals().get("visits", [])) == 6:
    print("The cell ran. The list visits has 6 items, and the set visitors holds the 3 different names.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("visitors") == {"Amara", "Kenji", "Sofia"} and len(globals().get("visits", [])) == 6
```

## What happened

1. `visits = [...]` makes the name `visits` refer to a list of six
   strings.

2. `visitors = set(visits)` makes a set from the list. Python takes
   each item of the list in turn. When the set does not hold the value
   yet, Python puts the value in the set. When the set already holds
   the value, nothing changes.

3. `print(len(visits))` shows `6`. The list still has all six items.

4. `print(len(visitors))` shows `3`. The function `len()` counts the
   items of a set, and the set has three.

5. `print(sorted(visitors))` shows the three names. The function
   `sorted()` gives back a new list with the items in order, from the
   smallest to the largest. For strings that begin with a capital
   letter, that is the order of the alphabet.

The last line uses `sorted()` for a reason. The next page explains
what you see when you print the set itself.
