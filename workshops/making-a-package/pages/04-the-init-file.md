---
title: The file that marks a package
requires: [verify:init-made]
---

# The file that marks a package

A package has one file with a special name: `__init__.py`. On this
page you make that file.

## What the file is for

The name `__init__.py` has two underscores, the word `init`, two
underscores again, and `.py`. You know this pattern from the method
`__init__` of a class, and from the name `__name__`. Two underscores
on each side mark a name that has a special meaning for Python.

The file does two things.

- It marks the directory as a package. A person who sees the file
  knows that the directory is one program, and not only a place where
  some files lie.

- When a program imports the package, Python runs this file first. So
  the file is the place for code that the whole package needs at the
  start. Most packages need no such code.

In the comparison with a box, `__init__.py` is the label on the box.

The file can be very short. In many packages it holds one line: a
string that says what the package is. A string on the first line of a
file, in three double quotes on each side, is a **docstring**. The
four modules of the program each begin with one.

Python can also import a directory that has no file `__init__.py`.
That form is made for a special use, and it does not behave in the
same way. A normal package always has the file.

## Your task

Make the file `__init__.py` inside the directory `spending`, with one
line in it.

First, the action below opens the file browser at the left side of
the window, and shows the directory `spending` in it.

```{file-browser-reveal}
:id: show-package
:title: Show the directory spending in the file browser
:path: spending/models.py
```

Then do these steps yourself:

1. In the file browser, click the empty space under the list of
   files with the right button of the mouse. A menu opens. Click
   `New File` in the menu.

2. A new file appears in the list, with the name `untitled.txt`. The
   name is ready for you to change. Type `__init__.py` and press
   `Enter`. If the name is not ready to change, click the file with
   the right button of the mouse, and click `Rename` in the menu.

3. Double-click the file `__init__.py` in the list. It opens in the
   editor, in the upper part of the window. It is empty.

4. Type this one line in the editor:

   ```python
   """The spending tracker."""
   ```

5. Save the file: hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
   press `S`. To **save** means to write what the editor shows to the
   file on the disk. Python reads the file on the disk, so a change
   that is not saved does not exist for Python.

```{hint}
:title: Hint: the name of the file
Count the underscores: two before `init` and two after it. The name
has no spaces, and it ends with `.py`, not with `.txt`.
```

```{hint}
:title: Hint: the file is in the wrong place
The file browser shows the name of the directory that it is in, above
the list of files. It must show `spending` at the end. If it does
not, click the action above again, and then make the file.
```

```{attempt}
:id: init-not-made
:check: init-made
:expect: There is no file __init__.py in the directory spending yet
```

````{attempt}
:id: init-outside
:check: init-made
:expect: is in your work directory, and it must be inside the directory spending

```{file-write}
:path: __init__.py
"""The spending tracker."""
```
````

````{attempt}
:id: init-untitled
:check: init-made
:expect: still has the name untitled.txt

```{file-delete}
:path: __init__.py
```

```{file-write}
:path: spending/untitled.txt
"""The spending tracker."""
```
````

````{attempt}
:id: init-empty
:check: init-made
:expect: but it holds no docstring

```{file-delete}
:path: spending/untitled.txt
```

```{file-write}
:path: spending/__init__.py
```
````

````{attempt}
:id: init-error
:check: init-made
:expect: The last line of the error is: SyntaxError

```{file-write}
:path: spending/__init__.py
"""The spending tracker.
```
````

````{hint}
:title: Show me a solution
:unlock: "init-made" in failed_checks or "init-made" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes the file `__init__.py` in the directory
`spending`, with the one line in it, and opens it in the editor.

```{file-write}
:id: init-solution
:title: Write the file spending/__init__.py
:path: spending/__init__.py
:open: true
"""The spending tracker."""
```
````

```{verify}
:id: init-made
:label: The package has the file __init__.py
:trigger: file-saved spending/__init__.py; after:init-solution
import os, subprocess, sys
from pathlib import Path

if not Path("spending/__init__.py").exists():
    if Path("__init__.py").exists():
        raise AssertionError("The file __init__.py is in your work directory, and it must be inside the directory spending. Move it with this command in the terminal: mv __init__.py spending/")
    if Path("spending/untitled.txt").exists():
        raise AssertionError("The new file still has the name untitled.txt. In the file browser, click the file with the right button of the mouse, and click Rename in the menu. Then type __init__.py and press Enter.")
    raise AssertionError("There is no file __init__.py in the directory spending yet. Make the file in the file browser. Check the name: two underscores, the word init, two underscores, and .py at the end.")
try:
    run = subprocess.run(
        [sys.executable, "-c", "import spending; print(spending.__doc__)"],
        capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError("The check imported the package, and the file spending/__init__.py did not end after 10 seconds. The file must hold one line only, the docstring. Remove every other line, and save the file.") from None
if run.returncode != 0:
    last = run.stderr.strip().splitlines()[-1]
    raise AssertionError(f"Python stopped with an error when it ran the file spending/__init__.py. The last line of the error is: {last}. The file must hold one line: three double quotes, the words The spending tracker and a full stop, and three double quotes again.")
shown = run.stdout.strip()
assert shown and shown != "None", "The file spending/__init__.py exists, but it holds no docstring. Type the line in the editor, with three double quotes on each side of the text. Then save the file: hold Ctrl and press S, or Cmd and S on a Mac."
print("Python imported the package, and it ran the file spending/__init__.py. The docstring of the package is:", shown)
```

## What happened

The directory `spending` is now a package in the full sense. It holds
five files: `__init__.py`, `cli.py`, `models.py`, `report.py` and
`storage.py`.

The program is not ready yet. The modules have moved, but the code
inside them still looks for the other modules in the old place. The
next page shows what goes wrong.
