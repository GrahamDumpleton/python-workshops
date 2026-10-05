---
title: A formatter
requires: [verify:formatted]
---

# A formatter

The second tool does not look for mistakes. It changes how the code
looks, and it never changes what the code does.

## What a formatter is

A **formatter** is a program that rewrites your code in one fixed
layout: where the spaces go, which quotes are used, and how a line that
is too long is broken into several lines. Python runs the code in the
same way before and after.

Why use one? When several people work on one project, each person
writes code in a slightly different way. Then every change mixes real
work with changes of layout, and the code is harder to read. With a
formatter, all the code of the project has one layout, and nobody
needs to think about it.

An everyday comparison: a formatter is like a printing house that sets
every book in the same type and the same margins. The words do not
change.

`ruff` is also a formatter. Its command is `python -m ruff format`.
It keeps each line to 88 characters or fewer, where it can.

## A line that is too long

This line of `src/spending/storage.py` has 105 characters, with the
spaces before it:

```python
            purchase = Purchase(row["date"], row["description"], Decimal(row["amount"]), row["category"])
```

## Run the formatter

This command is new, so the action below runs it for you.

```{attempt}
:id: not-formatted
:check: formatted
:expect: ruff format would still change 4 files
```

```{execute}
:id: run-format
:title: Run the formatter
:wait: prompt
python -m ruff format
```

`ruff` says `4 files reformatted, 4 files left unchanged`. It changed
four files of `src/spending`, and the other files already had its
layout.

```{verify}
:id: formatted
:label: Every file has the layout of the formatter
:trigger: after:run-format; terminal-output "reformatted"
import os, re, subprocess

plain = {name: value for name, value in os.environ.items() if name not in ("FORCE_COLOR", "CLICOLOR_FORCE")}
plain["NO_COLOR"] = "1"
run = subprocess.run(
    [".venv/bin/ruff", "format", "--check", "--no-cache"],
    capture_output=True, text=True, timeout=60, stdin=subprocess.DEVNULL, env=plain,
)
if run.returncode != 0:
    found = re.search(r"(\d+) files? would be reformatted", run.stdout)
    count = found.group(1) if found else "some"
    raise AssertionError(f"ruff format would still change {count} files. Click the action above, which runs python -m ruff format.")
print("Every file of the project has the layout of the formatter.")
```

Now open the file and look at the same line:

```{file-open}
:id: open-storage
:title: Open src/spending/storage.py
:path: src/spending/storage.py
```

```{editor-highlight}
:id: show-new-lines
:title: Show the line that the formatter broke
:path: src/spending/storage.py
:match: purchase = Purchase(
:duration: 4s
```

The one long line is now three lines:

```python
            purchase = Purchase(
                row["date"], row["description"], Decimal(row["amount"]), row["category"]
            )
```

Python allows a line break inside parentheses, so the code means the
same as before. The values inside the parentheses are on a line of
their own, with four more spaces before them.

Run the formatter once more. Type this command in the terminal, and
press `Enter`:

```
python -m ruff format
```

This time it says `8 files left unchanged`. A formatter gives the same
result each time, so a second run changes nothing.
