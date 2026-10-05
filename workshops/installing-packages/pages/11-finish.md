---
title: What you have learned
---

# What you have learned

You used code that other people published. You made an environment
for the spending tracker, installed a package into it, and looked at
what changed on the disk. You wrote a record of what the project
needs, deleted the environment, and got it back from that record.
Then the spending tracker used the package to show its totals as a
table.

## The ideas

- A **package** has two meanings. It is a directory that holds
  modules, such as your directory `spending`. It is also code that
  someone has published for other people to install, such as `rich`.
  When you installed `rich`, you got a directory `rich` that holds
  modules.

- **PyPI**, the Python Package Index, is the website that packages are
  installed from. Anyone can publish a package there, so read the
  name of a package with care before you install it.

- **pip** is the program that installs packages. These workshops
  start it with `python -m pip`, so that it is certain which Python
  gets the package.

- Install a package only into an environment, and only when the
  prompt begins with `(.venv)`. A **virtual environment** is a
  directory that holds its own `python` and its own `site-packages`,
  for one project.

- To install a package is to copy its files into the directory
  `site-packages` of the environment. Nothing else changes. Each
  package has a directory of its code and a directory `.dist-info` of
  notes about it.

- A **dependency** is a package that your program needs. A package
  can have dependencies of its own, and pip installs those too.

- A **requirements file** lists the packages that a project needs,
  one on each line. It is kept with the code, and the environment is
  not kept: you can delete an environment and make it again from the
  requirements file.

- The package `rich` shows a table in the terminal: a `Table` object
  holds the columns and the rows, and a `Console` object draws it.

- An option made with `action="store_true"` needs no value. Its value
  is `True` when the command holds it, and `False` when it does not.

## The commands and the code

| Command or code | What it does |
|-----------------|--------------|
| `python -m venv .venv` | makes the environment `.venv` |
| `source .venv/bin/activate` | activates the environment, so that `python` means its `python` |
| `deactivate` | makes the terminal stop using the environment |
| `python -m pip install rich` | installs the package `rich` and its dependencies |
| `python -m pip list` | shows the packages of the environment, with their versions |
| `python -m pip freeze` | shows the packages with their exact versions, in the form of a requirements file |
| `python -m pip install -r requirements.txt` | installs every package that the file names |
| `rm -r .venv` | deletes the environment and everything in it |
| `from rich.table import Table` | imports the class `Table` from the package `rich` |
| `table.add_column("Total", justify="right")` | adds a column, with its text on the right side |
| `table.add_row("All", "5.70", style="bold")` | adds a row in bold letters |
| `Console().print(table)` | draws the table in the terminal |
| `parser.add_argument("--table", action="store_true")` | adds an option that needs no value |

## The project now

The spending tracker is the directory `spending`, the data
`spending.csv`, and the file `requirements.txt`, which holds one line:

```
rich
```

The command `python -m spending spending.csv` shows the report as
lines of text, as before. The command
`python -m spending spending.csv --table` shows the total for each
category as a table. Both need an active environment that has `rich`.

## What comes next

You did each step by hand: make the environment, activate it,
install, and keep a record. Programmers often use a tool that does
these steps for them, and does them faster.

The next workshop, **The same with uv**, does each step of this
workshop again with the tool `uv`. For each command of `uv`, it shows
which command of this workshop it stands for.

Click `Finish` at the bottom of this panel.
