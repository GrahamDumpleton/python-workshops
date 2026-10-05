# Splitting into modules

The thirty-third workshop of the course, and the sixth of the set
**From a Python notebook to a program**. The spending tracker is one
file of about a hundred lines, `spending.py`. The learner splits it
into four modules, each with one job: `models.py` for the classes,
`storage.py` for the function that reads the file, `report.py` for the
lines of the report and `main.py` for the command line. The learner
makes each file in the file browser, copies the code into it, and
writes the imports between the modules. The workshop teaches that a
module imports every name that it uses itself, and its checks name the
usual mistakes: an import that is missing, a name that is still
imported from the old file, and a module that imports itself. At the
end the old file is deleted and the program runs as
`python main.py spending.csv`.

Twenty-five minutes, with an editor, the file browser and a terminal.
Python and its standard library only, nothing to install. It runs in
JupyterLab only, since it needs a terminal that can run `python`.
