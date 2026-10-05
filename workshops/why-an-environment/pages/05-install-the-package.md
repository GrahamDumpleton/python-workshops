---
title: Install the package
requires: [verify:old-installed, quiz:old-version-name, quiz:teal-code]
---

# Install the package

To install a package means to copy its files into the `site-packages`
of a Python. On this page you install the package `webcolors` for the
shared Python, and you look at what changed.

## A package has versions

The author of a package does not publish it one time only. The author
corrects mistakes and adds new things, and publishes the package
again. Each time, the package gets a new number. This number is the
**version** of the package.

The package `webcolors` has many versions. Two of them are important
in this workshop: version `1.13`, and the newer version `24.11.1`.

You wrote the project `poster` last year, with version `1.13`. So
that is the version to install.

## The tool that installs

The tool that installs a package is `pip`. It is the package that you
saw in `site-packages`. It gets the files of a package from the
internet, and it copies them into `site-packages`.

This is the command:

```
shared-python/bin/python -m pip install webcolors==1.13
```

Read it in parts:

- `shared-python/bin/python` is the program to run: the shared
  Python.

- `-m pip` tells Python to find the module `pip` by its name, and to
  run it as a program.

- `install` tells `pip` what to do.

- `webcolors==1.13` is the name of the package, then two equals
  signs, then the version. It means: this package, in exactly this
  version.

You run `pip` through a Python, with `-m pip`, for one reason. In
this way it is certain which Python gets the package: the Python at
the beginning of the command. The workshop **Installing packages**
explains `pip` in full.

This command is new, so the action below runs it for you. It needs a
few seconds. Wait until the terminal shows its prompt again.

```{attempt}
:id: old-not-installed
:check: old-installed
:expect: The shared Python does not have the package webcolors
```

````{attempt}
:id: old-other-version
:check: old-installed
:expect: The shared Python has version 1.12 of the package webcolors
```{execute}
:wait: prompt
:timeout: 300s
shared-python/bin/python -m pip install webcolors==1.12
```
````

```{execute}
:id: install-old
:title: Install version 1.13 of webcolors for the shared Python
:wait: prompt
:timeout: 300s
shared-python/bin/python -m pip install webcolors==1.13
```

```{verify}
:id: old-installed
:label: The shared Python has version 1.13 of webcolors
:trigger: after:install-old; terminal-output "Successfully installed webcolors-1.13"
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
assert version is not None, "The shared Python does not have the package webcolors. Click the action above that installs version 1.13, and wait until the terminal shows its prompt again. If the terminal says that there is no file shared-python/bin/python, go back to the page One Python for every project, and make the shared Python again."
assert version == "1.13", f"The shared Python has version {version} of the package webcolors, and this step needs version 1.13. Click the action above that installs version 1.13, and wait until the terminal shows its prompt again."
print("Correct. The shared Python has version 1.13 of the package webcolors.")
```

````{hint}
:title: The terminal shows an error and not the line Successfully installed

Read the last lines that the terminal shows.

If they say that `pip` could not find or could not get the package,
the computer has no connection to the internet at this moment. Wait a
little, and click the install action again.

If they say that there is no file `shared-python/bin/python`, the
shared Python is missing. Go back to the page **One Python for every
project**, and click the action that makes it.
````

The terminal shows several lines. They are not the same on every
computer, so this page does not show them all. The last line is the
important one:

```
Successfully installed webcolors-1.13
```

## Look at what changed

Now look inside `site-packages` again. Type this command in the
terminal, and press `Enter`. It is the command that the page **Where
the shared Python looks** ran for you.

```
ls shared-python/lib/python3.14/site-packages
```

````{hint}
:title: Run the command for me
:unlock: "old-version-name" in failed_checks
:locked: Answer the question below first

```{execute}
:id: list-old
:wait: prompt
ls shared-python/lib/python3.14/site-packages
```
````

The terminal shows four names now. Two of them are new, and both
begin with `webcolors`.

```{quiz}
:id: old-version-name
:type: text
:case: false
:title: The two new names
question: "One of the new names ends with `.dist-info`. Type that whole name."
answer:
  - "webcolors-1.13.dist-info"
wrong:
  - { text: "webcolors", explanation: "That is the other new name. Type the name that ends with `.dist-info`." }
  - { pattern: "pip-.*", explanation: "That name belongs to the tool `pip`, and it was there before. Type the new name, which begins with `webcolors`." }
  - { text: "1.13", explanation: "That is the version, which is a part of the name. Type the whole name, from `webcolors` to `.dist-info`." }
otherwise: "Look at the names under the command in the terminal. One name begins with `webcolors-` and ends with `.dist-info`. Type it exactly as the terminal shows it."
explanation: "The directory `webcolors` is the package itself: a directory that holds modules. The directory `webcolors-1.13.dist-info` holds notes that `pip` keeps about the package. Its name tells you which version is installed."
```

The install did what the page said. It copied the package into the
`site-packages` of the shared Python. Nothing more happened.

## Run the project again

Run the project `poster` again. Type this command, and press `Enter`:

```
shared-python/bin/python poster/poster.py
```

````{hint}
:title: A faster way to type a command again
The terminal remembers the commands that you ran. Click inside the
terminal, and press the up arrow, the key with an arrow that points
up. Each press shows one earlier command. When the terminal shows the
command that you want, press `Enter` to run it.
````

````{hint}
:title: Run the command for me
:unlock: "teal-code" in failed_checks
:locked: Answer the question below first

```{execute}
:id: run-poster-old
:wait: prompt
shared-python/bin/python poster/poster.py
```
````

```{quiz}
:id: teal-code
:type: text
:case: false
:title: The code of the colour
question: "The program shows one line, which ends with a code. Type the code, with the `#` at its beginning."
answer:
  - "#008080"
wrong:
  - { text: "008080", explanation: "Those are the six characters of the code. The code begins with the character `#`. Type it with the `#`." }
  - { pattern: ".*ModuleNotFoundError.*", explanation: "That is the error from the page before this one. Look at the newest lines in the terminal. If the error is still there, click the action above that installs the package, and then run the program again." }
  - { pattern: "The poster.*", explanation: "That is the whole line. Type only the code at its end, which begins with `#`." }
otherwise: "Look at the line under the newest command in the terminal. It ends with a `#` and six characters. Type those seven characters."
explanation: "The program works now. The line `import webcolors` found the package in `site-packages`, and the dictionary of the package gave the code `#008080` for the colour `teal`."
```

You did not change the program. It failed before, and it works now,
because the `site-packages` of the Python that runs it changed.
Remember this: what a program does depends on the program, and also
on what is installed for the Python that runs it.
