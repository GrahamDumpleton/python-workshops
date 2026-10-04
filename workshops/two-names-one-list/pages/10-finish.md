---
title: What you have learned
---

# What you have learned

You have met, on purpose, the mistakes that come from two names for
one value. You predicted what each cell shows, you saw why Python did
what it did, and you corrected each mistake yourself. When one of
these mistakes appears in your own program, you now know its reason.

## The ideas

- A name is a label that is tied to a value. An assignment such as
  `b = a` makes no copy. It ties a second label to the same value.

- Two lists can be **equal**, which means that they hold equal items,
  and still not be **the same** list. `==` tests whether two values
  are equal. `is` tests whether two names refer to the same value.

- `.copy()` makes a **copy** of a list: a new list that holds the
  same items.

- A **mutable** value can change after it is made. Lists,
  dictionaries and sets are mutable. An **immutable** value can never
  change. Numbers, strings, booleans and tuples are immutable.

- Changing a value and moving a label are two different actions.
  `append` changes a list. A line that begins with a name and `=`
  moves a label.

- A parameter is one more label on the argument. A function that
  changes a list that it is given changes the list of its caller.
  A function that returns a new list must make a copy first.

- `.copy()` copies one level only. A copy of a list of lists shares
  the inner lists with the first list. To share nothing, copy each
  inner list too.

- A **local name** is made inside a function, and exists only while
  the function runs. A **global name** is made outside every
  function.

- A function can read a global name. An assignment inside a function
  makes a local name, and does not move a global name with the same
  spelling. A function gives a new value to its caller with `return`.

## The code

| Code | What it does |
|------|--------------|
| `tuesday = monday` | ties a second name to the same list, and makes no copy |
| `same_trip is first_trip` | gives `True` when the two names refer to the same value |
| `other_trip == first_trip` | gives `True` when the two values are equal |
| `longer_stops = stops.copy()` | makes a new list with the same items |
| `result = things.copy()` | inside a function, makes a list that the function can change |
| `saved_rounds.append(one_round.copy())` | inside a loop, adds a copy of one inner list to a new outer list |
| `floor = room_area(4, 5)` | gives a global name to the return value of a function |
| `shelf = sell_five(shelf)` | makes a global name refer to the value that a function returns |

## What comes next

You now know functions, dictionaries, tuples, sets, loops over every
kind of value, and how names and values behave. That is enough to
build a program that works with real text.

The next workshop, **Counting words**, is the last workshop of
**Python functions and data**. In it you build a program that counts
the words of some short stories, finds the most common words, and
finds the words that appear in every story. You get less help than
before, because you can now do more of the work yourself.

Click `Finish` at the bottom of this panel.
