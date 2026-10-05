---
title: An environment for the project
requires: [verify:env-made, quiz:which-python]
---

# An environment for the project

The tool that runs tests is a package, and a package needs a place to
go. On this page you make that place: an environment that belongs to
the spending tracker.

## Why an environment

A **virtual environment** is a directory that holds its own `python`
and its own `site-packages`, for one project. `site-packages` is the
directory in which installed packages are kept. These workshops call
a virtual environment an **environment**.

A computer has a Python that many programs share. On this computer,
JupyterLab itself runs on that Python. A package that you install
into the environment of a project is there for that project, and it
cannot break another project or JupyterLab. So the rule is: first the
environment, then the packages.

## Your task: make the environment and activate it

The workshop **An environment of your own** taught these commands.
Here they are again.

The first command makes the environment, in a directory with the name
`.venv` in your work directory. The name begins with a dot. The
command takes one or two seconds, and it shows nothing when it works.

```
python -m venv .venv
```

The second command activates the environment. To **activate** an
environment means to make the terminal use it. The command puts the
directory `.venv/bin` first on `PATH`, the list of directories in
which the shell looks for a program. It shows nothing, but the
**prompt**, the short text that shows the shell is ready for a
command, now begins with `(.venv)`.

```
source .venv/bin/activate
```

The third command asks the shell which program the word `python`
starts now.

```
which python
```

Click in the terminal. Type the three commands, one after another,
and press `Enter` after each one. Then answer the question at the end
of this page.

```{hint}
:title: "Hint: I see a message after the second command"
A message that holds the words `no such file or directory` means that
the shell did not find the file `.venv/bin/activate`. Check the
spelling. If the spelling is right, the first command did not work,
so type the first command again.
```

```{attempt}
:id: env-not-made
:check: env-made
:expect: There is no environment in your work directory yet
```

````{attempt}
:id: env-other-name
:check: env-made
:expect: You made an environment with the name venv

```{directory-create}
:path: venv
```

```{file-write}
:path: venv/pyvenv.cfg
include-system-site-packages = false
```
````

````{attempt}
:id: env-other-name-removed
:check: env-made
:expect: There is no environment in your work directory yet

```{file-delete}
:path: venv
:recursive: true
```
````

````{hint}
:title: Show me the commands
:unlock: "env-made" in failed_checks or "env-made" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The three actions below run the three commands, one after another.
Click them in this order.

```{execute}
:id: make-env
:title: Make the environment
:wait: prompt
:timeout: 120s
python -m venv .venv
```

```{execute}
:id: activate-env
:title: Activate the environment
:wait: prompt
source .venv/bin/activate
```

```{execute}
:id: show-which
:title: Show which python the terminal uses
:wait: prompt
which python
```
````

```{verify}
:id: env-made
:label: Your work directory holds the environment .venv
:trigger: terminal-output ".venv/bin/python"; after:show-which
from pathlib import Path

if not Path(".venv/pyvenv.cfg").exists():
    others = sorted(path.parent.name for path in Path(".").glob("*/pyvenv.cfg"))
    if others:
        raise AssertionError(f"You made an environment with the name {others[0]}. This workshop needs an environment with the name .venv, which begins with a dot. Type this command in the terminal and press Enter: python -m venv .venv")
    raise AssertionError("There is no environment in your work directory yet. Click in the terminal, type this command and press Enter: python -m venv .venv")
assert Path(".venv/bin/python").exists(), "The directory .venv exists, but it holds no python. The command did not finish. Type this command in the terminal again and press Enter: python -m venv .venv"
print("Your work directory holds the environment .venv, with a python of its own.")
```

The check above can see that the environment exists. It cannot see
whether your terminal uses it. The answer to this question shows
that.

```{quiz}
:id: which-python
:title: The python that the terminal uses
:type: text
question: "Look at the line that `which python` shows. It ends with `/bin/python`. Which name is directly before `/bin/python`?"
answer:
  - { pattern: "/?\\.venv/?", example: ".venv" }
wrong:
  - { pattern: "/?venv/?", explanation: "Look at the name again. It begins with a dot." }
  - { pattern: "/?work/?", explanation: "The name `work` is in the path, but one more name comes after it and before `/bin/python`." }
  - { pattern: ".*/bin/python", explanation: "That is the whole path, or a large part of it. Type only the one name that is directly before `/bin/python`." }
otherwise: "If the line does not hold the name `.venv`, the environment is not active. Type `source .venv/bin/activate` in the terminal and press `Enter`. Then type `which python` again, and read the end of the line."
explanation: "The line ends with `work/.venv/bin/python`. The first part of the path is different on every computer. The end shows that the word `python` now starts the `python` of your environment. Keep this terminal open: the next pages use the environment in it."
```

If you close the terminal, or the prompt does not begin with
`(.venv)` on a later page, type `source .venv/bin/activate` again and
press `Enter`.
