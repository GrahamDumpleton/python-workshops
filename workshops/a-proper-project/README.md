# A proper project

The forty-second workshop of the course, and the sixth of the set
**Working like a Python developer**. It starts from the spending
tracker with its tests. The learner makes the environment and sees
that the tests find the package only because of the directory the
terminal is in. Then the learner moves the package into `src`, writes
`pyproject.toml` (with `hatchling` as the build system), installs the
project with `python -m pip install -e .`, and adds the command
`spending` with `[project.scripts]`. The last pages show three tools
at work: `python -m ruff check` finds and repairs four findings,
`python -m ruff format` breaks the long lines, and `python -m mypy`
checks three type hints that the
learner writes, and one hint made wrong on purpose. The learner types
most commands; the tools are mostly run by click.

Twenty-five minutes, in an editor and a terminal. It needs a
connection to the internet, because it installs `rich`, `pytest`,
`hatchling`, `ruff` and `mypy` from PyPI into a virtual environment
inside the workspace. It needs a terminal, so it runs in JupyterLab
only.
