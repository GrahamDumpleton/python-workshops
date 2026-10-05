---
title: The list of places
requires: [quiz:first-line, quiz:search-order]
---

# The list of places

Python keeps a list of the directories that it searches for an
import. On this page you look at that list.

## A list with a name

The list has a name: `sys.path`. It is in the module `sys`, which
holds values that describe the Python that is running. The workshop
**Taking arguments** used another value of that module, `sys.argv`.

`sys.path` is a normal list. Each item is a string, and each string
is the path of one directory. A **path** is the text that says where
a file or a directory is.

You can look at this list at any time. When an import does something
that you do not expect, the list tells you where Python looked.

## A script that shows the list

Click the action below. It makes a script with the name
`show_path.py`, and opens it in the editor.

```{file-write}
:id: write-show-path
:title: Make the script show_path.py and open it
:path: show_path.py
:open: true
import sys

for directory in sys.path:
    print(directory)
```

The script imports the module `sys`. Then a `for` loop takes each
item of the list `sys.path` and shows it on a line of its own.

Type this command in the terminal, and press `Enter`:

```
python show_path.py
```

````{hint}
:title: Run the command for me

```{execute}
:id: run-show-path
:wait: prompt
python show_path.py
```
````

## What the terminal shows

The terminal shows a few long paths. The paths are different on each
computer, because Python is installed in a different place on each
computer. On one computer the output looks like this, with `...` in
place of the part that differs:

```
.../work
.../lib/python314.zip
.../lib/python3.14
.../lib/python3.14/lib-dynload
.../lib/python3.14/site-packages
```

Your computer may show more lines than these, or the lines may have
other names in them. Look at the end of each of your lines, and
compare it with the list below.

```{quiz}
:id: first-line
:type: text
:case: false
:title: The first line
question: "Look at the first line that the terminal shows under the command. It is a long path. What is the last part of that path, after the last `/`?"
answer:
  - "work"
  - { pattern: ".*/work/?", example: "/home/asha/where-imports-come-from/work" }
wrong:
  - { pattern: ".*site-packages/?", explanation: "That is the end of one of the later lines. Look at the first line under the command." }
  - { pattern: ".*show_path\\.py", explanation: "That is the name of the script, which is in the command. Look at the first line under the command." }
otherwise: "Find the line directly under the command `python show_path.py`. Read the characters after its last `/`."
explanation: "The first line is the path of your work directory. It is in the list because the script that you ran, `show_path.py`, is in that directory. The next page looks at this first place more closely."
```

## What each line is

- **The line that ends with `work`** is the directory of the script
  that you ran. This is how `import menu` found the file `menu.py`.

- **A line that ends with `python3.14`** is the directory of the
  standard library. It holds files such as `random.py` and `csv.py`.
  This is how `import random` found a file. The number `3.14` is the
  version of Python.

- **A line that ends with `site-packages`** is the directory for code
  that was installed later and that does not come with Python. A
  later page of this workshop looks inside it.

- **A line that ends with `python314.zip`** and **a line that ends
  with `lib-dynload`** are two more places for parts of the standard
  library. You do not need to look in them, and you can ignore them.

## The order matters

Python searches the directories of `sys.path` in order, from the
first item to the last item. In the first directory, it looks for a
file with the right name. When the file is there, Python uses it and
stops the search. When the file is not there, Python continues with
the next directory.

When no directory of the list holds the file, Python stops the
program with an error message. You see that error on the next page.

```{quiz}
:id: search-order
:title: Two files with the same name
question: "Think of a computer on which two directories of `sys.path` each hold a file with the name `menu.py`. Which file does `import menu` use?"
options:
  - { text: "The file in the directory that comes last in `sys.path`", explanation: "Python does not continue to the end of the list. It stops at the first directory that holds a file with the right name." }
  - { text: "Both files, one after the other", explanation: "An import uses one file. Python stops the search when it finds the first file with the right name." }
  - { text: "The file in the directory that comes first in `sys.path`", correct: true }
explanation: "Python searches the list in order and uses the first file that has the right name. It never looks at the second file. Remember this rule. Later in this workshop, it explains a bug."
```
