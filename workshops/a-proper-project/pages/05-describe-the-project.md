---
title: Describe the project
requires: [verify:project-file]
---

# Describe the project

To install the project, pip must know what the project is. On this
page you write the file that tells it.

## The file `pyproject.toml`

Python has one standard file that describes a project. Its name is
always `pyproject.toml`, and it is in the first directory of the
project. pip reads it, and so do many other tools for Python.

The file answers these questions. What is the name of the project?
Which version of the program is this? Which versions of Python can
run it? Which packages does it need? And which tool can turn the
project into something that pip can install?

An everyday comparison: the file is the label on a product. The label
gives the name of the product, and it lists what the product is made
of.

## The form of the file

The ending `.toml` is the name of a format for text files, TOML. It is
made for settings that people write by hand. You need three rules.

- A line with a name in square brackets, such as `[project]`, begins a
  group of settings. The group is called a **table**.

- A setting is a line of the form `name = value`.

- A value is written as in Python: text in double quotes, and a list
  in square brackets.

This is the whole file that you will write:

```toml
[build-system]
requires = ["hatchling >= 1.26"]
build-backend = "hatchling.build"

[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = ["rich"]
```

The table `[project]` describes the project:

- `name` is the name of the project.

- `version` is the version of your program. You choose it, and
  `0.1.0` is a usual first number.

- `requires-python` says which versions of Python can run the
  project. `>=3.14` means version 3.14 or a newer one.

- `dependencies` is the list of the packages that the program needs to
  run. A **dependency** is a package that your program needs. The
  program needs `rich`. The tests need `pytest`, but people who only
  use the program do not, so `pytest` is not in this list. It stays in
  `requirements.txt`.

The table `[build-system]` says how to install the project. A **build
system** is the tool that turns the files of a project into a package
that pip can install. Here it is a tool with the name `hatchling`, and
`requires` says that version 1.26 or a newer one is needed. You do not
install `hatchling` yourself: pip gets it from the internet when it
installs the project. The Python Packaging User Guide uses `hatchling`
in its examples, and these lines are the lines that it gives.

`hatchling` finds the package by itself, because the directory
`src/spending` has the same name as the project.

## Your task

Make the file `pyproject.toml` in your work directory, with these
lines in it.

First, the action below shows your work directory in the file browser
at the left side of the window.

```{file-browser-reveal}
:id: show-work-directory
:title: Show my work directory in the file browser
:path: spending.csv
```

Then do these steps yourself:

1. In the file browser, click the empty space under the list of files
   with the right button of the mouse. A menu opens. Click `New File`
   in the menu.

2. A new file appears in the list, with the name `untitled.txt`. Type
   `pyproject.toml` and press `Enter`. If the name is not ready to
   change, click the file with the right button of the mouse, and
   click `Rename` in the menu.

3. Double-click the file `pyproject.toml`. It opens in the editor. It
   is empty.

4. Type the lines above in the editor. The empty line between the two
   tables is not needed, but it makes the file easier to read.

5. Save the file: hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
   press `S`. To **save** means to write what the editor shows to the
   file on the disk. pip reads the file on the disk, so a change that
   is not saved does not exist for pip.

A tab with changes that are not saved shows a filled circle in place
of the cross. After you save, the cross returns.

```{hint}
:title: Hint: the quotes and the brackets
Every value in the file is text or a list. Text needs a double quote
on both sides, such as `"spending"` and `"hatchling.build"`. The two
lists, after `requires` and after `dependencies`, have square brackets
round the text: `["rich"]`. The names of the two tables have square
brackets too.
```

```{hint}
:title: Hint: where the file goes
The file must be in your work directory, beside `requirements.txt`. It
must not be inside the directory `src` or `tests`. Its name has no
spaces, and it does not end with `.txt`.
```

```{attempt}
:id: project-file-missing
:check: project-file
:expect: There is no file pyproject.toml in your work directory yet
```

````{attempt}
:id: project-file-untitled
:check: project-file
:expect: still has the name untitled.txt

```{file-write}
:path: untitled.txt
[project]
name = "spending"
```
````

````{attempt}
:id: project-file-not-toml
:check: project-file
:expect: The check cannot read line 2 of pyproject.toml

```{file-delete}
:path: untitled.txt
```

```{file-write}
:path: pyproject.toml
[build-system]
requires = ["hatchling >= 1.26]
build-backend = "hatchling.build"
```
````

