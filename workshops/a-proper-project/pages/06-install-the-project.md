---
title: Install the project
requires: [verify:project-installed, quiz:predict-change]
---

# Install the project

The project has a description now. On this page you install it into
its own environment, and the tests and the program work again.

## The command

```
python -m pip install -e .
```

You know `python -m pip install` from the workshop **Installing
packages**. Two parts are new.

- The dot `.` means the current directory. Until now, you gave pip the
  name of a package on PyPI, the website that packages are installed
  from. Here you give it a directory. pip reads the file
  `pyproject.toml` in that directory, and installs the project that it
  describes, with its dependencies.

- `-e` is short for "editable". It is explained below.

Look at the prompt first. It must begin with `(.venv)`. If it does
not, type `source .venv/bin/activate` and press `Enter`.

This command is new, so the action below runs it for you this time. It
needs a few seconds, because pip first gets `hatchling` from the
internet.

```{attempt}
:id: project-not-installed
:check: project-installed
:expect: The environment does not hold the project spending yet
```

```{execute}
:id: install-editable
:title: Install the project into its environment
:wait: prompt
:timeout: 300s
python -m pip install -e .
```

pip shows many lines, and they are different on each computer. Near
the end is a line that begins with these words:

```
Successfully installed spending-0.1.0
```

```{hint}
:title: Hint: pip says that it could not find an activated virtualenv
The environment is not active, so pip installed nothing. Type
`source .venv/bin/activate` and press `Enter`. Then click the action
above again.
```

```{verify}
:id: project-installed
:label: The environment holds the project spending, from the directory src
:trigger: after:install-editable; terminal-output "Successfully installed spending"
import os, subprocess
from pathlib import Path

assert Path(".venv/bin/python").exists(), "There is no environment in your work directory. Return to the page The project and its environment, and make it."
run = subprocess.run(
    [str(Path(".venv/bin/python").absolute()), "-c", "import spending; print(spending.__file__)"],
    cwd="tests", capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
    env={**os.environ, "PYTHON_COLORS": "0"},
)
assert run.returncode == 0, "The environment does not hold the project spending yet. Look at the prompt: it must begin with (.venv). Then click the action above, which runs python -m pip install -e ."
print("The environment holds the project spending. Python finds it in the directory src, also from the directory tests.")
```

## The tests and the program work again

Type these two commands in the terminal, and press `Enter` after each
one:

```
python -m pytest
```

```
python -m spending spending.csv
```

The seven tests pass again, and the program shows its report. The
current directory still holds no package. Python found `spending`
because it is installed in the environment.

Now type one more command:

```
python -m pip list
```

It lists every package in the environment. The line of `spending` is
different from the others. It has a third column, with the heading
`Editable project location`, and the value is the path of your work
directory. The first part of that path is different on every
computer.

````{hint}
:title: Run the three commands for me
```{execute}
:id: tests-after-install
:title: Run the tests
:wait: prompt
python -m pytest
```

```{execute}
:id: program-after-install
:title: Run the program
:wait: prompt
python -m spending spending.csv
```

```{execute}
:id: list-after-install
:title: List the packages of the environment
:wait: prompt
python -m pip list
```
````

## What "editable" means

An ordinary install copies the code of a package into `site-packages`.
An **editable install** copies nothing. It puts a small note into
`site-packages`, and the note tells Python where the code is: in the
directory `src` of your work directory. So Python always reads the
files that you work on.

An everyday comparison: an ordinary install is a printed copy of a
document. An editable install is a link to the document. When you
change the document, everyone who has the link sees the change.

```{quiz}
:id: predict-change
:title: Predict
question: "You change the code in the file `src/spending/report.py`, and you save it. What must you do before `python -m spending spending.csv` shows the change?"
options:
  - { text: "Run `python -m pip install -e .` again", explanation: "With an ordinary install, that would be needed. The editable install points at the directory `src`, so Python reads the changed file when the program next starts." }
  - { text: "Nothing more. The next run of the program uses the changed file", correct: true }
  - { text: "Delete the environment and make it again", explanation: "That is never needed for a change to your own code. An environment is made again only when it is broken or out of date." }
explanation: "Python reads the code from `src` each time that the program starts. Programmers use an editable install while they work on a project, because they change the code all the time. On the next pages, tools change your code, and the tests use the changed code with no new install. One kind of change does need a new install: a change to `pyproject.toml`. You see one on the next page."
```
