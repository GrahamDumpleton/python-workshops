---
title: Where the shared Python looks
requires: [quiz:last-place, quiz:where-it-must-be]
---

# Where the shared Python looks

Each Python has a `site-packages` of its own. On this page you see
that for the shared Python, and you look at what its `site-packages`
holds now.

## The search for a module

When Python reads a line such as `import random`, it has only a name.
It searches for a file or a directory with that name. Python keeps a
list of the directories that it searches, and it searches them in
order. The list has the name `sys.path`, and it is in the module
`sys`.

The workshop **Where imports come from** looked at this list. The
list has three kinds of places, in this order:

| Place | What it holds |
|-------|---------------|
| the directory of the script | your own modules |
| the directories of the standard library | the modules that come with Python |
| `site-packages` | packages that were installed later |

The **standard library** is the set of modules that come with Python,
such as `random` and `csv`.

## A script that shows the list

Your work directory holds a small script that shows the list. Click
the action below to open it in the editor.

```{file-open}
:id: open-places
:title: Open places.py in the editor
:path: places.py
```

The script imports the module `sys`. Then a `for` loop takes each
item of the list `sys.path`, and shows it on a line of its own.

Now run the script with the shared Python. Click one time inside the
terminal, type this command, and press `Enter`:

```
shared-python/bin/python places.py
```

````{hint}
:title: Run the command for me
:unlock: "last-place" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-places
:wait: prompt
shared-python/bin/python places.py
```
````

The terminal shows five long paths. The first part of each path is
different on each computer. On one computer the output looks like
this, with `...` in place of the part that differs:

```
.../work
.../lib/python314.zip
.../lib/python3.14
.../lib/python3.14/lib-dynload
.../work/shared-python/lib/python3.14/site-packages
```

The first line is your work directory, because the script is there.
The three lines in the middle are the places of the standard library.
Look at the last line in your terminal, and answer the question.

```{quiz}
:id: last-place
:type: text
:case: false
:title: The last place
question: "The last line ends with `/lib/python3.14/site-packages`. Which name comes directly before `/lib` in that line?"
answer:
  - "shared-python"
  - { pattern: ".*shared-python(/.*)?", example: "work/shared-python" }
wrong:
  - { pattern: "/?work/?", explanation: "The name `work` is in the line, but one more name comes between `work` and `/lib`. Type that name." }
  - { pattern: ".*site-packages/?", explanation: "The name `site-packages` is at the end of the line. Type the name that comes directly before `/lib`." }
  - { pattern: "python3\\.14/?", explanation: "The name `python3.14` comes after `/lib`. Type the name that comes directly before `/lib`." }
otherwise: "Find the last line that the terminal shows under the command. Read it from the right: `site-packages`, then `python3.14`, then `lib`. Type the name that comes before `lib`."
explanation: "The `site-packages` that the shared Python searches is inside the directory `shared-python`. It belongs to this Python. Another Python searches another `site-packages`. A Python never looks in the `site-packages` of another Python."
```

## Look inside

Now look at what this `site-packages` holds. The command `ls` shows
the names of the files and directories that a directory holds. After
the word `ls` you write the path of the directory.

This path is long, so the action below runs the command for you this
time.

```{execute}
:id: list-first
:title: Show what the site-packages of the shared Python holds
:wait: prompt
ls shared-python/lib/python3.14/site-packages
```

The terminal shows two names on one line. They look like this, with
`...` in place of a version number that can differ on your computer:

```
pip   pip-....dist-info
```

Both names belong to one package, with the name `pip`. It is a tool
that installs other packages, and you use it later in this workshop.
The command that made the shared Python put it there.

So this `site-packages` holds one tool, and no other package.

```{quiz}
:id: where-it-must-be
:title: Where a package must be
question: "A script has the line `import webcolors`. The package `webcolors` does not come with Python, and your work directory has no file with that name. Where must the package be, so that the shared Python finds it?"
options:
  - { text: "In the directory `shared-python/lib/python3.14/site-packages`", correct: true }
  - { text: "In the `site-packages` of the Python that runs JupyterLab", explanation: "A Python searches only the directories of its own `sys.path`. The `site-packages` of another Python is not in that list." }
  - { text: "In any directory of the computer. Python searches the whole computer.", explanation: "Python does not search the whole computer. It searches only the directories of the list `sys.path`." }
explanation: "The shared Python searches the directories that `places.py` showed, and no others. A package that was installed later belongs in the last of them, the `site-packages` inside `shared-python`."
```