````{attempt}
:id: project-file-no-build
:check: project-file
:expect: has no table with the name build-system

```{file-write}
:path: pyproject.toml
[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = ["rich"]
```
````

````{attempt}
:id: project-file-no-version
:check: project-file
:expect: has no setting with the name version

```{file-write}
:path: pyproject.toml
[build-system]
requires = ["hatchling >= 1.26"]
build-backend = "hatchling.build"

[project]
name = "spending"
requires-python = ">=3.14"
dependencies = ["rich"]
```
````

````{attempt}
:id: project-file-no-rich
:check: project-file
:expect: The list dependencies does not hold rich

```{file-write}
:path: pyproject.toml
[build-system]
requires = ["hatchling >= 1.26"]
build-backend = "hatchling.build"

[project]
name = "spending"
version = "0.1.0"
requires-python = ">=3.14"
dependencies = []
```
````

````{hint}
:title: Show me a solution
:unlock: "project-file" in failed_checks or "project-file" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below writes the file `pyproject.toml` in your work
directory and opens it in the editor. Compare it with your own file.

```{file-write}
:id: project-file-solution
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
```
````

```{verify}
:id: project-file
:label: The file pyproject.toml describes the project
:trigger: file-saved pyproject.toml; after:project-file-solution
import tomllib
from pathlib import Path

path = Path("pyproject.toml")
if not path.exists():
    if Path("untitled.txt").exists():
        raise AssertionError("The new file still has the name untitled.txt. In the file browser, click the file with the right button of the mouse, and click Rename in the menu. Then type pyproject.toml and press Enter.")
    for place in ["src", "tests", "src/spending"]:
        if Path(place, "pyproject.toml").exists():
            raise AssertionError(f"The file pyproject.toml is inside the directory {place}, and it must be in your work directory, beside requirements.txt. Move it with this command in the terminal: mv {place}/pyproject.toml .")
    raise AssertionError("There is no file pyproject.toml in your work directory yet. Make the file in the file browser. Check the name: the word pyproject, a dot, and toml.")
text = path.read_text()
if not text.strip():
    raise AssertionError("The file pyproject.toml is empty. Type the lines in the editor. Then save the file: hold Ctrl and press S, or Cmd and S on a Mac.")
try:
    data = tomllib.loads(text)
except tomllib.TOMLDecodeError as error:
    raise AssertionError(f"The check cannot read line {error.lineno} of pyproject.toml, or the line before it. Compare the line with the text on the page: look for a missing double quote, a missing bracket or a missing = sign. Then save the file.") from None
for table in ["build-system", "project"]:
    if not isinstance(data.get(table), dict):
        raise AssertionError(f"The file pyproject.toml has no table with the name {table}. Add the line [{table}], with the square brackets, and the settings under it. Then save the file.")
wanted = {
    "build-system": [("requires", None), ("build-backend", "hatchling.build")],
    "project": [("name", "spending"), ("version", "0.1.0"), ("requires-python", ">=3.14"), ("dependencies", None)],
}
for table, settings in wanted.items():
    for key, value in settings:
        if key not in data[table]:
            raise AssertionError(f"The table [{table}] has no setting with the name {key}. Compare your file with the lines on the page. Check the spelling of the name before the = sign. Then save the file.")
        found = data[table][key]
        if value is not None and str(found).replace(" ", "") != value:
            raise AssertionError(f"The setting {key} of the table [{table}] is \"{found}\" and it must be \"{value}\". Change the line, and save the file.")
requires = data["build-system"]["requires"]
if not isinstance(requires, list) or not any(str(item).replace(" ", "").startswith("hatchling") for item in requires):
    raise AssertionError("The setting requires of the table [build-system] must be a list that holds the text \"hatchling >= 1.26\", in square brackets and double quotes. Change the line, and save the file.")
dependencies = data["project"]["dependencies"]
if not isinstance(dependencies, list):
    raise AssertionError("The setting dependencies must be a list, with square brackets: dependencies = [\"rich\"]. Change the line, and save the file.")
if "rich" not in [str(item).strip() for item in dependencies]:
    raise AssertionError("The list dependencies does not hold rich. The program needs the package rich, so write the line as dependencies = [\"rich\"] and save the file.")
print("The file pyproject.toml is correct. It names the project and its version, the versions of Python that can run it, its dependency rich, and the build system hatchling.")
```

## What happened

Nothing was installed yet. The file is only a description. On the
next page, pip reads it and installs the project.
