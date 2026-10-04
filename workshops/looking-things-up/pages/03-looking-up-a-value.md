---
title: Looking up a value
requires: [quiz:predict-ages, verify:ages-ran, verify:osaka-distance]
---

# Looking up a value

To **look up** a value means to find it in a dictionary with its key.
This is the reason a dictionary exists: you give the key, and Python
gives you the value that belongs to it.

You write the name of the dictionary, and then the key inside square
brackets:

```python
menu["rice"]
```

You have seen square brackets with a list, where they hold an index,
such as `dishes[1]`. With a dictionary, the square brackets hold a key
instead of an index. Python finds the pair that has this key, and
gives the value of that pair.

## Predict the value

Look at this cell. Do not run it yet. The dictionary holds the ages of
three people.

```python
ages = {"Aiko": 31, "Tunde": 27, "Mariam": 45}
print(ages["Tunde"])
```

```{quiz}
:id: predict-ages
:type: text
:title: Predict the value
question: What does the notebook show under this cell when it runs?
answer: "27"
wrong:
  - { text: "Tunde", explanation: "`\"Tunde\"` is the key. The square brackets give the value that belongs to the key." }
  - { text: "1", explanation: "`1` is the position of the pair, counted from 0. A dictionary does not give positions. It gives the value that belongs to the key." }
  - { text: "31", explanation: "`31` is the value of the key `\"Aiko\"`. Find the pair whose key is `\"Tunde\"`." }
  - { text: "45", explanation: "`45` is the value of the key `\"Mariam\"`. Find the pair whose key is `\"Tunde\"`." }
otherwise: 'Find the pair whose key is `"Tunde"`. The value is the number after the colon of that pair.'
explanation: 'Python finds the pair that has the key `"Tunde"`, and gives its value, which is `27`.'
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: ages-not-run
:check: ages-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-ages
:title: Add the cell that looks up the age of Tunde, and run it
:path: {{ notebook }}
:tags: [ages]
:run: true
ages = {"Aiko": 31, "Tunde": 27, "Mariam": 45}
print(ages["Tunde"])
```

```{verify}
:id: ages-ran
:label: The cell looked up a value with its key
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed ages
if globals().get("ages") == {"Aiko": 31, "Tunde": 27, "Mariam": 45}:
    print("The cell ran. It looked up the key Tunde in the dictionary, and showed the value 27.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("ages") == {"Aiko": 31, "Tunde": 27, "Mariam": 45}
```

The order of the pairs did not matter. Python did not count to the
second pair. It used the key to find the value.

## Your task

Three friends live in different cities. A dictionary holds the
distance from each city to the nearest airport, in kilometres. Write a
program that looks up one of the distances.

Your program must do these three things, in this order:

1. Give the name `distances` to the dictionary
   `{"Lagos": 12, "Osaka": 7, "Lima": 20}`.

2. Look up the value of the key `"Osaka"` in `distances`, and give
   that value the name `osaka_distance`.

3. Show the value of `osaka_distance` with `print()`.

When the program is correct, the output under the cell is:

```
7
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-osaka
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [osaka]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
Look at the cell with the ages. Its first line makes a dictionary, and
its second line looks up a value. Your first line is the same kind of
line, with the name `distances` and the three cities.
```

```{hint}
:title: Hint: the lookup
The second line of your program is an assignment. The right side is
the lookup: `distances["Osaka"]`. The left side is the new name:
`osaka_distance = distances["Osaka"]`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: osaka-not-started
:check: osaka-distance
:expect: The name distances does not exist yet
```

````{attempt}
:id: osaka-a-list
:check: osaka-distance
:expect: is not a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
distances = ["Lagos", 12, "Osaka", 7, "Lima", 20]
```
````

````{attempt}
:id: osaka-wrong-dictionary
:check: osaka-distance
:expect: but it must refer to the dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
distances = {"Lagos": 12, "Osaka": 70, "Lima": 20}
```
````

````{attempt}
:id: osaka-dictionary-only
:check: osaka-distance
:expect: The name osaka_distance does not exist yet

```{cell-insert}
:path: {{ notebook }}
:run: true
distances = {"Lagos": 12, "Osaka": 7, "Lima": 20}
```
````

````{attempt}
:id: osaka-other-key
:check: osaka-distance
:expect: That is the value of the key Lima

```{cell-insert}
:path: {{ notebook }}
:run: true
distances = {"Lagos": 12, "Osaka": 7, "Lima": 20}
osaka_distance = distances["Lima"]
print(osaka_distance)
```
````

````{attempt}
:id: osaka-the-key
:check: osaka-distance
:expect: but it must refer to 7

```{cell-insert}
:path: {{ notebook }}
:run: true
distances = {"Lagos": 12, "Osaka": 7, "Lima": 20}
osaka_distance = "Osaka"
print(osaka_distance)
```
````

````{hint}
:title: Show me a solution
:unlock: "osaka-distance" in failed_checks or "osaka-distance" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-osaka-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [osaka-solution]
:run: true
distances = {"Lagos": 12, "Osaka": 7, "Lima": 20}
osaka_distance = distances["Osaka"]
print(osaka_distance)
```
````

```{verify}
:id: osaka-distance
:label: Your program looks up the distance for Osaka
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed osaka; cell-executed osaka-solution
if "distances" not in globals():
    print("The name distances does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes the dictionary. Then hold Shift and press Enter to run the cell.")
elif type(distances) is not dict:
    print("The name distances exists, but its value is not a dictionary. A dictionary begins with { and ends with }, and each key is followed by a colon and its value. Correct the first line of your program. Then run the cell again.")
elif distances != {"Lagos": 12, "Osaka": 7, "Lima": 20}:
    print(f"The name distances refers to {distances} but it must refer to the dictionary {{'Lagos': 12, 'Osaka': 7, 'Lima': 20}}. Check each key and each value in the first line of your program. Then run the cell again.")
elif "osaka_distance" not in globals():
    print("The name osaka_distance does not exist yet. Add a line that looks up the key Osaka and gives the value this name. Check the spelling of the name. Then run the cell again.")
elif osaka_distance == 7 and type(osaka_distance) is int:
    print("Correct. Your program looked up the key Osaka, and the name osaka_distance refers to 7.")
elif type(osaka_distance) is int and osaka_distance in (12, 20):
    print(f"The name osaka_distance refers to {osaka_distance}. That is the value of the key {'Lagos' if osaka_distance == 12 else 'Lima'}. Write the key Osaka inside the square brackets. Then run the cell again.")
else:
    print(f"The name osaka_distance refers to {osaka_distance!r} but it must refer to 7. Write the name of the dictionary, and then the key Osaka inside square brackets. Then run the cell again.")
"distances" in globals() and "osaka_distance" in globals() and distances == {"Lagos": 12, "Osaka": 7, "Lima": 20} and type(osaka_distance) is int and osaka_distance == 7
```
