# Installing packages

The thirty-ninth workshop of the course, and the third of the set
**Working like a Python developer**. It explains the second meaning
of the word "package", code that someone has published for others to
install, and PyPI, the website that packages come from. The learner
makes an environment for the spending tracker, installs the package
`rich` into it with `python -m pip install`, and looks inside
`site-packages` to see where it went, with `python -m pip list` and
`python -m pip freeze`. The learner writes `requirements.txt`, deletes
the environment, and gets it back with
`python -m pip install -r requirements.txt`. Then the learner writes
the function `category_table`, which makes a table with `rich`, and
the option `--table`, which shows it.

Twenty-five minutes, in an editor and a terminal. It needs a
connection to the internet, to install `rich` from PyPI into a
virtual environment inside the workspace. It needs a terminal, so it
runs in JupyterLab only.
