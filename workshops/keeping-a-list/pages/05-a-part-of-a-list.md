---
title: A part of a list
requires: [verify:distances-ran, quiz:predict-rainfall, verify:rainfall-ran, verify:letters-ran]
---

# A part of a list

An index gets one item. Sometimes a program needs several items that
are next to each other: the first three results, or the last two
days. A **slice** is a part of a list, from one index to another
index.

To write a slice, put two indexes between the square brackets, with a
colon, `:`, between them: `distances[0:3]`. The first index says
where the slice starts. The second index says where the slice stops,
and the item at that index is not part of the slice.

Cutting a piece from a ruler is a good comparison. If you cut at the
mark 0 and at the mark 3, the piece is 3 centimetres long. It holds
the first, second and third centimetre, and the centimetre that
begins at the mark 3 is not in the piece.

Mariam walks every day. This list holds the number of kilometres that
she walked on each of seven days. Click the action below. It adds a
cell that shows the first three items, and then the whole list.

```{attempt}
:id: distances-not-run
:check: distances-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-distances
:title: Add a cell that shows the first three items of a list, and run it
:path: {{ notebook }}
:tags: [distances]
:run: true
distances = [5, 8, 3, 10, 6, 4, 7]
print(distances[0:3])
print(distances)
```

The output has two lines:

```
[5, 8, 3]
[5, 8, 3, 10, 6, 4, 7]
```

- `distances[0:3]` starts at the index 0 and stops at the index 3. It
  holds the items with the indexes 0, 1 and 2. The item with the
  index 3, which is `10`, is not in the slice.

- The slice is a new list. The second line of the output shows that
  the list `distances` still has all seven items. A slice does not
  remove anything from the list.

The number of items in a slice is the second index minus the first
index. Here, 3 minus 0 is 3 items.

```{verify}
:id: distances-ran
:label: The cell showed a slice and the whole list
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed distances
if globals().get("distances") == [5, 8, 3, 10, 6, 4, 7]:
    print("The cell ran. It showed the first three items, and the list still has seven items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("distances") == [5, 8, 3, 10, 6, 4, 7]
```

## Predict

Look at this cell. Do not run it yet.

```python
rainfall = [12, 0, 7, 30, 4, 9]
print(rainfall[2:5])
```

Type the list exactly as Python shows it, with the square brackets
and the commas.

```{quiz}
:id: predict-rainfall
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer:
  - "[7, 30, 4]"
  - { pattern: "\\[7, ?30, ?4\\]", example: "[7,30,4]" }
wrong:
  - { pattern: "\\[7, ?30, ?4, ?9\\]", explanation: "The slice stops at the index 5, and the item at that index is not part of the slice. The item with the index 5 is `9`." }
  - { pattern: "\\[0, ?7, ?30\\]", explanation: "Python counts the indexes from 0. The item with the index 2 is `7`, the third item." }
  - { pattern: "\\[0, ?7, ?30, ?4\\]", explanation: "Python counts the indexes from 0, so the slice starts at `7`. The slice stops before the item with the index 5." }
  - { pattern: "7,? ?30,? ?4", explanation: "The items are correct. A slice is a list, so Python shows it with square brackets and commas: type the brackets too." }
otherwise: "The slice starts at the item with the index 2, and stops before the item with the index 5. Count the items from 0."
explanation: "The slice holds the items with the indexes 2, 3 and 4. They are `7`, `30` and `4`. The item with the index 5 is not part of the slice."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: rainfall-not-run
:check: rainfall-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-rainfall
:title: Add the cell that shows the slice from 2 to 5, and run it
:path: {{ notebook }}
:tags: [rainfall]
:run: true
rainfall = [12, 0, 7, 30, 4, 9]
print(rainfall[2:5])
```

```{verify}
:id: rainfall-ran
:label: The cell showed the slice from 2 to 5
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rainfall
if globals().get("rainfall") == [12, 0, 7, 30, 4, 9]:
    print("The cell ran. It showed the items with the indexes 2, 3 and 4.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("rainfall") == [12, 0, 7, 30, 4, 9]
```

## A slice with one index

A slice can have only one of the two indexes. The colon stays.

- With no first index, the slice starts at the start of the list.
  `letters[:2]` is the first two items.

- With no second index, the slice continues to the end of the list.
  `letters[2:]` is every item from the index 2 to the end.

- A negative index counts from the end, as before. `letters[-2:]`
  starts two items before the end, so it is the last two items.

```{attempt}
:id: letters-not-run
:check: letters-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-letters
:title: Add a cell that shows three slices with one index, and run it
:path: {{ notebook }}
:tags: [letters]
:run: true
letters = ["a", "b", "c", "d", "e"]
print(letters[:2])
print(letters[2:])
print(letters[-2:])
```

The output has three lines:

```
['a', 'b']
['c', 'd', 'e']
['d', 'e']
```

```{verify}
:id: letters-ran
:label: The cell showed three slices
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed letters
if globals().get("letters") == ["a", "b", "c", "d", "e"]:
    print("The cell ran. It showed the first two items, the items from the index 2 to the end, and the last two items.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("letters") == ["a", "b", "c", "d", "e"]
```
