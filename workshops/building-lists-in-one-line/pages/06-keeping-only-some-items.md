---
title: Keeping only some items
requires: [verify:positives-ran, quiz:predict-passed, verify:passed-ran, verify:heavy-list]
---

# Keeping only some items

A list comprehension can also choose items. You add a test at its
end, and the new list gets only the items that pass the test.

Programs need this often. A shop wants only the products that cost
less than 10. A teacher wants only the names that begin with `A`. A
weather program wants only the days that were below zero. Each of
these is a new list that holds some of the items of another list.

Think of a person who sorts letters. The person looks at each letter
and asks one question about it: "Is this letter for another country?"
When the answer is yes, the letter goes into a bag. When the answer is
no, the person does nothing with the letter. At the end, the bag holds
only the letters that passed the test.

In a loop, the test is an `if` line. An `if` line holds a
**condition**: an expression that is either true or false, such as
`reading > 0`. Python runs the block under the `if` only when the
condition is true. Here is a loop that keeps only the temperatures
that are above zero:

```python
readings = [3, -2, 7, -5, 4]
positives = []
for reading in readings:
    if reading > 0:
        positives.append(reading)
print(positives)
```

In a list comprehension, the word `if` and the condition go at the
end. Click the action below. It adds a cell that does the same work
with a list comprehension, and runs it.

```{attempt}
:id: positives-not-run
:check: positives-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-positives
:title: Add a cell that keeps only the temperatures above zero, and run it
:path: {{ notebook }}
:tags: [positives]
:run: true
readings = [3, -2, 7, -5, 4]
positives = [reading for reading in readings if reading > 0]
print(positives)
```

The output is:

```
[3, 7, 4]
```

```{verify}
:id: positives-ran
:label: The list comprehension kept only the temperatures above zero
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed positives
if globals().get("positives") == [3, 7, 4]:
    print("The cell ran. The name positives refers to the new list [3, 7, 4].")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("positives") == [3, 7, 4]
```

## What happened

The list comprehension now has three parts:

```python
[reading for reading in readings if reading > 0]
```

- `reading`, at the start, is the expression that says what each new
  item is. Here the new item is the item itself, without a change, so
  the expression is only the loop name.

- `for reading in readings` says where the items come from.

- `if reading > 0` is the condition. Python tests it in every pass.
  When the condition is true, Python adds the new item to the list.
  When the condition is false, Python adds nothing in that pass.

| Pass | `reading` | `reading > 0` | The new list after the pass |
|------|-----------|---------------|-----------------------------|
| 1 | `3` | `True` | `[3]` |
| 2 | `-2` | `False` | `[3]` |
| 3 | `7` | `True` | `[3, 7]` |
| 4 | `-5` | `False` | `[3, 7]` |
| 5 | `4` | `True` | `[3, 7, 4]` |

The word `reading` is written three times in this line. That is
normal for a list comprehension that only chooses items: the new item,
the loop name and the condition all use the same name.

The items of the new list are in the same order as in the first list.

## Predict the result

Look at this cell. Do not run it yet. The operator `>=` means "is
greater than or equal to".

```python
scores = [55, 80, 42, 91]
passed = [score for score in scores if score >= 55]
print(passed)
```

