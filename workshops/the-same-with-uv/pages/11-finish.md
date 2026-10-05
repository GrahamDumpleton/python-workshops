---
title: What you have learned
---

# What you have learned

You did the work of three earlier workshops again, with one tool. You
made an environment, installed the packages of a requirements file,
read the description of the project in `pyproject.toml`, added a dependency, ran
the program with no activation, and made the environment again from
the lock file.

## The ideas

- `uv` is one program that does the work of `python -m venv` and of
  pip, in much less time. It brings no new ideas. A **virtual
  environment** is still a directory that holds its own `python` and
  its own `site-packages`, for one project.

- The commands that begin with `uv pip` look like the commands of
  pip. They install into the environment that is active, so you
  activate the environment first.

- An environment that `uv venv` makes has no pip inside it, because
  `uv` does the installing from outside the environment.

- A **project** is the directory that holds your program and
  everything that belongs to it. The file `pyproject.toml` describes
  it: its name, its version, the versions of Python that can run it,
  and its **dependencies**, the packages that it needs.

- `uv add` records a dependency in `pyproject.toml`, writes the lock
  file, and installs the package, in one command.

- A **lock file** records the exact version of every package that the
  project needs. `uv.lock` is the lock file of `uv`. You keep it with
  the project, and you do not change it by hand.

- `uv run` runs a command with the environment of the project, with
  no activation.

- `uv sync` makes the environment the same as the lock file. An
  environment can be deleted, because one command gets it back.

- Commands such as `uv add`, `uv run` and `uv sync` look for
  `pyproject.toml` in the directory of the terminal, and then in the
  directories above it. That is why every project has its own
  `pyproject.toml`.

## The commands

| What the step does | With `venv` and pip | With `uv` |
|--------------------|---------------------|-----------|
| makes the environment `.venv` | `python -m venv .venv` | `uv venv` |
| makes the terminal use it | `source .venv/bin/activate` | `source .venv/bin/activate` |
| installs what the requirements file names | `python -m pip install -r requirements.txt` | `uv pip install -r requirements.txt` |
| shows the packages of the environment | `python -m pip list` | `uv pip list` |
| adds a dependency and records it | `python -m pip install rich`, then write `rich` in `requirements.txt` | `uv add rich` |
| records the exact versions | `python -m pip freeze`, saved in a file | `uv.lock`, written by `uv add` |
| runs the program with the environment | activate, then `python -m spending spending.csv` | `uv run python -m spending spending.csv` |
| makes the environment again from the record | `python -m venv .venv`, activate, `python -m pip install -r requirements.txt` | `uv sync` |

## The file that describes the project

After `uv add rich`, the file `pyproject.toml` holds these lines, with
the version of `rich` in the place of `...`:

```toml
[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = [
    "rich>=...",
]
```

## What comes next

A program changes many times after you write it, and each change can
break something that worked before. The next workshop, **Testing your
code**, shows how to write code that checks your code, so that you
find such a mistake at once.

Click `Finish` at the bottom of this panel.
