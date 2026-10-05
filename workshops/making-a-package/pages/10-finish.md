---
title: What you have learned
---

# What you have learned

The spending tracker is now a package. Its modules are together in
one directory with one name, each module finds the others with a
relative import, and one command runs the whole program. You also
wrote a program of your own that uses the package.

## The ideas

- A **package** is a directory that holds modules. It gives a program
  one name, and it keeps the plain names of its modules apart from
  the names of other programs.

- The file `__init__.py` marks a directory as a package. Python runs
  it first when the package is imported. It can hold one line only.

- A module inside a package has a full name: the name of the package,
  a dot, and the name of the module, such as `spending.storage`.

- A **relative import** is an import that begins with a dot. The dot
  means "the package that this module is in". The modules of a
  package use it to import each other.

- A file that has relative imports cannot be run by its path. Python
  runs such a file as a script, and a script belongs to no package.
  Python stops with an `ImportError`.

- The command `python -m` with the name of a package runs the file
  `__main__.py` of that package. Python finds the package by its
  name, so the relative imports work.

- A program outside the package imports a module of the package by
  its full name.

## The commands

| Command | What it does |
|------|--------------|
| `mkdir spending` | makes a directory with the name `spending` |
| `mv models.py spending/` | moves the file `models.py` into the directory `spending` |
| `mv main.py spending/cli.py` | moves the file `main.py` into the directory `spending`, and gives it the name `cli.py` |
| `ls spending` | shows the names of the files in the directory `spending` |
| `python -m spending spending.csv` | runs the package `spending` as a program, with `spending.csv` as its command line argument |

## The code

| Code | What it does |
|------|--------------|
| `from .models import Ledger, Purchase` | inside the package: gets two names from the module `models` of the same package |
| `from .cli import main` | inside the package: gets the function `main` from the module `cli` of the same package |
| `from spending.storage import read_ledger` | outside the package: gets the function `read_ledger` from the module `storage` of the package `spending` |

## The package that you built

Your work directory now holds these files:

```
food_total.py
largest.py
spending.csv
spending/
    __init__.py
    __main__.py
    cli.py
    models.py
    report.py
    storage.py
```

The file `__main__.py` is the start of the program:

```python
from .cli import main

main()
```

## What comes next

The program is now six files in a package, and two more files use it.
When such a program goes wrong, the error message names several
files, and the mistake can be far from the line where Python stopped.

The next workshop is **Finding the bug**. You get a copy of this
package with three mistakes in it. You learn how to read an error
message that crosses several files, and how to look inside a program
while it runs.

The Python tutorial covers packages in
[Packages](https://docs.python.org/3/tutorial/modules.html#packages).
It is written for people who already program, so do not worry if
some of it is difficult to read now.

Click `Finish` at the bottom of this panel.
