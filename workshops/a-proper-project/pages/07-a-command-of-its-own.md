---
title: A command of its own
requires: [quiz:predict-command, verify:command-works]
---

# A command of its own

You start the program with `python -m spending spending.csv`. The
programs that you install, such as `pytest`, often have a command of
their own, with one word. On this page you give the spending tracker
the command `spending`.

## The table `[project.scripts]`

These two lines, at the end of `pyproject.toml`, ask for a command:

```toml
[project.scripts]
spending = "spending.cli:main"
```

The name of the table has a dot in it. `[project.scripts]` is a
table inside the table `project`, and it lists the commands of the
project.

The name before the `=` sign, `spending`, is the name of the command.
The text after it says which function the command calls. Before the
colon is the module, `spending.cli`: the module `cli` of the package
`spending`. After the colon is the function, `main`. That is the
function that `__main__.py` calls when you type
`python -m spending`.

When pip installs the project, it reads this table. For each command,
it writes a small program into the directory `.venv/bin`. You know
that directory: activating the environment put it first on `PATH`,
the list of directories in which the shell looks for a program. So
the shell can find the new command.

## Your task, part 1: add the two lines

Open the file `pyproject.toml` in the editor: double-click it in the
file browser. Add the two lines at the end of the file, after an
empty line. Save the file: hold `Ctrl` and press `S`, or `Cmd` and
`S` on a Mac.

```{quiz}
:id: predict-command
:title: Predict
question: "You have saved the two lines. You have not installed again. You type `spending spending.csv` in the terminal. What happens?"
options:
  - { text: "The program shows its report", explanation: "The command does not exist yet. pip writes the small program for a command only when it installs the project." }
  - { text: "The shell says that it cannot find the command `spending`", correct: true }
explanation: "The file only describes the command. The small program in `.venv/bin` is written by pip, when it installs. So the shell finds no program with the name `spending`. It shows a line with the words `command not found`. The editable install reads your code from `src` each time, but it does not read `pyproject.toml` again. After a change to `pyproject.toml`, install again."
```

Type the command, and see the message:

```
spending spending.csv
```

## Your task, part 2: install again, and use the command

Install the project again, with the same command as on the last page.
Look at the prompt first: it must begin with `(.venv)`.

```
python -m pip install -e .
```

Then use the new command. The words after it are the same as before:

```
spending spending.csv --month 2026-02
```

The report for February begins with the line `Purchases: 12`.

Last, ask the shell where it found the command:

```
which spending
```

The line that it shows ends with `.venv/bin/spending`. The first part
of the line is different on every computer.

```{hint}
:title: Hint: what the end of the file looks like
The file now has three tables. The last one is `[project.scripts]`,
with one line under it. The text after the `=` sign is in double
quotes, and it has a dot and then a colon:
`"spending.cli:main"`.
```

```{hint}
:title: Hint: the shell still says command not found
Did you install again after you saved the file? The command is made
by `python -m pip install -e .`. If you did install again, look at the
prompt. It must begin with `(.venv)`, or the shell does not look in
`.venv/bin`.
```

```{attempt}
:id: scripts-missing
:check: command-works
:expect: has no table [project.scripts]
```

````{attempt}
:id: scripts-not-toml
:check: command-works
:expect: The check cannot read line 12 of pyproject.toml

```{file-write}
:path: pyproject.toml
[build-system]
requires = ["hatchling >= 1.26"]
build-backend = "hatchling.build"

[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = ["rich"]

[project.scripts]
spending = "spending.cli:main
```
````

````{attempt}
:id: scripts-other-name
:check: command-works
:expect: has no command with the name spending

```{file-write}
:path: pyproject.toml
[build-system]
requires = ["hatchling >= 1.26"]
build-backend = "hatchling.build"

[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = ["rich"]

[project.scripts]
spend = "spending.cli:main"
```
````

````{attempt}
:id: scripts-not-installed
:check: command-works
:expect: Install the project again

```{file-write}
:path: pyproject.toml
[build-system]
requires = ["hatchling >= 1.26"]
build-backend = "hatchling.build"

[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = ["rich"]

[project.scripts]
spending = "spending.cli:main"
```
````

````{attempt}
:id: scripts-wrong-function
:check: command-works
:expect: The command spending stopped with an error

```{file-write}
:path: pyproject.toml
[build-system]
requires = ["hatchling >= 1.26"]
build-backend = "hatchling.build"

[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = ["rich"]

[project.scripts]
spending = "spending:main"
```

```{execute}
:wait: prompt
:timeout: 300s
python -m pip install -e .
```
````

````{hint}
:title: Show me a solution
:unlock: "command-works" in failed_checks or "command-works" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes the whole file `pyproject.toml`, with
the two new lines at the end, and opens it. The second action installs
the project again, and the third uses the new command.

```{file-write}
:id: scripts-solution
:title: Write the file pyproject.toml
:path: pyproject.toml
:open: true
[build-system]
requires = ["hatchling >= 1.26"]
build-backend = "hatchling.build"

[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = ["rich"]

[project.scripts]
spending = "spending.cli:main"
```

```{execute}
:id: reinstall-solution
:title: Install the project again
:wait: prompt
:timeout: 300s
python -m pip install -e .
```

```{execute}
:id: command-solution
:title: Use the command spending
:wait: prompt
spending spending.csv --month 2026-02
```
````

```{verify}
:id: command-works
:label: The command spending shows the report
:trigger: terminal-output "Purchases: 12"; after:command-solution
import os, subprocess, tomllib
from pathlib import Path

try:
    data = tomllib.loads(Path("pyproject.toml").read_text())
except FileNotFoundError:
    raise AssertionError("There is no file pyproject.toml in your work directory. Return to the page Describe the project, and make it.") from None
except tomllib.TOMLDecodeError as error:
    raise AssertionError(f"The check cannot read line {error.lineno} of pyproject.toml, or the line before it. Look for a missing double quote or a missing bracket. Then save the file.") from None
scripts = data.get("project", {}).get("scripts")
if not isinstance(scripts, dict):
    raise AssertionError("The file pyproject.toml has no table [project.scripts] yet. Add the two lines at the end of the file, and save it.")
if "spending" not in scripts:
    names = ", ".join(scripts) or "nothing"
    raise AssertionError(f"The table [project.scripts] has no command with the name spending. It names {names}. The name before the = sign is the name of the command. Change it to spending, and save the file.")
command = Path(".venv/bin/spending")
if not command.exists():
    raise AssertionError("The file pyproject.toml is right, but the command does not exist yet. Install the project again: type python -m pip install -e . in the terminal and press Enter. The prompt must begin with (.venv).")
try:
    run = subprocess.run(
        [str(command), "spending.csv", "--month", "2026-02"],
        capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError("The command spending did not end after 30 seconds.") from None
if run.returncode != 0:
    lines = run.stderr.strip().splitlines() or ["(nothing)"]
    raise AssertionError(f"The command spending stopped with an error. The last line of the error is: {lines[-1]}. Compare the text after the = sign with the page: it must be \"spending.cli:main\". Save the file, and install again.")
first = run.stdout.strip().splitlines()[0]
print(f"The command spending spending.csv --month 2026-02 shows the report. Its first line is: {first}")
```

## What happened

Type `ls .venv/bin` in the terminal. Beside `python`, `pip`, `pytest`
and the files that activate the environment, you see the new program
`spending`. pip wrote it. It is a few lines of Python that import the
function `main` from `spending.cli`, and call it.
