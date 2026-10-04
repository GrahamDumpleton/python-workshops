---
title: Putting a list in order
requires: [verify:heights-ran, verify:ages-ran, quiz:predict-names, verify:names-ran, quiz:which-sort]
---

# Putting a list in order

A list keeps its items in the order in which you wrote or added them.
Often you need another order: the prices from the lowest to the
highest, or the names in the order of the alphabet. To put items in
order is to **sort** them.

Python has two ways to sort a list. They look similar, but they work
differently, and the difference is a common cause of mistakes. This
page shows both.

## sorted() makes a new list

`sorted()` is a function. Write the list, or its name, between the
parentheses. `sorted()` gives back a new list, which holds the same
items in order from the smallest to the largest. The list that you
gave to it stays as it was.

Copying a shopping list onto a new piece of paper, in a better order,
is a good comparison. You now have two pieces of paper, and the first
one has not changed.

This list holds the heights of four people, in centimetres.

```{attempt}
:id: heights-not-run
:check: heights-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-heights
:title: Add a cell that makes a sorted list with sorted(), and run it
:path: {{ notebook }}
:tags: [heights]
:run: true
heights = [172, 158, 181, 165]
shortest_first = sorted(heights)
print(shortest_first)
print(heights)
```

The output has two lines:

```
[158, 165, 172, 181]
[172, 158, 181, 165]
```

1. `shortest_first = sorted(heights)` makes a new list with the items
   in order, and gives it the name `shortest_first`.

2. `print(shortest_first)` shows the new list, which is in order.

3. `print(heights)` shows that the list `heights` has not changed.

```{verify}
:id: heights-ran
:label: sorted() made a new list and left the list heights as it was
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed heights
if globals().get("heights") == [172, 158, 181, 165] and globals().get("shortest_first") == [158, 165, 172, 181]:
    print("The cell ran. The list shortest_first is in order, and the list heights has not changed.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("heights") == [172, 158, 181, 165] and globals().get("shortest_first") == [158, 165, 172, 181]
```

## .sort() changes the list

A list also has a method named `sort()`. Because it is a method, you
write it after the name of the list and a dot: `ages.sort()`. It puts
the items of that list in order. It does not make a new list: it
changes the list itself, and the old order is gone.

To continue the comparison: this time you erase the lines on the
piece of paper and write them again in order, on the same paper.

```{attempt}
:id: ages-not-run
:check: ages-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-ages
:title: Add a cell that sorts a list with .sort(), and run it
:path: {{ notebook }}
:tags: [ages]
:run: true
ages = [34, 8, 61, 27]
ages.sort()
print(ages)
```

The output is `[8, 27, 34, 61]`. The list `ages` itself is now in
order.

```{verify}
:id: ages-ran
:label: .sort() changed the list ages
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed ages
if globals().get("ages") == [8, 27, 34, 61]:
    print("The cell ran. The list ages itself is now in order.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("ages") == [8, 27, 34, 61]
```

## A common mistake

Like `append()`, the method `sort()` changes the list and has nothing
to give back. So it gives back `None`, the special value that means
"no value".

Look at this cell. Do not run it yet. Its second line is a mistake
that many people make. Think about what the right side of the
assignment gives back.

```python
names = ["Mei", "Amara", "Diego"]
names = names.sort()
print(names)
```

```{quiz}
:id: predict-names
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "None"
wrong:
  - { pattern: "\\[[\"']?Amara[\"']?, ?[\"']?Diego[\"']?, ?[\"']?Mei[\"']?\\]", explanation: "`names.sort()` does sort the list. But the method gives back `None`, and the assignment makes the name `names` refer to what the method gives back." }
  - { pattern: "\\[[\"']?Mei[\"']?, ?[\"']?Amara[\"']?, ?[\"']?Diego[\"']?\\]", explanation: "`names.sort()` changes the order of the list. But there is a second problem: the assignment makes the name `names` refer to what the method gives back." }
  - { pattern: "[Nn][Oo][Nn][Ee]", explanation: "That is the correct value. Python writes it with a capital letter: `None`." }
  - { pattern: ".*[Ee]rror.*", explanation: "The cell runs with no error. Python allows the assignment. Which value does `names.sort()` give back?" }
otherwise: "Python calculates the right side of the assignment first. `names.sort()` sorts the list, and gives back `None`. Then the name `names` refers to what the right side gave back."
explanation: "`names.sort()` sorts the list and gives back `None`. The assignment then makes the name `names` refer to `None`. No name refers to the sorted list any more, so the list is lost."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: names-not-run
:check: names-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-names
:title: Add the cell with the mistake, and run it
:path: {{ notebook }}
:tags: [names]
:run: true
names = ["Mei", "Amara", "Diego"]
names = names.sort()
print(names)
```

The output is `None`. Python shows no error message, because the cell
is correct Python. It does something different from what the writer
wanted. The error comes later, when another line tries to use `names`
as a list.

The correct code is one of these two lines, and never a mix of them:

- `names.sort()`, with no assignment, when you want to change the
  list.

- `in_order = sorted(names)`, when you want a new list and want to
  keep the list `names` as it was.

```{verify}
:id: names-ran
:label: The name names refers to None
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed names
if "names" in globals() and names is None:
    print("The cell ran. The name names refers to None, because names.sort() gives back None.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
"names" in globals() and names is None
```

```{quiz}
:id: which-sort
:title: Choosing between the two
question: The list `results` holds numbers in the order in which they were measured. You need the numbers in order from the smallest to the largest, and you also need the first order later. Which line do you write?
options:
  - { text: "`results.sort()`", explanation: "`results.sort()` changes the list itself, so the first order is gone." }
  - { text: "`in_order = sorted(results)`", correct: true }
  - { text: "`in_order = results.sort()`", explanation: "`results.sort()` changes the list and gives back `None`. So the first order is gone, and `in_order` refers to `None`." }
explanation: "`sorted(results)` gives back a new list in order, and leaves the list `results` as it was. So you have both orders."
```

```{hint}
:title: Can Python sort a list of strings?
Yes. `sorted(["Quito", "Accra", "Hanoi"])` gives
`['Accra', 'Hanoi', 'Quito']`, in the order of the alphabet. There is
one surprise: Python puts every capital letter before every small
letter. So `sorted(["banana", "Cherry", "apple"])` gives
`['Cherry', 'apple', 'banana']`.
```
