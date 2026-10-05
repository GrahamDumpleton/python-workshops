---
title: What you have learned
---

# What you have learned

You saw the problem that a virtual environment solves. You installed
a package for one project, then a newer version of the same package
for a second project, and the first project stopped working, although
you did not change it. Then you saw that no version was right for
both projects.

## The ideas

- A **project** is one piece of work: a program, with the files that
  belong to it, in a directory of its own.

- A Python keeps the packages that were installed for it in one
  directory, `site-packages`. An `import` line searches the
  directories of the list `sys.path`, and `site-packages` is the last
  of them.

- To install a package means to copy its files into the
  `site-packages` of one Python. The tool `pip` does this. The Python
  at the beginning of the command gets the package.

- A package has **versions**. The author changes the package and
  publishes it again with a new number. A newer version can remove
  something that an older version had.

- A **dependency** is a package that a program needs.

- A `site-packages` holds one version of each package. An install of
  another version removes the version that was there.

- An `import` line says a name, and not a version. A wrong version
  often shows as an `AttributeError`, not as a message about the
  version.

- When every project shares one Python, an install for one project
  can break another project. Nothing warns you.

- So each project needs a `site-packages` of its own. A **virtual
  environment** is a directory that holds its own `python` and its
  own `site-packages`, for one project.

## The commands

| Command | What it does |
|---------|--------------|
| `python -m venv shared-python` | makes a virtual environment in the directory `shared-python` (the next workshop explains it) |
| `shared-python/bin/python --version` | runs the Python at that path, and shows its version |
| `shared-python/bin/python places.py` | runs the script `places.py` with the Python at that path |
| `ls shared-python/lib/python3.14/site-packages` | shows the names in the `site-packages` of that Python |
| `shared-python/bin/python -m pip install webcolors==1.13` | installs exactly version `1.13` of the package `webcolors` for that Python |

## What comes next

The next workshop, **An environment of your own**, gives a project
an environment of its own. You make the environment yourself with
`python -m venv`, you look at what is inside it, and you learn what
it means to activate it.

Click `Finish` at the bottom of this panel.
