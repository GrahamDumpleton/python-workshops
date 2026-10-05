---
title: Installed code
requires: [verify:where-installed, quiz:installed-directory]
---

# Installed code

One directory of `sys.path` has the name `site-packages`. On this
page you look at what it is for, and at what it holds.

## Code that does not come with Python

The standard library is the same for everybody who has the same
version of Python. But people all over the world also publish Python
code of their own, for anyone to use. This code does not come with
Python. You install it when you need it.

Python keeps installed code apart from the standard library, in a
directory of its own. The name of that directory is `site-packages`.
Programmers call a piece of installed code a package. A later
workshop explains that word, and shows how to install one. On this
page, you only look.

Think of the library again. Some books were there on the day that the
library opened. Other books were bought later, and they are kept on a
shelf of their own. Everybody knows that shelf, and a new book always
goes there.

This computer already has installed code. JupyterLab, the program
that you are using now, is written partly in Python. Somebody
installed it, so its code is in `site-packages`.

## A command that shows the places

Python has a command that shows `sys.path` with no script of your
own. This command is new, so the action below runs it for you. Click
it, and look at the terminal.

```{execute}
:id: run-site
:wait: prompt
python -m site
```

The option `-m` tells `python` to find a module by its name, in the
same way as `import` does, and to run that module as a program. The
module `site` is a module of the standard library. When Python
starts, this module adds the directory `site-packages` to `sys.path`.
When you run it as a program, it shows the list.

The output looks like this, with `...` in place of the parts that
differ on each computer:

```
sys.path = [
    '.../work',
    '.../lib/python314.zip',
    '.../lib/python3.14',
    '.../lib/python3.14/lib-dynload',
    '.../lib/python3.14/site-packages',
]
USER_BASE: ...
USER_SITE: ...
ENABLE_USER_SITE: ...
```

The first part is the list `sys.path`, with the same directories that
your script `show_path.py` showed. The first item is your work
directory. This command has no script, so the first place is the
current directory of the terminal.

The last three lines are about one more directory, which belongs to
one user of the computer. These workshops do not use it, and you can
ignore those lines.

## Look inside

The path of `site-packages` is long, and it is different on each
computer. So a script finds the directory for you. Click the action
below. It makes a script with the name `packages.py`, and opens it.

```{file-write}
:id: write-packages
:title: Make the script packages.py and open it
:path: packages.py
:open: true
import os
import sys

for directory in sys.path:
    if "site-packages" in directory:
        names = sorted(os.listdir(directory))
        print(directory)
        print("Number of names:", len(names))
        for name in names:
            if "jupyter" in name and "." not in name:
                print("   ", name)
```

Three things in this script are new or need a reminder:

- With two strings, the operator `in` asks if the first string is a
  part of the second string. So `"site-packages" in directory` is
  `True` for a path that has `site-packages` in it.

- The function `os.listdir()` is in the module `os` of the standard
  library. It gives a list of the names of the files and directories
  that a directory holds.

- The last `if` chooses the names that have `jupyter` in them and
  that have no dot. A directory holds too many names to read them
  all, so the script shows only these.

Type this command in the terminal, and press `Enter`:

```
python packages.py
```

````{hint}
:title: Run the command for me

```{execute}
:id: run-packages
:wait: prompt
python packages.py
```
````

On one computer the output looks like this, with `...` in place of
the first part of the path and in place of some of the names. Your
number and your names can be different:

```
.../lib/python3.14/site-packages
Number of names: 245
    jupyter_builder
    jupyter_client
    jupyter_core
    ...
    jupyterlab
    ...
```

The directory holds some hundreds of names. Nobody typed these files
on this computer. A tool copied them into `site-packages` when
JupyterLab was installed. Each name in the list is a directory that
holds modules.

One of the names is `jupyterlab`, on a computer where JupyterLab was
installed for this Python. Because `site-packages` is in `sys.path`,
the line `import jupyterlab` finds it.

## Ask the module where it came from

Now test that yourself. Change your script `where.py` so that it also
shows the file of the module `jupyterlab`:

- Add the line `import jupyterlab` under the other `import` lines.

- Add a `print()` line at the end that shows the attribute `__file__`
  of that module.

Save the file. Hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
press `S`. Then type this command in the terminal, and press `Enter`:

```
python where.py
```

```{attempt}
:id: installed-not-shown
:check: where-installed
:expect: Your program shows the files of 3 modules, and this step asks for one more module
```

````{attempt}
:id: installed-wrong-name
:check: where-installed
:expect: The last line of the error is: ModuleNotFoundError

