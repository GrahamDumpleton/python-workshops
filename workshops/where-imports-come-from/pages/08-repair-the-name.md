---
title: Repair the name
requires: [verify:pick-works, quiz:safe-name]
---

# Repair the name

The script `pick.py` is correct, and it stops with an error. The
cause is not in its code. The cause is the name of another file. On
this page you repair it.

## Why a new name repairs it

Python uses your file because two things are true: the file is in the
first directory that Python searches, and its name is `random.py`.
When you change one of these two things, the bug is gone.

The simplest repair is to give your file another name. Then the first
directory holds no file with the name `random.py`. Python continues
the search, and it finds the file of the standard library, as it did
before.

You do not need to change `pick.py`. No change in `pick.py` can
repair this bug, because the line `import random` gives Python only a
name.

## Give the file another name

Give your notes the name `random_notes.py`. No module of Python has
that name.

First click the action below, which makes sure that the file browser
shows your work directory.

```{file-browser-reveal}
:id: reveal-work-rename
:title: Show my work directory in the file browser
:path: pick.py
```

Then do these steps:

1. In the file browser, click the file `random.py` with the right
   button of the mouse. If your mouse or trackpad has one button,
   hold the `Ctrl` key and click. A menu opens.

2. Click `Rename` in the menu. The name is marked, ready for you to
   change it.

3. Type `random_notes.py` and press `Enter`.

Then type this command in the terminal, and press `Enter`:

```
python pick.py
```

```{attempt}
:id: still-random
:check: pick-works
:expect: The file random.py is still in your work directory
```

````{attempt}
:id: pick-broken
:check: pick-works
:expect: The last line of the error is: AttributeError

```{file-rename}
:path: random.py
:to: attempt_notes.py
```

```{file-write}
:path: pick.py
import random

random.sede(7)
meals = ["soup", "rice", "noodles", "salad"]
print("Today:", random.choice(meals))
```
````

````{attempt}
:id: pick-waits
:check: pick-works
:expect: did not end

```{file-write}
:path: pick.py
import random

while True:
    pass
```
````

````{attempt}
:id: pick-other-output
:check: pick-works
:expect: it does not show the line Today: noodles

```{file-write}
:path: pick.py
import random

print("Today: soup")
```
````

````{attempt}
:id: random-again
:check: pick-works
:expect: The file random.py is still in your work directory

```{file-rename}
:path: attempt_notes.py
:to: random.py
```

```{file-write}
:path: pick.py
import random

print(random.__file__)
random.seed(7)
meals = ["soup", "rice", "noodles", "salad"]
print("Today:", random.choice(meals))
```
````

````{hint}
:title: "Hint 1: the menu does not show Rename"

The menu with `Rename` opens when the pointer is on the name
`random.py` in the file browser. If you click on the empty space
under the names, a different menu opens. Press `Esc` to close it, and
click on the name of the file.
````

````{hint}
:title: "Hint 2: the error is still there"

Look at the file browser. If it still shows a file with the name
`random.py`, the new name was not accepted. Do the three steps again,
and press `Enter` after you type the new name. If the file browser
shows `random_notes.py` and the error is still there, read the last
line of the error message. It can be a different error now.
````

````{hint}
:title: Show me a solution
:unlock: "pick-works" in failed_checks
:locked: Click Check below first

The first action gives the file `random.py` the name
`random_notes.py`. If you already changed the name yourself, you do
not need this action. The second action runs `pick.py`.

```{file-rename}
:id: rename-solution
:title: Give random.py the name random_notes.py
:path: random.py
:to: random_notes.py
```

```{execute}
:id: pick-run
:wait: prompt
python pick.py
```
````

```{verify}
:id: pick-works
:label: pick.py works again
:trigger: terminal-output "Today:"; after:pick-run
import os, subprocess, sys
from pathlib import Path

assert not Path("random.py").exists(), "The file random.py is still in your work directory. In the file browser, click it with the right button of the mouse, click Rename, type random_notes.py and press Enter."
quiet = {**os.environ, "PYTHON_COLORS": "0"}
try:
    run = subprocess.run([sys.executable, "pick.py"], capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL, env=quiet)
except subprocess.TimeoutExpired:
    raise AssertionError("The program pick.py did not end after 5 seconds. Look for a loop that never ends.") from None
if run.returncode != 0:
    last = (run.stderr.strip().splitlines() or ["no message"])[-1]
    raise AssertionError(f"Python stopped with an error when it ran pick.py. The last line of the error is: {last}")
shown = [line.strip() for line in run.stdout.splitlines()]
assert "Today: noodles" in shown, "The program pick.py ran with no error, but it does not show the line Today: noodles. The lines random.seed(7), the list of four meals and the last print() line must be as they were at the start."
print("Correct. No file hides the module random now, and pick.py shows: Today: noodles")
```

## What happened

The terminal shows two lines. The first is the path that your line
`print(random.__file__)` shows, with `...` here for the part that
differs:

```
.../lib/python3.14/random.py
Today: noodles
```

The path is in the directory of the standard library again. Python
searched your work directory first, found no file with the name
`random.py`, and continued with the next directories.

You can now remove the line `print(random.__file__)` from `pick.py`.
It was a tool to find the bug, and the program does not need it.

## One file can break much more

While your file had the name `random.py`, it did not only break
`pick.py`. It broke every program in that directory that needs the
module `random`, also when the program does not import `random`
itself. For example, the code of `jupyterlab` uses modules of the
standard library that import `random`. So your script `where.py`
also stopped with an error during that time.

The error message in such a case can be long, and it can name files
that you never saw. The cause is still one file with the wrong name,
in the directory of your script.

## The rule

Do not give a file of your own the name of a module that you import.
That means the modules of the standard library, such as `random`,
`math`, `csv`, `json`, `datetime` and `statistics`, and also the
names of installed code.

A good name says what your file is for: `random_notes.py`,
`pick.py`, `read_spending.py`.

```{quiz}
:id: safe-name
:title: A safe name
question: "You write a module of your own with functions that read CSV files. Which name is safe for the file?"
options:
  - { text: "`csv.py`", explanation: "The standard library has a module with the name `csv`. A file `csv.py` beside your script hides it, so `import csv` gives your file." }
  - { text: "`csv_tools.py`", correct: true }
  - { text: "`json.py`", explanation: "The standard library has a module with the name `json`. A file `json.py` beside your script hides it for every program in that directory." }
explanation: "No module of Python has the name `csv_tools`, so the file hides nothing. Inside it, the line `import csv` still finds the module of the standard library."
```
