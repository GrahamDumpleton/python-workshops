---
title: Counting with a dictionary
requires: [quiz:predict-counts, verify:counts-ran, verify:days-counted]
---

# Counting with a dictionary

A common question about a list is: how many times does each item
appear? How many votes did each answer get? How many days of the week
had rain? How many times does each word appear in a text?

You know how to count one thing with a loop: a count starts from `0`,
and the loop adds `1` each time it finds the thing. But here you do
not know which things are in the list before you read it. You need one
count for each different item, however many there are.

A dictionary is the right tool for this. Each different item becomes a key, and
the value of the key is the count for that item.

Think of counting votes on paper. You read the votes one at a time.
When you read a name that is not on your paper yet, you write the
name with the number `1`. When you read a name that is on your paper,
you add `1` to its number.

## The line that counts

A reminder: a `for` loop runs its block one time for each item of a
list. Each run is called a pass, and the loop name refers to the item
of that pass. The lines of the block begin with four spaces.

The counting needs only one line in the block of the loop. In this
line, `counts` is the dictionary, and `word` is the item of this pass:

```python
counts[word] = counts.get(word, 0) + 1
```

Python calculates the right side first:

1. `counts.get(word, 0)` gives the count so far for this item. When
   the item is not a key yet, it gives the default `0`.

2. `+ 1` adds one to that count.

Then the left side, `counts[word] =`, keeps the result as the value of
the key. When the key does not exist, this adds a new pair. When the
key exists, this replaces the old count.

So one line does the work of both cases on the paper. You do not need
an `if`.

## Predict the value

Look at this cell. Do not run it yet.

```python
words = ["red", "blue", "red", "green", "red", "blue"]
counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1
print(counts["red"])
print(counts)
```

```{quiz}
:id: predict-counts
:type: text
:title: Predict the first line of output
question: "What is the first line of output, from `print(counts[\"red\"])`?"
answer: "3"
wrong:
  - { text: "1", explanation: "The first pass with `\"red\"` gives the count `1`. But `\"red\"` appears in the list more than one time, and each pass with it adds `1`." }
  - { text: "6", explanation: "`6` is the number of items in the list. The dictionary keeps a separate count for each different item." }
  - { text: "0", explanation: "`0` is only the default, the count before the first `\"red\"`. Each pass with `\"red\"` adds `1` to it." }
  - { text: "2", explanation: "Count again. The string `\"red\"` is the first, the third and the fifth item of the list." }
otherwise: 'The value of the key `"red"` is the number of times that `"red"` appears in the list `words`.'
explanation: 'The string `"red"` appears three times in the list, so the loop adds `1` to its count three times.'
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: counts-not-run
:check: counts-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-counts
:title: Add the cell that counts each word, and run it
:path: {{ notebook }}
:tags: [counts]
:run: true
words = ["red", "blue", "red", "green", "red", "blue"]
counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1
print(counts["red"])
print(counts)
```

The output is:

```
3
{'red': 3, 'blue': 2, 'green': 1}
```

```{verify}
:id: counts-ran
:label: The loop counted each word
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed counts
if globals().get("counts") == {"red": 3, "blue": 2, "green": 1}:
    print("The cell ran. The dictionary counts has one key for each different word, and each value is the number of times that the word appears.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("counts") == {"red": 3, "blue": 2, "green": 1}
```

## What happened

The dictionary `counts` was empty before the loop. The loop made six
passes, one for each item of the list.

| Pass | `word` | `counts.get(word, 0)` | `counts` after the pass |
|------|--------|-----------------------|-------------------------|
| 1 | `"red"` | `0` | `{'red': 1}` |
| 2 | `"blue"` | `0` | `{'red': 1, 'blue': 1}` |
| 3 | `"red"` | `1` | `{'red': 2, 'blue': 1}` |
| 4 | `"green"` | `0` | `{'red': 2, 'blue': 1, 'green': 1}` |
| 5 | `"red"` | `2` | `{'red': 3, 'blue': 1, 'green': 1}` |
| 6 | `"blue"` | `1` | `{'red': 3, 'blue': 2, 'green': 1}` |

In passes 1, 2 and 4 the word was new, so `get()` gave the default
`0`, and the line added a pair with the count `1`. In passes 3, 5 and
6 the word was already a key, so the line replaced its count with a
count that is larger by one.

The line `counts = {}` is before the loop, so it runs one time. Inside
the loop, it would make the dictionary empty again in every pass.

## Your task

A list holds the weather of each day of one week. Write a program
that counts how many days had each kind of weather.

Your program must do these four things, in this order:

1. Give the name `weather` to the list
   `["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]`.

2. Give the name `days` to an empty dictionary.

3. Use a `for` loop over `weather` that counts each item in the
   dictionary `days`. You can choose the loop name. A good loop name
   is `kind`.

4. After the loop, show the dictionary `days` with `print()`.

When the program is correct, the output under the cell is:

```
{'sun': 4, 'rain': 2, 'cloud': 1}
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-days
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [days]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program. The
line in the block of the loop must begin with four spaces. To write
the line after the loop, remove the spaces at the beginning of the
line. Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell that counts the words. Your program has the same four
parts: the list, the empty dictionary, the loop with one line in its
block, and the `print()` line after the loop. Use the names `weather`
and `days`.
```

```{hint}
:title: Hint: the loop
The loop has two lines. The first line is `for kind in weather:`. The
second line begins with four spaces, and counts the item:
`days[kind] = days.get(kind, 0) + 1`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: days-not-started
:check: days-counted
:expect: The name weather does not exist yet
```

````{attempt}
:id: days-wrong-list
:check: days-counted
:expect: but it must refer to the list

```{cell-insert}
:path: {{ notebook }}
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain"]
```
````

````{attempt}
:id: days-list-only
:check: days-counted
:expect: The name days does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]
```
````

````{attempt}
:id: days-a-list
:check: days-counted
:expect: is not a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]
days = []
```
````

````{attempt}
:id: days-nothing-counted
:check: days-counted
:expect: The dictionary days is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]
days = {}
for kind in weather:
    print(kind)
print(days)
```
````

````{attempt}
:id: days-always-one
:check: days-counted
:expect: Every count in days is 1

```{cell-insert}
:path: {{ notebook }}
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]
days = {}
for kind in weather:
    days[kind] = 1
print(days)
```
````

````{attempt}
:id: days-default-one
:check: days-counted
:expect: Every count in days is larger by one

```{cell-insert}
:path: {{ notebook }}
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]
days = {}
for kind in weather:
    days[kind] = days.get(kind, 1) + 1
