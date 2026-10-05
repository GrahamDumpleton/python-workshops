---
title: The file of a module
requires: [verify:where-three, quiz:library-directory]
---

# The file of a module

A module knows which file it came from. On this page you ask three
modules for their files.

## The attribute `__file__`

The list `sys.path` tells you where Python can look. It does not tell
you where Python found one module. For that, you ask the module
itself.

An **attribute** is a value that belongs to another value. You write
it after a dot, with no parentheses. When Python imports a module
from a file, it gives the module an attribute with the name
`__file__`. The value of this attribute is a string: the path of the
file that the module came from.

The name has two underscores on each side. This marks a name that
Python itself makes. You do not choose such a name.

This script shows the file of the module `menu`:

```python
import menu

print(menu.__file__)
```

## Make a script of your own

In this step you make a file yourself, in the file browser. First
click the action below. It makes sure that the file browser shows
your work directory.

```{file-browser-reveal}
:id: reveal-work
:title: Show my work directory in the file browser
:path: menu.py
```

Then do these steps:

1. Move the pointer to the empty space under the names of the files,
   in the file browser.

2. Click with the right button of the mouse. If your mouse or
   trackpad has one button, hold the `Ctrl` key and click. A menu
   opens.

3. Click `New File` in the menu. A new file appears in the list. Its
   name is `untitled.txt`, and the name is marked, ready for you to
   change it.

4. Type `where.py` and press `Enter`.

5. Double-click `where.py` in the file browser. The file opens in
   the editor, and it is empty.

## What your script must do

Write a script in `where.py` that shows the file of three modules, in
this order:

1. the module `menu`

2. the module `random`

3. the module `csv`

The script shows three lines. Each line is the value of the
attribute `__file__` of one module. For example, the first
line ends with `work/menu.py`.

When you have typed the code, save the file. To **save** means to
write what the editor shows to the file on the disk. Hold `Ctrl` and
press `S`. On a Mac, hold `Cmd` and press `S`. Python reads the file
on the disk, so a change that you did not save does not count.

Then run your script. Type this command in the terminal, and press
`Enter`:

```
python where.py
```

```{attempt}
:id: where-missing
:check: where-three
:expect: There is no file where.py in your work directory
```

````{hint}
:title: Make the empty file for me

If the menu of the file browser does not work for you, click the
action below. It makes the empty file `where.py` and opens it.

```{file-write}
:id: make-where
:title: Make the empty file where.py and open it
:path: where.py
:open: true
```
````

```{attempt}
:id: where-empty
:check: where-three
:expect: it showed nothing
```

````{attempt}
:id: where-error
:check: where-three
:expect: The last line of the error is: AttributeError

```{file-write}
:path: where.py
import sys

print(sys.__file__)
```
````

````{attempt}
:id: where-one-only
:check: where-three
:expect: Line 2 of the output must be the file of the module random

```{file-write}
:path: where.py
import menu

print(menu.__file__)
```
````

````{attempt}
:id: where-name-only
:check: where-three
:expect: Line 1 of the output must be the file of the module menu. On that line your program showed: menu.py

```{file-write}
:path: where.py
print("menu.py")
print("random.py")
print("csv.py")
```
````

````{hint}
:title: "Hint 1: where to begin"

Begin with the script for one module that this page shows above:
the line `import menu`, and then the line `print(menu.__file__)`.
Save the file and run it. When it shows one path, add the other two
modules.
````

````{hint}
:title: "Hint 2: the form of the script"

The script needs three `import` lines, one for each module. Then it
needs three `print()` lines. Each `print()` line shows the attribute
`__file__` of one module, in the form `print(random.__file__)`. The
`print()` lines must be in the order `menu`, `random`, `csv`.
````

````{hint}
:title: Show me a solution
:unlock: "where-three" in failed_checks
:locked: Click Check below first

The first action writes a working script to `where.py`. The second
action runs it.

```{file-write}
:id: where-solution
:title: Write a solution to where.py
:path: where.py
:open: true
import menu
import random
import csv

print(menu.__file__)
print(random.__file__)
print(csv.__file__)
```

