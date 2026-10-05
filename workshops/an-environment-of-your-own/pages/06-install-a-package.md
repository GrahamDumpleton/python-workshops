---
title: Install a package
requires: [verify:tabulate-installed, quiz:packages-after, quiz:table-first-word]
---

# Install a package

The program `prices.py` needs the package `tabulate`. The environment
is active, so now you can install the package for this project and
for no other project. On this page you install it, and you look where
it went.

## Look at the prompt first

An install goes to the Python that the word `python` means at that
moment. So before any install, look at the prompt.

**Install only when the prompt begins with `(.venv)`.** If it does
not, go back one page and click the action that runs
`source .venv/bin/activate`.

## The command

```
python -m pip install tabulate
```

- `python` is the interpreter of your environment, because the
  environment is active.

- `-m pip` tells the interpreter to run the module `pip` as a
  program. `pip` is the tool that installs packages. You saw it in
  the `site-packages` of the environment. The next workshop,
  **Installing packages**, explains `pip`.

- `install tabulate` tells `pip` what to do: get the package with the
  name `tabulate` from the internet, and install it.

You may see people write `pip install` with no `python -m` before it.
These workshops always write `python -m pip`. Then it is certain
which Python gets the package: the Python that the word `python`
means.

The command is new, so this time a click runs it. It can need some
seconds, because it gets the package from the internet.

```{attempt}
:id: tabulate-not-installed
:check: tabulate-installed
:expect: The package tabulate is not in your environment yet
```

```{execute}
:id: install-tabulate
:title: Run the command in the terminal
:wait: prompt
:timeout: 300s
python -m pip install tabulate
```

The terminal shows several lines while `pip` works. They hold version
numbers, which change with time. The last line has this form:

```
Successfully installed tabulate-...
```

```{verify}
:id: tabulate-installed
:label: The package tabulate is in your environment
:trigger: after:install-tabulate; terminal-output "Successfully installed"
import os, subprocess
from pathlib import Path

python = Path(".venv/bin/python")
found = False
if python.exists():
    try:
        run = subprocess.run(
            [str(python), "-c", "import tabulate"],
            capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
        found = run.returncode == 0
    except subprocess.TimeoutExpired:
        found = False
assert found, "The package tabulate is not in your environment yet. Look at the prompt in the terminal. If it does not begin with (.venv), go back one page and activate the environment. Then click the action above that runs python -m pip install tabulate, and wait for the prompt."
print("Correct. The Python of your environment can import tabulate.")
```

````{hint}
:title: The terminal shows an error and not the line Successfully installed

Read the last lines that the terminal shows.

If they say that no virtual environment is active, or that there is
no module with the name `pip`, look at the prompt. It does not begin
with `(.venv)`, so the word `python` meant the Python of the computer.
Go back one page, and click the action that runs
`source .venv/bin/activate`. Then click the install action again.
This workshop has set `pip` so that it refuses to install when no
environment is active, so nothing was installed in the wrong place.

If they say that `pip` could not find or could not get the package,
the computer has no connection to the internet at this moment. Wait a
little, and click the install action again.
````

## Where it went

On an earlier page, the `site-packages` of your environment held
only `pip`. Look at it again. The command is the same long command as
before, so you do not need to type it again. The shell remembers the
commands that it ran. Click one time inside the terminal, and press
the up arrow key several times, until the terminal shows this
command. Then press `Enter`:

```
ls .venv/lib/python3.14/site-packages
```

You can also type the command.

````{hint}
:title: Type the command for me

```{execute}
:id: run-ls-packages-after
:wait: prompt
ls .venv/lib/python3.14/site-packages
```
````

The terminal now shows four names, with `...` here in place of the
version numbers:

```
pip   pip-....dist-info   tabulate   tabulate-....dist-info
```

```{quiz}
:id: packages-after
:title: The new names
:type: text
:case: false
question: "Two of the four names are new. One of the new names has no version number in it. Type that name."
answer: "tabulate"
wrong:
  - { text: "pip", explanation: "The name `pip` was there before the install. Type the new name that has no version number." }
  - { pattern: "tabulate-.*", explanation: "That is the new name with the version number. Type the new name that has no version number and no hyphen." }
otherwise: "Compare the line with the two names that the directory held before: `pip` and a second name that begins with `pip-`. Type the new name that has no hyphen in it."
explanation: "The name `tabulate` is a directory that holds the modules of the package. The other new name is a directory in which `pip` keeps notes about the package, such as its version. To install a package means to copy its files into `site-packages`. Here that is the `site-packages` of your environment, inside your work directory."
```

## Run the program

The program `prices.py` can now find its import. Type this command,
and press `Enter`:

```
python prices.py
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-prices-active
:wait: prompt
python prices.py
```
````

The terminal shows a table:

```
item      price
------  -------
tea           3
soup          4
bread         2
```

```{quiz}
:id: table-first-word
:title: What the program shows
:type: text
:case: false
question: "Look at the line of the table that has the number `4`. What is the word before the number?"
answer: "soup"
wrong:
  - { pattern: "tea|bread|item", explanation: "That word is on another line of the table. Find the line that has the number `4`." }
  - { pattern: ".*ModuleNotFoundError.*", explanation: "The program did not find the package. Look at the prompt. If it does not begin with `(.venv)`, the environment is not active. Go back one page and activate it, and then run `python prices.py` again." }
otherwise: "Look at the lines under the command `python prices.py`. Find the line that ends with `4`, and type the word at its start."
explanation: "The program ran, and the function of the package `tabulate` made the table. The word `python` meant the interpreter of your environment. That interpreter searched the `site-packages` of your environment, and found the package there."
```

## What happened

- `pip` got the package `tabulate` from the internet.

- It copied the files into `.venv/lib/python3.14/site-packages`,
  which is inside your work directory.

- The interpreter of the environment looks for imports in that
  directory, so `from tabulate import tabulate` works.

The Python of the computer did not change. Its own `site-packages`
holds the same packages as before. The next page shows that.
