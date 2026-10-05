---
title: What you have learned
---

# What you have learned

You have split one long program into four modules. You made each file
yourself, you moved the code, and you wrote the imports that connect
the modules. The program does the same as before, and each part of it
is now in a place with a clear name.

## The ideas

- A program can be several files that work together. Each file of
  Python code is a module.

- Each module has one job, and the name of the file says what the job
  is. You then know where to look for code, and where new code goes.

- A module imports every name that it uses, at the top of its own
  file. An import in another file does not count.

- A module imports no name that it does not use. `report.py` needs no
  import, although it works with a ledger, because its code never
  writes the name of a class or of a module.

- You import from your own module in the same way as from a module of
  Python. The name after `from` is the name of the file without
  `.py`.

- When an import is missing, Python stops with a `NameError`, and
  only when the line that uses the name runs. So you run the program
  after every change to its imports.

- Code is in one module only. A second copy of a class or of a
  function is a mistake that waits to happen.

- The imports go in one direction. Two modules that import each other
  make a circular import, and Python can stop with an `ImportError`.

- A module never imports from itself.

## The code

| Code | What it does |
|------|--------------|
| `from models import Ledger, Purchase` | takes two names from your module `models.py` |
| `from storage import read_ledger` | takes one name from your module `storage.py` |
| `import csv` | makes a module of Python ready to use, as before |
| `python main.py spending.csv` | runs the script `main.py`, which imports the other modules |
| `python -c "import models; print(models.Purchase)"` | runs the code between the quotes |

## The modules

| Module | Its one job | It imports from |
|--------|-------------|-----------------|
| `models.py` | describe the data | `dataclasses`, `decimal` |
| `storage.py` | read the data from a file | `csv`, `decimal`, `models` |
| `report.py` | make the text of the report | nothing |
| `main.py` | the command line | `argparse`, `report`, `storage` |

You also learned a skill of the tools: to make a new file in the file
browser, with the right button of the mouse and `New File`.

## What comes next

In this workshop, the line `from models import Ledger, Purchase`
worked because `models.py` was in the same directory as the program.
But Python also found `csv`, `decimal` and `argparse`, and those
files are not in your directory.

The next workshop, **Where imports come from**, shows how Python
finds a module when it reads an `import` line, and what goes wrong
when one of your own files has the same name as a module of Python.

Click `Finish` at the bottom of this panel.
