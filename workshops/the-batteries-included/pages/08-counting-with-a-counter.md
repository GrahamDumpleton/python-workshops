---
title: Counting with a Counter
requires: [verify:january-counts-ran, verify:top-two-ran, verify:top-category]
---

# Counting with a Counter

The module `collections` holds types that keep several values
together, as a list and a dictionary do. One of them has the name
`Counter`. A `Counter` counts how many times each value appears in a
list.

## Why it exists

Counting is one of the most common things that a program does with
data. You can count with a dictionary and a loop. A dictionary keeps
each value together with a key, and the loop adds `1` to the value of
a key each time it sees that key:

```python
counts = {}
for category in categories:
    counts[category] = counts.get(category, 0) + 1
```

These three lines are correct, and you can always write them. But
many programs need them, so the standard library has them ready. A
`Counter` does the same work in one line, and it can also give the
most common values, which needs more lines when you write it yourself.

## Count the items of a list

In January 2026, Mariam made 13 purchases. The list in the cell below
holds the category of each purchase, in the order of the file.

Click the action below. It adds a cell that counts the categories, and
runs the cell.

```{attempt}
:id: january-counts-not-run
:check: january-counts-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-january-counts
:title: Add a cell that counts the categories of January, and run it
:path: {{ notebook }}
:tags: [january-counts]
:run: true
from collections import Counter

january = ["rent", "food", "transport", "phone", "food", "hobbies", "transport", "food", "clothes", "food", "food", "transport", "food"]
january_counts = Counter(january)
print(january_counts)
print(january_counts["food"])
print(january_counts["holidays"])
```

The output is:

```
Counter({'food': 6, 'transport': 3, 'rent': 1, 'phone': 1, 'hobbies': 1, 'clothes': 1})
6
0
```

```{verify}
:id: january-counts-ran
:label: The cell counted the categories
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed january-counts
if globals().get("january_counts") == {"food": 6, "transport": 3, "rent": 1, "phone": 1, "hobbies": 1, "clothes": 1}:
    print("The cell ran. The Counter holds six categories, and the count of food is 6.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("january_counts") == {"food": 6, "transport": 3, "rent": 1, "phone": 1, "hobbies": 1, "clothes": 1}
```

## What happened

- `Counter(january)` looked at every item of the list, and counted how
  many times each different item appears. The name `Counter` begins
  with a capital letter, and Python treats `Counter` and `counter` as
  two different names.

- The first line of output shows the `Counter`. It looks like a
  dictionary with the word `Counter` around it. Each key is a
  category, and its value is the count. The largest count comes
  first.

- `january_counts["food"]` gave `6`. You look up a count with square
  brackets and a key, as you do with a dictionary.

- `january_counts["holidays"]` gave `0`. Here a `Counter` is different
  from a dictionary. A dictionary stops with a `KeyError` for a key
  that does not exist. A `Counter` gives `0`, because something that
  it never saw has the count zero.

## The most common values

The method `most_common()` of a `Counter` gives the values that
appear most often. Its argument says how many of them you want.

```{attempt}
:id: top-two-not-run
:check: top-two-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-top-two
:title: Add a cell that asks for the two most common categories, and run it
:path: {{ notebook }}
:tags: [top-two]
:run: true
top_two = january_counts.most_common(2)
print(top_two)
print(top_two[0])
```

The output is:

```
[('food', 6), ('transport', 3)]
('food', 6)
```

```{verify}
:id: top-two-ran
:label: The cell asked for the two most common categories
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed top-two
if globals().get("top_two") == [("food", 6), ("transport", 3)]:
    print("The cell ran. The two most common categories are food, with 6 purchases, and transport, with 3 purchases.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("top_two") == [("food", 6), ("transport", 3)]
```

`most_common(2)` returned a list of two items, with the most common
first. Each item is a **tuple**, which is a group of values that
belong together, written with parentheses. Here each tuple is a pair:
the category, and then its count.

Look at the brackets with care. `most_common()` always returns a
list, and that is also true when you ask for one value.
`january_counts.most_common(1)` gives `[('food', 6)]`, which is a list
that holds one tuple. To read the name of the category, you take the
first item of the list, and then the first value of that tuple.

## Your task

Write a function that finds the category in which Mariam made the
most purchases.

Your function must be like this:

- Its name is `top_category`.

- It has one parameter, `categories`, which is a list of strings.

- It returns the string that appears most often in the list. It
  returns only the string, without the count.

Two examples:

| Call | Return value |
|------|--------------|
| `top_category(["food", "rent", "food", "transport"])` | `"food"` |
| `top_category(["bus", "train", "bus", "taxi", "train", "train"])` | `"train"` |

The function must work with any list of strings in which one string
appears more often than every other string.

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-top-category
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [top-category]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function.
Then run the cell: hold `Shift` and press `Enter`. To try your
function, you can add the line `print(top_category(january))` under
it, without spaces at the start. The check calls your function with
several lists.

```{hint}
:title: Hint: three steps
First make a `Counter` from the list `categories`. Then call
`most_common(1)` on it, which gives a list that holds one tuple. Then
take the string from that tuple and return it.
```

```{hint}
:title: Hint: from the list to the string
If the name `top` refers to the result of `most_common(1)`, then
`top[0]` is the tuple, such as `('food', 6)`, and `top[0][0]` is the
string `'food'`. The second `[0]` reads the first value of the tuple.
```

```{hint}
:title: Hint: the lines of the function
The first line is `def top_category(categories):`. The second line is
`top = Counter(categories).most_common(1)`. The third line is
`return top[0][0]`. The second line and the third line begin with four
spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: top-category-not-started
:check: top-category
:expect: The function top_category does not exist yet
```

