# The same with uv

The fortieth workshop of the course, and the fourth of the set
**Working like a Python developer**. It teaches uv as the same ideas
with a faster tool, and matches every step to the step with
`python -m venv` and pip that it stands for: `uv venv`, then
`uv pip install -r requirements.txt` and `uv pip list` in the
activated environment. Then it shows the project way of working: the
learner reads the file `pyproject.toml`, which the workshop ships so
that every `uv` project command finds it in the workspace, adds the
dependency with `uv add rich`, reads what uv changed in `pyproject.toml` and what the
lock file `uv.lock` holds, runs the spending tracker with `uv run`
and no activation, and deletes the environment and gets it back with
`uv sync`. The learner types the commands.

Twenty-five minutes, in an editor and a terminal. It needs the
program `uv` and a connection to the internet, because it installs
the package `rich` from PyPI into a virtual environment inside the
workspace. It needs a terminal, so it runs in JupyterLab only.