```{quiz}
:id: predict-passed
:type: text
:title: Predict the list
question: What does the notebook show under this cell when it runs?
answer:
  - { pattern: '\[\s*55\s*,\s*80\s*,\s*91\s*\]', example: "[55, 80, 91]" }
wrong:
  - { pattern: '\[\s*80\s*,\s*91\s*\]', explanation: "The operator `>=` means greater than or equal to. The score `55` is equal to `55`, so the condition is true for it too." }
  - { pattern: '\[\s*55\s*,\s*80\s*,\s*42\s*,\s*91\s*\]', explanation: "That is the list `scores`. The condition `score >= 55` is false for `42`, so Python does not add `42` to the new list." }
  - { pattern: '\[\s*42\s*\]', explanation: "The new list holds the items for which the condition is true. The condition `score >= 55` is false for `42`, and true for the other three scores." }
  - { pattern: '\[\s*True\s*,\s*True\s*,\s*False\s*,\s*True\s*\]', explanation: "The condition only decides whether an item goes into the new list. The new item is the expression at the start, which is `score`." }
  - { pattern: '55\s*,?\s*80\s*,?\s*91', explanation: "The three numbers are correct. Python shows a list with square brackets around the items, so type the brackets too." }
otherwise: "Test the condition `score >= 55` for each of the four scores. The new list holds only the scores for which the condition is true, in the same order."
explanation: "The condition `score >= 55` is true for `55`, `80` and `91`, and false for `42`. The new list is `[55, 80, 91]`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: passed-not-run
:check: passed-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-passed
:title: Add the cell that keeps the scores of 55 or more, and run it
:path: {{ notebook }}
:tags: [passed]
:run: true
scores = [55, 80, 42, 91]
passed = [score for score in scores if score >= 55]
print(passed)
```

```{verify}
:id: passed-ran
:label: The list comprehension kept the scores of 55 or more
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed passed
if globals().get("passed") == [55, 80, 91]:
    print("The cell ran. The name passed refers to the new list [55, 80, 91].")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("passed") == [55, 80, 91]
```

## Your task

A delivery company has five parcels. Their weights are 2, 15, 10, 22
and 5 kilograms. A parcel that weighs more than 10 kilograms is heavy,
and needs two people to carry it. Write a program that builds a list
of the weights of the heavy parcels.

This loop does the work:

```python
parcels_kg = [2, 15, 10, 22, 5]
heavy = []
for parcel in parcels_kg:
    if parcel > 10:
        heavy.append(parcel)
print(heavy)
```

Write a program that does the same work with a list comprehension.
Your program must do these three things, in this order:

1. Give the name `parcels_kg` to the list `[2, 15, 10, 22, 5]`.

2. Give the name `heavy` to a list comprehension that keeps only the
   items of `parcels_kg` that are greater than `10`. You can choose
   the loop name. A good loop name is `parcel`.

3. Show the value of `heavy` with `print()`.

When the program is correct, the output under the cell is:

```
[15, 22]
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-heavy
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [heavy]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell with the temperatures. Your program has the same
three lines: the list, the list comprehension, and the `print()`
line. The list comprehension has three parts: the expression, the
`for` part, and the `if` part.
```

```{hint}
:title: Hint: the list comprehension
The expression is only the loop name, `parcel`, because the new item
is the item itself. The `for` part is `for parcel in parcels_kg`. The
`if` part comes last, without a colon: `if parcel > 10`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: heavy-not-started
:check: heavy-list
:expect: The name parcels_kg does not exist yet
```

````{attempt}
:id: heavy-wrong-parcels
:check: heavy-list
:expect: The name parcels_kg refers to [2, 15, 10]

```{cell-insert}
:path: {{ notebook }}
:run: true
parcels_kg = [2, 15, 10]
```
````

