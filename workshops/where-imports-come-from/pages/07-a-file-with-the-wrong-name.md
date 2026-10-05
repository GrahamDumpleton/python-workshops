---
title: A file with the wrong name
requires: [quiz:predict-shadow, verify:shadow-found]
---

# A file with the wrong name

You know the places that Python searches, and you know the order. On
this page you use that knowledge to predict a bug, and then you find
its cause. Almost every Python programmer meets this bug one time.

## A natural name

Think of this situation. You want to practise the module `random`,
and you want to keep some notes about it in a file. You give the file
the name of its subject: `random.py`. This is a natural choice, and
many people make it.

Make that file now, in the file browser, in the same way as on the
page about `where.py`. First click the action below, which makes sure
that the file browser shows your work directory.

```{file-browser-reveal}
:id: reveal-work-again
:title: Show my work directory in the file browser
:path: pick.py
```

Then do these steps:

1. Click with the right button of the mouse on the empty space under
   the names of the files. If your mouse or trackpad has one button,
   hold the `Ctrl` key and click.

2. Click `New File` in the menu.

3. Type `random.py` and press `Enter`.

4. Double-click `random.py` in the file browser, so that it opens in
   the editor.

Type this one line in the file:

```python
print("These are my notes about random numbers.")
```

Save the file. Hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
press `S`.

```{attempt}
:id: shadow-no-file
:check: shadow-found
:expect: There is no file random.py in your work directory yet
```

````{hint}
:title: Make the file for me

If the menu of the file browser does not work for you, click the
action below. It makes the file `random.py` with its one line, and
opens it.

```{file-write}
:id: make-random
:title: Make the file random.py and open it
:path: random.py
:open: true
print("These are my notes about random numbers.")
```
````

## Predict

Your work directory now holds your file `random.py`. It also still
holds the script `pick.py` from the beginning of this workshop:

```python
import random

random.seed(7)
meals = ["soup", "rice", "noodles", "salad"]
print("Today:", random.choice(meals))
```

When you ran `python pick.py` before, it showed `Today: noodles`. You
did not change `pick.py`.

Think about the directories that Python searches for `import random`,
and about their order. Then answer the question.

```{quiz}
:id: predict-shadow
:title: Predict the result
question: "What happens when you run `python pick.py` now?"
options:
  - { text: "It shows `Today: noodles`, as before. The module `random` of the standard library is always found first.", explanation: "The standard library does not come first. The first item of `sys.path` is the directory of the script, and that directory now holds a file with the name `random.py`." }
  - { text: "It shows the line of your notes, and then Python stops with an error message.", correct: true }
  - { text: "Python stops with a `ModuleNotFoundError`, because two files have the name `random.py`.", explanation: "Two files with the same name are not an error for Python. It uses the first one that it finds, and it never looks at the second one." }
explanation: "Python searches the directory of the script first. It finds your file `random.py` there, and stops the search. An import runs the code of the module, so the line of your notes appears. Then `pick.py` calls `random.seed(7)`, and your file has no function with the name `seed`."
```

## Run it

Type this command in the terminal, and press `Enter`:

```
python pick.py
```

````{hint}
:title: Run the command for me

```{execute}
:id: run-pick-shadow
:wait: prompt
python pick.py
```
````

The terminal shows this. The paths are written with `...`, because
they are different on each computer:

```
These are my notes about random numbers.
Traceback (most recent call last):
  File ".../work/pick.py", line 3, in <module>
    random.seed(7)
    ^^^^^^^^^^^
AttributeError: module 'random' has no attribute 'seed' (consider renaming '.../work/random.py' since it has the same name as the standard library module named 'random' and prevents importing that standard library module)
```

Read it in three parts:

- **The first line** is the line of your notes. The script `pick.py`
  has no such line. It appears because `import random` ran the code
  of your file.

- **The last line** begins with `AttributeError`. This error means
  that a value does not have the attribute that the code asked for.
  Here the value is the module `random`, and the attribute is `seed`.
  You know that the module `random` of the standard library has a
  function `seed`. So this message is the sign that the name `random`
  refers to some other module.

