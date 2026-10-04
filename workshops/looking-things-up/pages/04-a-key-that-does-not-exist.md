---
title: A key that does not exist
requires: [verify:plum-fixed]
---

# A key that does not exist

A lookup with square brackets works only when the key is in the
dictionary. If you give a key that the dictionary does not have,
Python cannot give you a value. It does not guess which key you
meant, and it does not give you an empty value. It stops, and it shows
an **error message**: a message that says what went wrong.

The type of this error is `KeyError`. You have seen a similar error
with a list: an index that is too large gives an `IndexError`. A key
that does not exist gives a `KeyError`.

It is better to see this error now, on purpose, than to meet it later
by accident.

## A cell with a mistake

The action below adds a cell that has a mistake in it. A dictionary
holds the number of each fruit in a shop. The cell is meant to look up
the number of plums. The action does not run the cell.

```{cell-insert}
:id: insert-plum
:title: Add a cell that has a mistake in it, without running it
:path: {{ notebook }}
:tags: [plum]
:run: false
stock = {"apples": 12, "pears": 5, "plums": 8}
plum_count = stock["plum"]
print(plum_count)
```

Run the cell: click inside it, hold `Shift` and press `Enter`.

The notebook shows several lines with a coloured background under the
cell. This is the error message. Read the last line of the message
first:

```
KeyError: 'plum'
```

- `KeyError` is the type of the error. A `KeyError` always means that
  a lookup used a key that is not in the dictionary.

- `'plum'` is the key that Python could not find.

Above that line, the message shows the line of the cell where Python
stopped, with an arrow that points at it:

```
----> 2 plum_count = stock["plum"]
```

Python stopped at line 2, so line 3 did not run, and the name
`plum_count` does not exist.

## Your task

Find the mistake in the cell and correct it. Then run the cell again.
When the cell is correct, the error message goes away, and the output
is `8`.

```{hint}
:title: Hint: where is the mistake?
The error message says that the key `'plum'` is not in the dictionary.
Look at the first line of the cell. Which keys does the dictionary
have? Compare them with the key in the second line, letter by letter.
```

```{hint}
:title: Hint: how to correct it
The dictionary has the key `"plums"`, with an `s` at the end. The
second line uses `"plum"`, with no `s`. Change `"plum"` in the second
line to `"plums"`. Then run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check`.

```{attempt}
:id: plum-not-fixed
:check: plum-fixed
:expect: The name plum_count does not exist yet
```

````{attempt}
:id: plum-other-key
:check: plum-fixed
:expect: That is the value of the key pears

```{cell-insert}
:path: {{ notebook }}
:run: true
stock = {"apples": 12, "pears": 5, "plums": 8}
plum_count = stock["pears"]
print(plum_count)
```
````

````{attempt}
:id: plum-changed-value
:check: plum-fixed
:expect: but it must refer to 8

```{cell-insert}
:path: {{ notebook }}
:run: true
stock = {"apples": 12, "pears": 5, "plums": 8}
plum_count = stock["plums"] + 1
print(plum_count)
```
````

````{attempt}
:id: plum-renamed-key
:check: plum-fixed
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
stock = {"apples": 12, "pears": 5, "plum": 8}
plum_count = stock["plum"]
print(plum_count)
```
````

````{hint}
:title: Show me a solution
:unlock: "plum-fixed" in failed_checks or "plum-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-plum-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [plum-solution]
:run: true
stock = {"apples": 12, "pears": 5, "plums": 8}
plum_count = stock["plums"]
print(plum_count)
```
````

```{verify}
:id: plum-fixed
:label: The cell runs without an error and gives 8
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed plum; cell-executed plum-solution
if "plum_count" not in globals():
    print("The name plum_count does not exist yet. That means the second line of the cell has not run without an error. Correct the key in the second line, so that it is the same as a key of the dictionary in the first line. Then run the cell.")
elif plum_count == 8:
    print("Correct. The cell runs without an error, and the name plum_count refers to 8.")
elif plum_count in (12, 5):
    print(f"The name plum_count refers to {plum_count}. That is the value of the key {'apples' if plum_count == 12 else 'pears'}. The key for the plums is plums, with an s at the end. Write that key inside the square brackets. Then run the cell again.")
else:
    print(f"The name plum_count refers to {plum_count!r} but it must refer to 8. The second line must look up the key plums in the dictionary stock. Then run the cell again.")
"plum_count" in globals() and plum_count == 8
```

## Keys must match exactly

A key in a lookup must be exactly the same as the key in the
dictionary. Every letter counts, and so does the difference between a
small letter and a capital letter. To Python, `"plums"`, `"plum"` and
`"Plums"` are three different keys.

A `KeyError` is useful. It tells you immediately that the key is wrong,
before the program continues with a wrong value. But sometimes a
missing key is not a mistake. The next page shows what to do then.
