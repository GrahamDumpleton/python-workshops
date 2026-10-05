---
title: Install with uv
requires: [verify:rich-installed, quiz:why-four, quiz:predict-pip, quiz:food-total]
---

# Install with `uv`

The environment is empty: it has a `python`, and no packages. On this
page you install the package that the program needs, with `uv`.

## The commands that begin with `uv pip`

`uv` has a group of commands that begin with the two words `uv pip`.
They are made to look like the commands of pip, so that a person who
knows pip can use them at once. You take a command of pip and you
change its start:

| With pip | With `uv` |
|----------|-----------|
| `python -m pip install -r requirements.txt` | `uv pip install -r requirements.txt` |
| `python -m pip install rich` | `uv pip install rich` |
| `python -m pip list` | `uv pip list` |
| `python -m pip freeze` | `uv pip freeze` |

The words after the start mean the same. `install` gets packages from
PyPI and puts them into the environment. `-r requirements.txt` says:
read the names of the packages from the file `requirements.txt`.

These commands do not run pip. The word `pip` in them is only a name.
`uv` does the work itself.

## First, be sure that the environment is active

`uv pip install` puts the packages into the environment that is
active in the terminal. So the environment must be active before you
install.

Look at the prompt in the terminal. It must begin with a name in
parentheses, which is `(work)` here. If the prompt has no name in
parentheses, type this command first, and press `Enter`:

```
source .venv/bin/activate
```

This matters. With no active environment, `uv pip install` can put
the package into another Python of the computer, and that is the
mistake that an environment exists to prevent.

## Your task: install what the program needs

Type this command in the terminal, and press `Enter`:

```
uv pip install -r requirements.txt
```

`uv` shows lines of this form. The numbers are different on each
computer and on each day, so they are written as `...` here:

```
Resolved 4 packages in ...
Installed 4 packages in ...
 + markdown-it-py==...
 + mdurl==...
 + pygments==...
 + rich==...
```

Each line that begins with `+` names one package that was installed,
and its version after `==`.

```{attempt}
:id: rich-not-installed
:check: rich-installed
:expect: The package rich is not in the environment .venv yet
```

````{hint}
:title: Run the command for me
:unlock: "rich-installed" in failed_checks or "rich-installed" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The two actions below run the two commands in the terminal. Click
them in this order. The first activates the environment, so that the
second installs into it.

```{execute}
:id: install-activate
:title: Activate the environment
:wait: prompt
source .venv/bin/activate
```

```{execute}
:id: install-solution
:title: Install the packages that requirements.txt names
:wait: prompt
:timeout: 300s
uv pip install -r requirements.txt
```
````

```{verify}
:id: rich-installed
:label: The environment .venv has the package rich
:trigger: terminal-output /(Installed|Audited) \d+ packages? in/; after:install-solution
import os, subprocess
from pathlib import Path

python = Path(".venv/bin/python")
version = ""
if python.exists():
    try:
        run = subprocess.run(
            [str(python), "-c", "import rich, importlib.metadata; print(importlib.metadata.version('rich'))"],
            capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
        if run.returncode == 0:
            version = run.stdout.strip()
    except subprocess.TimeoutExpired:
        version = ""
assert version, "The package rich is not in the environment .venv yet. First activate the environment: type source .venv/bin/activate and press Enter. Then type uv pip install -r requirements.txt and press Enter. If you have no environment yet, go back one page and make it with uv venv."
print(f"The python of the environment .venv can import rich. The version of rich is {version}.")
```

## What is in the environment now

Type this command, and press `Enter`:

```
uv pip list
```

It shows a table of the packages of the environment, with the version
of each: `markdown-it-py`, `mdurl`, `pygments` and `rich`.

```{quiz}
:id: why-four
:title: More packages than the file names
question: "The file `requirements.txt` names one package, `rich`. Why does the environment hold four packages?"
options:
  - { text: "`uv` always installs three packages of its own into an environment", explanation: "`uv` installs nothing of its own. The directory `site-packages` of a new environment from `uv venv` holds no packages." }
  - { text: "The package `rich` needs the other three packages for its own work", correct: true }
  - { text: "The other three packages are part of Python", explanation: "The modules that are part of Python are the standard library, and they are not in this list. These three packages came from PyPI now." }
explanation: "A package that a program needs is a **dependency** of the program. A package can have dependencies of its own. `rich` needs `markdown-it-py` and `pygments`, and `markdown-it-py` needs `mdurl`. The first line that `uv` showed, `Resolved 4 packages`, reports this work: `uv` found every package that is needed, and a version of each that fits the others. pip does the same."
```

## One thing that is different

Here is a command of pip that you know:

```
python -m pip list
```

Remember what you saw in the directory `.venv/bin` on the page
before.

```{quiz}
:id: predict-pip
:title: Predict: pip in this environment
question: "What happens when you type `python -m pip list` now, in the active environment?"
options:
  - { text: "It shows the same four packages as `uv pip list`", explanation: "It would in an environment that `python -m venv` made. This environment was made by `uv venv`, and it has no pip inside it." }
  - { text: "Python says that it has no module with the name `pip`", correct: true }
  - { text: "It installs pip, and then shows the list", explanation: "`python -m pip` runs the module `pip` when the environment has one. It never installs it." }
explanation: "With `-m`, Python looks for a module with the name `pip` in the environment, and this environment has none. Python shows one line that ends with `No module named pip`. Nothing is broken. `uv` is a program outside the environment, and it installs into the environment from outside. So in an environment that `uv` made, you use `uv pip` where you used `python -m pip`."
```

Now type `python -m pip list` in the terminal, press `Enter`, and see
it.

## Run the program

The program has what it needs now. The option `--table` makes it show
the totals as a table, which is the part that uses `rich`. An
**option** is a command line argument that begins with `--`.

Type this command, and press `Enter`:

```
python -m spending spending.csv --table
```

The word `python` here means the `python` of the environment, because
the environment is active. That `python` finds `rich` in the
`site-packages` of the environment.

````{hint}
:title: Run the command for me
:unlock: "food-total" in failed_checks or "food-total" in passed_checks
:locked: Try the task first. This opens after you have answered the question below.
The action below runs the program in the terminal.

```{execute}
:id: run-table-solution
:title: Show the table
:wait: prompt
python -m spending spending.csv --table
```
````

```{quiz}
:id: food-total
:type: text
question: "What is the total in the row `food` of the table? Type the number."
answer: "445.60"
wrong:
  - { text: "445.6", explanation: "Almost. The table shows two digits after the point. Type the number as the table shows it." }
  - { text: "2834.79", explanation: "That is the last row, the total of all categories. Look for the row that begins with `food`." }
  - { pattern: ".*No module named.*", explanation: "Python did not find the package `rich`, so the environment is not active, or the package is not installed. Do the steps of this page again from `source .venv/bin/activate`." }
otherwise: "Look at the table in the terminal. Each row has a category and a total. Type the number in the row `food`."
explanation: "Mariam spent 445.60 on food in the three months. The program now runs, with a package that `uv` installed into an environment that `uv` made. You did the three steps of the workshop **Installing packages**, each with a shorter command."
```
