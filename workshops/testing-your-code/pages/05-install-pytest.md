---
title: Install pytest
requires: [verify:pytest-installed, verify:requirements-has-pytest]
---

# Install pytest

Python has the word `assert`, but a file of checks that you run by
hand has limits. It stops at the first check that fails, so you never
learn about the checks after it. It does not say which values were
different. And you must remember to run every such file.

**pytest** is a package that solves this. It is a tool that finds the
tests of a project, runs every one of them, and shows which tests
passed and which failed. For a test that fails, it shows the values
that were different. Most Python projects use it. Its name is one
word, in small letters.

## Install pytest and rich

The spending tracker already needs one package, `rich`, which it uses
to show a table. The file `requirements.txt` in your work directory
names it. A **requirements file** lists the packages that a project
needs, one on each line.

Your new environment is empty, so it needs both packages. pip can
take a requirements file and the name of a package in one command:

```
python -m pip install -r requirements.txt pytest
```

With `-r requirements.txt`, pip installs every package that the file
names. The word `pytest` after it names one more package. These
workshops write `python -m pip`, and not `pip` alone: with
`python -m pip` it is certain which Python gets the packages, the
same `python` that runs your programs.

Look at the prompt in the terminal first. It must begin with
`(.venv)`. If it does not, type `source .venv/bin/activate` and press
`Enter`. The command takes a few seconds, because pip gets the
packages over the internet, so the action below runs it for you.

```{attempt}
:id: pytest-not-installed
:check: pytest-installed
:expect: The package pytest is not in your environment yet
```

```{execute}
:id: install-pytest
:title: Install the packages into the environment
:wait: prompt
:timeout: 300s
python -m pip install -r requirements.txt pytest
```

pip shows many lines, which are different from month to month,
because new versions of packages are published. The important line
is near the end. It begins with the words `Successfully installed`,
and it names `pytest`, `rich`, and the packages that they need, each
with the number of its version. pip may also show lines that begin
with `[notice]`, which say that a newer pip exists. You can ignore
them.

```{hint}
:title: "Hint: pip says that it could not find an activated virtualenv"
The message `ERROR: Could not find an activated virtualenv (required).`
means that your environment is not active, so pip installed nothing.
In this workshop, pip is set to refuse in that case. Type
`source .venv/bin/activate` in the terminal and press `Enter`. Then
click the action above again.
```

```{verify}
:id: pytest-installed
:label: The environment holds the packages pytest and rich
:trigger: after:install-pytest; terminal-output "Successfully installed"
import os, subprocess
from pathlib import Path

assert Path(".venv/bin/python").exists(), "There is no environment in your work directory. Go back one page and make it, with the command python -m venv .venv, and activate it."
for name in ["pytest", "rich"]:
    run = subprocess.run(
        [".venv/bin/python", "-c", f"import {name}"],
        capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
    assert run.returncode == 0, f"The package {name} is not in your environment yet. Look at the prompt in the terminal. If it does not begin with (.venv), type source .venv/bin/activate and press Enter. Then click the action above, which runs python -m pip install -r requirements.txt pytest."
print("The python of your environment can import pytest and rich.")
```

## Record the new package

The file `requirements.txt` still names only `rich`. A person who gets
your project tomorrow makes an environment, installs what the file
names, and has no `pytest`. So the record must change too.

`pytest` is different from `rich` in one way: the program does not
need it to run. Only the tests need it. Many projects still list it in
the same file, so that one command gives a person everything that the
project uses. The spending tracker does the same.

Your task: add a second line to `requirements.txt`, with the word
`pytest`.

1. Double-click the file `requirements.txt` in the file browser on the
   left. It opens in the editor. If the file browser does not show
   your work directory, click the action below first.

2. Click at the end of the line `rich`, press `Enter`, and type
   `pytest`.

3. Save the file: hold `Ctrl` and press `S`, or on a Mac hold `Cmd`
   and press `S`.

```{file-browser-reveal}
:id: show-requirements
:title: Show requirements.txt in the file browser
:path: requirements.txt
```

The file then holds two lines:

```
rich
pytest
```

```{attempt}
:id: requirements-no-pytest
:check: requirements-has-pytest
:expect: The file requirements.txt has no line for pytest yet
```

````{attempt}
:id: requirements-no-rich
:check: requirements-has-pytest
:expect: has no line for rich now

```{file-write}
:path: requirements.txt
pytest
```
````

````{hint}
:title: Show me a solution
:unlock: "requirements-has-pytest" in failed_checks or "requirements-has-pytest" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes the file `requirements.txt` with its two
lines, and opens it in the editor.

```{file-write}
:id: requirements-solution
:title: Write a solution to requirements.txt
:path: requirements.txt
:from: solutions/requirements.txt
:open: true
```
````

```{verify}
:id: requirements-has-pytest
:label: The file requirements.txt names rich and pytest
:trigger: file-saved requirements.txt; after:requirements-solution
import re
from pathlib import Path

file = Path("requirements.txt")
assert file.exists(), "There is no file requirements.txt in your work directory. Make it in the file browser, with the two lines rich and pytest, and save it."
lines = [line.strip() for line in file.read_text().splitlines()]
names = [re.split(r"[\s=<>!~;\[]", line, maxsplit=1)[0].lower() for line in lines if line and not line.startswith("#")]
assert "pytest" in names, "The file requirements.txt has no line for pytest yet. Add a line with the word pytest under the line rich. Then save the file: hold Ctrl and press S, or on a Mac hold Cmd and press S."
assert "rich" in names, "The file requirements.txt has no line for rich now. The program still needs rich. The file must hold two lines: rich, and under it pytest. Save the file after you change it."
print("The file requirements.txt names rich and pytest. It records everything that the project uses.")
```
