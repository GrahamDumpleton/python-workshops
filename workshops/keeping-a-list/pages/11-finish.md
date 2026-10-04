---
title: What you have learned
---

# What you have learned

Your programs can now keep many values under one name, and you have
written a program that builds a list and gets answers from it.

## The ideas

- A **list** is one value that holds many values, in a fixed order.
  Each value in a list is an **item**.

- The **index** of an item is its position in the list. Python counts
  the indexes from 0, because an index is the distance from the start
  of the list.

- A negative index counts from the end of the list. The index `-1` is
  the last item.

- A **slice** is a part of a list. It starts at the first index and
  stops before the second index. A slice is a new list.

- A list can change. An assignment with an index replaces one item,
  and the method `append()` adds an item at the end.

- `append()` and `sort()` change the list and give back `None`, which
  means "no value". Never assign their result to a name.

- `len()` counts the items of a list, and `in` asks whether a value
  is one of the items.

- `sorted()` gives back a new list in order and leaves the list as it
  was. The method `sort()` puts the list itself in order.

- An index that is past the end of a list gives an `IndexError`.

## The code

| Code | What it does |
|------|--------------|
| `fruits = ["apple", "banana"]` | creates a list of two items |
| `queue = []` | creates an empty list |
| `fruits[0]` | the first item |
| `fruits[-1]` | the last item |
| `distances[0:3]` | a new list of the items with the indexes 0, 1 and 2 |
| `letters[:2]` | a new list of the first two items |
| `letters[-2:]` | a new list of the last two items |
| `prices[0] = 5` | replaces the first item with `5` |
| `basket.append("tea")` | adds `"tea"` at the end of the list |
| `len(scores)` | the number of items |
| `"Arabic" in languages` | `True` when the value is one of the items |
| `sorted(heights)` | a new list in order; `heights` does not change |
| `ages.sort()` | puts the list `ages` itself in order |

## What comes next

In this workshop, your code worked with one item at a time, and you
wrote the index of each item yourself. A real list can have thousands
of items. The next workshop, **Doing it again**, shows how a program
repeats the same lines for every item of a list.

Click `Finish` at the bottom of this panel.
