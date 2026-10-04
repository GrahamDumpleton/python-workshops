---
title: What a method is
requires: [verify:station-ran, quiz:predict-colour, verify:colour-ran, verify:code-capitals]
---

# What a method is

Programs often need a changed form of a text: the same words in
capital letters, or without extra spaces. Python strings can do this
work themselves, with methods.

A **method** is a function that belongs to a value. A string has
methods that work with text. A method is written after the value,
with a dot between them:

```python
station.upper()
```

Read this from left to right: take the string that the name `station`
refers to, and use its method `upper`. The parentheses at the end are
necessary. They tell Python to perform the method.

Compare a method with a function such as `len()`:

- With a function, the value goes between the parentheses:
  `len(station)`.

- With a method, the value comes first, then a dot, then the name of
  the method: `station.upper()`.

A method gives a value back to your code, as `len()` does. The method
`upper()` gives back a string in which every small letter is a
capital letter. "Upper case" is another name for capital letters.

Click the action below. It adds a cell that uses the method, and runs
it.

```{attempt}
:id: station-not-run
:check: station-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-station
:title: Add a cell that makes a string in capital letters, and run it
:path: {{ notebook }}
:tags: [station]
:run: true
station = "central"
station_sign = station.upper()
print(station_sign)
```

## What happened

1. `station = "central"` makes the name `station` refer to a string.

2. `station_sign = station.upper()` performs the method `upper` of
   that string. The method gives back the new string `"CENTRAL"`, and
   the name `station_sign` refers to it.

3. `print(station_sign)` shows `CENTRAL`.

```{verify}
:id: station-ran
:label: The method upper() gave back a string in capital letters
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed station
if globals().get("station_sign") == "CENTRAL":
    print("The cell ran. The name station_sign refers to the string CENTRAL.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("station_sign") == "CENTRAL"
```

## A string never changes

Look at this cell. Do not run it yet. The second line performs the
method, but it does not give a name to the result.

```python
colour = "green"
colour.upper()
print(colour)
```

```{quiz}
:id: predict-colour
:type: text
:title: Predict the output
question: What does the notebook show under this cell when it runs?
answer: "green"
wrong:
  - { text: "GREEN", explanation: "The method `upper()` does not change the string that `colour` refers to. It gives back a new string. This cell gives no name to the new string, so Python forgets it." }
  - { text: "Green", explanation: "No line in this cell makes a string that has one capital letter. The name `colour` refers to the string from the first line." }
  - { text: "\"green\"", explanation: "The characters are correct. But `print()` shows a string without its quotes: type only the characters." }
otherwise: "The last line shows the value that the name `colour` refers to. Which line gives that name a value?"
explanation: "The method `upper()` gives back a new string, `\"GREEN\"`. The cell gives no name to it, so Python forgets it. The name `colour` still refers to `\"green\"`."
```

Run the cell, and compare the output with your prediction.

```{attempt}
:id: colour-not-run
:check: colour-ran
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-colour
:title: Add the cell that does not keep the result of the method, and run it
:path: {{ notebook }}
:tags: [colour]
:run: true
colour = "green"
colour.upper()
print(colour)
```

```{verify}
:id: colour-ran
:label: The string that colour refers to did not change
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed colour
if globals().get("colour") == "green":
    print("The cell ran. The name colour still refers to the string green, in small letters.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
globals().get("colour") == "green"
```

This is an important rule of Python: a string never changes. No
method changes the characters of a string. A method that seems to
change a string gives back a new string, and the old string stays as
it was.

A printed page is a comparison. You cannot change the letters on a
printed page. If you want the text in capital letters, you print a
new page.

To keep the new string, give it a name with an assignment. You can
choose a new name, as in `station_sign = station.upper()`. You can
also use the same name again. The line `colour = colour.upper()`
makes the name `colour` refer to the new string.

## Your task

A ticket office writes its ticket codes in capital letters. The
action below adds a cell that tries to do that. The action does not
run the cell.

```{cell-insert}
:id: insert-code
:title: Add a cell with a ticket code for me to change
:path: {{ notebook }}
:tags: [code]
:run: false
ticket_code = "ab123"
ticket_code.upper()
print(ticket_code)
```

When this cell runs, the output is `ab123`, in small letters. Change
the second line so that the name `ticket_code` refers to the string
in capital letters. Do not change the first line. Then run the cell.
The output must be:

```
AB123
```

```{hint}
:title: Hint: what is wrong with the second line?
The second line performs the method, and the method gives back a new
string. But the line does not give a name to the new string, so
Python forgets it. The second line must be an assignment.
```

```{hint}
:title: Hint: what does the line look like?
Write the name and the symbol `=` before the expression:
`ticket_code = ticket_code.upper()`. Python calculates the right side
first. Then it makes the name `ticket_code` refer to the new string.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: code-not-started
:check: code-capitals
:expect: The cell has not run yet
```

````{attempt}
:id: code-unchanged
:check: code-capitals
:expect: still refers to the string ab123

```{cell-insert}
:path: {{ notebook }}
:run: true
ticket_code = "ab123"
ticket_code.upper()
print(ticket_code)
```
````

````{attempt}
:id: code-no-parentheses
:check: code-capitals
:expect: the parentheses after upper are missing

```{cell-insert}
:path: {{ notebook }}
:run: true
ticket_code = "ab123"
ticket_code = ticket_code.upper
print(ticket_code)
```
````

````{attempt}
:id: code-other-text
:check: code-capitals
:expect: but it must refer to the string AB123

```{cell-insert}
:path: {{ notebook }}
:run: true
ticket_code = "ab12"
ticket_code = ticket_code.upper()
print(ticket_code)
```
````

````{hint}
:title: Show me a solution
:unlock: "code-capitals" in failed_checks or "code-capitals" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-code-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [code-solution]
:run: true
ticket_code = "ab123"
ticket_code = ticket_code.upper()
print(ticket_code)
```
````

```{verify}
:id: code-capitals
:label: The name ticket_code refers to the code in capital letters
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed code; cell-executed code-solution
if "ticket_code" not in globals():
    print("The cell has not run yet. Change the second line of the new cell. Then hold Shift and press Enter to run the cell.")
elif not isinstance(ticket_code, str):
    print("The name ticket_code does not refer to a string. That happens when the parentheses after upper are missing. Write ticket_code = ticket_code.upper() in the second line, with the two parentheses at the end. Then run the cell again.")
elif ticket_code == "AB123":
    print("Correct. The method gave back a new string, and the name ticket_code now refers to it: AB123.")
elif ticket_code == "ab123":
    print("The name ticket_code still refers to the string ab123, in small letters. The method upper() gives back a new string, and the second line must give it a name. Write ticket_code = ticket_code.upper() in the second line. Then run the cell again.")
else:
    print(f"The name ticket_code refers to [{ticket_code}] but it must refer to the string AB123. The square brackets show where the value begins and ends. The first line must be ticket_code = \"ab123\", and the second line must be ticket_code = ticket_code.upper(). Then run the cell again.")
"ticket_code" in globals() and ticket_code == "AB123"
```
