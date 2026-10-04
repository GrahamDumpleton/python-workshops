---
title: A copy that still shares
requires: [quiz:predict-week, verify:week-ran, verify:rounds-fixed]
---

# A copy that still shares

You now use `.copy()` when you want a second list. There is one
situation in which `.copy()` is not enough, and it is the last
surprise with lists in this workshop.

## A list can hold lists

An item of a list can be any value. It can be a number or a string,
and it can also be another list. A list of lists is useful for data
that has groups. For example, this list holds one shopping list for
each of two weeks:

```python
week = [["bread", "milk"], ["rice"]]
```

The list `week` has two items. Each item is a list. This page calls
`week` the outer list, and calls its two items the inner lists.

- `week[0]` is the first item, the inner list `["bread", "milk"]`.

- `week[1]` is the second item, the inner list `["rice"]`.

- `len(week)` is `2`, because the outer list has two items.

- `week[0].append("tea")` adds an item to the first inner list.

## What a list holds

The label picture tells you what a list really holds. A list does not
hold its items inside it. Each position of a list is like a label: it
is tied to a value. The outer list `week` has two positions, and each
position is tied to an inner list.

`.copy()` makes a new list with the same number of positions, and it
ties each position to the same value as in the first list. It does
not copy the values themselves. For numbers and strings this does not
matter, because they are immutable. For inner lists it matters.

Think of two pieces of paper that both say "see the list on the
refrigerator door". The second paper is a real copy of the first
paper. But there is still only one list on the door.

## Predict: a copy of a list of lists

Look at this cell. Do not run it yet.

```python
week = [["bread", "milk"], ["rice"]]
next_week = week.copy()
next_week[0].append("tea")
print(len(week[0]))
```

The third line adds an item to the first inner list of the copy. The
last line shows the number of items of the first inner list of
`week`.

```{quiz}
:id: predict-week
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "3"
wrong:
  - { text: "2", explanation: "`week.copy()` makes a new outer list. But the first position of the new list is tied to the same inner list as the first position of `week`. The inner list was not copied, so `append` changes the inner list that both outer lists share." }
  - { text: "1", explanation: "`week[0]` is the first inner list, which starts with 2 items. The inner list with 1 item is `week[1]`." }
otherwise: "The last line shows the number of items of the inner list `week[0]`. Did `.copy()` make a new inner list, or only a new outer list? Type one whole number."
explanation: "`.copy()` copies only the outer list. The positions of the new outer list are tied to the same two inner lists. So `next_week[0]` and `week[0]` are the same list, and that list now has 3 items."
```

Run the cell, and compare the output with your prediction. The cell
in your notebook has three more lines. They show the list `week`,
and they ask two questions with `is`.

```{attempt}
:id: week-not-run
:check: week-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-week
:title: Add the cell that copies a list of lists, and run it
:path: {{ notebook }}
:tags: [week]
:run: true
week = [["bread", "milk"], ["rice"]]
next_week = week.copy()
next_week[0].append("tea")
print(len(week[0]))
print(week)
print(next_week is week)
print(next_week[0] is week[0])
```

The output is:

```
3
[['bread', 'milk', 'tea'], ['rice']]
False
True
```

```{verify}
:id: week-ran
:label: The copy and the first list share their inner lists
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed week
if globals().get("week") == [["bread", "milk", "tea"], ["rice"]] and globals().get("next_week") == [["bread", "milk", "tea"], ["rice"]] and globals().get("next_week") is not globals().get("week"):
    print("The cell ran. The names week and next_week refer to two outer lists, but both outer lists hold the same inner lists, so the item tea appears in both.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("week") == [["bread", "milk", "tea"], ["rice"]] and globals().get("next_week") == [["bread", "milk", "tea"], ["rice"]] and globals().get("next_week") is not globals().get("week")
```

## What happened

1. The first line makes three lists: two inner lists, and the outer
   list whose positions are tied to them.

2. `next_week = week.copy()` makes a fourth list. It is a new outer
   list. Its two positions are tied to the same two inner lists.

3. `next_week[0].append("tea")` finds the first inner list through
   the new outer list, and changes it.

4. `week[0]` is that same inner list, so it has 3 items.

The last two lines of the output say the same thing.

- `next_week is week` is `False`: there are two outer lists.

- `next_week[0] is week[0]` is `True`: the first position of each
  outer list is tied to one inner list.

## How to copy the inner lists too

To have a copy that shares nothing, you must copy each inner list as
well. You already know the tools: an empty list, a `for` loop over
the outer list, and `append`.

1. Make an empty list. It becomes the new outer list.

2. Loop over the first outer list. In each pass, the loop name refers
   to one inner list.

3. In each pass, add a copy of that inner list to the new outer list.

## Your task

Chidi keeps the points of a game. The list `rounds` holds one inner
list of points for each round. Before he adds new points, he saves
the list as it is, under the name `saved_rounds`. His cell has the
mistake of this page.

```{cell-insert}
:id: insert-rounds
:title: Add a cell with the mistake for me to correct
:path: {{ notebook }}
:tags: [rounds]
:run: false
rounds = [[3, 5], [4, 4]]
saved_rounds = rounds.copy()
rounds[0].append(9)
print(rounds)
print(saved_rounds)
```

First run the cell as it is: click inside it, hold `Shift` and press
`Enter`. Both lines of the output show `[[3, 5, 9], [4, 4]]`, so the
saved list changed too.

Then correct the cell. Replace the second line with lines that make
`saved_rounds` a new outer list that holds a copy of each inner list
of `rounds`. Leave the other lines as they are. Run the cell again.
When the cell is correct, the output is:

```
[[3, 5, 9], [4, 4]]
[[3, 5], [4, 4]]
```