````{attempt}
:id: heavy-parcels-only
:check: heavy-list
:expect: The name heavy does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
parcels_kg = [2, 15, 10, 22, 5]
```
````

````{attempt}
:id: heavy-not-a-list
:check: heavy-list
:expect: is not a list

```{cell-insert}
:path: {{ notebook }}
:run: true
parcels_kg = [2, 15, 10, 22, 5]
heavy = parcels_kg[1] > 10
print(heavy)
```
````

````{attempt}
:id: heavy-no-condition
:check: heavy-list
:expect: holds every item of parcels_kg

```{cell-insert}
:path: {{ notebook }}
:run: true
parcels_kg = [2, 15, 10, 22, 5]
heavy = [parcel for parcel in parcels_kg]
print(heavy)
```
````

````{attempt}
:id: heavy-or-equal
:check: heavy-list
:expect: The list heavy includes 10

```{cell-insert}
:path: {{ notebook }}
:run: true
parcels_kg = [2, 15, 10, 22, 5]
heavy = [parcel for parcel in parcels_kg if parcel >= 10]
print(heavy)
```
````

````{attempt}
:id: heavy-less-than
:check: heavy-list
:expect: holds the parcels that are not heavy

```{cell-insert}
:path: {{ notebook }}
:run: true
parcels_kg = [2, 15, 10, 22, 5]
heavy = [parcel for parcel in parcels_kg if parcel < 10]
print(heavy)
```
````

````{attempt}
:id: heavy-condition-first
:check: heavy-list
:expect: The list heavy holds the values True and False

```{cell-insert}
:path: {{ notebook }}
:run: true
parcels_kg = [2, 15, 10, 22, 5]
heavy = [parcel > 10 for parcel in parcels_kg]
print(heavy)
```
````

````{attempt}
:id: heavy-other-number
:check: heavy-list
:expect: but it must refer to [15, 22]

```{cell-insert}
:path: {{ notebook }}
:run: true
parcels_kg = [2, 15, 10, 22, 5]
heavy = [parcel for parcel in parcels_kg if parcel > 20]
print(heavy)
```
````

````{attempt}
:id: heavy-other-way
:check: heavy-list
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
parcels_kg = [2, 15, 10, 22, 5]
heavy = [kg for kg in parcels_kg if 10 < kg]
print(heavy)
```
````

````{hint}
:title: Show me a solution
:unlock: "heavy-list" in failed_checks or "heavy-list" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-heavy-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [heavy-solution]
:run: true
parcels_kg = [2, 15, 10, 22, 5]
heavy = [parcel for parcel in parcels_kg if parcel > 10]
print(heavy)
```
````

```{verify}
:id: heavy-list
:label: Your list comprehension keeps only the heavy parcels
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed heavy; cell-executed heavy-solution
if "parcels_kg" not in globals():
    print("The name parcels_kg does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the list: parcels_kg = [2, 15, 10, 22, 5]. Then hold Shift and press Enter to run the cell.")
elif parcels_kg != [2, 15, 10, 22, 5]:
    print(f"The name parcels_kg refers to {parcels_kg!r} but it must refer to the list [2, 15, 10, 22, 5]. Correct the first line of your program. Then run the cell again.")
elif "heavy" not in globals():
    print("The name heavy does not exist yet. Add a line that gives the name heavy to a list comprehension. Check the spelling. Then run the cell again.")
elif type(heavy) is not list:
    print(f"The name heavy refers to {heavy!r}, which is not a list. A list comprehension has square brackets around it, and the words for and in inside the brackets. Then run the cell again.")
elif heavy == [15, 22]:
    print("Correct. The name heavy refers to [15, 22], the two parcels that weigh more than 10 kilograms.")
elif heavy == parcels_kg:
    print("The list heavy holds every item of parcels_kg, so the list comprehension has no condition, or its condition is always true. Add the condition at the end, inside the square brackets: if parcel > 10. Then run the cell again.")
elif heavy == [15, 10, 22]:
    print("The list heavy includes 10. A heavy parcel weighs more than 10 kilograms, so a parcel of 10 kilograms is not heavy. Use the operator > in the condition, and not the operator >=. Then run the cell again.")
elif heavy == [2, 5] or heavy == [2, 10, 5]:
    print(f"The name heavy refers to {heavy!r}. That list holds the parcels that are not heavy, so the condition uses the wrong operator. The condition must be true for the parcels that weigh more than 10: if parcel > 10. Then run the cell again.")
elif len(heavy) > 0 and type(heavy[0]) is bool:
    print("The list heavy holds the values True and False. The comparison is at the start of the list comprehension, so it became the new item. Write the loop name at the start, and write the comparison at the end, after the word if. Then run the cell again.")
else:
    print(f"The name heavy refers to {heavy!r} but it must refer to [15, 22]. The condition at the end must be true only for the items that are greater than 10: if parcel > 10. Then run the cell again.")
"parcels_kg" in globals() and "heavy" in globals() and parcels_kg == [2, 15, 10, 22, 5] and type(heavy) is list and heavy == [15, 22]
```
