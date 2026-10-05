---
title: An environment with uv
requires: [verify:env-made, quiz:inside-bin, quiz:which-python]
---

# An environment with `uv`

On this page you make a virtual environment with `uv`, you look
inside it, and you activate it.

## The command `uv venv`

A **virtual environment** is a directory that holds its own `python`
and its own `site-packages`, for one project. From here, these pages
say "environment" for short.

You know the command that makes one:

```
python -m venv .venv
```

The command of `uv` for the same step is shorter:

```
uv venv
```

You do not write the name `.venv`. `uv` uses that name when you give
no other name. The directory is made in the directory that the
terminal is in, which is your work directory.

## Your task: make the environment

Type the command `uv venv` in the terminal, and press `Enter`.

`uv` shows a few lines. One line says which Python it uses. One line
says `Creating virtual environment at: .venv`. The last line reminds
you of the command that activates the environment.

```{attempt}
:id: env-not-made
:check: env-made
:expect: There is no environment in your work directory yet
```

````{hint}
:title: Run the command for me
:unlock: "env-made" in failed_checks or "env-made" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below runs the command in the terminal.

```{execute}
:id: uv-venv-solution
:title: Make the environment
:wait: prompt
:timeout: 120s
uv venv
```
````

```{verify}
:id: env-made
:label: The environment .venv exists
:trigger: terminal-output "Creating virtual environment"; after:uv-venv-solution
from pathlib import Path

assert Path(".venv/bin/python").exists(), "There is no environment in your work directory yet. Click in the terminal, type uv venv and press Enter. Then click Check again."
print("The directory .venv exists, and it holds its own python.")
```

## Look inside

The name `.venv` begins with a dot, so `ls` does not show it, and the
file browser does not show it. You can still look inside it when you
write its name. Type this command, and press `Enter`:

```
ls .venv/bin
```

The directory `bin` holds the programs of the environment. Read the
list of names in the terminal, and then answer the question.

```{quiz}
:id: inside-bin
:title: The programs of the environment
question: "Which of these names is in the list?"
options:
  - { text: "`pip`", explanation: "Look at the list again. No name in it begins with `pip`. An environment that `python -m venv` makes has a `pip` inside it. An environment that `uv` makes has none." }
  - { text: "`python`", correct: true }
  - { text: "`uv`", explanation: "The program `uv` is not inside the environment. It is installed one time on the computer, outside every environment, and it works on each environment from outside." }
explanation: "The list has `python`, and several files whose names begin with `activate`. It has no `pip`. This is the one difference that you can see between the two kinds of environment. `python -m venv` puts a copy of pip into every environment, and that takes time. `uv` needs no pip inside the environment, because `uv` itself does the installing. So `uv venv` is ready almost at once."
```

## Activate the environment

To **activate** an environment means to make the terminal use it.
The command is the command that you know. Type it, and press `Enter`:

```
source .venv/bin/activate
```

The command shows nothing. But the prompt has changed: it now begins
with a name in parentheses. With `python -m venv .venv`, that name
was `(.venv)`. `uv` uses the name of the directory that holds the
environment, so here the name is `(work)`. The name in parentheses
tells you that an environment is active.

````{hint}
:title: Activate the environment for me
The action below runs the command in the terminal.

```{execute}
:id: activate-solution
:title: Activate the environment
:wait: prompt
source .venv/bin/activate
```
````

Now ask the shell which program the word `python` means. The
**shell** is the program inside the terminal that reads each command
and runs it. Type this command, and press `Enter`:

```
which python
```

The terminal shows one path. A **path** is the text that says where a
file is. The start of this path is different on every computer. Look
at the end of it.

```{quiz}
:id: which-python
:type: text
question: "Which four names are at the end of the path, with a `/` between them? Type them in the form `a/b/c/d`."
answer:
  - { pattern: "(.*/)?work/\\.venv/bin/python", example: "work/.venv/bin/python" }
wrong:
  - { pattern: "/?work/venv/bin/python", explanation: "Almost. The name of the directory after `work` begins with a dot: `.venv`." }
  - { pattern: "/?\\.venv/bin/python", explanation: "These are the last three names. Type one more name, the name of the directory before `.venv`." }
  - { pattern: ".*bin/python3?", explanation: "The path ends with `bin/python`, but the names before `bin` are not `work/.venv`. So this is another Python, and your environment is not active in this terminal. Type `source .venv/bin/activate`, press `Enter`, and then type `which python` again." }
otherwise: "Look at the line under the command `which python`. Type the last four names of the path, with a `/` between them."
explanation: "The path ends with `work/.venv/bin/python`. Your work directory has the name `work`, and the environment is the directory `.venv` inside it. So the word `python` now means the `python` inside your environment. Activating put the directory `.venv/bin` first in `PATH`, the list of directories in which the shell looks for a program. An environment that `uv` made behaves here exactly like an environment that `python -m venv` made."
```

Do not close the terminal. The next page installs a package, and the
environment must be active when you do that.
