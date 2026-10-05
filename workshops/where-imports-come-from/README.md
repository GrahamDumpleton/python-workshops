# Where imports come from

The thirty-fourth workshop of the course, in the set **From a Python
notebook to a program**. It explains how `import` finds a module:
`sys.path` as a list of directories that Python searches in order,
the directory of the script as the first of them, the directory of
the standard library, the directory `site-packages` and what it
holds, `python -m site`, and the attribute `__file__`, which shows
the file that a module came from. The learner predicts what an import
finds, writes a small script that shows where four modules came from,
and then finds and repairs the bug of a file of their own named
`random.py`, which hides the module `random` of the standard library.
This is the groundwork for the next set, in which a virtual
environment is a different `site-packages`.

Twenty-five minutes, in an editor and a terminal. Python and its
standard library only, nothing to install. It needs a terminal that
can run `python`, so it runs in JupyterLab only.