````{attempt}
:id: top-category-not-a-function
:check: top-category
:expect: is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
top_category = january_counts.most_common(1)[0][0]
```
````

````{attempt}
:id: top-category-no-parameter
:check: top-category
:expect: but it has 0

```{cell-insert}
:path: {{ notebook }}
:run: true
def top_category():
    return january_counts.most_common(1)[0][0]
```
````

````{attempt}
:id: top-category-error
:check: top-category
:expect: stopped with an AttributeError

```{cell-insert}
:path: {{ notebook }}
:run: true
def top_category(categories):
    return categories.most_common(1)[0][0]
```
````

````{attempt}
:id: top-category-prints
:check: top-category
:expect: shows the category with print(), but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def top_category(categories):
    top = Counter(categories).most_common(1)
    print(top[0][0])
```
````

````{attempt}
:id: top-category-no-return
:check: top-category
:expect: A function with no return line gives None

```{cell-insert}
:path: {{ notebook }}
:run: true
def top_category(categories):
    top = Counter(categories).most_common(1)
```
````

````{attempt}
:id: top-category-list
:check: top-category
:expect: That is a list that holds one tuple

```{cell-insert}
:path: {{ notebook }}
:run: true
def top_category(categories):
    return Counter(categories).most_common(1)
```
````

````{attempt}
:id: top-category-tuple
:check: top-category
:expect: That is a tuple of the category and its count

```{cell-insert}
:path: {{ notebook }}
:run: true
def top_category(categories):
    top = Counter(categories).most_common(1)
    return top[0]
```
````

````{attempt}
:id: top-category-count
:check: top-category
:expect: That is the count

```{cell-insert}
:path: {{ notebook }}
:run: true
def top_category(categories):
    top = Counter(categories).most_common(1)
    return top[0][1]
```
````

````{attempt}
:id: top-category-first-item
:check: top-category
:expect: gives 'bus' but it must give 'train'

```{cell-insert}
:path: {{ notebook }}
:run: true
def top_category(categories):
    return categories[0]
```
````

````{attempt}
:id: top-category-with-loop
:check: top-category
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def top_category(categories):
    counts = {}
    for category in categories:
        counts[category] = counts.get(category, 0) + 1
    best = ""
    best_count = 0
    for category in counts:
        if counts[category] > best_count:
            best = category
            best_count = counts[category]
    return best
```
````

````{hint}
:title: Show me a solution
:unlock: "top-category" in failed_checks or "top-category" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-top-category-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [top-category-solution]
:run: true
def top_category(categories):
    top = Counter(categories).most_common(1)
    return top[0][0]

print(top_category(["food", "rent", "food", "transport"]))
print(top_category(january))
```
````

```{verify}
:id: top-category
:label: Your function gives the most common category
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed top-category; cell-executed top-category-solution
def _workshop_check():
    import contextlib, inspect, io
    if "top_category" not in globals():
        print("The function top_category does not exist yet. Write it under the comment in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    top_category = globals()["top_category"]
    if not callable(top_category):
        print("The name top_category exists, but its value is not a function. Begin your cell with the line def top_category(categories): and write the lines of the function under it. Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(top_category).parameters)
    except (TypeError, ValueError):
        count = 1
    if count != 1:
        print(f"The function top_category must have one parameter, the list of categories, but it has {count}. Make the first line def top_category(categories): and use the name categories inside the function. Then run the cell again.")
        return False
    cases = [
        (["food", "rent", "food", "transport"], "food", 2),
        (["bus", "train", "bus", "taxi", "train", "train"], "train", 3),
        (["tea", "milk", "milk", "milk", "tea"], "milk", 3),
    ]
    for categories, expected, times in cases:
        call = f"top_category({categories!r})"
        shown = io.StringIO()
        try:
            with contextlib.redirect_stdout(shown):
                result = top_category(list(categories))
        except Exception as error:
            kind = type(error).__name__
            kind = ("an " if kind[0] in "AEIOU" else "a ") + kind
            print(f"The function top_category stopped with {kind} when the check called {call}. The parameter categories is a list. Make a Counter from it first, with Counter(categories), and call most_common(1) on the Counter. Then run the cell again.")
            return False
        if result is None and shown.getvalue().strip() == expected:
            print("The function top_category shows the category with print(), but it does not return it. The code that calls the function gets None. Replace print() with a line that begins with return. Then run the cell again.")
            return False
        if result is None:
            print(f"{call} gives None but it must give {expected!r}. A function with no return line gives None. Add a line that begins with return and gives the most common string. Then run the cell again.")
            return False
        if type(result) is list:
            print(f"{call} gives {result!r} but it must give {expected!r}. That is a list that holds one tuple. Take the first item of the list with [0], and then the first value of that tuple with a second [0]. Then run the cell again.")
            return False
        if type(result) is tuple:
            print(f"{call} gives {result!r} but it must give {expected!r}. That is a tuple of the category and its count. Take the first value of the tuple with [0]. Then run the cell again.")
            return False
        if type(result) is int and result == times:
            print(f"{call} gives {result} but it must give {expected!r}. That is the count, which is the second value of the tuple. The category is the first value, at index 0. Return that value, and run the cell again.")
            return False
        if type(result) is not str or result != expected:
            print(f"{call} gives {result!r} but it must give {expected!r}. Make a Counter from the list categories, call most_common(1) on it, and return the string of the first tuple. Then run the cell again.")
            return False
    print("Correct. Your function counts the strings of the list and gives the most common one.")
    return True
globals().pop("_workshop_check")()
```
