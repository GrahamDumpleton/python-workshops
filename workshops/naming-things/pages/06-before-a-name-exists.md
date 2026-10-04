---
title: A name that does not exist
requires: [verify:name-fixed]
---

# A name that does not exist

A name exists only after an assignment has given it a value. If you
write a name that has no value, Python cannot continue. It does not
guess what you meant. It stops, and it shows an **error message**: a
message that says what went wrong.

This happens to every programmer, every day. The most common reason
is a spelling mistake: to Python, a name with one different letter is
a different name.

It is better to see this error now, on purpose, than to meet it later
by accident.

## A cell with a mistake

The action below adds a cell that has a mistake in it. The cell is
meant to calculate two times a distance. The action does not run the
cell.

```{cell-insert}
:id: insert-misspelled
:title: Add a cell that has a mistake in it, without running it
:path: {{ notebook }}
:tags: [misspelled]
:run: false
distance = 12
double_distance = distence * 2
double_distance
```

Run the cell: click inside it, hold `Shift` and press `Enter`.

The notebook shows several lines with a coloured background under the
cell. This is the error message. It looks alarming the first time, but
it is only Python telling you where it stopped. Nothing is broken.

Read the last line of the message first. It begins like this:

```
NameError: name 'distence' is not defined
```

- `NameError` is the type of the error. A `NameError` always means
  that Python found a name that has no value.

- `name 'distence' is not defined` says which name. "Not defined"
  means that no assignment has given this name a value.

Above that line, the message shows the line of the cell where Python
stopped, with an arrow that points at it.

## Your task

Find the mistake in the cell and correct it. Then run the cell again.
When the cell is correct, the error message goes away, and the output
is `24`.

```{hint}
:title: Hint: where is the mistake?
The error message says that the name `distence` is not defined. Look
at the first line of the cell. Which name did that line create?
Compare the two names letter by letter.
```

```{hint}
:title: Hint: how to correct it
The first line creates the name `distance`, with an `a`. The second
line uses `distence`, with an `e`. Change `distence` in the second
line to `distance`. Then run the cell again.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check`.

```{attempt}
:id: name-not-fixed
:check: name-fixed
:expect: The name double_distance does not exist yet
```

````{attempt}
:id: name-wrong-value
:check: name-fixed
:expect: but it must refer to 24

```{cell-insert}
:path: {{ notebook }}
:run: true
distance = 12
double_distance = distance + 2
double_distance
```
````

````{hint}
:title: Show me a solution
:unlock: "name-fixed" in failed_checks or "name-fixed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-misspelled-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [misspelled-solution]
:run: true
distance = 12
double_distance = distance * 2
double_distance
```
````

```{verify}
:id: name-fixed
:label: The cell runs without an error and gives 24
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed misspelled; cell-executed misspelled-solution
if "double_distance" not in globals():
    print("The name double_distance does not exist yet. That means the second line of the cell has not run without an error. Correct the spelling of the name in the second line, so that it is the same as the name in the first line. Then run the cell.")
elif double_distance == 24:
    print("Correct. The cell runs without an error, and the name double_distance refers to 24.")
else:
    print(f"The name double_distance refers to {double_distance} but it must refer to 24. The first line must be distance = 12, and the second line must multiply distance by 2. Then run the cell again.")
"double_distance" in globals() and double_distance == 24
```

## The order of the lines matters

Python performs the lines of a cell in order, so a name must be
assigned before the line that uses it. A name that is assigned lower
in the cell does not exist yet when Python reaches the line that needs
it, and the result is the same `NameError`.

Names stay in the memory of Python after the cell ends. A name that
one cell creates can be used by every cell that runs after it.

A later workshop, **When things go wrong**, teaches you to read every
part of an error message.
