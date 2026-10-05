---
title: The editor and saving
requires: [verify:packing-saved]
---

# The editor and saving

The **editor** is the part of JupyterLab in which you change a file.
The file `packing.txt` is open in the editor now. It has a **tab** at
the top, which is the small label that shows the name of the file.
When several files are open, each has a tab, and a click on a tab
shows that file.

If you closed the file, click this action to open it again.

```{file-open}
:id: open-packing-again
:title: Open the file packing.txt in the editor
:path: packing.txt
```

## The editor and the file are two things

This is the most important idea of this page. What you see in the
editor is not the file. It is a copy of the text of the file, which
the editor holds while you work.

When you type in the editor, you change only the copy. The file on the
disk of the computer still holds the old text. To **save** means to
write what the editor shows to the file on the disk. After you save,
the file and the editor hold the same text again.

Think of a letter that you write by hand. You write a first copy and
you correct it many times. The letter that another person can read is
the one that you put in the envelope. A change that you made only on
your first copy is not in the envelope.

This matters because other programs read the file, and not the editor.
The terminal and Python see only what you saved. A common mistake is
to change a file, forget to save it, and then not understand why
nothing is different.

## How you can tell

Look at the tab of the file. At the right end of the tab is a small
cross: `×`. When the editor holds a change that is not saved, the
cross changes to a dot: `●`. The dot means: the file on the disk is
older than what you see.

To save, click in the editor, then hold `Ctrl` and press `S`. On a
Mac, hold `Cmd` and press `S`. The dot changes to a cross again.

JupyterLab also saves a file by itself from time to time. Do not wait
for that. Save each time you finish a change.

## Now you do it

Amara wants to take one more thing: an umbrella.

1. Click at the end of the last line of the file, after the word
   `toothbrush`.

2. Press `Enter` to begin a new line.

3. Type the word `umbrella`.

4. Look at the tab. It shows a dot.

5. Save the file: hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
   press `S`.

The check below runs each time you save the file. It reads the file on
the disk, so it sees only what you saved.

```{attempt}
:id: nothing-typed
:check: packing-saved
:expect: does not hold a line with the word umbrella yet
```

````{attempt}
:id: typed-not-saved
:check: packing-saved
:expect: a dot on the tab means that the file is not saved

```{editor-insert}
:path: packing.txt
:save: false
umbrella
```
````

````{attempt}
:id: same-line
:check: packing-saved
:expect: it is not on a line of its own

```{file-write}
:path: packing.txt
passport
train ticket
2 shirts
warm jacket
toothbrush umbrella
```
````

````{hint}
:title: The keys do nothing
The keys go to the part of the window that you clicked last. Click
one time inside the text of the file. Then press the keys again.

You can also use the menu: open the `File` menu at the top of the
window, and choose `Save Text`.
````

````{hint}
:title: Show me a solution
:unlock: "packing-saved" in failed_checks
:locked: Click Check below first

This action writes the whole file again, with the new line at the
end, and saves it.

```{file-write}
:id: packing-solution
:path: packing.txt
:open: true
passport
train ticket
2 shirts
warm jacket
toothbrush
umbrella
```
````

```{verify}
:id: packing-saved
:label: The file packing.txt on the disk holds the new line
:trigger: file-saved packing.txt; after:packing-solution
from pathlib import Path

path = Path("packing.txt")
text = path.read_text() if path.exists() else ""
lines = [line.strip().lower() for line in text.splitlines()]
together = [line for line in lines if "umbrella" in line and line != "umbrella"]
if "umbrella" not in lines and together:
    raise AssertionError(f"The word umbrella is in the file, but it is not on a line of its own. The line is: {together[0]}. Click before the word umbrella, press Enter, and save the file again.")
assert "umbrella" in lines, "The file packing.txt on the disk does not hold a line with the word umbrella yet. If you typed the word in the editor, look at the tab: a dot on the tab means that the file is not saved. Click in the editor, then hold Ctrl and press S. On a Mac, hold Cmd and press S."
print("The file on the disk holds the line umbrella.")
```

You changed a file, and you saved it. On the next page, another
program reads the same file.
