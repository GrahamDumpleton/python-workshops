---
title: Describing a function
requires: [quiz:docstring-place, verify:kilometres-described]
---

# Describing a function

A **docstring** is a string that says what a function does. It is the
first line of the body of the function.

A person who calls a function wants to know what it does and which
arguments it needs. That person does not want to read the body to
find the answer. Sometimes that person is you, some weeks after you
wrote the function. The docstring gives the answer in plain words.

The label on a tin of food is a good comparison. The label says what
is inside, so you do not need to open the tin to know.

## How to write a docstring

```python
def greet(name, greeting="Hello"):
    """Return a greeting for the person called name."""
    return f"{greeting}, {name}!"
```

The second line is the docstring. It begins and ends with three
double quote characters, `"""`. A string that is written in this way
can continue over several lines, so a docstring can be as long as it
needs to be. The docstring begins with four spaces, like every line of
the body.

A docstring does not change what the function does. Python keeps the
text with the function, and does nothing more with it when the
function runs.

## Reading a docstring with help()

Python has a function named `help()` that shows the docstring of a
function. Give it the name of the function, without parentheses after
the name: `help(greet)`.

For the function above, `help(greet)` shows:

```
Help on function greet in module __main__:

greet(name, greeting='Hello')
    Return a greeting for the person called name.
```

- The first line says that `greet` is a function. The words
  `in module __main__` mean that the function was defined in your
  notebook. You do not need to know more about them now.

- The next line shows the name of the function, its parameters and
  their default values. Python shows a string with single quotes
  here, and it is the same string.

- The last line is the docstring.

A comment, which begins with the symbol `#`, is different. A comment
is a note for a person who reads the code, and Python ignores it.
`help()` does not show comments. A docstring is for a person who uses
the function.

```{quiz}
:id: docstring-place
:title: Where the docstring goes
question: "Where do you write the docstring of a function?"
options:
  - { text: "On the line above the `def` line", explanation: "A string above the `def` line does not belong to the function. The docstring is inside the function, as the first line of its body." }
  - { text: "As the first line of the body, directly under the `def` line", correct: true }
  - { text: "As the last line of the body, under the `return` line", explanation: "Python accepts a string in that place, but it is not a docstring, and `help()` does not show it. The docstring is the first line of the body." }
explanation: "The docstring is the first line of the body, directly under the `def` line, and it begins with four spaces. Only a string in that place is a docstring."
```

## Your task

The action below adds a cell that holds a function that has no
docstring. The function changes a distance in metres to kilometres.
The last line of the cell asks for help about the function. The
action does not run the cell.

```{cell-insert}
:id: insert-kilometres
:title: Add a cell with a function that has no docstring
:path: {{ notebook }}
:tags: [kilometres]
:run: false
def to_kilometres(metres):
    return metres / 1000

help(to_kilometres)
```

Add a docstring to the function. Click at the end of the `def` line,
and press `Enter` to make a new line under it. On the new line, write
this docstring:

```python
"""Return the distance in kilometres."""
```

Check that the new line begins with four spaces. Then run the cell.
The output must be:

```
Help on function to_kilometres in module __main__:

to_kilometres(metres)
    Return the distance in kilometres.
```

You can also write a docstring in your own words. The check accepts
any text.

```{hint}
:title: Hint: what the function looks like with a docstring
The function has three lines. The first is the `def` line. The second
is the docstring, with four spaces before it and three double quote
characters on each side of the text. The third is the `return` line,
which you do not change.
```

```{hint}
:title: Hint: I see a SyntaxError or an IndentationError
A `SyntaxError` usually means that the quote characters are not
complete. Count them: three before the text, and three after it. An
`IndentationError` means that the docstring does not begin with
exactly four spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: kilometres-not-started
:check: kilometres-described
:expect: There is no function named to_kilometres yet
```

````{attempt}
:id: kilometres-unchanged
:check: kilometres-described
:expect: The function to_kilometres has no docstring

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_kilometres(metres):
    # Return the distance in kilometres.
    return metres / 1000
```
````

````{attempt}
:id: kilometres-broken
:check: kilometres-described
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_kilometres(metres):
    """Return the distance in kilometres."""
    return meters / 1000
```
````

````{attempt}
:id: kilometres-changed
:check: kilometres-described
:expect: to_kilometres(5000) gives 5000000 but it must give 5.0

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_kilometres(metres):
    """Return the distance in kilometres."""
    return metres * 1000
```
````

````{attempt}
:id: kilometres-own-words
:check: kilometres-described
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def to_kilometres(metres):
    "Change a distance in metres to kilometres."
    return metres / 1000
```
````

````{hint}
:title: Show me a solution
:unlock: "kilometres-described" in failed_checks or "kilometres-described" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-kilometres-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [kilometres-solution]
:run: true
def to_kilometres(metres):
    """Return the distance in kilometres."""
    return metres / 1000

help(to_kilometres)
```
````

```{verify}
:id: kilometres-described
:label: The function to_kilometres has a docstring
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed kilometres; cell-executed kilometres-solution
def _workshop_check():
    import contextlib, io
    function = globals().get("to_kilometres")
    if not callable(function):
        print("There is no function named to_kilometres yet. Add the docstring in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    text = getattr(function, "__doc__", None)
    if not isinstance(text, str) or text.strip() == "":
        print("The function to_kilometres has no docstring. Add a docstring as the first line of the body, directly under the def line. A docstring is a string, with quote characters around it. A comment that begins with # is not a docstring. Then run the cell again.")
        return False
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown):
            result = function(5000)
    except Exception as error:
        print(f"The function to_kilometres stopped with a {type(error).__name__} when the check called to_kilometres(5000). Do not change the def line or the return line. The return line must be return metres / 1000. Then run the cell again.")
        return False
    if result != 5.0:
        print(f"to_kilometres(5000) gives {result!r} but it must give 5.0. Do not change the return line. It must be return metres / 1000. Then run the cell again.")
        return False
    print("Correct. The function has a docstring, and help() shows it: " + text.strip().splitlines()[0])
    return True
globals().pop("_workshop_check")()
```

Write a docstring for every function that you write from now on. One
short sentence that says what the function returns is enough.
