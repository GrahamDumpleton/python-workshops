---
title: The file browser
requires: [verify:packing-open]
---

# The file browser

A **file** is a place where a computer keeps data under a name. A
computer holds many thousands of files. To keep them in order, the
computer puts files in directories.

A **directory** is a place that holds files and other directories.
Another word for a directory is "folder". These workshops say
"directory", because that is the word that the terminal and Python
use.

Think of a cupboard with boxes. A box holds papers, and a box can also
hold smaller boxes. A paper is a file, and a box is a directory. To
find a paper, you need to know which box it is in.

The **file browser** is the part of JupyterLab that shows what a
directory holds. It is the list on the left side of the window.

## The directory of this workshop

Each workshop has a directory of its own for your work. Its name is
`work`. Everything that you do in this workshop happens inside that
directory.

Click the action below. It makes the file browser show the directory
`work`, and it marks one file in the list.

```{file-browser-reveal}
:id: show-work
:title: Show the directory of this workshop in the file browser
:path: packing.txt
```

The file browser now shows four names:

- `recipes` and `trip` are directories. A directory has a picture of a
  folder beside its name.

- `count_up.py` and `packing.txt` are files. The part of a name after
  the dot says what kind of file it is. A name that ends in `.txt` is a
  file of plain text. A name that ends in `.py` is a file of Python
  code.

These files belong to one made-up person, Amara. She plans a journey
by train, and she keeps some notes.

## Look inside a directory

To see what a directory holds, you click its name two times, quickly.
This is a **double-click**.

Double-click the name `recipes` in the file browser. The list changes.
It now shows the two files that the directory `recipes` holds:
`bread.txt` and `soup.txt`.

To return, click the action above again. It shows the directory `work`
again.

## Open a file

You open a file in the same way: with a double-click on its name.

Now you do it. Double-click the name `packing.txt` in the file
browser. The file opens in the empty area in the middle of the window.
It is a list of things that Amara wants to take on her journey.

```{attempt}
:id: packing-not-open
:check: packing-open
:expect: The file packing.txt is not open yet
```

````{hint}
:title: The list does not show packing.txt
The file browser shows another directory. Click the action `Show the
directory of this workshop in the file browser` on this page. Then
look for the name `packing.txt` in the list.
````

````{hint}
:title: Open the file for me
:unlock: "packing-open" in failed_checks
:locked: Click Check below first

```{file-open}
:id: open-packing
:path: packing.txt
```
````

```{verify}
:id: packing-open
:label: The file packing.txt is open
:substrate: ui
:trigger: after:open-packing; interval 2s
:message: The file packing.txt is not open yet. Double-click the name packing.txt in the file browser, on the left side of the window.
file-open packing.txt
```

The file is open in the **editor**. The next page explains what you
can do there.
