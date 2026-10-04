---
title: A function, again
requires: [verify:welcome-two-parameters]
---

# A function, again

This page repeats the words about functions that the rest of the
workshop uses. Then you change a function yourself.

A **function** is a group of lines of code that has a name. You write
the lines once, and you use them many times.

Look at this code. Do not run it yet.

```python
def welcome(name):
    return f"Hello, {name}!"

print(welcome("Aiko"))
```

Each part of this code has a name of its own.

- The line that begins with `def` **defines** the function: it tells
  Python the name of the function and what the function needs. The
  name of this function is `welcome`.

- A **parameter** is a name between the parentheses of the `def`
  line. This function has one parameter, `name`.

- The **body** is the block of lines under the `def` line. Each line
  of the body begins with four spaces. This body has one line.

- `welcome("Aiko")` is a **call**: it tells Python to run the body
  now.

- An **argument** is a value that a call gives to the function. In
  this call, the argument is the string `"Aiko"`. While the body
  runs, the parameter `name` refers to the argument.

- The word `return` ends the function and gives a value back to the
  code that called it. That value is the **return value**. Here, the
  return value is the string `"Hello, Aiko!"`, and `print()` shows it.

So a parameter is a name in the `def` line, and an argument is a value
in a call. You need both words on the pages that follow.

## Your task

The function `welcome` always uses the word `Hello`. Change it so that
the call chooses the word.

The action below adds a cell that holds the code above. The action
does not run the cell.

```{cell-insert}
:id: insert-welcome
:title: Add a cell with the function welcome for me to change
:path: {{ notebook }}
:tags: [welcome]
:run: false
def welcome(name):
    return f"Hello, {name}!"

print(welcome("Aiko"))
```

Make three changes in the cell:

1. In the `def` line, add a second parameter that is named `greeting`.
   Write a comma and a space between the two parameters.

2. In the f-string, replace the word `Hello` with `{greeting}`.

3. In the last line, give the call a second argument, the string
   `"Good morning"`.

Then run the cell: click inside it, hold `Shift` and press `Enter`.
The output must be:

```
Good morning, Aiko!
```

```{hint}
:title: Hint: the def line and the call
The `def` line with two parameters is `def welcome(name, greeting):`.
The call with two arguments is `welcome("Aiko", "Good morning")`. The
first argument goes to the first parameter, and the second argument
goes to the second parameter.
```

```{hint}
:title: Hint: the f-string
The f-string must use both parameters: `f"{greeting}, {name}!"`.
Python replaces `{greeting}` with the second argument, and `{name}`
with the first argument.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: welcome-not-started
:check: welcome-two-parameters
:expect: There is no function named welcome yet
```

````{attempt}
:id: welcome-unchanged
:check: welcome-two-parameters
:expect: does not accept two arguments yet

```{cell-insert}
:path: {{ notebook }}
:run: true
def welcome(name):
    return f"Hello, {name}!"

print(welcome("Aiko"))
```
````

````{attempt}
:id: welcome-misspelled
:check: welcome-two-parameters
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def welcome(name, greeting):
    return f"{greting}, {name}!"
```
````

````{attempt}
:id: welcome-still-hello
:check: welcome-two-parameters
:expect: The function still uses the word Hello

```{cell-insert}
:path: {{ notebook }}
:run: true
def welcome(name, greeting):
    return f"Hello, {name}!"

print(welcome("Aiko", "Good morning"))
```
````

````{attempt}
:id: welcome-other-order
:check: welcome-two-parameters
:expect: The two parameters are in the other order

```{cell-insert}
:path: {{ notebook }}
:run: true
def welcome(greeting, name):
    return f"{greeting}, {name}!"

print(welcome("Good morning", "Aiko"))
```
````

````{attempt}
:id: welcome-prints
:check: welcome-two-parameters
:expect: but it does not return it

```{cell-insert}
:path: {{ notebook }}
:run: true
def welcome(name, greeting):
    print(f"{greeting}, {name}!")

welcome("Aiko", "Good morning")
```
````

````{attempt}
:id: welcome-other-text
:check: welcome-two-parameters
:expect: but it must give 'Good morning, Aiko!'

```{cell-insert}
:path: {{ notebook }}
:run: true
def welcome(name, greeting):
    return f"{greeting} {name}"

print(welcome("Aiko", "Good morning"))
```
````

````{hint}
:title: Show me a solution
:unlock: "welcome-two-parameters" in failed_checks or "welcome-two-parameters" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-welcome-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [welcome-solution]
:run: true
def welcome(name, greeting):
    return f"{greeting}, {name}!"

print(welcome("Aiko", "Good morning"))
```
````

```{verify}
:id: welcome-two-parameters
:label: The function welcome uses the greeting that the call gives
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed welcome; cell-executed welcome-solution
def _workshop_check():
    import contextlib, io
    function = globals().get("welcome")
    if not callable(function):
        print("There is no function named welcome yet. Make the three changes in the new cell. Then hold Shift and press Enter to run the cell.")
        return False
    import inspect
    try:
        inspect.signature(function).bind("Aiko", "Good morning")
    except TypeError:
        print("The function welcome does not accept two arguments yet. Add a second parameter to the def line, so that the line is def welcome(name, greeting): Then run the cell again.")
        return False
    shown = io.StringIO()
    try:
        with contextlib.redirect_stdout(shown):
            first = function("Aiko", "Good morning")
            second = function("Tariq", "Hi")
    except Exception as error:
        print(f"The function welcome stopped with a {type(error).__name__} when the check called welcome(\"Aiko\", \"Good morning\"). Check the spelling of the names name and greeting in the def line and in the f-string. Then run the cell again.")
        return False
    if first is None and "Good morning, Aiko!" in shown.getvalue():
        print("The function welcome shows the text with print(), but it does not return it. Keep the word return at the start of the line in the body: return f\"{greeting}, {name}!\" Then run the cell again.")
        return False
    if first == "Hello, Aiko!":
        print("The function still uses the word Hello. In the f-string, replace the word Hello with {greeting}, so that Python puts the second argument there. Then run the cell again.")
        return False
    if first == "Aiko, Good morning!":
        print("The two parameters are in the other order. The first parameter must be name and the second must be greeting: def welcome(name, greeting): The f-string must be f\"{greeting}, {name}!\" Then run the cell again.")
        return False
    for call, result, expected in (("welcome(\"Aiko\", \"Good morning\")", first, "Good morning, Aiko!"), ("welcome(\"Tariq\", \"Hi\")", second, "Hi, Tariq!")):
        if result != expected:
            print(call + " gives " + repr(result) + " but it must give " + repr(expected) + ". The line in the body must be return f\"{greeting}, {name}!\" with a comma and a space after the first braces, and an exclamation mark at the end. Then run the cell again.")
            return False
    print("Correct. welcome(\"Aiko\", \"Good morning\") gives 'Good morning, Aiko!'. The call now chooses the greeting.")
    return True
globals().pop("_workshop_check")()
```

## Every call must give both values

The function now accepts any greeting. But every call must give two
arguments, even when the greeting is the usual `"Hello"`. The next
page shows how a function can supply the usual value itself.
