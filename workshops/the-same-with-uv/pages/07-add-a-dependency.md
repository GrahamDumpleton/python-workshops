---
title: Add a dependency
requires: [verify:rich-added, quiz:what-uv-wrote]
---

# Add a dependency

Your project has a file that describes it, and the list of
dependencies in that file is empty. On this page you tell `uv` that
the project needs the package `rich`, and you see what `uv` changes.

## The command `uv add`

A **dependency** is a package that your program needs. With pip, a
new dependency took two steps, and you did both by hand:

1. Install the package: `python -m pip install rich`.

2. Record it: write the name in the file `requirements.txt`.

Many people do the first step and forget the second step. Then the
program works on your computer, and it stops on every other computer,
because the record is not complete.

`uv` has one command for both steps:

```
uv add rich
```

The command does three things, in this order:

1. It writes the name of the package in the list `dependencies` of
   the file `pyproject.toml`.

2. It finds the exact version of every package that is needed, and it
   writes those versions in a new file, `uv.lock`. The next page is
   about that file.

3. It installs the packages into the environment `.venv` of the
   project. If the project has no environment yet, `uv` makes one.

So the record and the environment can never disagree.

`uv add` is for a project. It works on the file `pyproject.toml` of
your work directory, which is the directory that the terminal is in.

## Your task: add the package

Type this command in the terminal, and press `Enter`:

```
uv add rich
```

`uv` shows two or three short lines, and it is ready almost at once.
The package `rich` is already in your environment from an earlier
page, so `uv` has nothing to get from PyPI this time.

```{hint}
:title: Hint: uv shows a line that begins with warning
The line begins with `warning: VIRTUAL_ENV=`, and it says that this
environment "will be ignored". It means that the terminal has another
environment active, not the environment `.venv` of this project. `uv`
does not use that other environment. It uses the environment `.venv`
of your project, which is the right one. The warning does no harm.
```

```{attempt}
:id: rich-not-added
:check: rich-added
:expect: The list dependencies of pyproject.toml does not name the package rich yet
```

````{attempt}
:id: rich-typed-by-hand
:check: rich-added
:expect: but there is no file uv.lock

```{file-write}
:path: pyproject.toml
[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = ["rich"]
```
````

````{hint}
:title: Run the command for me
:unlock: "rich-added" in failed_checks or "rich-added" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action writes the file `pyproject.toml` again, as it was
when the workshop started. The second action runs the command in the
terminal.

```{file-write}
:id: project-file-again
:title: Write the file pyproject.toml with an empty list of dependencies
:path: pyproject.toml
[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = []
```

```{execute}
:id: add-solution
:title: Add the package rich to the project
:wait: prompt
:timeout: 300s
uv add rich
```
````

```{verify}
:id: rich-added
:label: The project records the package rich
:trigger: terminal-output /(Installed|Checked|Audited) \d+ packages? in/; after:add-solution
import tomllib
from pathlib import Path

names = []
path = Path("pyproject.toml")
if path.exists():
    try:
        project = tomllib.loads(path.read_text()).get("project", {})
        names = [str(item).strip().lower() for item in project.get("dependencies", [])]
    except (tomllib.TOMLDecodeError, AttributeError, TypeError):
        names = []
assert any(name.startswith("rich") for name in names), "The list dependencies of pyproject.toml does not name the package rich yet. Type uv add rich in the terminal, and press Enter. If uv shows an error, read its last line: it says what is wrong with the file pyproject.toml."
lock = Path("uv.lock")
assert lock.exists() and 'name = "rich"' in lock.read_text(), "The file pyproject.toml names the package rich, but there is no file uv.lock that names it. Did you type the name in the file by hand? Let uv do the work: type uv add rich in the terminal, and press Enter. It writes the file uv.lock, and it installs the package."
print("The file pyproject.toml names rich in its list of dependencies, and the file uv.lock exists.")
```

## What `uv` changed

Look at the file `pyproject.toml` again. Type this command, and press
`Enter`:

```
cat pyproject.toml
```

The editor may still show the old text of the file. The editor does
not see a change that another program makes to a file. The action
below opens the file again, with the text that is on the disk now.

```{file-open}
:id: reopen-project-file
:title: Show the file pyproject.toml as it is now
:path: pyproject.toml
```

The last line of the file was `dependencies = []`. `uv` has written
in the list, and the list now takes three lines:

```toml
dependencies = [
    "rich>=...",
]
```

In your file, a version of `rich` stands in the place of `...`.

```{quiz}
:id: what-uv-wrote
:type: text
question: "Which two characters stand between the name `rich` and the number of the version, in your file?"
answer: ">="
wrong:
  - { text: "==", explanation: "Look again. Two equal signs are what `pip freeze` writes, and what `uv` showed when it installed. In `pyproject.toml`, `uv` wrote two other characters." }
  - { text: ">", explanation: "Almost. One more character follows the `>`." }
  - { text: "=", explanation: "Almost. One more character stands before the `=`." }
  - { pattern: "\\d+(\\.\\d+)*", explanation: "That is the number of the version. The answer is the two characters between the name and that number." }
otherwise: "Look at the line that begins with `\"rich` in the file. Type the two characters between the name `rich` and the number."
explanation: "`>=` means \"this version, or a newer version\", as it does in `requires-python`. `uv` wrote the version of `rich` that it installed, with `>=` before it. So the file says: this project works with that version of `rich`, and with the versions that come after it. The file does not fix one exact version. The exact version is recorded in another place, which is the subject of the next page."
```

## What happened

One command did the work of two steps of pip, and it kept the record
for you. The directory now holds one more file. Type `ls` to see it:

```
pyproject.toml  requirements.txt  spending  spending.csv  uv.lock
```
