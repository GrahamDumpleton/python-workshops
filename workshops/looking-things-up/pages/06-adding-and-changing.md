---
title: Adding and changing
requires: [quiz:predict-rooms, verify:rooms-ran, verify:seats-filled]
---

# Adding and changing

A dictionary can change after it is made. You can add a new pair, and
you can give a key a new value. A program needs this often: a
shop gets a new product, or the price of a product changes.

Think of the contacts in a telephone. When you meet a new person, you
add the name and the number. When a friend gets a new number, you
replace the old number. The name stays the same.

One kind of line does both. It is an assignment, with the dictionary
and a key on the left side:

```python
menu["cake"] = 5
```

Python looks for the key in the dictionary, and then does one of two
things:

- When the key does not exist, Python adds a new pair, with this key
  and this value.

- When the key exists, Python replaces the value of that key. The old
  value is gone. A key can have only one value.

## Predict the value

Look at this cell. Do not run it yet. The dictionary holds the area of
the rooms of a home, in square metres.

```python
rooms = {"kitchen": 20}
rooms["bedroom"] = 18
rooms["kitchen"] = 21
print(rooms["kitchen"])
print(rooms)
```

```{quiz}
:id: predict-rooms
:type: text
:title: Predict the first line of output
question: "What is the first line of output, from `print(rooms[\"kitchen\"])`?"
answer: "21"
wrong:
  - { text: "20", explanation: "`20` was the value at the start. The third line gives the key `\"kitchen\"` a new value, and the old value is gone." }
  - { text: "41", explanation: "An assignment does not add the new value to the old value. It replaces the old value." }
  - { text: "18", explanation: "`18` is the value of the key `\"bedroom\"`. Follow what happens to the key `\"kitchen\"`." }
otherwise: 'Follow the key `"kitchen"` line by line. It has a value on the first line, and it gets a new value on the third line.'
explanation: 'The key `"kitchen"` exists when the third line runs, so Python replaces its value. The new value is `21`.'
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: rooms-not-run
:check: rooms-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-rooms
:title: Add the cell that adds a pair and changes a value, and run it
:path: {{ notebook }}
:tags: [rooms]
:run: true
rooms = {"kitchen": 20}
rooms["bedroom"] = 18
rooms["kitchen"] = 21
print(rooms["kitchen"])
print(rooms)
```

The output is:

```
21
{'kitchen': 21, 'bedroom': 18}
```

```{verify}
:id: rooms-ran
:label: The cell added a pair and changed a value
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed rooms
if globals().get("rooms") == {"kitchen": 21, "bedroom": 18}:
    print("The cell ran. The dictionary rooms now holds two pairs, and the key kitchen has the new value 21.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("rooms") == {"kitchen": 21, "bedroom": 18}
```

## What happened

| Line | What Python did | The dictionary after the line |
|------|-----------------|-------------------------------|
| `rooms = {"kitchen": 20}` | made a dictionary of one pair | `{'kitchen': 20}` |
| `rooms["bedroom"] = 18` | the key `"bedroom"` did not exist, so Python added a pair | `{'kitchen': 20, 'bedroom': 18}` |
| `rooms["kitchen"] = 21` | the key `"kitchen"` existed, so Python replaced its value | `{'kitchen': 21, 'bedroom': 18}` |

The dictionary still has two pairs after the third line. The pair for
the kitchen stayed in its place, and only its value changed. A new
pair goes after the pairs that are already there.

## An empty dictionary

A program often starts with a dictionary that holds nothing, and adds
the pairs later. Two curly brackets with nothing between them make an
empty dictionary:

```python
menu = {}
```

## Your task

A dictionary holds the seat number of each passenger on a bus. Write a
program that starts with an empty dictionary, adds two passengers, and
then moves one of them to another seat.

Your program must do these five things, in this order:

1. Give the name `seats` to an empty dictionary.

2. Add the key `"Ravi"` with the value `14`.

3. Add the key `"Elena"` with the value `7`.

4. Ravi moves to seat 15. Change the value of the key `"Ravi"` to
   `15`.

5. Show the dictionary `seats` with `print()`.

When the program is correct, the output under the cell is:

```
{'Ravi': 15, 'Elena': 7}
```

The action below adds a new cell for your program.

```{cell-insert}
:id: insert-seats
:title: Add a cell for my program
:path: {{ notebook }}
:tags: [seats]
:run: false
# Write your program on the lines below this one.

```

Click on the empty line under the comment, and type your program.
Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: how to begin
The first line is `seats = {}`. Each of the next three lines is an
assignment that has the dictionary and a key on its left side, like
the line `rooms["bedroom"] = 18` in the cell above.
```

```{hint}
:title: Hint: adding and changing
The line that adds Ravi is `seats["Ravi"] = 14`. The line that adds
Elena has the same form. The line that changes the seat of Ravi also
has the same form, with the new value: `seats["Ravi"] = 15`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: seats-not-started
:check: seats-filled
:expect: The name seats does not exist yet
```

````{attempt}
:id: seats-a-list
:check: seats-filled
:expect: is not a dictionary

```{cell-insert}
:path: {{ notebook }}
:run: true
seats = []
```
````

````{attempt}
:id: seats-empty
:check: seats-filled
:expect: The dictionary seats is empty

```{cell-insert}
:path: {{ notebook }}
:run: true
seats = {}
print(seats)
```
````

````{attempt}
:id: seats-one-passenger
:check: seats-filled
:expect: has no key Elena

```{cell-insert}
:path: {{ notebook }}
:run: true
seats = {}
seats["Ravi"] = 14
seats["Ravi"] = 15
print(seats)
```
````

````{attempt}
:id: seats-not-moved
:check: seats-filled
:expect: The key Ravi still has the value 14

```{cell-insert}
:path: {{ notebook }}
:run: true
seats = {}
seats["Ravi"] = 14
seats["Elena"] = 7
print(seats)
```
````

````{attempt}
:id: seats-small-letter
:check: seats-filled
:expect: has a key that the task does not ask for

```{cell-insert}
:path: {{ notebook }}
:run: true
seats = {}
seats["Ravi"] = 14
seats["Elena"] = 7
seats["ravi"] = 15
print(seats)
```
````

````{attempt}
:id: seats-wrong-value
:check: seats-filled
:expect: but it must refer to

```{cell-insert}
:path: {{ notebook }}
:run: true
seats = {}
seats["Ravi"] = 14
seats["Elena"] = 17
seats["Ravi"] = 15
print(seats)
```
````

````{hint}
:title: Show me a solution
:unlock: "seats-filled" in failed_checks or "seats-filled" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-seats-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [seats-solution]
:run: true
seats = {}
seats["Ravi"] = 14
seats["Elena"] = 7
seats["Ravi"] = 15
print(seats)
```
````

```{verify}
:id: seats-filled
:label: Your dictionary holds the two passengers and the new seat
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed seats; cell-executed seats-solution
if "seats" not in globals():
    print("The name seats does not exist yet. Write your program under the comment in the new cell, and begin with the line that makes an empty dictionary: seats = {}. Then hold Shift and press Enter to run the cell.")
elif type(seats) is not dict:
    print("The name seats exists, but its value is not a dictionary. An empty dictionary is written with curly brackets: seats = {}. Square brackets make a list. Correct the first line of your program. Then run the cell again.")
elif seats == {"Ravi": 15, "Elena": 7}:
    print("Correct. The dictionary seats holds two pairs, and the key Ravi has the new value 15.")
elif len(seats) == 0:
    print("The dictionary seats is empty. Add the two passengers under the first line. The line that adds Ravi is seats[\"Ravi\"] = 14. Then run the cell again.")
elif len(seats) > 2:
    print(f"The dictionary seats is {seats}. It has a key that the task does not ask for. The keys must be exactly Ravi and Elena, each with a capital letter at the start. A key with a different spelling is a different key, so Python adds a new pair for it. Correct the keys. Then run the cell again.")
elif "Ravi" not in seats or "Elena" not in seats:
    print(f"The dictionary seats is {seats}. It has no key {'Ravi' if 'Ravi' not in seats else 'Elena'}. Add that key with its seat number, and check the spelling and the capital letter. Then run the cell again.")
elif seats == {"Ravi": 14, "Elena": 7}:
    print("The key Ravi still has the value 14. Ravi moves to seat 15. Add a line after the other lines that gives the key a new value: seats[\"Ravi\"] = 15. Then run the cell again.")
else:
    print(f"The name seats refers to {seats} but it must refer to {{'Ravi': 15, 'Elena': 7}}. Check the value that each line gives. Then run the cell again.")
"seats" in globals() and type(seats) is dict and seats == {"Ravi": 15, "Elena": 7}
```
