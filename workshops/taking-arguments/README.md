# Taking arguments

The thirty-second workshop of the course, and the fifth of the set
**From a Python notebook to a program**. It shows how a program
receives words from the command that starts it. A small script shows
the list `sys.argv`: a list of strings whose first item is the name of
the script. The learner writes a script that adds two numbers from the
command line. Then the module `argparse` is shown on a second small
script: a command line argument that is always needed, an option that
begins with `--`, the help text and the messages. The learner then
changes the spending tracker in three steps: `main()` takes the name
of the file from the command line, the class `Ledger` gets a method
`select(month=None, category=None)`, and `main()` gets the options
`--month` and `--category`.

Twenty-five minutes, in an editor and a terminal. Python and its
standard library only, nothing to install. It needs a terminal, so it
runs in JupyterLab only.
