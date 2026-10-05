# Making a package

The thirty-fifth workshop of the course, and the eighth of the set
**From a Python notebook to a program**. The spending tracker is four
modules that lie in the work directory. The learner makes a package
of them: a directory `spending` made with `mkdir`, the modules moved
into it with `mv`, the file `__init__.py`, relative imports between
the modules, and the file `__main__.py`, so that the command
`python -m spending spending.csv` runs the program. Two predictions
show what goes wrong on the way: a module inside the package that
cannot find its neighbour, and a file with relative imports that is
run by its path. The learner ends by writing a small program that
uses the package from outside.

Twenty-five minutes, in an editor and a terminal. Python and its
standard library only, nothing to install. It needs a terminal, so it
runs in JupyterLab only.
