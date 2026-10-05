---
title: The environment again
requires: [verify:env-deleted, quiz:predict-new-env, verify:env-restored]
---

# The environment again

You have a record of what the project needs. On this page you test
the record in the strongest way: you delete the environment, and you
get it back from the file `requirements.txt`.

## An environment is not something that you keep

An environment holds nothing that you wrote. It holds a `python`,
and packages that pip copied from PyPI. All of that can be made
again in a few seconds, as long as you know which packages to ask
for. The requirements file is that knowledge.

So programmers treat an environment as a thing to throw away. When
an environment is broken, or holds packages that nobody remembers
installing, they delete it and make it again.

## Step 1: leave the environment

The command `deactivate` ends what `source .venv/bin/activate`
started. The terminal stops using the environment, and `(.venv)`
goes away from the prompt.

Type this command in the terminal, and press `Enter`:

```
deactivate
```

````{hint}
:title: Run the command for me
The action below types the command in the terminal and runs it.

```{execute}
:id: leave-env
:title: Leave the environment
:wait: prompt
deactivate
```
````

## Step 2: delete the environment

The command `rm` removes files. With `-r`, it removes a directory
and everything inside it. This command removes the directory `.venv`:

```
rm -r .venv
```

Be very careful with `rm`. It does not ask you first, and what it
removes does not come back. So you do not type this command
yourself. The action below types it in the terminal for you, and it
does not press `Enter`.

```{attempt}
:id: env-still-there
:check: env-deleted
:expect: The directory .venv still exists
```

```{terminal-type}
:id: type-rm
:title: Type the command in the terminal
rm -r .venv
```

Read the command in the terminal. It must be exactly `rm -r .venv`.
Then click one time inside the terminal, and press `Enter`. The
command shows nothing when it works. Then click `Check` below.

````{hint}
:title: Press Enter for me
:unlock: "env-deleted" in failed_checks or "env-deleted" in passed_checks
:locked: Click Check below first

```{send-key}
:id: enter-rm
:keys: enter
```
````

```{verify}
:id: env-deleted
:label: The environment .venv is deleted
:trigger: after:enter-rm; interval 3s
from pathlib import Path

assert not Path(".venv").exists(), "The directory .venv still exists. Click the action above, which types the command rm -r .venv in the terminal. Then click one time inside the terminal and press Enter."
print("The directory .venv is deleted. Your code, your data and the file requirements.txt are still there.")
```

The environment is gone, with `rich` and every other package in it.
Your code, your data and the file `requirements.txt` are not inside
`.venv`, so they are all still there.

## Step 3: make the environment again

```{quiz}
:id: predict-new-env
:title: A new environment
question: "You make the environment again with `python -m venv .venv`, and you activate it. Which packages does `python -m pip list` show then?"
options:
  - { text: "Only `pip`", correct: true }
  - { text: "`pip`, `rich` and the dependencies of `rich`, as before", explanation: "The packages were inside the directory that you deleted. The command `python -m venv` makes an empty environment. It does not know what the old one held." }
  - { text: "`pip` and `rich`, because the file `requirements.txt` names `rich`", explanation: "The command `python -m venv` does not read the file `requirements.txt`. A package arrives only when you ask pip to install it." }
explanation: "A new environment is empty: it holds only pip. Nothing reads the file `requirements.txt` until you give it to pip. That is the last step."
```

Now do the work. Type these three commands in the terminal, one
after another, and press `Enter` after each one.

The first two commands are the commands of the earlier page. They
make the environment and activate it:

```
python -m venv .venv
```

```
source .venv/bin/activate
```

Look at the prompt. It must begin with `(.venv)` again.

The third command is the command that installs, with `-r` and the
name of the file in place of the name of a package. The letter is
short for "requirement". With `-r`, pip reads the file and installs
every package that the file names:

```
python -m pip install -r requirements.txt
```

Read the command again before you press `Enter`. pip installs what
you type.

```{hint}
:title: Hint: pip says that it could not find an activated virtualenv
The message `ERROR: Could not find an activated virtualenv (required).`
means that the environment is not active, so pip installed nothing.
Type `source .venv/bin/activate` in the terminal and press `Enter`.
Then type the third command again.
```

```{hint}
:title: Hint: pip says that it could not open the requirements file
The message holds the words `Could not open requirements file`. pip
did not find a file with the name that you typed. Check the spelling
of `requirements.txt` in the command. Then type `ls` to see whether
the file is in your work directory. If it is not there, go back one
page and write it.
```

If the hints were not enough, the box below holds the commands. It
opens after you have clicked `Check`.

```{attempt}
:id: restore-not-started
:check: env-restored
:expect: There is no environment in your work directory now
```

````{attempt}
:id: restore-empty-env
:check: env-restored
:expect: The new environment does not hold the package rich yet

```{execute}
:wait: prompt
:timeout: 120s
python -m venv .venv
```
````

````{hint}
:title: Show me the commands
:unlock: "env-restored" in failed_checks or "env-restored" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The three actions below run the three commands, one after another.
Click them in this order.

```{execute}
:id: make-env-again
:title: Make the environment again
:wait: prompt
:timeout: 120s
python -m venv .venv
```

```{execute}
:id: activate-env-again
:title: Activate the environment
:wait: prompt
source .venv/bin/activate
```

```{execute}
:id: install-requirements
:title: Install what the file requirements.txt names
:wait: prompt
:timeout: 300s
python -m pip install -r requirements.txt
```
````

```{verify}
:id: env-restored
:label: The new environment holds the package rich
:trigger: terminal-output "Successfully installed"; after:install-requirements
import os, subprocess
from pathlib import Path

assert Path(".venv/bin/python").exists(), "There is no environment in your work directory now. Type this command in the terminal and press Enter: python -m venv .venv"
assert Path("requirements.txt").exists(), "There is no file requirements.txt in your work directory. Go back one page and write it. Then type the command python -m pip install -r requirements.txt again."
run = subprocess.run(
    [".venv/bin/python", "-c", "import rich"],
    capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
    env={**os.environ, "PYTHON_COLORS": "0"},
)
assert run.returncode == 0, "The new environment does not hold the package rich yet. Look at the prompt. If it does not begin with (.venv), type source .venv/bin/activate and press Enter. Then type this command and press Enter: python -m pip install -r requirements.txt"
print("The new environment holds the package rich. You got it back from the file requirements.txt.")
```

## What happened

pip showed the same kind of lines as before, and the line that
begins with `Successfully installed` names `rich` and its
dependencies again.

You made the same environment two times, and the second time you
needed only one small file. Another person with your project can do
the same on their computer, with the same three commands.
