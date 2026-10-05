---
title: What you have learned
---

# What you have learned

You gave a project a Python environment of its own. You made the
environment, you looked inside it, you activated it and left it
again, you installed a package into it, and you used it with no
activation. Then you deleted it and made it again, and the project
still worked.

## The ideas

- A **virtual environment** is a directory that holds its own `python`
  and its own `site-packages`, for one project. A package that you
  install there is seen by that project and by no other project.

- The interpreter of an environment is a small file that leads to the
  Python that made the environment. The file `pyvenv.cfg` tells it
  that it is inside an environment, and that it uses the
  `site-packages` of that environment only.

- `PATH` is the list of directories in which the shell looks for a
  program. The shell searches the list in order, and runs the first
  program that has the right name.

- To **activate** an environment means to make the terminal use it.
  Activating puts the directory `.venv/bin` first on `PATH`, and it
  changes the prompt. It does not change any file, and it is for one
  terminal only.

- Before you install a package, look at the prompt. When it begins
  with `(.venv)`, the word `python` means the Python of your
  environment.

- You can use an environment with no activation, when you name its
  interpreter by its path: `.venv/bin/python`.

- An environment holds nothing that you wrote. It holds full paths of
  the place where it was made. So you do not move it or repair it: you
  delete it and make it again.

## The commands

| Command | What it does |
|---------|--------------|
| `python -m venv .venv` | makes a virtual environment in the directory `.venv` |
| `ls -a` | shows every name in the current directory, also the names that begin with a dot |
| `ls .venv/bin` | shows the names in the directory `.venv/bin` |
| `cat .venv/pyvenv.cfg` | shows the text inside the file `pyvenv.cfg` |
| `echo $PATH` | shows the list of directories in which the shell looks for a program |
| `which python` | shows the path of the `python` that the shell runs |
| `source .venv/bin/activate` | activates the environment in this terminal |
| `python -m pip install tabulate` | installs the package `tabulate` into the Python that the word `python` means |
| `deactivate` | ends the activation, and puts `PATH` and the prompt back |
| `.venv/bin/python prices.py` | runs a program with the interpreter of the environment, with no activation |
| `rm -r .venv` | deletes the directory `.venv` and everything inside it |

## What comes next

In this workshop you installed one package with one command, and you
did it again by hand after you made a new environment. A real project
can need many packages. The next workshop, **Installing packages**,
explains `pip`, shows where packages come from, and shows how a
project keeps a list of the packages that it needs, so that one
command installs all of them.

Click `Finish` at the bottom of this panel.
