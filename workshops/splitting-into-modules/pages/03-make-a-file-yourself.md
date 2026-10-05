---
title: Make a file yourself
requires: [verify:models-made]
---

# Make a file yourself

In the earlier workshops, an action made each new file for you. From
now on, you make the files. A programmer makes new files every day,
so this is a skill that you need.

The first file is `models.py`. On this page you only make the file
and open it. It stays empty until the next page.

## The steps

The file browser must show the files of this workshop. Click the
action below, and it shows them.

```{file-browser-reveal}
:id: show-workshop-files
:title: Show the files of this workshop in the file browser
:path: spending.py
```

Now do these five steps:

1. Move the pointer to the empty space under the names of the files,
   in the file browser.

2. Click with the right button of the mouse. If your mouse or
   trackpad has one button, hold the `Ctrl` key and click. A menu
   opens.

3. Click `New File` in the menu. A new file appears in the list. Its
   name is `untitled.txt`, and the name is marked, ready for you to
   change it.

4. Type `models.py` and press `Enter`. The name has small letters
   only, and it ends with `.py`, which says that the file holds
   Python code.

5. Double-click `models.py` in the file browser. The file opens in
   the editor, in a new tab beside `spending.py`. The file is empty.

When the file is open, click `Check` in the box at the bottom of this
page.

## If you need help

```{hint}
:title: "Hint: the name is not ready to change"
If you clicked somewhere else before you typed the name, the file
keeps the name `untitled.txt`. You can still change it. Click the
file `untitled.txt` with the right button of the mouse, and click
`Rename` in the menu. Then type `models.py` and press `Enter`.
```

```{hint}
:title: "Hint: the file is in the wrong place"
The new file must be in the same list as `spending.py` and
`spending.csv`. If the file browser showed other files when you made
the file, click the action "Show the files of this workshop in the
file browser" above, and make the file again.
```

If the hints were not enough, the box below makes the file for you.
It opens after you have clicked `Check` one time.

```{attempt}
:id: models-not-made
:check: models-made
:expect: There is no file with the name models.py yet
```

````{attempt}
:id: models-untitled
:check: models-made
:expect: still has the name untitled.txt

```{file-write}
:path: untitled.txt
```
````

````{attempt}
:id: models-other-name
:check: models-made
:expect: There is a file with the name models.txt

```{file-delete}
:path: untitled.txt
```

```{file-write}
:path: models.txt
```
````

````{hint}
:title: Make the file for me
:unlock: "models-made" in failed_checks or "models-made" in passed_checks
:locked: Click Check below first

```{file-write}
:id: models-make-solution
:title: Make the empty file models.py and open it
:path: models.py
:open: true
```
````

```{verify}
:id: models-made
:label: The file models.py exists
:trigger: after:models-make-solution
import os

names = os.listdir(".")
close = [name for name in names if name.lower().startswith("models") and name != "models.py"]
if "models.py" not in names and close:
    raise AssertionError(f"There is a file with the name {close[0]}. The name must be models.py exactly, with small letters only and with .py at its end. Click the file with the right button of the mouse, click Rename, and type models.py.")
if "models.py" not in names and "untitled.txt" in names:
    raise AssertionError("The new file still has the name untitled.txt. Click it with the right button of the mouse, and click Rename in the menu. Then type models.py and press Enter.")
assert "models.py" in names, "There is no file with the name models.py yet. Make it in the file browser, beside spending.py: click the empty space with the right button of the mouse, and click New File."
print("The file models.py exists, in the same place as spending.py.")
```

## What happened

You made a file without code and without a command. The file browser
shows three files now. The editor has two tabs, and you click a tab
to go from one file to the other.

On the next page, you move the two classes into `models.py`.
