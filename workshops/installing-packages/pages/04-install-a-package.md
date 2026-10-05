---
title: Install a package
requires: [quiz:predict-import, verify:rich-installed]
---

# Install a package

The environment is ready. On this page you install the package
`rich` into it.

## The tool `pip`

**pip** is the program that installs packages. The command
`python -m venv` put it into your new environment. You give pip the
name of a package. It finds the package on PyPI,
gets it over the internet, and copies it into the `site-packages`
directory of the environment.

pip is a module, and you start it with `python -m pip`. You know
`-m` from the command `python -m spending`: it runs a module by its
name. The words after `pip` say what pip must do.

Many pages on the internet write the shorter command `pip`. These
workshops always write `python -m pip`, for one reason. A computer
can have several Pythons. With `python -m pip`, it is certain which
Python gets the package: the same `python` that runs your programs.

## Before the package is installed

First, see what Python does when a program imports a package that is
not installed.

The command below uses `-c`. With `-c`, Python runs the code that is
written after it, between the quotation marks. Here the code is one
line, `import rich`.

```{quiz}
:id: predict-import
:title: A package that is not installed
question: "Your environment is new, and nobody has installed `rich` into it. What does the command `python -c \"import rich\"` do?"
options:
  - { text: "It gets the package from PyPI, and then it imports it", explanation: "An `import` line never installs anything, and it never uses the internet. It only looks in the directories of `sys.path`." }
  - { text: "Python stops with a `ModuleNotFoundError`", correct: true }
  - { text: "It shows nothing, because `rich` comes with Python", explanation: "The package `rich` is not part of the standard library. Someone published it on PyPI." }
explanation: "An `import` line looks for the module in the directories of `sys.path`, and in no other place. The `site-packages` of your new environment has no `rich`, so Python stops with a `ModuleNotFoundError`. Click the action below to see it."
```

```{execute}
:id: import-before
:title: Try to import rich
:wait: prompt
python -c "import rich"
```

The last line that the terminal shows is:

```
ModuleNotFoundError: No module named 'rich'
```

You may also see a note under the action, which says that the command
ended with status 1. That is correct here. A command that ends with
an error has a status that is not 0.

## Install it

Look at the prompt in the terminal. It must begin with `(.venv)`. If
it does not, type `source .venv/bin/activate` and press `Enter`.

The command that installs a package is:

```
python -m pip install rich
```

This command is new, so the action below runs it for you this time.
It needs a few seconds, because pip gets the package over the
internet.

```{attempt}
:id: rich-not-installed
:check: rich-installed
:expect: The package rich is not in your environment yet
```

```{execute}
:id: install-rich
:title: Install the package rich into the environment
:wait: prompt
:timeout: 300s
python -m pip install rich
```

pip shows many lines. The lines are different from month to month,
because new versions of packages are published. The important line
is near the end. It begins with these words:

```
Successfully installed
```

After those words, the line names each thing that pip installed,
with the number of its version. The name `rich` is one of them.

pip may also show one or two lines that begin with `[notice]`. They
say that a newer pip exists. You can ignore them.

```{hint}
:title: Hint: pip says that it could not find an activated virtualenv
The whole message is
`ERROR: Could not find an activated virtualenv (required).` The word
"virtualenv" is another name for a virtual environment. The message
means that your environment is not active, so pip installed nothing.
In this workshop, pip is set to refuse in that case. Type
`source .venv/bin/activate` in the terminal and press `Enter`. Then
click the action above again.
```

```{hint}
:title: Hint: Python says that there is no module named pip
The message `No module named pip` also means that your environment
is not active. Type `source .venv/bin/activate` in the terminal and
press `Enter`. Then click the action above again.
```

```{verify}
:id: rich-installed
:label: The environment holds the package rich
:trigger: after:install-rich; terminal-output "Successfully installed"
import os, subprocess
from pathlib import Path

assert Path(".venv/bin/python").exists(), "There is no environment in your work directory. Go back one page and make it, with the command python -m venv .venv, and activate it."
run = subprocess.run(
    [".venv/bin/python", "-c", "import rich"],
    capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
    env={**os.environ, "PYTHON_COLORS": "0"},
)
assert run.returncode == 0, "The package rich is not in your environment yet. Look at the prompt in the terminal. If it does not begin with (.venv), type source .venv/bin/activate and press Enter. Then click the action above, which runs python -m pip install rich."
print("The python of your environment can import rich.")
```

## After the package is installed

Now try the import again. Type this command in the terminal
yourself, and press `Enter`:

```
python -c "import rich"
```

This time the terminal shows nothing, and the prompt returns. For an
`import` line, no message means that it worked. Python found the
package.

You did not change the program, and you did not change Python. The
only thing that changed is what the `site-packages` of your
environment holds. On the next page you look inside it.
