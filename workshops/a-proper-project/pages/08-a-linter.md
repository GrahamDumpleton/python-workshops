---
title: A linter
requires: [verify:tools-installed, verify:lint-clean]
---

# A linter

The project is complete. From this page on, you watch three tools at
work on your code. Each one reads the code and tells you something
about it, without running the program.

## Install the tools

The tools are packages, so they go into the environment of the
project, as `rich` and `pytest` did. These pages use two: `ruff` and
`mypy`. The command names an exact version of each, after `==`. With
a fixed version, a tool shows the same results as on these pages. A
newer version may find other things.

The action below types the command in the terminal for you. Look at
the prompt: it must begin with `(.venv)`. Then click in the terminal,
and press `Enter`.

```{attempt}
:id: tools-missing
:check: tools-installed
:expect: The environment does not hold ruff yet
```

```{terminal-type}
:id: type-install-tools
:title: Type the command that installs ruff and mypy
python -m pip install ruff==0.16.10 mypy==2.4.0
```

````{hint}
:title: Press Enter for me
:unlock: "tools-installed" in failed_checks or "tools-installed" in passed_checks
:locked: Click Check below first

```{send-key}
:id: enter-install-tools
:keys: enter
```
````

```{verify}
:id: tools-installed
:label: The environment holds ruff and mypy
:trigger: terminal-output "Successfully installed"; after:enter-install-tools
from pathlib import Path

for name in ["ruff", "mypy"]:
    if not Path(".venv/bin", name).exists():
        raise AssertionError(f"The environment does not hold {name} yet. Click in the terminal and press Enter, to run the command that the action typed. The prompt must begin with (.venv).")
print("The environment holds ruff and mypy.")
```

## What a linter is

A **linter** is a program that reads your code and looks for
mistakes and for code that could be written better. It does not run
your program. It knows many rules, and it reports each place where the
code breaks one of them. Each report is called a **finding**.

Some findings are real mistakes, such as a name that is used before
it is defined. Others are advice. The linter cannot know what you
meant, so you read each finding and decide.

An everyday comparison: a linter is a spelling checker for code. It
finds a word that is spelled wrong at once. It can also suggest a
better word, and then you choose.

`ruff` is a linter. The command `python -m ruff check` checks every
Python file of the project. It does not look into `.venv`.

These pages start each tool with `python -m`, as they do for pip. The
reason is the same: then it is certain that the tool comes from the
environment of the project. A computer can have another copy of a
tool somewhere else, perhaps an older version, and the short command
`ruff` could start that copy.

## Run it

This command is new, so the action below runs it for you.

```{execute}
:id: first-lint
:title: Run the linter
:wait: prompt
python -m ruff check
```

`ruff` finds four things. A note under the action may say that the
command ended with status 1. That is correct here: `ruff` ends that
way when it has findings. The first finding begins like this:

```
FURB157 [*] Verbose expression in `Decimal` constructor
  --> src/spending/models.py:26:26
```

Read it line by line:

- `FURB157` is the code of the rule. Each rule of `ruff` has a code,
  and the documentation of `ruff` explains each one.

- `[*]` means that `ruff` can repair this finding by itself.

- `Verbose expression in Decimal constructor` is the message. Verbose
  means "longer than needed". The constructor is the call that makes
  the `Decimal`.

- `src/spending/models.py:26:26` is the place: the file, line 26, and
  character 26 of that line.

Under those lines, `ruff` shows the line of code, and how it would
change it: `Decimal("0")` becomes `Decimal(0)`.

Is the advice right? The rule of these workshops is to make a
`Decimal` from a string, as in `Decimal("6.40")`. That rule is for a
number with a decimal point, because a float such as `6.40` is not
exact. A whole number is always exact, so `Decimal(0)` and
`Decimal("0")` are the same value. The advice is right, and the
shorter form is easier to read.

## Your task: let the linter repair the code

`python -m ruff check --fix` repairs each finding that has the mark `[*]`. Type
these two commands in the terminal, and press `Enter` after each one.
The second command checks again. It shows `All checks passed!`.

```
python -m ruff check --fix
```

```
python -m ruff check
```

```{attempt}
:id: lint-findings
:check: lint-clean
:expect: ruff still finds 4 things
```

````{hint}
:title: Show me the commands
:unlock: "lint-clean" in failed_checks or "lint-clean" in passed_checks
:locked: Try the task first. This opens after the check below has run.

```{execute}
:id: lint-fix-solution
:title: Repair the findings
:wait: prompt
python -m ruff check --fix
```

```{execute}
:id: lint-again-solution
:title: Check again
:wait: prompt
python -m ruff check
```
````

```{verify}
:id: lint-clean
:label: python -m ruff check finds nothing
:trigger: terminal-output "All checks passed"; after:lint-again-solution
import os, subprocess

plain = {name: value for name, value in os.environ.items() if name not in ("FORCE_COLOR", "CLICOLOR_FORCE")}
plain["NO_COLOR"] = "1"
plain["PYTHON_COLORS"] = "0"
lint = subprocess.run(
    [".venv/bin/ruff", "check", "--no-cache", "--output-format", "concise"],
    capture_output=True, text=True, timeout=60, stdin=subprocess.DEVNULL, env=plain,
)
if lint.returncode != 0:
    findings = [line for line in lint.stdout.splitlines() if ".py:" in line]
    first = findings[0] if findings else lint.stdout.strip().splitlines()[-1]
    raise AssertionError(f"ruff still finds {len(findings)} things. The first is: {first}. Type python -m ruff check --fix in the terminal and press Enter.")
print("python -m ruff check finds nothing in your code.")
```

## What happened

`ruff` changed three lines of `src/spending/models.py` and one line of
`tests/test_models.py`. Type `python -m pytest` in the terminal: the
seven tests still pass. You did not install again. The editable
install reads the changed files.