```{hint}
:title: Hint: what to look at
Read the three steps under the heading "How to copy the inner lists
too" on this page. Your code replaces the line
`saved_rounds = rounds.copy()`, and it must come before the line
`rounds[0].append(9)`.
```

```{hint}
:title: Hint: the shape of the code
Your code needs three lines in the place of the second line.

1. Make an empty list: `saved_rounds = []`.

2. Start a loop over the outer list: `for one_round in rounds:`.

3. Inside the loop, with four spaces at the start of the line, add a
   copy of the inner list to the new list with
   `saved_rounds.append(...)`. Between the parentheses, write the
   expression that makes a copy of `one_round`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: rounds-not-started
:check: rounds-fixed
:expect: The cell has not run yet
```

````{attempt}
:id: rounds-same-list
:check: rounds-fixed
:expect: refer to the same list

```{cell-insert}
:path: {{ notebook }}
:run: true
rounds = [[3, 5], [4, 4]]
saved_rounds = rounds
rounds[0].append(9)
print(rounds)
print(saved_rounds)
```
````

````{attempt}
:id: rounds-unchanged
:check: rounds-fixed
:expect: still share an inner list

```{cell-insert}
:path: {{ notebook }}
:run: true
rounds = [[3, 5], [4, 4]]
saved_rounds = rounds.copy()
rounds[0].append(9)
print(rounds)
print(saved_rounds)
```
````

````{attempt}
:id: rounds-loop-without-copy
:check: rounds-fixed
:expect: still share an inner list

```{cell-insert}
:path: {{ notebook }}
:run: true
rounds = [[3, 5], [4, 4]]
saved_rounds = []
for one_round in rounds:
    saved_rounds.append(one_round)
rounds[0].append(9)
print(rounds)
print(saved_rounds)
```
````

````{attempt}
:id: rounds-not-lists
:check: rounds-fixed
:expect: must be a list that holds two lists

```{cell-insert}
:path: {{ notebook }}
:run: true
rounds = [[3, 5], [4, 4]]
saved_rounds = []
for one_round in rounds:
    saved_rounds = one_round.copy()
rounds[0].append(9)
print(rounds)
print(saved_rounds)
```
````

````{attempt}
:id: rounds-copied-too-late
:check: rounds-fixed
:expect: Make the copies before the line

```{cell-insert}
:path: {{ notebook }}
:run: true
rounds = [[3, 5], [4, 4]]
rounds[0].append(9)
saved_rounds = []
for one_round in rounds:
    saved_rounds.append(one_round.copy())
print(rounds)
print(saved_rounds)
```
````

````{attempt}
:id: rounds-comprehension
:check: rounds-fixed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
rounds = [[3, 5], [4, 4]]
saved_rounds = [one_round.copy() for one_round in rounds]
rounds[0].append(9)
print(rounds)
print(saved_rounds)
```
````

````{hint}
:title: Show me a solution
:unlock: "rounds-fixed" in failed_checks or "rounds-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-rounds-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [rounds-solution]
:run: true
rounds = [[3, 5], [4, 4]]
saved_rounds = []
for one_round in rounds:
    saved_rounds.append(one_round.copy())
rounds[0].append(9)
print(rounds)
print(saved_rounds)
```
````

```{verify}
:id: rounds-fixed
:label: The list saved_rounds shares nothing with the list rounds
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rounds; cell-executed rounds-solution
def _workshop_check():
    if "rounds" not in globals() or "saved_rounds" not in globals():
        print("The cell has not run yet. Click inside the new cell, then hold Shift and press Enter to run it. If the cell shows an error message, read its last line, correct the cell, and run it again.")
        return False
    rounds = globals()["rounds"]
    saved = globals()["saved_rounds"]
    if saved is rounds:
        print("The names saved_rounds and rounds refer to the same list. An assignment such as saved_rounds = rounds makes no copy. Make a new outer list: begin with saved_rounds = [] and then add a copy of each inner list to it in a loop. Then run the cell again.")
        return False
    for name, value in (("rounds", rounds), ("saved_rounds", saved)):
        if not (isinstance(value, list) and len(value) == 2 and all(isinstance(inner, list) for inner in value)):
            print(f"The name {name} must be a list that holds two lists, but it refers to {value!r}. Inside the loop, add each copy to the new outer list with append: saved_rounds.append(one_round.copy()) and do not assign to saved_rounds inside the loop. Leave the first line of the cell as it was. Then run the cell again.")
            return False
    if saved[0] is rounds[0] or saved[1] is rounds[1]:
        print(f"The lists rounds and saved_rounds are two outer lists, but they still share an inner list. That is why saved_rounds is now {saved!r}. The method copy of the outer list does not copy the inner lists. Make an empty list, loop over rounds, and add a copy of each inner list: saved_rounds.append(one_round.copy()). Then run the cell again.")
        return False
    if rounds == [[3, 5, 9], [4, 4]] and saved == [[3, 5], [4, 4]]:
        print("Correct. The list saved_rounds holds copies of the inner lists, so it still holds [[3, 5], [4, 4]] after the list rounds changed.")
        return True
    print(f"The two lists now share nothing, which is right. But rounds is {rounds!r} and saved_rounds is {saved!r}. The list rounds must be [[3, 5, 9], [4, 4]] and the list saved_rounds must be [[3, 5], [4, 4]]. Make the copies before the line rounds[0].append(9) and leave the other lines as they were. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

You corrected the mistake. Each inner list of `saved_rounds` is a
copy, so the two lists share nothing.

If you did the workshop **Building lists in one line**, you can write
the same copy as a list comprehension:
`saved_rounds = [one_round.copy() for one_round in rounds]`.

The same rule is true for every mutable value inside another value:
a dictionary whose values are lists, or a list of dictionaries.
`.copy()` copies one level only.