print(days)
```
````

````{attempt}
:id: days-emptied-in-loop
:check: days-counted
:expect: holds only the last item

```{cell-insert}
:path: {{ notebook }}
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]
for kind in weather:
    days = {}
    days[kind] = days.get(kind, 0) + 1
print(days)
```
````

````{attempt}
:id: days-added-two
:check: days-counted
:expect: but it must refer to

```{cell-insert}
:path: {{ notebook }}
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]
days = {}
for kind in weather:
    days[kind] = days.get(kind, 0) + 2
print(days)
```
````

````{attempt}
:id: days-with-if
:check: days-counted
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]
days = {}
for day in weather:
    if day in days:
        days[day] = days[day] + 1
    else:
        days[day] = 1
print(days)
```
````

````{hint}
:title: Show me a solution
:unlock: "days-counted" in failed_checks or "days-counted" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-days-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [days-solution]
:run: true
weather = ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]
days = {}
for kind in weather:
    days[kind] = days.get(kind, 0) + 1
print(days)
```
````

```{verify}
:id: days-counted
:label: Your loop counts the days of each kind of weather
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed days; cell-executed days-solution
if "weather" not in globals():
    print("The name weather does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the list. Then hold Shift and press Enter to run the cell.")
elif weather != ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"]:
    print(f"The name weather refers to {weather} but it must refer to the list ['sun', 'rain', 'sun', 'sun', 'cloud', 'rain', 'sun']. Correct the first line of your program. Then run the cell again.")
elif "days" not in globals():
    print("The name days does not exist yet. Add a line before the loop that makes an empty dictionary: days = {}. Check the spelling. Then run the cell again.")
elif type(days) is not dict:
    print("The name days exists, but its value is not a dictionary. An empty dictionary is written with curly brackets: days = {}. Square brackets make a list. Correct that line. Then run the cell again.")
elif days == {"sun": 4, "rain": 2, "cloud": 1}:
    print("Correct. Your loop counted 4 days of sun, 2 days of rain and 1 day of cloud.")
elif len(days) == 0:
    print("The dictionary days is empty, so the loop does not put anything in it. Inside the loop, write a line that begins with four spaces and counts the item: days[kind] = days.get(kind, 0) + 1. Then run the cell again.")
elif days == {"sun": 1}:
    print("The dictionary days holds only the last item of the list. There are two usual reasons. The line days = {} may be inside the loop: move it before the loop, so that it runs one time. Or the line that counts may begin without spaces, so that it runs one time after the loop: give it four spaces. Then run the cell again.")
elif days == {"sun": 1, "rain": 1, "cloud": 1}:
    print("Every count in days is 1, so the loop does not add to the count that an item already has. The line in the loop must read the count so far and add one to it: days[kind] = days.get(kind, 0) + 1. Then run the cell again.")
elif days == {"sun": 5, "rain": 3, "cloud": 2}:
    print("Every count in days is larger by one than it must be. The count of an item that is not a key yet is 0, so the default in get() must be 0: days.get(kind, 0). Then run the cell again.")
else:
    print(f"The name days refers to {days} but it must refer to {{'sun': 4, 'rain': 2, 'cloud': 1}}. The line in the loop must be days[kind] = days.get(kind, 0) + 1. Then run the cell again.")
"weather" in globals() and "days" in globals() and weather == ["sun", "rain", "sun", "sun", "cloud", "rain", "sun"] and type(days) is dict and days == {"sun": 4, "rain": 2, "cloud": 1}
```
