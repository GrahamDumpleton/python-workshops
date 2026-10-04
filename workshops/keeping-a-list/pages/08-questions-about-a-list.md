---
title: Two questions about a list
requires: [verify:scores-ran, quiz:predict-parcels, verify:parcels-ran, verify:languages-ran, verify:invited-ran]
---

# Two questions about a list

A list can grow, so a program does not always know what a list holds.
A program often asks two questions about a list: "How many items does
it have?" and "Is this value one of the items?". Python answers both.

## How many items: len()

The function `len()` counts the items of a list. Write the list, or
its name, between the parentheses: `len(scores)`. The result is an
integer. The name `len` is a short form of the word "length".

You used `len()` before, to count the characters of a string. It
counts the items of a list in the same way.

```{attempt}
:id: scores-not-run
:check: scores-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-scores
:title: Add a cell that counts the items of a list, and run it
:path: {{ notebook }}
:tags: [scores]
:run: true
scores = [12, 7, 15, 9]
print(len(scores))
```

The output is `4`, because the list has four items.

The indexes of this list are 0, 1, 2 and 3. The last index is always
one less than the number of items, because counting starts at zero.

```{verify}
:id: scores-ran
:label: The cell counted the items of the list scores
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed scores
if globals().get("scores") == [12, 7, 15, 9]:
    print("The cell ran. The list scores has 4 items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("scores") == [12, 7, 15, 9]
```

Look at this cell. Do not run it yet.

```python
parcels = [2, 5, 1]
parcels.append(4)
print(len(parcels))
```

```{quiz}
:id: predict-parcels
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "4"
wrong:
  - { text: "3", explanation: "The list has three items when it is created. Then `append()` adds one more item, before `len()` counts." }
  - { text: "12", explanation: "`len()` does not add the items together. It counts how many items the list has." }
  - { text: "5", explanation: "`append(4)` adds one item, and the value of that item is `4`. It does not add four items." }
  - { pattern: "\\[.*\\]", explanation: "`len()` gives one number, not a list. How many items does the list have after the second line?" }
otherwise: "`len()` counts the items. How many items does the list have after the line with `append()`?"
explanation: "The list starts with three items. `append(4)` adds one more item, so the list has four items, and `len(parcels)` is 4."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: parcels-not-run
:check: parcels-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-parcels
:title: Add the cell that counts the items after an append, and run it
:path: {{ notebook }}
:tags: [parcels]
:run: true
parcels = [2, 5, 1]
parcels.append(4)
print(len(parcels))
```

```{verify}
:id: parcels-ran
:label: The cell counted the items of the list parcels
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed parcels
if globals().get("parcels") == [2, 5, 1, 4]:
    print("The cell ran. The list parcels has 4 items after the append.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("parcels") == [2, 5, 1, 4]
```

## Is a value in the list: in

The word `in` is an operator, like `==`. Write a value, then `in`,
then a list: `"Arabic" in languages`. Python looks at every item of
the list. The result is a **boolean**, which is one of the two values
`True` and `False`. The result is `True` when one of the items is
equal to the value, and `False` when no item is equal to it.

Looking for a name on a list of guests is a good comparison. The
answer is yes or no.

```{attempt}
:id: languages-not-run
:check: languages-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-languages
:title: Add a cell that asks whether two values are in a list, and run it
:path: {{ notebook }}
:tags: [languages]
:run: true
languages = ["Hindi", "Arabic", "Spanish"]
print("Arabic" in languages)
print("Swahili" in languages)
```

The output has two lines: `True` and `False`. The string `"Arabic"`
is one of the items. The string `"Swahili"` is not one of the items.

```{verify}
:id: languages-ran
:label: The cell asked whether two values are in the list
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed languages
if globals().get("languages") == ["Hindi", "Arabic", "Spanish"]:
    print("The cell ran. It showed True for Arabic, and False for Swahili.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("languages") == ["Hindi", "Arabic", "Spanish"]
```

## Using in to make a decision

The result of `in` is a boolean, so you can use it as the condition
of an `if`. An `if` runs the lines that are indented under it only
when its condition is `True`. The lines under `else` run when the
condition is `False`.

```{attempt}
:id: invited-not-run
:check: invited-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-invited
:title: Add a cell that uses in to make a decision, and run it
:path: {{ notebook }}
:tags: [invited]
:run: true
invited = ["Yuki", "Omar", "Priya"]
if "Omar" in invited:
    print("Omar is invited.")
else:
    print("Omar is not invited.")
```

The output is `Omar is invited.`, because `"Omar"` is one of the
items, so the condition is `True`.

```{verify}
:id: invited-ran
:label: The cell used in to make a decision
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed invited
if globals().get("invited") == ["Yuki", "Omar", "Priya"]:
    print("The cell ran. Omar is in the list, so the cell showed that Omar is invited.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("invited") == ["Yuki", "Omar", "Priya"]
```

```{hint}
:title: Does in pay attention to capital letters?
Yes. An item must be exactly equal to the value. The string `"omar"`,
with a small letter, is a different string from `"Omar"`. So
`"omar" in invited` is `False`.
```
