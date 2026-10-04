---
title: A value for the function
requires: [verify:welcome-defined, quiz:predict-welcome, verify:welcome-chidi, verify:goodbye-function]
---

# A value for the function

The functions that you have written so far do exactly the same thing
on every call. Most functions need to do almost the same thing each
time, with one detail that changes. A function that welcomes a guest
must use a different name for each guest.

For that, a function can receive a value when it is called. Two new
words describe how.

A **parameter** is a name that you write between the parentheses of
the `def` line. The body of the function uses this name.

An **argument** is the value that you write between the parentheses
of the call. When the call happens, Python makes the parameter refer
to the argument, and then runs the body.

Think of a printed card that says "Welcome, ____!", with an empty
space for a name. The empty space is the parameter. Each time you use
a card, you write a different name in the space. The name that you
write is the argument.

You have given arguments to functions before. In `len("tea")`, the
string `"tea"` is an argument. In `print(total)`, the value of `total`
is an argument.

## A function with a parameter

Click the action below. It adds a cell that defines a function with
one parameter and calls it two times, and runs the cell.

```{attempt}
:id: welcome-not-defined
:check: welcome-defined
:expect: The cell has not run yet
```

```{cell-insert}
:id: insert-welcome
:title: Add a cell that defines a function with a parameter and calls it, and run it
:path: {{ notebook }}
:tags: [welcome]
:run: true
def welcome_guest(guest):
    print(f"Welcome, {guest}!")

welcome_guest("Aiko")
welcome_guest("Mateo")
```

The output is:

```
Welcome, Aiko!
Welcome, Mateo!
```

```{verify}
:id: welcome-defined
:label: Python knows the function welcome_guest
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed welcome
if callable(globals().get("welcome_guest")):
    print("The cell ran. The function welcome_guest welcomed two guests, each by name.")
else:
    print("The cell has not run yet. Click the action above to add the cell and run it.")
callable(globals().get("welcome_guest"))
```

## What happened

The `def` line has the name `guest` between its parentheses. That name
is the parameter.

The body holds an f-string. An f-string is a string that begins with
the letter `f`, and Python replaces `{guest}` in it with the value
that the name `guest` refers to.

Then the cell calls the function two times.

1. `welcome_guest("Aiko")` calls the function with the argument
   `"Aiko"`. Python makes the parameter `guest` refer to `"Aiko"`.
   Then it runs the body, which shows `Welcome, Aiko!`.

2. `welcome_guest("Mateo")` calls the function again, with the
   argument `"Mateo"`. This time Python makes `guest` refer to
   `"Mateo"`, and the same body shows `Welcome, Mateo!`.

The body is written once. Each call gives it a different value to
work with.

## Predict a call

Look at this call. Do not run it yet.

```python
welcome_guest("Chidi")
```

Type the line that you predict the notebook shows, exactly as it
appears.

```{quiz}
:id: predict-welcome
:type: text
:title: Predict the output
question: 'What does the notebook show when the call `welcome_guest("Chidi")` runs?'
answer: "Welcome, Chidi!"
wrong:
  - { text: "Welcome, guest!", explanation: "The name `guest` is the parameter. Python replaces it with the value that it refers to during this call, which is the argument." }
  - { text: "Welcome, {guest}!", explanation: "The string in the body is an f-string. Python replaces `{guest}` with the value that the parameter refers to during this call." }
  - { text: "Chidi", explanation: "The body shows the complete string, with the value of the parameter inside it." }
  - { text: '"Welcome, Chidi!"', explanation: "The text is correct. But `print()` shows a string with no quotes." }
  - { pattern: "[Ww]elcome,? ?Chidi!?", explanation: "The words are correct. Type the line exactly as it appears, with the capital letter, the comma, one space and the exclamation mark." }
otherwise: "The argument of the call is `\"Chidi\"`. Python makes the parameter `guest` refer to it, and then runs the body."
explanation: "Python makes the parameter `guest` refer to the argument `\"Chidi\"`. Then it runs the body, and the f-string becomes `Welcome, Chidi!`."
```

Run the call, and compare the output with your prediction.

```{attempt}
:id: welcome-chidi-not-run
:check: welcome-chidi
:expect: The cell has not run yet. Click the action above
```

```{cell-insert}
:id: insert-welcome-chidi
:title: Add a cell that calls the function with a new argument, and run it
:path: {{ notebook }}
:tags: [welcome-chidi]
:run: true
welcome_guest("Chidi")
```

```{verify}
:id: welcome-chidi
:label: The cell that calls the function with a new argument has run
:substrate: contents
:trigger: cell-executed welcome-chidi
:message: The cell has not run yet. Click the action above to add the cell and run it.
cell-executed {{ notebook }} welcome-chidi
```

## Your task

Write a function with the name `say_goodbye`. It has one parameter,
with the name `person`. When it is called, it shows one line: the word
`Goodbye`, a comma, a space, the value of the parameter, and an
exclamation mark.

| The call | What the call shows |
|----------|---------------------|
| `say_goodbye("Lena")` | `Goodbye, Lena!` |
| `say_goodbye("Tariq")` | `Goodbye, Tariq!` |

Under the function, call it one time with a name that you choose, so
that you can see that it works.

```{cell-insert}
:id: insert-goodbye
:title: Add a cell for my function
:path: {{ notebook }}
:tags: [goodbye]
:run: false
# Write your function on the lines below this one.

```

Click on the empty line under the comment, and type your function and
the call. Then run the cell: hold `Shift` and press `Enter`.

```{hint}
:title: Hint: the first line
The `def` line holds the name of the function, and the name of the
parameter between the parentheses: `def say_goodbye(person):`.
```

```{hint}
:title: Hint: the body and the call
The body is one line that begins with four spaces. It prints an
f-string that uses the parameter: `print(f"Goodbye, {person}!")`. The
call begins without spaces, and it has a string between its
parentheses: `say_goodbye("Lena")`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have run your cell, or after you have clicked `Check`.

