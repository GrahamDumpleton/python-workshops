---
title: Delete it and get it back
requires: [verify:env-deleted, quiz:predict-sync, verify:env-synced]
---

# Delete it and get it back

An environment holds nothing that you wrote. It holds a `python`,
and packages that came from PyPI. So you can delete it, and make it
again whenever you need to. On this page you delete the environment
`.venv`, and you get it back with one command of `uv`.

## One command for three

With pip, three commands made the environment again from a record:

```
python -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

With `uv`, one command does that work:

```
uv sync
```

The word "sync" is short for "synchronise", which means "make two
things the same". `uv sync` makes the environment `.venv` the same as
the file `uv.lock`:

1. If there is no environment `.venv`, it makes one.

2. It installs every package that `uv.lock` names, with the exact
   version that `uv.lock` names.

3. It removes any package of the environment that `uv.lock` does not
   name.

| What the step does | With pip | With `uv` |
|--------------------|----------|-----------|
| makes the environment again from the record | `python -m venv .venv`, `source .venv/bin/activate`, `python -m pip install -r requirements.txt` | `uv sync` |

## Step 1: delete the environment

The environment must not be active when you delete it. Look at the
prompt. If it begins with a name in parentheses, type `deactivate`
and press `Enter`.

The command `rm` removes files. With `-r`, it removes a directory and
everything inside it. This command removes the directory `.venv`:

```
rm -r .venv
```

Be very careful with `rm`. It does not ask you first, and what it
removes does not come back. So you do not type this command yourself.
The action below types it in the terminal for you, and it does not
press `Enter`.

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
:unlock: "env-deleted" in failed_checks
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
assert Path("uv.lock").exists() and Path("pyproject.toml").exists(), "The directory .venv is deleted, but the file uv.lock or the file pyproject.toml is missing too. Go back to the page A file that describes the project, and do the steps from there again."
print("The directory .venv is deleted. Your code, your data, pyproject.toml and uv.lock are still there.")
```

The environment is gone, with `rich` and every other package in it.
Your code, your data and the files `pyproject.toml` and `uv.lock` are
not inside `.venv`, so they are all still there.

## Step 2: get it back

```{quiz}
:id: predict-sync
:title: Predict: where uv finds the list
question: "You type `uv sync`. From which file does `uv` take the packages and their versions?"
options:
  - { text: "From `requirements.txt`", explanation: "`uv sync` does not read `requirements.txt`. That file is for `python -m pip install -r` and `uv pip install -r`." }
  - { text: "From `uv.lock`", correct: true }
  - { text: "From the old environment `.venv`", explanation: "The old environment is deleted. Nothing is left of it." }
explanation: "`uv sync` makes the environment the same as `uv.lock`. So the new environment gets exactly the versions that the lock file names, the same versions as before."
```

`uv sync` is a command for a project, as `uv add` and `uv run` are.
Type this command in the terminal, and press `Enter`:

```
uv sync
```

`uv` shows that it made the environment, and then a line for each
package that it installed, with `+` in front of it. The numbers are
different on each computer, so this page does not show them.

```{attempt}
:id: sync-not-started
:check: env-synced
:expect: There is no environment in your work directory now
```

````{attempt}
:id: sync-empty-env
:check: env-synced
:expect: The environment .venv exists, but it does not hold the package rich

```{execute}
:wait: prompt
:timeout: 120s
uv venv
```
````

````{attempt}
:id: sync-other-version
:check: env-synced
:expect: and uv.lock names rich

```{execute}
:wait: prompt
:timeout: 300s
uv pip install --python .venv/bin/python rich==14.0.0
```
````

````{hint}
:title: Run the command for me
:unlock: "env-synced" in failed_checks or "env-synced" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below runs the command in the terminal.

```{execute}
:id: sync-solution
:title: Make the environment the same as uv.lock
:wait: prompt
:timeout: 300s
uv sync
```
````

```{verify}
:id: env-synced
:label: The new environment holds the version of rich that uv.lock names
:trigger: terminal-output /Installed \d+ packages? in/; after:sync-solution
import os, subprocess, tomllib
from pathlib import Path

assert Path(".venv/bin/python").exists(), "There is no environment in your work directory now. Type uv sync in the terminal, and press Enter."
locked = ""
try:
    for package in tomllib.loads(Path("uv.lock").read_text()).get("package", []):
        if package.get("name") == "rich":
            locked = package.get("version", "")
except (OSError, tomllib.TOMLDecodeError):
    locked = ""
assert locked, "The file uv.lock does not name the package rich. Go back to the page Add a dependency, and type uv add rich there."
try:
    run = subprocess.run(
        [".venv/bin/python", "-c", "import importlib.metadata; print(importlib.metadata.version('rich'))"],
        capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
        env={**os.environ, "PYTHON_COLORS": "0"},
    )
except subprocess.TimeoutExpired:
    raise AssertionError("The python of the environment did not answer after 30 seconds. Type uv sync in the terminal again.") from None
installed = run.stdout.strip() if run.returncode == 0 else ""
assert installed, "The environment .venv exists, but it does not hold the package rich. Type uv sync in the terminal, and press Enter. It installs what uv.lock names."
assert installed == locked, f"The environment holds rich {installed}, and uv.lock names rich {locked}. Type uv sync in the terminal, and press Enter. It installs the version that uv.lock names."
print(f"The new environment holds rich {installed}, the version that uv.lock names.")
```

## What happened

One command made the environment again, from the lock file. It is
the same environment as before, with the same versions. Another
person who has your project can do the same on their computer, and
get the same versions too.

You did not activate the environment, and you do not need to. Run
the program again with `uv run`, and see that it works:

```
uv run python -m spending spending.csv --table
```

`uv run` also makes the environment the same as `uv.lock` before it
runs the command. So if you had typed `uv run` with no environment,
`uv` would have made it for you. `uv sync` is the command for when
you want only the environment, and no program run.
