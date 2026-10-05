---
title: The lock file
requires: [quiz:lock-own-project, quiz:lock-exact, quiz:lock-later]
---

# The lock file

`uv add` wrote a new file in your work directory, with the name
`uv.lock`. On this page you look inside it, and you see why it
exists.

## What a lock file is

A **lock file** is a file that records the exact version of every
package that a project needs. It names the packages that you asked
for, and also their dependencies, and the dependencies of those
dependencies. Each one has one exact version.

## Why it exists

Look at the line that `uv add` wrote in `pyproject.toml`:
`"rich>=..."`, with a version after `>=`. It means "this version of
`rich`, or any newer version". That is a range of versions, not one
version.

New versions of packages are published on PyPI all the time. Suppose
that another person gets your project next year, and installs what
`pyproject.toml` asks for. They get the newest `rich` of that day,
which can be different from your `rich`. A new version can behave in
a different way, so the program can work on your computer and stop
with an error on theirs.

The lock file solves this. `uv` reads it, and installs exactly the
versions that it names, on every computer. So everybody who works on
the project has the same packages as you.

An everyday comparison: `pyproject.toml` is like a shopping list
that says "rice". The lock file is like the receipt of the shop. It
says exactly which rice you got, and how much.

## Look inside

The action below opens the file `uv.lock` in the editor.

```{file-open}
:id: open-lock-file
:title: Open the file uv.lock
:path: uv.lock
```

The file is long, and you do not need to read all of it. It holds one
group of lines for each package. Each group begins with the line
`[[package]]`. In each group:

- `name` is the name of the package.

- `version` is its exact version.

- `source` says where the package comes from. For the packages from
  PyPI, it names the address of PyPI.

- `dependencies` names the packages that this package needs.

- The lines with `sdist` and `wheels` give the address of each file
  to download, and a `hash`. A **hash** is a long code made from the
  contents of a file. `uv` makes the code again from each file that
  it downloads, and compares it. If one character of the file is
  different, the code is different, and `uv` refuses the file.

Scroll through the file, and find the group whose `source` is
`{ virtual = "." }`.

```{quiz}
:id: lock-own-project
:type: text
:case: false
question: "What is the `name` in the group whose `source` is `{ virtual = \".\" }`? Type the name."
answer: "spending"
wrong:
  - { text: "rich", explanation: "The group of `rich` has another `source`, the address of PyPI. Look for the group whose `source` is a dot in quotes." }
  - { pattern: "\\.|virtual", explanation: "That is the `source`. Look at the line `name` in the same group, two lines above it." }
otherwise: "Find the line `source = { virtual = \".\" }` in the file. The line `name` is two lines above it, in the same group."
explanation: "The group is your own project. `.` means the directory that holds `uv.lock`, which is your work directory, and `spending` is the name that you gave the project in `pyproject.toml`. Its `dependencies` name `rich`. So the file records your project too, and what it needs."
```

## One exact version

```{quiz}
:id: lock-exact
:title: The file with the exact version
question: "Your project uses the package `rich`. Which file says exactly which version of `rich` it uses?"
options:
  - { text: "`pyproject.toml`", explanation: "This file says `rich>=` and a version. That means that version or any newer one, which is a range and not one exact version." }
  - { text: "`requirements.txt`", explanation: "This file holds only the name `rich`, with no version. And `uv add` did not change it." }
  - { text: "`uv.lock`", correct: true }
explanation: "The group `[[package]]` of `rich` in `uv.lock` has a line `version`, with one exact version. `pyproject.toml` says which versions the project can use. `uv.lock` says which versions it does use."
```

```{quiz}
:id: lock-later
:title: Predict: a year later
question: "A year from now, a newer version of `rich` is on PyPI. Another person gets your project, with the file `uv.lock`, and makes the environment with `uv`. Which version of `rich` does that person get?"
options:
  - { text: "The newest version of `rich` on PyPI", explanation: "That would happen if `uv` read only `pyproject.toml`. With a lock file, `uv` installs the version that the lock file names, even when newer versions exist." }
  - { text: "The version of `rich` that `uv.lock` names", correct: true }
  - { text: "No version, because the lock file stops all installs", explanation: "The word \"lock\" does not mean that nothing can be installed. It means that the versions are fixed." }
explanation: "The lock file fixes the versions. So that person gets the same `rich` as you, and the same dependencies of `rich`. The program behaves the same on both computers. You see this at work on the last page of this workshop."
```

## The lock file and pip

pip has no lock file of its own. In the workshop **Installing
packages**, the command `python -m pip freeze` showed every package of
the environment with `==` and its exact version. A file with that
output is the nearest thing to a lock file that pip gives you. But
you must remember to make that file again after every change.

| What the step does | With pip | With `uv` |
|--------------------|----------|-----------|
| records what the project needs | you write the name in `requirements.txt` | `uv add` writes it in `pyproject.toml` |
| records the exact versions | `python -m pip freeze`, and you save its output in a file | `uv add` writes `uv.lock` |

Two rules for the file `uv.lock`:

- Do not change it by hand. `uv` writes it every time that the
  dependencies change.

- Keep it with your project. When you give your project to another
  person, give them `pyproject.toml` and `uv.lock` with your code.

You can close the tab of `uv.lock` in the editor now.
