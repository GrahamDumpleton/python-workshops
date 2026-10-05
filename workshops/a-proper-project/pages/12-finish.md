---
title: What you have learned
---

# What you have learned

The spending tracker is now a proper project. It describes itself in
one file, its code is in `src`, it is installed in its own
environment, it has a command of its own, and three tools have
checked it.

## The ideas

- The file `pyproject.toml` describes a project: its name, its
  version, the versions of Python that can run it, its dependencies,
  and the build system that turns it into something pip can install.

- In the src layout, the package is in a directory `src`. The current
  directory then holds no package, so Python finds the code only
  where it is installed. The tests run against the installed package,
  not against whatever directory the terminal is in.

- `python -m pip install -e .` installs the project of the current
  directory. An editable install points at your files, so a change to
  the code needs no new install. A change to `pyproject.toml` does.

- The table `[project.scripts]` gives the program a command of its
  own. pip writes a small program for it into `.venv/bin`.

- A linter reads the code and reports mistakes and advice. You read
  each finding and decide.

- A formatter gives all the code one layout, and does not change what
  the code does.

- A type hint says what type a value should be. Python does not check
  it. A type checker compares the hints with the code, and reports
  where they do not agree.

## The commands

| Command | What it does |
|---------|--------------|
| `mkdir src` and `mv spending src/` | make the directory `src`, and move the package into it |
| `python -m pip install -e .` | install the project of the current directory, as an editable install |
| `python -m pip list` | list the packages of the environment, with the place of an editable one |
| `spending spending.csv` | run the program with its own command |
| `which spending` | show where the shell found the command |
| `python -m ruff check` | run the linter |
| `python -m ruff check --fix` | let the linter repair what it can |
| `python -m ruff format` | run the formatter |
| `python -m mypy src` | run the type checker on the modules in `src` |

## The same with uv

The workshop **The same with uv** showed a faster tool that does the
work of `python -m venv` and of pip. `uv` reads the same file
`pyproject.toml`. In a project like this one, `uv sync` makes the
environment and installs the project into it as an editable install,
in one step. `uv run spending spending.csv` then runs the command
without activating the environment. The ideas of this workshop stay
the same.

## What comes next

The next workshop is **Your own project**, the last workshop of the
course. You choose one of four small programs, and you build it
yourself, from a short description that says what it must do.

Click `Finish` at the bottom of this panel.
