---
title: Install the newer version
requires: [quiz:predict-both-versions, verify:new-installed, quiz:new-version-name, quiz:count-colours]
---

# Install the newer version

The project `labels` needs version `24.11.1` of the package
`webcolors`. On this page you install it for the shared Python, and
you see what happens to the version that was there.

## Predict

The `site-packages` of the shared Python holds version `1.13` now.
The command that installs the newer version is the same as before,
with another number:

```
shared-python/bin/python -m pip install webcolors==24.11.1
```

```{quiz}
:id: predict-both-versions
:title: Predict the result
question: "What does `site-packages` hold after this command?"
options:
  - { text: "Both versions, `1.13` and `24.11.1`, each in a directory of its own", explanation: "The package is a directory with the name `webcolors`. One directory cannot hold two directories with the same name, so `site-packages` has room for one version." }
  - { text: "Version `24.11.1` only. The tool removes version `1.13` first.", correct: true }
  - { text: "Version `1.13` only. The tool does not replace a package that is installed.", explanation: "The command asks for exactly version `24.11.1`, and `pip` does what the command asks. It replaces the version that is there." }
explanation: "A `site-packages` holds one version of each package. To install another version, `pip` first removes the files of the version that is there, and then copies the files of the new version."
```

## Install it

Click the action below. It types the command in the terminal, but it
does not press `Enter`.

```{attempt}
:id: new-still-old
:check: new-installed
:expect: The shared Python has version 1.13 of the package webcolors, and this step needs version 24.11.1
```

````{attempt}
:id: new-nothing-installed
:check: new-installed
:expect: The shared Python does not have the package webcolors

```{execute}
:wait: prompt
:timeout: 300s
shared-python/bin/python -m pip uninstall --yes webcolors
```
````

```{terminal-type}
:id: type-install-new
:title: Type the command in the terminal
shared-python/bin/python -m pip install webcolors==24.11.1
```

Read the command in the terminal. Make sure that it begins with
`shared-python/bin/python`. Then click one time inside the terminal,
and press `Enter`. The command needs a few seconds. Wait until the
terminal shows its prompt again.

````{hint}
:title: Press Enter for me
:unlock: "new-installed" in failed_checks
:locked: Click Check below first

```{send-key}
:id: enter-install-new
:keys: enter
```
````

````{attempt}
:id: new-wait-for-install
:check: new-installed
:result: pass

```{execute}
:wait: prompt
:timeout: 300s
ls shared-python/lib/python3.14/site-packages
```
````

```{verify}
:id: new-installed
:label: The shared Python has version 24.11.1 of webcolors
:trigger: terminal-output "Successfully installed webcolors-24.11.1"
import os, subprocess
from pathlib import Path

python = Path("shared-python/bin/python")
version = None
if python.exists():
    try:
        run = subprocess.run(
            [str(python), "-c", "from importlib.metadata import version; print(version('webcolors'))"],
            capture_output=True, text=True, timeout=30, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
        if run.returncode == 0:
            version = run.stdout.strip()
    except subprocess.TimeoutExpired:
        version = None
assert version is not None, "The shared Python does not have the package webcolors. Click the action above that types the command, then click in the terminal and press Enter. Wait until the terminal shows its prompt again."
assert version == "24.11.1", f"The shared Python has version {version} of the package webcolors, and this step needs version 24.11.1. If you see the command in the terminal, click in the terminal and press Enter. If you do not see it, click the action above that types the command first. Then wait until the terminal shows its prompt again."
print("Correct. The shared Python has version 24.11.1 of the package webcolors.")
```

## Read what the tool did

This time `pip` says more than before. Among its lines are these:

```
  Attempting uninstall: webcolors
    Found existing installation: webcolors 1.13
    Uninstalling webcolors-1.13:
      Successfully uninstalled webcolors-1.13
Successfully installed webcolors-24.11.1
```

To uninstall a package means to remove its files from
`site-packages`. The tool found version `1.13`, removed it, and then
installed version `24.11.1`. It did not ask you first.

## Look at what changed

Look inside `site-packages` again. Type this command, and press
`Enter`. You can also get it back with the up arrow.

```
ls shared-python/lib/python3.14/site-packages
```

````{hint}
:title: Run the command for me
:unlock: "new-version-name" in failed_checks
:locked: Answer the question below first

```{execute}
:id: list-new
:wait: prompt
ls shared-python/lib/python3.14/site-packages
```
````

```{quiz}
:id: new-version-name
:type: text
:case: false
:title: The name that changed
question: "One name begins with `webcolors-` and ends with `.dist-info`. Type that whole name as the terminal shows it now."
answer:
  - "webcolors-24.11.1.dist-info"
wrong:
  - { text: "webcolors-1.13.dist-info", explanation: "That was the name before the install. Run the command `ls` again, and read the newest lines in the terminal. If the name is still the same, the install has not run. Go back to the action that types the command." }
  - { text: "webcolors", explanation: "That is the directory of the package. Type the name that ends with `.dist-info`." }
  - { text: "24.11.1", explanation: "That is the version, which is a part of the name. Type the whole name, from `webcolors` to `.dist-info`." }
otherwise: "Look at the names under the newest `ls` command in the terminal. One name begins with `webcolors-` and ends with `.dist-info`. Type it exactly as the terminal shows it."
explanation: "The terminal shows four names, as before. The directory `webcolors` is still there, but the files inside it are now the files of version `24.11.1`. The notes of version `1.13` are gone. Nothing in `site-packages` remains of the old version."
```

## Run the new project

Now run the project `labels` again. Type this command, and press
`Enter`:

```
shared-python/bin/python labels/labels.py
```

````{hint}
:title: Run the command for me
:unlock: "count-colours" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-labels-new
:wait: prompt
shared-python/bin/python labels/labels.py
```
````

```{quiz}
:id: count-colours
:type: text
:title: The number of colours
question: "The program shows one line, with a number in it. Type the number."
answer:
  - "147"
wrong:
  - { pattern: ".*AttributeError.*", explanation: "That is the error from the page before this one. Look at the newest lines in the terminal. If the error is still there, the newer version is not installed. Go back to the action that types the command." }
  - { pattern: "The labels.*", explanation: "That is the whole line. Type only the number in it." }
otherwise: "Look at the line under the newest command in the terminal. It says how many colours the labels can use. Type that number."
explanation: "The project `labels` works now. The line `import webcolors` found version `24.11.1`, which has the function `names()`, and the list that it returns has 147 names."
```

The new project works. You installed what it needs, and the tool
reported success. Nothing in the terminal says that anything is
wrong.

On the next page you look at the project that you did not change.
