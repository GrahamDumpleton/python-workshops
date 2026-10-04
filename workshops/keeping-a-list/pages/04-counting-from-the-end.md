---
title: Counting from the end
requires: [verify:stations-ran, quiz:predict-planets, verify:planets-ran]
---

# Counting from the end

Often a program needs the last item of a list: the newest message, or
the last station of a railway line. To get the last item with the
indexes that you know, you must first know how many items the list
has. That number changes when the list grows.

Python has a second way to count, which does not need that number. A
negative index counts from the end of the list. The index `-1` is the
last item, `-2` is the item before the last item, and so on.

```python
stations = ["North", "Market", "Museum", "Harbour", "South"]
```

| Index from the start | 0 | 1 | 2 | 3 | 4 |
|----------------------|---|---|---|---|---|
| Item | `"North"` | `"Market"` | `"Museum"` | `"Harbour"` | `"South"` |
| Index from the end | -5 | -4 | -3 | -2 | -1 |

Every item has two indexes, and both get the same item. Counting from
the end starts at `-1`, not at `0`, because the index `0` already
means the first item.

Click the action below. It adds a cell that shows the last item, and
the item before it.

```{attempt}
:id: stations-not-run
:check: stations-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-stations
:title: Add a cell that shows two items counted from the end, and run it
:path: {{ notebook }}
:tags: [stations]
:run: true
stations = ["North", "Market", "Museum", "Harbour", "South"]
print(stations[-1])
print(stations[-2])
```

The output has two lines: `South` and `Harbour`.

- `stations[-1]` is the last item, `"South"`.

- `stations[-2]` is one step before the last item. That is
  `"Harbour"`.

```{verify}
:id: stations-ran
:label: The cell showed the last two items
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed stations
if globals().get("stations") == ["North", "Market", "Museum", "Harbour", "South"]:
    print("The cell ran. It showed the items with the indexes -1 and -2.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("stations") == ["North", "Market", "Museum", "Harbour", "South"]
```

## Predict

Look at this cell. Do not run it yet.

```python
planets = ["Mercury", "Venus", "Earth", "Mars"]
print(planets[-3])
```

```{quiz}
:id: predict-planets
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "Venus"
wrong:
  - { text: "Mercury", explanation: "Counting from the end starts at `-1`, not at `0`. The last item, `\"Mars\"`, has the index `-1`." }
  - { text: "Earth", explanation: "`\"Earth\"` has the index `-2`. Count one more step towards the start of the list." }
  - { text: "Mars", explanation: "`\"Mars\"` is the last item, and its index is `-1`. Count two more steps towards the start of the list." }
  - { pattern: "[\"']Venus[\"']", explanation: "The item is correct. `print()` shows one string without its quotes, so type the word only." }
otherwise: "Begin at the last item, which has the index `-1`. The item before it has the index `-2`. Which item has the index `-3`?"
explanation: "From the end, the indexes are `-1` for `\"Mars\"`, `-2` for `\"Earth\"` and `-3` for `\"Venus\"`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: planets-not-run
:check: planets-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-planets
:title: Add the cell that shows the item with the index -3, and run it
:path: {{ notebook }}
:tags: [planets]
:run: true
planets = ["Mercury", "Venus", "Earth", "Mars"]
print(planets[-3])
```

```{verify}
:id: planets-ran
:label: The cell showed the item with the index -3
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed planets
if globals().get("planets") == ["Mercury", "Venus", "Earth", "Mars"]:
    print("The cell ran. It showed Venus, the item with the index -3.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("planets") == ["Mercury", "Venus", "Earth", "Mars"]
```
