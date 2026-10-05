---
title: The requirements file
requires: [verify:requirements-written]
---

# The requirements file

The spending tracker will soon need the package `rich`. The package
is in your environment, but nothing in the project says so. On this
page you write that down, in a file.

## Why a project needs a record

Think of a person who gets your project tomorrow. They get the
directory `spending` and the file `spending.csv`. They do not get
your environment: an environment is never copied from one computer
to another, because it holds paths that are right for one computer
only. So they must make an environment of their own, and they must
know which packages to install into it.

That person can also be you, next month, on a new computer.

A **requirements file** is a text file that lists the packages that
a project needs, one on each line. Its usual name is
`requirements.txt`, and it is kept beside the code. An everyday
comparison: it is the list of ingredients at the top of a recipe.
The list is small, and with it anyone can get what the recipe needs.

## What exactly is installed

First look at one more command of pip. It is:

```
python -m pip freeze
```

This command is new, so the action below runs it for you this time.

```{execute}
:id: pip-freeze
:title: Show the exact version of each package
:wait: prompt
python -m pip freeze
```

The terminal shows one line for each package, in this form. In place
of each `...` you see the number of a version.

```
markdown-it-py==...
mdurl==...
Pygments==...
rich==...
```

Each line has the name of a package, then `==`, then the exact
version that is installed. You know `==` as the comparison "is equal
to". Here it means "exactly this version".

The command shows the same packages as `python -m pip list`, with
two differences. It leaves pip itself out. And it writes each line
in the form that a requirements file uses, so the lines can go into
a requirements file as they are. Programmers do that when every
computer must get exactly the same versions.

## What the project itself needs

For the spending tracker, a shorter record is enough. Your program
needs one package, `rich`. The other packages are dependencies of
`rich`, and pip finds them by itself.

So the requirements file of the spending tracker has one line:

```
rich
```

A line with a name and no version means: the newest version.

## Your task: write the file

Make a file with the name `requirements.txt` in your work directory,
beside the file `spending.csv`. Write the one line in it, and save
it.

The action below shows your work directory in the file browser, on
the left side of the window.

```{file-browser-reveal}
:id: show-work-directory
:title: Show my work directory in the file browser
:path: spending.csv
```

Then do these steps yourself:

1. In the file browser, click the empty space under the list of
   files with the right button of the mouse. A menu opens. Click
   `New File` in the menu.

2. A new file appears in the list, with the name `untitled.txt`. The
   name is ready for you to change. Type `requirements.txt` and press
   `Enter`. If the name is not ready to change, click the file with
   the right button of the mouse, and click `Rename` in the menu.

3. Double-click the file `requirements.txt` in the list. It opens in
   the editor, in the upper part of the window. It is empty.

4. Type the word `rich` in the editor.

5. Save the file: hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
   press `S`. To **save** means to write what the editor shows to the
   file on the disk. pip reads the file on the disk, so a line that
   is not saved does not exist for pip.

```{hint}
:title: Hint: the file is in the wrong place
The file must be in your work directory, beside `spending.csv`, and
not inside the directory `spending`. If the file browser shows the
files `cli.py` and `models.py`, it is inside the directory
`spending`. Click the action above again to show your work
directory, and then make the file there.
```

```{hint}
:title: Hint: what the file holds
The file holds one line, and the line holds one word: `rich`. It is
not Python code, so there is no `import` and there are no quotation
marks.
```

If the hints were not enough, the box below holds a solution. It
opens after you have saved the file, or after you have clicked
`Check`.

```{attempt}
:id: requirements-not-made
:check: requirements-written
:expect: There is no file requirements.txt in your work directory yet
```

````{attempt}
:id: requirements-untitled
:check: requirements-written
:expect: still has the name untitled.txt

```{file-write}
:path: untitled.txt
rich
```
````

````{attempt}
:id: requirements-inside
:check: requirements-written
:expect: is inside the directory spending

```{file-delete}
:path: untitled.txt
```

```{file-write}
:path: spending/requirements.txt
rich
```
````

````{attempt}
:id: requirements-empty
:check: requirements-written
:expect: The file requirements.txt is empty

```{file-delete}
:path: spending/requirements.txt
```

```{file-write}
:path: requirements.txt
```
````

````{attempt}
:id: requirements-code
:check: requirements-written
:expect: has no line for the package rich. Its first line is: import rich

```{file-write}
:path: requirements.txt
import rich
```
````

````{attempt}
:id: requirements-exact
:check: requirements-written
:result: pass

```{file-write}
:path: requirements.txt
markdown-it-py==4.2.0
mdurl==0.1.2
Pygments==2.21.0
rich==15.0.0
```
````

````{hint}
:title: Show me a solution
:unlock: "requirements-written" in failed_checks or "requirements-written" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes the file `requirements.txt` with its one
line, and opens it in the editor. It replaces what the file holds
now.

```{file-write}
:id: requirements-solution
:title: Write a solution to requirements.txt
:path: requirements.txt
:from: answers/requirements.txt
:open: true
```
````

```{verify}
:id: requirements-written
:label: The file requirements.txt names the package rich
:trigger: file-saved requirements.txt; after:requirements-solution
import re
from pathlib import Path

file = Path("requirements.txt")
if not file.exists():
    if Path("spending/requirements.txt").exists():
        raise AssertionError("The file requirements.txt is inside the directory spending. It must be in your work directory, beside the file spending.csv. Click the action on this page that shows your work directory in the file browser, and make the file there.")
    if Path("untitled.txt").exists():
        raise AssertionError("The new file still has the name untitled.txt. In the file browser, click the file with the right button of the mouse, click Rename, type requirements.txt and press Enter.")
    raise AssertionError("There is no file requirements.txt in your work directory yet. Make the file in the file browser, write the one line in it, and save it.")
lines = [line.strip() for line in file.read_text().splitlines()]
lines = [line for line in lines if line and not line.startswith("#")]
assert lines, "The file requirements.txt is empty. Type the word rich in the editor. Then save the file: hold Ctrl and press S, or on a Mac hold Cmd and press S."
names = [re.split(r"[\s=<>!~;\[]", line, maxsplit=1)[0].lower() for line in lines]
assert "rich" in names, f"The file requirements.txt has no line for the package rich. Its first line is: {lines[0]}. The file must hold the name of the package on a line of its own, with no other words: rich. Save the file after you change it."
print("The file requirements.txt names the package rich. It is the record of what the project needs.")
```

## What happened

Your project now has three parts: the code in the directory
`spending`, the data in `spending.csv`, and the record of what the
code needs in `requirements.txt`. The environment `.venv` is not a
part that you keep. On the next page you see why.