```{file-write}
:path: where.py
import menu
import random
import csv
import jupiterlab

print(menu.__file__)
print(random.__file__)
print(csv.__file__)
print(jupiterlab.__file__)
```
````

````{attempt}
:id: installed-no-file
:check: where-installed
:expect: There is no file where.py in your work directory

```{file-delete}
:path: where.py
```
````

````{hint}
:title: "Hint 1: the two lines"

The two new lines have the same form as the lines that the script
already has. The `import` line names the module `jupyterlab`. The
`print()` line shows `jupyterlab.__file__`.
````

````{hint}
:title: "Hint 2: an error with the word ModuleNotFoundError"

If Python stops with a `ModuleNotFoundError`, read the name in the
last line of the error message. The name of the module is
`jupyterlab`, in small letters, with no space and no hyphen.

If the name is correct and the error stays, the list that
`packages.py` showed has no name `jupyterlab` on your computer. Use
another name from that list in place of `jupyterlab`, in both lines.
````

````{hint}
:title: Show me a solution
:unlock: "where-installed" in failed_checks
:locked: Click Check below first

The first action writes a working script to `where.py`. The second
action runs it.

```{file-write}
:id: installed-solution
:title: Write a solution to where.py
:path: where.py
:open: true
import menu
import random
import csv
import jupyterlab

print(menu.__file__)
print(random.__file__)
print(csv.__file__)
print(jupyterlab.__file__)
```

```{execute}
:id: installed-run
:wait: prompt
python where.py
```
````

```{verify}
:id: where-installed
:label: where.py shows the file of one more module
:trigger: terminal-output "__init__.py"; file-saved where.py; after:installed-run
import os, subprocess, sys
from pathlib import Path

assert Path("where.py").exists(), "There is no file where.py in your work directory. Open the solution on the page before this one, or the solution on this page, to make the file again."
quiet = {**os.environ, "PYTHON_COLORS": "0"}
try:
    run = subprocess.run([sys.executable, "where.py"], capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL, env=quiet)
except subprocess.TimeoutExpired:
    raise AssertionError("Your program did not end after 5 seconds. Look for a loop that never ends.") from None
if run.returncode != 0:
    last = (run.stderr.strip().splitlines() or ["no message"])[-1]
    raise AssertionError(f"Python stopped with an error when it ran where.py. The last line of the error is: {last}")
shown = [line.strip() for line in run.stdout.splitlines()]
files = []
for line in shown:
    if os.path.isabs(line) and os.path.isfile(line) and os.path.realpath(line) not in files:
        files.append(os.path.realpath(line))
assert len(files) >= 4, f"Your program shows the files of {len(files)} modules, and this step asks for one more module. Add the lines import jupyterlab and print(jupyterlab.__file__), save the file, and run it again."
print("Correct. Your program shows that the new module came from this file:", files[3])
```

## Read the new path

Look at the new line in the terminal. On most computers it looks like
this, with `...` in place of the part that differs:

```
.../lib/python3.14/site-packages/jupyterlab/__init__.py
```

Find the name `site-packages` in your line. It is the name of the
directory that `packages.py` showed, and that directory is in
`sys.path`. Python searched the directories of `sys.path` in order,
and this is the first one that holds the name `jupyterlab`.

```{quiz}
:id: installed-directory
:title: Where installed code goes
question: "Think of a tool that installs code with the name `rich` for this Python. Into which directory does the tool copy the files?"
options:
  - { text: "Into your work directory, beside your scripts", explanation: "Your work directory holds your own files. Installed code is kept apart from them, in a directory that every script of this Python can use." }
  - { text: "Into the directory `site-packages`", correct: true }
  - { text: "Into the directory of the standard library, beside `random.py`", explanation: "The directory of the standard library holds only the modules that come with Python. Installed code has a directory of its own." }
explanation: "Installed code goes into `site-packages`. That directory is in `sys.path`, so after the files are copied, the line `import rich` finds them."
```

## What happened

The path does not end with `jupyterlab.py`. The module `jupyterlab`
is not one file. It is a directory of modules, and the attribute
`__file__` shows a file with the name `__init__.py` inside that
directory. The next workshop, **Making a package**, explains such a
directory and that file.

The important thing on this page is the place. To install code for
Python means to copy its files into `site-packages`. After that, an
import finds the code, because `site-packages` is in `sys.path`.
Nothing more happens.

You now know three places where an import can come from:

| Place | What it holds |
|-------|---------------|
| the directory of the script | your own modules |
| the directory of the standard library | the modules that come with Python |
| `site-packages` | code that was installed later |

Python searches them in this order.