```{execute}
:id: where-run
:wait: prompt
python where.py
```
````

```{verify}
:id: where-three
:label: where.py shows the files of menu, random and csv
:trigger: terminal-output "csv.py"; file-saved where.py; after:where-run
import os, subprocess, sys
from pathlib import Path

names = ["menu", "random", "csv"]
assert Path("where.py").exists(), "There is no file where.py in your work directory. Make the file in the file browser, type the code, and save the file."
quiet = {**os.environ, "PYTHON_COLORS": "0"}
try:
    run = subprocess.run([sys.executable, "where.py"], capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL, env=quiet)
except subprocess.TimeoutExpired:
    raise AssertionError("Your program did not end after 5 seconds. Look for a loop that never ends.") from None
if run.returncode != 0:
    last = (run.stderr.strip().splitlines() or ["no message"])[-1]
    raise AssertionError(f"Python stopped with an error when it ran where.py. The last line of the error is: {last}")
shown = [line.strip() for line in run.stdout.strip().splitlines()]
assert shown, "Your program ran, and it showed nothing. Did you save the file? Use print() to show the attribute __file__ of each module."
code = "import importlib\nfor name in " + repr(names) + ":\n    print(importlib.import_module(name).__file__)"
real = subprocess.run([sys.executable, "-c", code], capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL, env=quiet).stdout.splitlines()
assert len(real) == len(names), "The check could not find the files of the three modules itself. Look for a file in your work directory that has the name random.py or csv.py, and give it another name."
for position, name in enumerate(names):
    line = shown[position] if position < len(shown) else "nothing"
    same = os.path.isabs(line) and os.path.realpath(line) == os.path.realpath(real[position])
    assert same, f"Line {position + 1} of the output must be the file of the module {name}. On that line your program showed: {line}. Write the lines import {name} and print({name}.__file__), save the file, and run it again."
print("Correct. Your program shows the file of each of the three modules.")
```

## Read the three paths

Look at the three lines in the terminal. The paths are different on
each computer. On one computer they look like this, with `...` in
place of the part that differs:

```
.../work/menu.py
.../lib/python3.14/random.py
.../lib/python3.14/csv.py
```

The first path is in your work directory. You saw that file in the
editor.

The second path and the third path are in another directory. The two
files `random.py` and `csv.py` are in the same directory.

```{quiz}
:id: library-directory
:type: text
:title: The directory of the standard library
question: "Look at the second line in the terminal. It ends with `/random.py`. What is the name of the directory that holds this file? Type the part of the path between the last two `/` characters."
answer:
  - "python3.14"
  - { pattern: "/?python3\\.\\d+t?/?", example: "python3.14" }
wrong:
  - { pattern: "/?lib/?", explanation: "The directory `lib` comes one step earlier in the path. Read the part directly before `/random.py`." }
  - { pattern: "(.*/)?random\\.py", explanation: "That is the name of the file. Type the name of the directory that holds it, which is the part directly before `/random.py`." }
  - { pattern: "(.*/)?work/?", explanation: "That is the directory of `menu.py`, in the first line. Look at the second line, which ends with `/random.py`." }
otherwise: "Find the line that ends with `/random.py`. Read the part between the `/` before `random.py` and the `/` before that."
explanation: "The file `random.py` is in a directory with the name `python3.14`. This is the directory of the standard library. It is one of the lines that `show_path.py` showed, so it is in `sys.path`."
```

## What happened

The module `random` is a normal file of Python code, with the name
`random.py`. Somebody wrote it, and it arrived on this computer when
Python was installed. The line `import random` works because the
directory that holds this file is in `sys.path`. Nothing more is
needed.

The same is true for `csv`, `datetime`, `decimal` and most other
modules of the standard library.

A few modules have no file. The module `sys` is one of them. Such a
module is part of the program `python` itself, and Python finds it
before it searches any directory. A module that has no file has no
attribute `__file__`.
