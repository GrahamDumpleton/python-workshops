---
title: What you have learned
---

# What you have learned

Your programs can now find a value by a key. You have made
dictionaries, looked up values, added and changed pairs, counted the
items of a list, and written a function that uses a dictionary of
prices.

## The ideas

- A **dictionary** holds **pairs**. Each pair is a **key** and the
  **value** that the dictionary keeps for that key. You find a value
  by its key, and not by its position.

- To **look up** a value, you write the dictionary and then the key
  in square brackets. The key must be exactly the same as the key in
  the dictionary.

- A lookup with a key that does not exist stops with a `KeyError`. The
  last line of the error message shows the key that Python could not
  find.

- The method `get()` looks up a key and never stops with an error. For
  a key that does not exist it gives `None`, or the **default** that
  you give as the second argument.

- An assignment with a key on the left side adds a pair when the key
  does not exist, and replaces the value when the key exists. Each key
  appears only one time.

- The word `in` tests whether a key is in a dictionary. It looks at
  the keys only. The function `len()` gives the number of pairs.

- A dictionary can count the items of a list. Each different item
  becomes a key, and its value is the count.

## The code

| Code | What it does |
|------|--------------|
| `menu = {"soup": 4, "tea": 2}` | makes a dictionary of two pairs |
| `menu = {}` | makes an empty dictionary |
| `menu["soup"]` | gives the value of the key `"soup"`, or stops with a `KeyError` |
| `menu.get("cake")` | gives the value of the key, or `None` when the key does not exist |
| `menu.get("cake", 0)` | gives the value of the key, or `0` when the key does not exist |
| `menu["cake"] = 5` | adds the key with this value, or replaces the value of the key |
| `"soup" in menu` | gives `True` when the key exists, and `False` when it does not |
| `len(menu)` | gives the number of pairs |
| `counts[word] = counts.get(word, 0) + 1` | inside a loop, counts how many times each item appears |

## What comes next

A list keeps values in order. A dictionary keeps each value with a
key. Python has two more ways to keep several values together.

The next workshop, **Pairs and unique things**, shows them. One keeps
a few values that belong together and do not change. The other keeps
each value only one time, however many times you add it.

Click `Finish` at the bottom of this panel.
