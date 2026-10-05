# Code in a file

The thirtieth workshop of the course, and the third of the set **From
a Python notebook to a program**. The notebook receives the classes
`Purchase` and `Ledger` and the function `read_ledger` of the spending
tracker by click. The workshop explains why code is kept in a file,
creates the file `spending.py` by click, and has the learner copy the
code into it from the cells, piece by piece, and import it back into
the notebook. Two things go wrong on purpose: the module has no import
lines of its own, and the notebook keeps the old code of the module
until its kernel is restarted. It covers a module of your own,
`import spending`, `from spending import read_ledger`, copy and paste
between a cell and the editor, saving, and restarting the kernel. At
the end a second notebook uses the same file.

Twenty-five minutes, in a notebook with the editor under it. Python
and its standard library only, nothing to install. It runs in
JupyterLab only.
