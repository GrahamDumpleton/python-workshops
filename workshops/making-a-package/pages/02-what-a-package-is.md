---
title: What a package is
requires: [verify:directory-made]
---

# What a package is

A **package** is a directory that holds modules. The directory has a
name, and the modules inside it belong together.

## Why a program needs a package

Your work directory holds four modules and one file of data. Nothing
says that `models.py`, `storage.py`, `report.py` and `main.py` are one
program. They lie beside `spending.csv` and beside every other file
that you put there later.

This causes two problems.

- The program has no name. To give the program to another person, you
  must say which four files belong to it.

- The names of the modules are plain words. Another program in the
  same directory may also want a file with the name `report.py` or
  `models.py`. Two files in one directory cannot have the same name.

A package solves both problems. The four modules go into one
directory with the name `spending`. The directory is the program, and
it has a name. Inside it, the name `report.py` belongs to this program
only.

Think of a box with a label. The papers for one piece of work go into
one box, and the label says what the work is. You can carry the box
to another room as one thing. A second box can hold a paper with the
same title, and nobody confuses the two papers, because each paper is
in its own box.

## A new command: `mkdir`

A package is a directory, so the first step is to make a directory.
The command for that is `mkdir`. The name is short for "make
directory". After the word `mkdir` you write the name of the new
directory.

```
mkdir spending
```

This command is new, so the action below runs it for you this time.
Watch the terminal when you click.

```{attempt}
:id: directory-not-made
:check: directory-made
:expect: There is no directory with the name spending yet
```

```{execute}
:id: make-directory
:title: Make the directory spending
:wait: prompt
mkdir spending
```

```{verify}
:id: directory-made
:label: The directory spending exists
:trigger: after:make-directory
from pathlib import Path

assert Path("spending").is_dir(), "There is no directory with the name spending yet. Click the action above to run the command mkdir spending."
print("The directory spending exists in your work directory.")
```

## What happened

The command showed nothing. Many commands show nothing when they
work. They show a message only when something goes wrong.

To see the new directory, type this command in the terminal yourself,
and press `Enter`:

```
ls
```

The list now has six names. The new name is `spending`:

```
main.py  models.py  report.py  spending  spending.csv  storage.py
```

The directory `spending` is empty. On the next page you move the
modules into it.
