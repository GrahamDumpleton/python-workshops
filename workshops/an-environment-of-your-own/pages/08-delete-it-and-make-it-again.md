---
title: Delete it and make it again
requires: [quiz:what-stays, verify:env-deleted, verify:env-made-again, verify:tabulate-again]
---

# Delete it and make it again

An environment is a thing that you can delete and make again at any
time. On this page you do that, so that you see that nothing is lost.

## Why you can delete it

Think about what the directory `.venv` holds:

- an interpreter, which is a small file that leads to the Python of
  the computer

- `pip`, which the command `python -m venv .venv` put there

- the package `tabulate`, which `pip` got from the internet

You did not write any of these. Each of them can be made again in a
few seconds, with the commands that you already know.

The program `prices.py` is the work of the project. It is in your work
directory, beside `.venv`, and not inside it. So when you delete
`.venv`, the program stays.

## Why you sometimes must delete it

On the page **A look inside**, you saw that the file `pyvenv.cfg`
holds full paths. Other files of the environment hold full paths also,
such as the file `activate` and the file `pip` in `.venv/bin`. So an
environment works only in the place where it was made.

If you move the project to another directory, or give its directory
another name, the paths in the environment are wrong. You do not
repair them. You delete the environment and make a new one. You do
the same when an environment holds packages that nobody remembers
installing, or when something in it is broken.

```{quiz}
:id: what-stays
:title: What stays after you delete .venv
question: "You delete the directory `.venv`. Which of these is still in your work directory after that?"
options:
  - { text: "The package `tabulate`", explanation: "The package was installed into `.venv/lib/python3.14/site-packages`, which is inside `.venv`. It goes with the directory. You install it again later on this page." }
  - { text: "The file `pyvenv.cfg`", explanation: "The file `pyvenv.cfg` is inside `.venv`, so it goes with the directory. The command `python -m venv .venv` makes it again." }
  - { text: "The program `prices.py`", correct: true }
explanation: "The program `prices.py` is beside `.venv`, not inside it. Everything inside `.venv` was made by commands, and the same commands make it again. Keep the work that you wrote outside the environment, and the environment is safe to delete."
```

## Step 1: the environment must not be active

Look at the prompt in the terminal. On the page before this one, you
ran `deactivate`, so the prompt does not begin with `(.venv)`.

If the prompt begins with `(.venv)`, type `deactivate` and press
`Enter` before you continue. Do not delete an environment that is
active in the terminal.

## Step 2: delete the environment

The command `rm` removes files. Its name is short for "remove".
With `-r`, it removes a directory and everything inside it. This
command removes the directory `.venv`:

```
rm -r .venv
```

Be very careful with `rm`. It does not ask you first, and what it
removes cannot be restored. So you do not type this command
yourself. The action below types it in the terminal for you, and it
does not press `Enter`.

```{attempt}
:id: env-still-there
:check: env-deleted
:expect: The directory .venv is still in your work directory
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
:unlock: "env-deleted" in failed_checks
:locked: Click Check below first

```{send-key}
:id: enter-rm
:keys: enter
```
````

```{verify}
:id: env-deleted
:label: The directory .venv is deleted
:trigger: after:enter-rm
from pathlib import Path

assert not Path(".venv").exists(), "The directory .venv is still in your work directory. Click the action above, which types the command rm -r .venv in the terminal. Then click one time inside the terminal, press Enter, and click Check again."
print("Correct. The directory .venv is deleted, and the program prices.py is still in your work directory.")
```

The environment is gone, with `pip` and `tabulate` inside it. The
Python of the computer did not change, and `prices.py` did not
change.

## Step 3: make the environment again

The command that makes an environment is the command of the page
**Make an environment**. Type it in the terminal, and press `Enter`.
Wait until the prompt shows again.

```
python -m venv .venv
```

```{attempt}
:id: env-not-made-again
:check: env-made-again
:expect: There is no virtual environment in your work directory
```

````{hint}
:title: Show me the command
:unlock: "env-made-again" in failed_checks
:locked: Click Check below first

The action below types the command in the terminal and runs it.

```{execute}
:id: remake-venv
:title: Make the environment again
:wait: prompt
:timeout: 120s
python -m venv .venv
```
````

```{verify}
:id: env-made-again
:label: Your work directory holds a virtual environment again
:trigger: after:remake-venv
from pathlib import Path

assert Path(".venv/pyvenv.cfg").exists() and Path(".venv/bin/python").exists(), "There is no virtual environment in your work directory. Type python -m venv .venv in the terminal, and press Enter. Wait until the prompt shows again, and then click Check."
print("Correct. The directory .venv is a virtual environment again.")
```

The new environment is like the first one when it was new. Its
`site-packages` holds only `pip`. The package `tabulate` is not there
yet.

## Step 4: install the package again

On the page before this one, you ran a program with the interpreter
of the environment, by its path, with no activation. You can run
`pip` in the same way. This command installs `tabulate` into the
environment, and the environment does not need to be active:

```
.venv/bin/python -m pip install tabulate
```

The first word is the path of the interpreter of your environment. So
the package goes to the `site-packages` of that environment, and to no
other place.

An install takes some seconds, and a mistake in the command can put a
package in the wrong place. So the action below types the command for
you, and it does not press `Enter`.

```{attempt}
:id: tabulate-not-again
:check: tabulate-again
:expect: The package tabulate is not in your environment
```

```{terminal-type}
:id: type-install
:title: Type the command in the terminal
.venv/bin/python -m pip install tabulate
```

Read the command in the terminal. It must begin with `.venv/bin/python`.
Then click one time inside the terminal, and press `Enter`. Wait for
the line that begins with `Successfully installed`, and for the
prompt.

````{hint}
:title: Press Enter for me
:unlock: "tabulate-again" in failed_checks
:locked: Click Check below first

```{send-key}
:id: enter-install
:keys: enter
```
````

```{verify}
:id: tabulate-again
:label: The package tabulate is in your new environment
:trigger: terminal-output "Successfully installed"; after:enter-install
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
assert found, "The package tabulate is not in your environment. If there is no directory .venv, go back to step 3 and make it again. Then click the action above that types .venv/bin/python -m pip install tabulate, click in the terminal and press Enter. Wait for the line Successfully installed, and then click Check."
print("Correct. The package tabulate is in the site-packages of your new environment.")
```

## Step 5: run the program

Run the program with the interpreter of the environment, by its path.
Type this command, and press `Enter`:

```
.venv/bin/python prices.py
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-prices-again
:wait: prompt
.venv/bin/python prices.py
```
````

The terminal shows the same table as before. The project works again,
with a new environment.

## What happened

- `rm -r .venv` deleted the environment and everything inside it.

- `python -m venv .venv` made a new, empty environment in the same
  place.

- `.venv/bin/python -m pip install tabulate` put the package into the
  new environment, with no activation.

The program `prices.py` did not change at any time. In the next
workshop you learn how a project keeps a list of the packages that it
needs, so that one command can install all of them into a new
environment.
