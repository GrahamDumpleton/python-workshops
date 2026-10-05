---
title: Make an environment
requires: [verify:env-made, quiz:hidden-name]
---

# Make an environment

A **virtual environment** is a directory that holds its own `python`
and its own `site-packages`, for one project. After this first use,
these pages say "environment" for short.

`site-packages` is the directory in which installed packages are
kept. A **package** is a directory that holds modules, and a
**module** is a file of Python code. People publish packages, so that
other people can install them and use them.

## Why a project needs one

One Python has one `site-packages`. When every project uses the same
Python, every project uses the same installed packages. A package
that you install or replace for one project is changed for all of
them.

An environment gives one project a `site-packages` of its own. A
package that you install there is seen by that project and by no
other project. The Python of the computer stays as it was.

Think of a place where several people repair things, with one shared
box of tools. One person needs a newer saw and puts it in the box in
place of the old saw. The next day, another person finds that the old
saw is gone, and cannot finish a job. The solution is a box of tools
for each job. A virtual environment is such a box, for one project.

## The project

Your work directory holds one small program, `prices.py`. Click the
action below to open it in the editor.

```{file-open}
:id: open-prices
:title: Open the program prices.py
:path: prices.py
```

```python
from tabulate import tabulate

prices = [["tea", 3], ["soup", 4], ["bread", 2]]
print(tabulate(prices, headers=["item", "price"]))
```

The program imports a function from a module with the name
`tabulate`. This module does not come with Python. It is part of a package, also with the name
`tabulate`, which someone published. The function makes a table of
text from a list of rows.

So this project needs one package. You do not install it into the
Python of the computer. You make an environment for the project
first, and on a later page you install the package there.

## The command

This command makes an environment:

```
python -m venv .venv
```

It has three parts:

- `python` is the **interpreter**, the program that runs Python
  code.

- `-m venv` tells the interpreter to find the module with the name
  `venv` and to run it as a program. The module `venv` comes with
  Python. Its work is to make a virtual environment.

- `.venv` is the name of the directory to make. You can choose
  another name, but most Python programmers use `.venv`, and many
  tools look for that name.

The command is new, so this time a click runs it. Click the action
below, and wait until the terminal shows the prompt again. The
command needs a few seconds, and it shows nothing when it works.

```{attempt}
:id: env-not-made
:check: env-made
:expect: There is no virtual environment in your work directory yet
```

```{execute}
:id: make-venv
:title: Run the command in the terminal
:wait: prompt
:timeout: 120s
python -m venv .venv
```

```{verify}
:id: env-made
:label: Your work directory holds a virtual environment
:trigger: after:make-venv
from pathlib import Path

assert Path(".venv/pyvenv.cfg").exists() and Path(".venv/bin/python").exists(), "There is no virtual environment in your work directory yet. Click the action above that runs python -m venv .venv. Wait until the terminal shows the prompt again, and then click Check."
print("Correct. Your work directory holds the directory .venv, and it is a virtual environment.")
```

## Where is it?

The command made a directory. Look for it. Click one time inside the
terminal, type this command, and press `Enter`:

```
ls
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-ls
:wait: prompt
ls
```
````

The terminal shows one name, `prices.py`. The new directory is not in
the list.

The reason is the dot. The command `ls` does not show a name that
begins with a dot. Such names are for things that you seldom need to
see. To see every name, add `-a` to the command. The letter `a` is
short for "all". Type this command, and press `Enter`:

```
ls -a
```

````{hint}
:title: Type the command for me
:unlock: "hidden-name" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-ls-a
:wait: prompt
ls -a
```
````

```{quiz}
:id: hidden-name
:title: The name that ls did not show
:type: text
:case: false
question: "The command `ls -a` shows more names than `ls`. One of the new names begins with a dot and has four letters after the dot. Type that name, with the dot."
answer: ".venv"
wrong:
  - { text: "venv", explanation: "Type the name with the dot before it. The dot is a part of the name." }
  - { text: ".", explanation: "One dot alone is a special name. It means the current directory itself. Look for the name that has four letters after the dot." }
  - { text: "..", explanation: "Two dots are a special name. They mean the directory that holds the current directory. Look for the name that has four letters after one dot." }
  - { text: "prices.py", explanation: "The command `ls` showed that name also. Look for a name that only `ls -a` shows." }
otherwise: "Look at the names under the command `ls -a`. Type the name that begins with a dot and has four letters after the dot."
explanation: "The directory `.venv` is in your work directory, beside `prices.py`. The names `.` and `..` are in every directory: one dot means the directory itself, and two dots mean the directory that holds it. If the list shows other names that begin with a dot, you can ignore them."
```

## What happened

The interpreter ran the module `venv`. The module made the directory
`.venv` in the current directory, and filled it with the files of an
environment. Nothing else on the computer changed.

An environment is a directory, and nothing more. On the next page you
look inside it.
