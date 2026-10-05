---
title: Where the package went
requires: [quiz:code-directory, quiz:why-more]
---

# Where the package went

pip said that it installed the package. On this page you look at
what changed on the disk, so that installing is not a mystery.

## Look inside `site-packages`

The environment keeps installed packages in this directory:

```
.venv/lib/python3.14/site-packages
```

The path has four parts. `.venv` is your environment. `lib` is short
for "library". `python3.14` names the version of Python. The last
part, `site-packages`, is the directory in which installed packages
are kept.

The command `ls` shows what a directory holds when you write the path
of the directory after it. Type this command in the terminal, and
press `Enter`:

```
ls .venv/lib/python3.14/site-packages
```

````{hint}
:title: Run the command for me
:unlock: "code-directory" in failed_checks
:locked: Answer the question below first
The action below types the command in the terminal and runs it.

```{execute}
:id: list-site-packages
:title: Show what site-packages holds
:wait: prompt
ls .venv/lib/python3.14/site-packages
```
````

The terminal shows about ten names, in columns. These are the names,
one on each line here. In place of each `...` you see the number of a
version. The numbers change when new versions are published, so this
page does not show them.

```
markdown_it
markdown_it_py-....dist-info
mdurl
mdurl-....dist-info
pip
pip-....dist-info
pygments
pygments-....dist-info
rich
rich-....dist-info
```

Your list can hold other names too, if the newest `rich` needs other
packages than it needed when this page was written.

```{quiz}
:id: code-directory
:title: The directory of the package
:type: text
question: "Two names in your list begin with `rich`. One of them is the directory that holds the modules of the package. Type that name."
answer: "rich"
wrong:
  - { pattern: "rich-.*dist-info/?", explanation: "That directory holds notes about the package: its name, its version, and a list of its files. pip reads those notes. The modules are in the other directory, whose name is one word." }
  - { pattern: "rich/", explanation: "That is the right directory. Type the name with no `/` after it." }
otherwise: "Look for the names that begin with the letters `rich`. One name is the word `rich` and nothing more. The other name is longer and ends with `.dist-info`."
explanation: "The directory `rich` holds the modules of the package. It is a package in the first meaning of the word: a directory that holds modules, like your directory `spending`. So the line `import rich` works for the same reason that `import spending` works: Python finds a directory with that name in a directory of `sys.path`."
```

For each package, the list holds two names. The directory with the
plain name holds the code. The directory whose name ends with
`.dist-info` holds notes about the package, such as its version.

To install a package is to copy files into this directory. Nothing
else on the computer changed.

## You asked for one package, and more arrived

The list holds `rich`. It holds `pip`, which was there before. It
also holds names that you did not ask for.

pip can show the same information as a tidy list. The command is:

```
python -m pip list
```

This command is new, so the action below runs it for you this time.

```{execute}
:id: pip-list
:title: Show the packages of the environment
:wait: prompt
python -m pip list
```

The list has two columns: the name of each package, and its version.
When this page was written, it held five packages: `markdown-it-py`,
`mdurl`, `pip`, `Pygments` and `rich`.

```{quiz}
:id: why-more
:title: Packages that you did not ask for
question: "You asked pip for one package, `rich`. Why does the environment also hold packages such as `Pygments`?"
options:
  - { text: "pip installs the most popular packages into every environment", explanation: "pip installs only what you ask for, and what those packages need. A new environment holds only pip." }
  - { text: "The package `rich` needs them, so pip installed them too", correct: true }
  - { text: "They are part of the standard library", explanation: "The standard library is not in `site-packages`, and `python -m pip list` does not show it. These packages came from PyPI." }
explanation: "A package can have dependencies of its own. Parts of the code of `rich` import the package `Pygments`, so `rich` needs it. Each package on PyPI says which packages it needs. pip reads that, and it installs those packages too, and then the packages that they need. You asked for one package, and pip did the rest of the work."
```

Remember the word from the second page: a **dependency** is a package
that your program needs. Now you see that the word works at every
level. `rich` is a dependency of your program, and `Pygments` is a
dependency of `rich`.
