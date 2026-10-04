---
title: What you have learned
---

# What you have learned

You can now use a `for` loop with strings and dictionaries as well as
lists, and you know two functions that make loops shorter and
clearer. You typed most of the code yourself, and you wrote a
function that uses a loop over a dictionary.

## The ideas

- A `for` loop works with more than lists. It makes one pass for each
  part of the value that it works through.

- A loop over a **string** gives the **characters**, one in each pass.

- A loop over a **dictionary** gives the **keys**, in the order in
  which they were added. The value that belongs to a key is
  `dictionary[key]`.

- The method `.values()` gives the values of a dictionary, without
  the keys.

- The method `.items()` gives each key together with its value, as a
  **tuple**. A loop with two loop names **unpacks** the tuple: the
  first loop name refers to the key, and the second loop name refers
  to the value.

- The function `enumerate()` gives a number with each item. The
  numbers begin at `0`, or at the number that you write after the
  list.

- The function `zip()` puts two lists together. In each pass, it
  gives the next item of each list. It stops when the shorter list
  has no more items.

- `zip()` replaces the loop `for i in range(len(items)):` when you
  need the items of two lists together.

## The code

| Code | What it does |
|------|--------------|
| `for letter in drink:` | runs the block one time for each character of the string `drink` |
| `for product in stock:` | runs the block one time for each key of the dictionary `stock` |
| `for seat_count in seats.values():` | runs the block one time for each value of the dictionary `seats` |
| `for dish, price in menu.items():` | runs the block one time for each pair, with the key as `dish` and the value as `price` |
| `for number, runner in enumerate(runners):` | runs the block one time for each item, with `number` as `0`, `1`, `2` and so on |
| `for place, finisher in enumerate(finishers, 1):` | does the same, but the numbers begin at `1` |
| `for town, height in zip(towns, heights):` | runs the block one time for each position, with one item from each list |

## What comes next

Many of the loops in this workshop did the same work: they started
with an empty list, and added a value to it in each pass. Python has
a shorter way to write that kind of loop.

The next workshop, **Building lists in one line**, shows you how to
build a new list from another list in one line of code.

Click `Finish` at the bottom of this panel.
