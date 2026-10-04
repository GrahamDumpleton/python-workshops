---
title: Calling a function
requires: [verify:hours-called, verify:hours-called-twice, verify:menu-function]
---

# Calling a function

To **call** a function means to tell Python to run its body. You
write the name of the function, and then a pair of parentheses.

In the comparison with a recipe, to define the function is to write
the recipe, and to call the function is to cook from it.

The function `show_opening_hours` from the last page has this body:

```python
def show_opening_hours():
    print("The library opens at 09:00.")
    print("The library closes at 18:00.")
```

Click the action below. It adds a cell that calls the function, and
runs it.

```{attempt}
:id: hours-not-called
:check: hours-called
:expect: The cell has not run yet. Click the action above
```

```{cell-insert}
:id: insert-call-hours
:title: Add a cell that calls the function, and run it
:path: {{ notebook }}
:tags: [call-hours]
:run: true
show_opening_hours()
```

The output is:

```
The library opens at 09:00.
The library closes at 18:00.
```

```{verify}
:id: hours-called
:label: The cell that calls the function has run
:substrate: contents
:trigger: cell-executed call-hours
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} call-hours
```

## What happened

Python found the name `show_opening_hours`, and then the parentheses.
The parentheses tell Python to call the function. Python went to the
body of the function and ran its two lines, in order. Then Python
continued in the cell, with the line after the call. In this cell
there is no line after the call, so the cell ended.

The cell holds one line, but Python ran two `print()` lines. The two
lines are written in one place, in the function, and the call uses
them.

## Many calls

You can call a function as many times as you like. Each call runs the
body again.

```{attempt}
:id: hours-not-called-twice
:check: hours-called-twice
:expect: The cell has not run yet. Click the action above
```

```{cell-insert}
:id: insert-call-twice
:title: Add a cell that calls the function two times, and run it
:path: {{ notebook }}
:tags: [call-twice]
:run: true
show_opening_hours()
print("Have a good day.")
show_opening_hours()
```

The output is:

```
The library opens at 09:00.
The library closes at 18:00.
Have a good day.
The library opens at 09:00.
The library closes at 18:00.
```

```{verify}
:id: hours-called-twice
:label: The cell that calls the function two times has run
:substrate: contents
:trigger: cell-executed call-twice
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} call-twice
```

Python ran the body, then ran the `print()` line of the cell, and
then ran the body again.

Two rules are important when you call a function:

- Python must know the function before you call it. The cell that
  defines the function must run first. If you call a function that
  Python does not know, Python stops with a `NameError`, in the same
  way as for every other name that does not exist.

- The parentheses are necessary. They are what tells Python to run
  the body. The name alone, with no parentheses, does not run it.

## Your task

Now you write a function yourself, and you call it.

Write a function with the name `show_menu`. When it is called, it
shows these two lines:

```
Soup: 4
Bread: 2
```

Then call the function one time, on a line under the function. The
line with the call must begin without spaces, because it is not part
of the body.

Your cell needs four lines:

1. the line that begins with `def`, with the name, empty parentheses
   and a colon

2. a `print()` line for the first line of the menu, which begins with
   four spaces

3. a `print()` line for the second line of the menu, which begins with
   four spaces

4. the call, which begins without spaces

The action below adds a new cell for your function.

```{cell-insert}
:id: insert-menu
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [menu]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your four lines.
Then run the cell: hold `Shift` and press `Enter`. The output under
the cell must be the two lines of the menu.

```{hint}
:title: Hint: how to begin
Look at the function `show_opening_hours` at the top of this page.
Your function has the same form. The first line is
`def show_menu():`. Do not forget the colon at the end.
```

```{hint}
:title: Hint: the body and the call
The body is two lines that begin with four spaces:
`print("Soup: 4")` and `print("Bread: 2")`. The last line of the cell
is the call, `show_menu()`, and it begins without spaces.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: menu-not-started
:check: menu-function
:expect: The function show_menu does not exist yet
```

````{attempt}
:id: menu-not-a-function
:check: menu-function
:expect: it is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
show_menu = "Soup: 4"
print(show_menu)
```
````

````{attempt}
:id: menu-with-parameter
:check: menu-function
:expect: has a name between its parentheses

```{cell-insert}
:path: {{ notebook }}
:run: true
def show_menu(menu):
    print("Soup: 4")
    print("Bread: 2")
```
````

````{attempt}
:id: menu-stops
:check: menu-function
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def show_menu():
    print(soup)
    print("Bread: 2")
```
````

````{attempt}
:id: menu-shows-nothing
:check: menu-function
:expect: shows nothing when it is called

```{cell-insert}
:path: {{ notebook }}
:run: true
def show_menu():
    menu = "Soup: 4"
```
````

````{attempt}
:id: menu-one-line
:check: menu-function
:expect: shows only the first line of the menu

```{cell-insert}
:path: {{ notebook }}
:run: true
def show_menu():
    print("Soup: 4")
print("Bread: 2")

show_menu()
```
````

````{attempt}
:id: menu-wrong-text
:check: menu-function
:expect: It must show 'Soup: 4' and then 'Bread: 2'

```{cell-insert}
:path: {{ notebook }}
:run: true
def show_menu():
    print("Soup 4")
    print("Bread 2")

show_menu()
```
````

````{hint}
:title: Show me a solution
:unlock: "menu-function" in failed_checks or "menu-function" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-menu-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [menu-solution]
:run: true
def show_menu():
    print("Soup: 4")
    print("Bread: 2")

show_menu()
```
````

```{verify}
:id: menu-function
:label: Your function show_menu shows the two lines of the menu
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed menu; cell-executed menu-solution
def _workshop_check():
    import contextlib, inspect, io
    if "show_menu" not in globals():
        print("The function show_menu does not exist yet. Write it under the comment in the new cell. The first line is def show_menu(): and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["show_menu"]
    if not callable(function):
        print("The name show_menu exists, but it is not a function. A function begins with a line that has the word def, the name, a pair of parentheses and a colon: def show_menu(): Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 0
    if count != 0:
        print("The function show_menu has a name between its parentheses. This function needs no value from outside, so the parentheses must be empty: def show_menu(): Then run the cell again.")
        return False
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown):
            function()
    except Exception as error:
        print(f"The function show_menu stopped with a {type(error).__name__} when it was called. Read the last line of the error message under your cell. Correct the body of the function, and run the cell again.")
        return False
    lines = [line.strip() for line in shown.getvalue().strip().splitlines()]
    if lines == ["Soup: 4", "Bread: 2"]:
        print("Correct. Your function show_menu shows the two lines of the menu each time it is called.")
        return True
    if lines == []:
        print("The function show_menu shows nothing when it is called. The body must hold two print() lines, and each of them must begin with four spaces. Then run the cell again.")
        return False
    if lines == ["Soup: 4"]:
        print("The function show_menu shows only the first line of the menu. The second print() line probably begins without spaces, so it is outside the body, and Python runs it only when the cell runs. Give the second print() line four spaces. Then run the cell again.")
        return False
    found = " and then ".join(repr(line) for line in lines)
    print(f"When it is called, the function show_menu shows {found}. It must show 'Soup: 4' and then 'Bread: 2'. Check every letter, the colon and the space in each line. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

You defined a function and called it. The two `print()` lines are
written once, and every call of `show_menu()` runs them.
