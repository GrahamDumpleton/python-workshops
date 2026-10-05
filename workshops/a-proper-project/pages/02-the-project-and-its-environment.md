---
title: The project and its environment
requires: [verify:env-ready, quiz:tests-passed]
---

# The project and its environment

A **project** is one piece of work: the directory that holds your
program, and everything that belongs to it. Your work directory is a
project. On this page you look at what it holds, and you make its
environment.

## What the project holds now

A **directory** is a place that holds files and other directories.
Your work directory holds these:

| Name | What it is |
|------|------------|
| `spending` | the package: a directory that holds the six modules of the program |
| `tests` | the two files of tests, `test_models.py` and `test_report.py` |
| `spending.csv` | the 37 purchases |
| `requirements.txt` | the packages that the project needs, `rich` and `pytest`, one name on each line |

A **module** is a file of Python code. The modules in `spending`
hold the classes `Purchase` and `Ledger`, the function `read_ledger`
that reads the CSV file, the report, and the function `main` that
reads the command. You start the program with
`python -m spending spending.csv`.

## Your task: make the environment and install the packages

The program needs the package `rich`, and the tests need `pytest`.
They go into an environment of the project. These are the three
commands, which the workshops **An environment of your own** and
**Installing packages** taught:

```
python -m venv .venv
```

```
source .venv/bin/activate
```

```
python -m pip install -r requirements.txt
```

The first command makes the environment, the directory `.venv`. The
second command activates it: after it, the **prompt**, the short text
that shows the shell is ready for a command, begins with `(.venv)`.
The third command installs every package that `requirements.txt`
names. It needs a few seconds, because pip gets the packages over the
internet. Near its end, it shows a line that begins with
`Successfully installed`.

These workshops write `python -m pip`, and not `pip`, for one reason:
it is certain which Python gets the package. It is the `python` that
the terminal runs, which is the `python` of the environment after you
activate it.

Click in the terminal, which is the lower part of the window. Type
the three commands, one after another, and press `Enter` after each
one.

```{hint}
:title: Hint: pip says that it could not find an activated virtualenv
The word "virtualenv" is another name for a virtual environment. The
message means that the environment is not active, so pip installed
nothing. In this workshop, pip is set to refuse in that case, so that
nothing is installed into the Python of the computer. Type
`source .venv/bin/activate` and press `Enter`. Then type the install
command again.
```

```{attempt}
:id: env-missing
:check: env-ready
:expect: There is no environment in your work directory yet
```

````{attempt}
:id: env-empty
:check: env-ready
:expect: The environment has no package rich yet

```{execute}
:wait: prompt
:timeout: 120s
python -m venv .venv
```
````

````{hint}
:title: Show me the commands
:unlock: "env-ready" in failed_checks or "env-ready" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The actions below run the three commands, one after another. Click
them in this order.

```{execute}
:id: make-env
:title: Make the environment
:wait: prompt
:timeout: 120s
python -m venv .venv
```

```{execute}
:id: activate-env
:title: Activate the environment
:wait: prompt
source .venv/bin/activate
```

```{execute}
:id: install-requirements
:title: Install the packages of requirements.txt
:wait: prompt
:timeout: 300s
python -m pip install -r requirements.txt
```
````

```{verify}
:id: env-ready
:label: The environment .venv holds rich and pytest
:trigger: terminal-output "Successfully installed"; after:install-requirements
import os, subprocess
from pathlib import Path

assert Path(".venv/bin/python").exists(), "There is no environment in your work directory yet. Click in the terminal, type python -m venv .venv and press Enter."
for name in ["rich", "pytest"]:
    run = subprocess.run(
        [".venv/bin/python", "-c", f"import {name}"],
        capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
    assert run.returncode == 0, f"The environment has no package {name} yet. Look at the prompt in the terminal. If it does not begin with (.venv), type source .venv/bin/activate and press Enter. Then type python -m pip install -r requirements.txt and press Enter."
print("The environment .venv holds the packages rich and pytest.")
```

## Run the tests

Now run the tests. Type this command in the terminal, and press
`Enter`:

```
python -m pytest
```

````{hint}
:title: Run the tests for me
```{execute}
:id: run-tests-first
:title: Run the tests
:wait: prompt
python -m pytest
```
````

```{quiz}
:id: tests-passed
:title: The last line of pytest
:type: text
question: "The last line that pytest shows says how many tests passed. How many?"
answer: "7"
wrong:
  - { text: "0", explanation: "Look at the last line again. It begins with a number and the word `passed`." }
otherwise: "Look at the last line under the command. It has the form `7 passed in 0.02s`, and the time is different on each computer. Type the number before the word `passed`."
explanation: "All seven tests pass. They pass because the terminal is in your work directory, and the package `spending` is in that directory too. On the next page you see what happens when that is not so."
```
