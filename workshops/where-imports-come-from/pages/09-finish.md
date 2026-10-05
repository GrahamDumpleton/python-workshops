---
title: What you have learned
---

# What you have learned

You looked at what Python does when it reads the word `import`. You
saw the list of directories that it searches, you asked four modules
which file they came from, and you found and repaired a bug that was
caused by the name of a file.

## The ideas

- An import is a search. The line `import menu` gives Python only a
  name, and Python searches for a file with the name `menu.py`.

- `sys.path` is the list of directories that Python searches. Python
  searches them in order, and it uses the first file that has the
  right name.

- The first item of `sys.path` is the directory of the script that
  you run. When there is no script, it is the current directory of
  the terminal.

- The **standard library** is in a directory of its own, with a name
  such as `python3.14`. Most of its modules are normal files, such as
  `random.py`.

- The directory `site-packages` holds code that was installed later.
  To install code for Python means to copy files into this directory.

- A module that came from a file has the attribute `__file__`, which
  is the path of that file.

- A `ModuleNotFoundError` means that no directory of `sys.path` holds
  a file for the module.

- A file of your own that has the name of another module hides that
  module, for every program in the same directory. Programmers say
  that it **shadows** the module. The repair is to give your file
  another name.

## The code and the commands

| Code or command | What it does |
|-----------------|--------------|
| `import sys` | gets the module `sys`, which holds values that describe the Python that is running |
| `sys.path` | the list of directories that Python searches for an import |
| `sys.path[0]` | the first place: the directory of the script |
| `random.__file__` | the path of the file that the module `random` came from |
| `python -m site` | shows `sys.path` in the terminal |
| `python kitchen/cook.py` | runs a script that is in the directory `kitchen` |

## When an import goes wrong

| What you see | What to do |
|--------------|------------|
| `ModuleNotFoundError` | Read the name in the message letter by letter. Then ask if the file is beside the script, or in another directory of `sys.path`. |
| A module that you know has lost a function | Show the attribute `__file__` of the module. Look for a file of your own that has the same name as the module. |

## What comes next

The place for installed code, `site-packages`, is one directory. Every
program that this Python runs uses the same one. The next set of
workshops, **Working like a Python developer**, begins with the
problem that this causes, and with its solution: a **virtual
environment**, which gives one project a `site-packages` of its own.
You are ready for that idea now, because you know what
`site-packages` is and how an import finds it.

Before that, the spending tracker needs one more step. It is four
modules in one directory, beside every other file. The next
workshop, **Making a package**, puts them into a directory of their
own, which Python can import with one name. The rule that you learned
here, that the first place is the directory of the script, explains
what happens there.

Click `Finish` at the bottom of this panel.
