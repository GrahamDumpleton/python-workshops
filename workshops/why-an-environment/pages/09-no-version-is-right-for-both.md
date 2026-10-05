---
title: No version is right for both
requires: [quiz:predict-go-back, verify:old-again, quiz:right-for-both]
---

# No version is right for both

The project `poster` is broken. The first thing that many people try
is to install the old version again. On this page you try it, and you
see what it does to the other project.

## Predict

```{quiz}
:id: predict-go-back
:title: Predict the result
question: "You install version `1.13` for the shared Python again. Which of the two projects works after that?"
options:
  - { text: "Both projects work.", explanation: "The `site-packages` holds one version. When version `1.13` is installed, version `24.11.1` is removed. The project `labels` needs the newer version." }
  - { text: "Only `poster` works.", correct: true }
  - { text: "Only `labels` works.", explanation: "The project `labels` uses the function `names()`, which version `1.13` does not have." }
explanation: "The install replaces version `24.11.1` with version `1.13`. The project `poster` gets what it needs, and the project `labels` loses what it needs."
```

## Install the old version again

Type this command in the terminal, and press `Enter`. It is the
command of the page **Install the package**. Read it before you press
`Enter`, and make sure that it begins with `shared-python/bin/python`.

```
shared-python/bin/python -m pip install webcolors==1.13
```

Wait until the terminal shows its prompt again.

```{attempt}
:id: old-again-not-yet
:check: old-again
:expect: The shared Python has version 24.11.1 of the package webcolors, and this step needs version 1.13
```

````{attempt}
:id: old-again-nothing
:check: old-again
:expect: The shared Python does not have the package webcolors

```{execute}
:wait: prompt
:timeout: 300s
shared-python/bin/python -m pip uninstall --yes webcolors
```
````

````{hint}
:title: Run the command for me
:unlock: "old-again" in failed_checks
:locked: Click Check below first

```{execute}
:id: install-old-again
:wait: prompt
:timeout: 300s
shared-python/bin/python -m pip install webcolors==1.13
```
````

```{verify}
:id: old-again
:label: The shared Python has version 1.13 of webcolors again
:trigger: terminal-output "Successfully installed webcolors-1.13"; after:install-old-again
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
assert version is not None, "The shared Python does not have the package webcolors. Type the command shared-python/bin/python -m pip install webcolors==1.13 in the terminal, and press Enter. Wait until the terminal shows its prompt again."
assert version == "1.13", f"The shared Python has version {version} of the package webcolors, and this step needs version 1.13. Type the command shared-python/bin/python -m pip install webcolors==1.13 in the terminal, and press Enter. Wait until the terminal shows its prompt again."
print("Correct. The shared Python has version 1.13 of the package webcolors again.")
```

The tool `pip` removes version `24.11.1`, and installs version `1.13`
in its place. Again it says `Successfully installed`.

## Run both projects

Run the two projects, one after the other. Type each command, and
press `Enter`:

```
shared-python/bin/python poster/poster.py
```

```
shared-python/bin/python labels/labels.py
```

````{hint}
:title: Run the two commands for me
:unlock: "right-for-both" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-poster-again
:wait: prompt
shared-python/bin/python poster/poster.py
```

```{execute}
:id: run-labels-again
:wait: prompt
shared-python/bin/python labels/labels.py
```
````

The project `poster` shows the code `#008080` again. The project
`labels` stops with the `AttributeError` that you saw on the page **A
second project**: the module has no attribute `names`.

Here is what you saw with each version, in one table:

| The version in `site-packages` | `poster` | `labels` |
|--------------------------------|----------|----------|
| `1.13` | works | `AttributeError` |
| `24.11.1` | `AttributeError` | works |

```{quiz}
:id: right-for-both
:title: The right version
question: "Which version of `webcolors` in the `site-packages` of the shared Python lets both projects work?"
options:
  - { text: "Version `1.13`", explanation: "With version `1.13`, the project `labels` stops, because that version has no function `names()`." }
  - { text: "Version `24.11.1`", explanation: "With version `24.11.1`, the project `poster` stops, because that version has no dictionary `CSS3_NAMES_TO_HEX`." }
  - { text: "Both versions, installed one after the other", explanation: "The second install removes the first version. A `site-packages` holds one version of each package." }
  - { text: "No version", correct: true }
explanation: "Each version breaks one of the two projects. As long as the two projects share one `site-packages`, you can choose which project works, but you cannot make both work."
```

## Why not change a project?

You could change the program `poster` so that it works with the
newer version. Here that is one line. In real work it is often much
more:

- A real project uses many packages, and each of them can change
  between versions.

- A project may be written by another person, and you do not want to
  change it, or you may not know how.

- The next new project can need another version again, and then the
  problem returns.

The two programs are not wrong. Each one is right for the version
that it was written for. The problem is that they share one
`site-packages`.