```{attempt}
:id: goodbye-not-started
:check: goodbye-function
:expect: The function say_goodbye does not exist yet
```

````{attempt}
:id: goodbye-not-a-function
:check: goodbye-function
:expect: it is not a function

```{cell-insert}
:path: {{ notebook }}
:run: true
say_goodbye = "Goodbye, Lena!"
print(say_goodbye)
```
````

````{attempt}
:id: goodbye-no-parameter
:check: goodbye-function
:expect: has no parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def say_goodbye():
    print("Goodbye, Lena!")

say_goodbye()
```
````

````{attempt}
:id: goodbye-two-parameters
:check: goodbye-function
:expect: has 2 parameters

```{cell-insert}
:path: {{ notebook }}
:run: true
def say_goodbye(word, person):
    print(f"{word}, {person}!")

say_goodbye("Goodbye", "Lena")
```
````

````{attempt}
:id: goodbye-stops
:check: goodbye-function
:expect: stopped with a NameError

```{cell-insert}
:path: {{ notebook }}
:run: true
def say_goodbye(person):
    print(f"Goodbye, {visitor}!")
```
````

````{attempt}
:id: goodbye-shows-nothing
:check: goodbye-function
:expect: shows nothing

```{cell-insert}
:path: {{ notebook }}
:run: true
def say_goodbye(person):
    message = f"Goodbye, {person}!"

say_goodbye("Lena")
```
````

````{attempt}
:id: goodbye-fixed-name
:check: goodbye-function
:expect: The body does not use the parameter

```{cell-insert}
:path: {{ notebook }}
:run: true
def say_goodbye(person):
    print("Goodbye, Lena!")

say_goodbye("Lena")
```
````

````{attempt}
:id: goodbye-wrong-text
:check: goodbye-function
:expect: but it must show 'Goodbye, Lena!'

```{cell-insert}
:path: {{ notebook }}
:run: true
def say_goodbye(person):
    print(f"Goodbye {person}")

say_goodbye("Lena")
```
````

````{attempt}
:id: goodbye-other-way
:check: goodbye-function
:result: pass

```{cell-insert}
:path: {{ notebook }}
:run: true
def say_goodbye(friend):
    print("Goodbye, " + friend + "!")

say_goodbye("Ngozi")
```
````

````{hint}
:title: Show me a solution
:unlock: "goodbye-function" in failed_checks or "goodbye-function" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below adds a new cell to your notebook. The cell holds a
working answer, and the action runs it. Compare it with your own cell.

```{cell-insert}
:id: insert-goodbye-solution
:title: Add a solution in a new cell, and run it
:path: {{ notebook }}
:tags: [goodbye-solution]
:run: true
def say_goodbye(person):
    print(f"Goodbye, {person}!")

say_goodbye("Lena")
```
````

```{verify}
:id: goodbye-function
:label: Your function say_goodbye uses its parameter
:substrate: learner-kernel
:path: {{ notebook }}
:trigger: cell-executed goodbye; cell-executed goodbye-solution
def _workshop_check():
    import contextlib, inspect, io
    if "say_goodbye" not in globals():
        print("The function say_goodbye does not exist yet. Write it under the comment in the new cell. The first line is def say_goodbye(person): and the spelling must be the same. Then hold Shift and press Enter to run the cell.")
        return False
    function = globals()["say_goodbye"]
    if not callable(function):
        print("The name say_goodbye exists, but it is not a function. A function begins with a line that has the word def, the name, a pair of parentheses and a colon: def say_goodbye(person): Then run the cell again.")
        return False
    try:
        count = len(inspect.signature(function).parameters)
    except (TypeError, ValueError):
        count = 1
    if count == 0:
        print("The function say_goodbye has no parameter, so it cannot receive a name. Write the name of the parameter between the parentheses of the def line: def say_goodbye(person): Then run the cell again.")
        return False
    if count != 1:
        print(f"The function say_goodbye has {count} parameters, but it must have exactly one. The def line must be: def say_goodbye(person): Then run the cell again.")
        return False
    shown = []
    for name in ("Lena", "Tariq"):
        output = io.StringIO()
        try:
            with contextlib.redirect_stdout(output):
                function(name)
        except Exception as error:
            print(f"The call say_goodbye({name!r}) stopped with a {type(error).__name__}. Read the last line of the error message under your cell. The body must use the same name as the parameter in the def line. Correct the body, and run the cell again.")
            return False
        shown.append(output.getvalue().strip())
    if shown == ["Goodbye, Lena!", "Goodbye, Tariq!"]:
        print("Correct. say_goodbye('Lena') shows Goodbye, Lena! and say_goodbye('Tariq') shows Goodbye, Tariq! The body uses the parameter, so each call can show a different name.")
        return True
    if shown[0] == "":
        print("The call say_goodbye('Lena') shows nothing. The body must show the text with print(), on a line that begins with four spaces. Then run the cell again.")
        return False
    if shown[0] == shown[1]:
        print("The call say_goodbye('Lena') shows " + repr(shown[0]) + ", and the call say_goodbye('Tariq') shows exactly the same. The body does not use the parameter. Use an f-string that holds the parameter in curly brackets: print(f\"Goodbye, {person}!\"). Then run the cell again.")
        return False
    print(f"The call say_goodbye('Lena') shows {shown[0]!r} but it must show 'Goodbye, Lena!'. Check the capital letter, the comma, the space and the exclamation mark. Then run the cell again.")
    return False
globals().pop("_workshop_check")()
```

Your function has a parameter, so one function can say goodbye to any
person.
