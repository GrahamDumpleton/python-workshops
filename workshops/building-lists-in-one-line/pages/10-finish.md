---
title: What you have learned
---

# What you have learned

You can now build a new list or a new dictionary in one line. You
wrote each comprehension from the loop that it replaces, and you
wrote a loop from a comprehension that was too long.

## The ideas

- A loop that builds a new list has three parts: an empty list, a
  loop, and `.append()` in the block of the loop.

- A **list comprehension** is one line of code that builds a new list
  from another list. It has square brackets around it. It does the
  same work as that loop, without the empty list and `.append()`.

- The expression at the start of a comprehension says what each new
  item is. It can be any expression that uses the loop name.

- A condition at the end, after the word `if`, chooses items. The new
  list gets a new item only when the condition is true.

- In each pass, Python does the `for` part first, then the `if` part,
  and then the expression at the start.

- A **dictionary comprehension** builds a new dictionary. It has curly
  brackets around it, and a key, a colon and a value at its start.

- A comprehension always builds a new value. The list or dictionary
  that the items come from does not change.

- A loop is clearer when the work for each item needs more than one
  step, when the line becomes long, or when you are not building a
  list or a dictionary.

## The code

| Code | What it does |
|------|--------------|
| `[fare * 2 for fare in fares]` | builds a list with each item of `fares` multiplied by 2 |
| `[guest.upper() for guest in guests]` | builds a list with each string of `guests` in capital letters |
| `[len(fruit) for fruit in fruits]` | builds a list with the length of each string of `fruits` |
| `[reading for reading in readings if reading > 0]` | builds a list with only the items of `readings` that are greater than 0 |
| `[item - 5 for item in shelf if item > 10]` | keeps only the items of `shelf` that are greater than 10, and subtracts 5 from each of them |
| `{pet: len(pet) for pet in pets}` | builds a dictionary in which each key is an item of `pets`, and each value is its length |
| `{dish: cost * 2 for dish, cost in menu.items()}` | builds a dictionary with the same keys as `menu`, and each value multiplied by 2 |

## What comes next

Every comprehension of this workshop built a new list, and the first
list did not change. That difference, between a new list and a list
that is changed, matters more than it seems.

The next workshop, **Two names, one list**, shows what happens when
two names refer to the same list, and one of them is used to change
it. This is the cause of many mistakes that are difficult to find, and
in that workshop you meet them on purpose.

Click `Finish` at the bottom of this panel.
