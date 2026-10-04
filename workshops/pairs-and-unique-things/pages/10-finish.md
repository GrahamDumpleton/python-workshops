---
title: What you have learned
---

# What you have learned

You now know four kinds of value that hold several values: the list,
the dictionary, the tuple and the set. In this workshop you wrote
programs with tuples and sets, and a function that returns two values.

## The ideas

- A **tuple** holds a fixed group of values that belong together, in
  order. You write it with parentheses and commas.

- You read one item of a tuple with an index, in the same way as for a
  list. Python counts from `0`.

- A tuple cannot be changed. To get another group of values, you make
  a new tuple.

- **Unpacking** gives each item of a tuple a name of its own, in one
  assignment. The number of names must be the same as the number of
  items.

- A function returns more than one value as a tuple. The code that
  calls the function can unpack the tuple in the same line.

- A **set** holds each value only once. `set()` of a list gives a set
  without the duplicates.

- A set has no order and no index. Use `sorted()` when you need the
  items in order.

- The method `add` puts a value in a set, and the operator `in` asks
  whether the set holds a value.

- The operator `&` gives the values that are in both sets. The
  operator `|` gives the values that are in either set.

## The code

| Code | What it does |
|------|--------------|
| `date = (2026, 10, 4)` | creates a tuple of three items |
| `date[0]` | the first item of the tuple |
| `year, month, day = date` | unpacks the tuple into three names |
| `return hours, minutes` | in a function, returns a tuple of two values |
| `hours, minutes = hours_and_minutes(135)` | calls the function and unpacks its return value |
| `set(visits)` | a new set with each different item of the list `visits` |
| `{1, 4, 6}` | a set of three items |
| `set()` | a set that holds no items |
| `colours.add("green")` | puts the value in the set, if the set does not hold it yet |
| `"green" in colours` | `True` when the set holds the value |
| `monday & friday` | a new set with the values that are in both sets |
| `monday \| friday` | a new set with the values that are in either set |
| `sorted(colours)` | a new list with the items of the set in order |

## Which one to use

| You have | Use |
|----------|-----|
| many values of the same kind, in an order | a list |
| values that you look up by a key | a dictionary |
| a few values that belong together and do not change | a tuple |
| values where only "is it here?" matters, each one time | a set |

## What comes next

The next workshop, **Looping over anything**, shows that a `for` loop
works with more than lists. You will loop over strings and
dictionaries, and you will use unpacking inside the loop to get two
values in each pass.

Click `Finish` at the bottom of this panel.