- **The text in parentheses** is advice from Python. It names your
  file, and it says that the file has the same name as a module of
  the standard library. Python gives this advice since version 3.13.
  An older Python ends the message after `'seed'`, so you must be
  able to find the cause yourself.

## Find the cause yourself

You already know the tool: a module knows which file it came from.

Click the action below to open `pick.py` in the editor.

```{file-open}
:id: open-pick-again
:title: Open pick.py in the editor
:path: pick.py
```

Add one line directly under the line `import random`:

```python
print(random.__file__)
```

The new line must come before the line `random.seed(7)`, because
Python stops at that line.

Save the file, and run `python pick.py` in the terminal again. The
check below runs when you save the file.

```{attempt}
:id: shadow-not-shown
:check: shadow-found
:expect: pick.py does not show the file of the module random yet
```

````{attempt}
:id: shadow-other-error
:check: shadow-found
:expect: The last line of the error is: NameError

```{file-write}
:path: pick.py
import random

print(file)
random.seed(7)
meals = ["soup", "rice", "noodles", "salad"]
print("Today:", random.choice(meals))
```
````

````{hint}
:title: "Hint 1: where the line goes"

The file `pick.py` begins with the line `import random`. Put the
cursor at the end of that line and press `Enter`. Type the new line
on the empty line that appears. The new line has no spaces at its
beginning.
````

````{hint}
:title: "Hint 2: the form of the line"

The line shows one attribute of the module with `print()`. The name
of the attribute is `__file__`, with two underscores before the word
`file` and two underscores after it. So the line is
`print(random.__file__)`.
````

````{hint}
:title: Show me a solution
:unlock: "shadow-found" in failed_checks or "shadow-found" in passed_checks
:locked: Click Check below first

The first action writes `pick.py` with the new line. The second
action runs it.

```{file-write}
:id: shadow-solution
:title: Write pick.py with the new line
:path: pick.py
:open: true
import random

print(random.__file__)
random.seed(7)
meals = ["soup", "rice", "noodles", "salad"]
print("Today:", random.choice(meals))
```

```{execute}
:id: shadow-run
:wait: prompt
python pick.py
```
````

```{verify}
:id: shadow-found
:label: pick.py shows which file the module random came from
:trigger: file-saved pick.py; after:shadow-run
import os, subprocess, sys
from pathlib import Path

assert Path("random.py").exists(), "There is no file random.py in your work directory yet. Make the file in the file browser, type the one line in it, and save it."
quiet = {**os.environ, "PYTHON_COLORS": "0"}
try:
    run = subprocess.run([sys.executable, "pick.py"], capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL, env=quiet)
except subprocess.TimeoutExpired:
    raise AssertionError("The program pick.py did not end after 5 seconds. Look for a loop that never ends, in pick.py or in random.py.") from None
shown = [line.strip() for line in run.stdout.splitlines()]
yours = os.path.realpath("random.py")
found = [line for line in shown if os.path.isabs(line) and os.path.realpath(line) == yours]
last = (run.stderr.strip().splitlines() or [""])[-1]
if not found and run.returncode != 0 and not last.startswith("AttributeError"):
    raise AssertionError(f"Python stopped with an error that this step does not expect when it ran pick.py. The last line of the error is: {last}")
assert found, "pick.py does not show the file of the module random yet. Add the line print(random.__file__) directly under the line import random, save the file, and run it again."
print("Correct. pick.py shows that the module random came from the file random.py in your work directory.")
```

## What happened

The terminal now shows one more line, directly under the line of
your notes. It looks like this:

```
.../work/random.py
```

That is the path of your own file. It is not the path
`.../lib/python3.14/random.py` that `where.py` showed for the module
`random` of the standard library.

Python did what it always does. It searched the directories of
`sys.path` in order. The first directory is the directory of the
script, which is your work directory. It holds a file with the name
`random.py`, so Python used that file and stopped the search. It
never looked in the directory of the standard library.

Your file hides the module of the standard library. Programmers say
that your file **shadows** the module.

This is the method to remember. When a module that you know well
seems to have lost a function, show its attribute `__file__`. The
path tells you which file Python really imported.

On the next page you repair the bug.
