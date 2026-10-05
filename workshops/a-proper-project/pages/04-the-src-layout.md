---
title: The src layout
requires: [verify:src-layout, quiz:predict-after-move]
---

# The src layout

On this page you move the package `spending` into a new directory
with the name `src`. Afterwards, nothing can find the package by
accident.

## What the src layout is

The **src layout** is a way to arrange a project. The package does
not sit in the first directory of the project. It sits one level
lower, in a directory with the name `src`, which is short for
"source". The source of a program is its code. The tests stay where
they are.

```
spending.csv
requirements.txt
src/
    spending/
        __init__.py
        ...
tests/
    test_models.py
    test_report.py
```

## Why it exists

On the last page, the tests found the package only because the
terminal was in the right directory. That hides mistakes. A test can
pass on your computer and the program can still be broken for the
people who install it, for example when a file is missing from what
they get.

In the src layout, the current directory holds no package. So the
only way for Python to find `spending` is to find it installed in the
environment. The tests then run against the installed package, not
against whatever directory the terminal is in. The Python Packaging User
Guide gives the same reason.

An everyday comparison: a cook tastes the soup from a plate, as it
goes to the table, and not from the spoon in the kitchen. What the
cook tastes is then what the guest gets.

## Your task: move the package

Two commands do it. The workshop **Making a package** taught both.

The command `mkdir` makes a directory. Its name is short for "make
directory":

```
mkdir src
```

The command `mv` moves a file or a directory. After the word `mv`
you write what to move, and then the place where it must go. The `/`
at the end says that `src` is a directory. A directory moves with
everything inside it:

```
mv spending src/
```

The command `ls` with a name after it shows what a directory holds.
Use it to look at the result:

```
ls src
```

Look at the prompt first. It must not show the name `tests`. If it
does, type `cd ..` and press `Enter`. Then type the three commands,
one after another, and press `Enter` after each one. The last command
shows one name, `spending`.

```{hint}
:title: Hint: I see a message that begins with mv
The message means that `mv` did not find what to move. Type `ls` to
see what your work directory holds. If you see no `spending` there,
type `ls src`: perhaps the package has moved already.
```

```{attempt}
:id: src-missing
:check: src-layout
:expect: There is no directory src in your work directory yet
```

````{attempt}
:id: src-in-tests
:check: src-layout
:expect: inside the directory tests

```{directory-create}
:path: tests/src
```
````

````{attempt}
:id: package-lost
:check: src-layout
:expect: The check cannot find the package spending

```{file-delete}
:path: tests/src
:recursive: true
```

```{file-rename}
:path: spending
:to: spendng
```
````

````{attempt}
:id: package-back
:check: src-layout
:expect: There is no directory src in your work directory yet

```{file-rename}
:path: spendng
:to: spending
```
````

````{attempt}
:id: package-not-moved
:check: src-layout
:expect: is still in your work directory

```{directory-create}
:path: src
```
````

````{attempt}
:id: src-removed
:check: src-layout
:expect: There is no directory src in your work directory yet

```{file-delete}
:path: src
:recursive: true
```
````

````{hint}
:title: Show me the commands
:unlock: "src-layout" in failed_checks or "src-layout" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The actions below run the three commands. They work when the terminal
is in your work directory, and the directory `src` does not exist
yet.

```{execute}
:id: make-src
:title: Make the directory src
:wait: prompt
mkdir src
```

```{execute}
:id: move-solution
:title: Move the package into src
:wait: prompt
mv spending src/
```

```{execute}
:id: list-src
:title: Show what src holds
:wait: prompt
ls src
```
````

```{verify}
:id: src-layout
:label: The package spending is in the directory src
:trigger: terminal-output "ls src"; after:list-src
from pathlib import Path

if Path("src/spending/__init__.py").exists() and not Path("spending").exists():
    print("The package spending is now in the directory src, and the work directory holds no package.")
elif Path("tests/src").exists():
    raise AssertionError("You made the directory src inside the directory tests. The terminal was still in tests. Type cd .. and press Enter. Then type the commands again. The empty directory tests/src does no harm.")
elif not Path("spending").exists() and not Path("src/spending").exists():
    raise AssertionError("The check cannot find the package spending in your work directory or in the directory src. Perhaps it has another name now. Type ls and then ls src to look for it.")
elif not Path("src").is_dir():
    raise AssertionError("There is no directory src in your work directory yet. Click in the terminal, type mkdir src and press Enter.")
else:
    raise AssertionError("The directory src exists, but the package spending is still in your work directory. Type mv spending src/ and press Enter.")
```

## What breaks now

The package is no longer in the current directory, and it is not
installed anywhere.

```{quiz}
:id: predict-after-move
:title: Predict
question: "The terminal is in your work directory. You type `python -m pytest`. What happens?"
options:
  - { text: "The seven tests pass, because `spending` is in a directory of the work directory", explanation: "Python does not look inside every directory below the current one. It looks for `spending` directly in the current directory, and there is none there now." }
  - { text: "Each file of tests stops with `ModuleNotFoundError`, as it did in the directory `tests`", correct: true }
explanation: "Python looks for `spending` in the current directory and in the `site-packages` of the environment. It is in neither. The command `python -m spending spending.csv` fails in the same way, with `No module named spending`. Type both commands in the terminal and look. On the next two pages you install the project, and both commands work again."
```

```
python -m pytest
```

```
python -m spending spending.csv
```
