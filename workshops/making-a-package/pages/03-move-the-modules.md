---
title: Move the modules into the package
requires: [verify:models-moved, verify:two-moved, verify:cli-in-place]
---

# Move the modules into the package

The directory `spending` is empty. On this page you move the four
modules into it.

## A new command: `mv`

The command `mv` moves a file. The name is short for "move". After
the word `mv` you write two things: the file to move, and the place
where it must go.

```
mv models.py spending/
```

This command means: move the file `models.py` into the directory
`spending`. The file is the same file afterwards. Only its place has
changed.

The character `/` after `spending` says that `spending` is a
directory. Always write it when you move a file into a directory.
With the `/`, the command refuses to work when the directory does not
exist. With no `/`, the command would give the file the new name
`spending`, and that is not what you want.

Be careful with `mv`. If the place already holds a file with the same
name, `mv` replaces that file, and it does not ask you first.

This command is new, so the action below runs it for you this time.

```{attempt}
:id: models-not-moved
:check: models-moved
:expect: The file models.py is not in the directory spending yet
```

```{execute}
:id: move-models
:title: Move models.py into the directory spending
:wait: prompt
mv models.py spending/
```

```{verify}
:id: models-moved
:label: The file models.py is in the directory spending
:substrate: contents
:trigger: after:move-models
:message: The file models.py is not in the directory spending yet. Click the action above to run the command.
exists spending/models.py
missing models.py
```

## Your task: move two more modules

Move the files `storage.py` and `report.py` into the directory
`spending`. Use one command for each file. Type each command in the
terminal, and press `Enter`.

Then look at what the directory holds. The command `ls` shows another
directory when you write its name after it:

```
ls spending
```

After the two commands, the list must show `models.py`, `report.py`
and `storage.py`. When you have seen the list, click `Check` below.

```{hint}
:title: Hint: the form of the command
Look at the command that moved `models.py`. Your commands have the
same form. Only the name of the file is different.
```

```{hint}
:title: Hint: I see a message in the terminal
A message that begins with `mv:` means that the command did not move
the file. The usual reason is a name that is spelled wrong. Check the
spelling of the file and of the directory. Type `ls` to see which
files are still in your work directory.
```

```{attempt}
:id: two-not-moved
:check: two-moved
:expect: still in your work directory: storage.py and report.py
```

````{attempt}
:id: one-moved
:check: two-moved
:expect: still in your work directory: report.py

```{execute}
:wait: prompt
mv storage.py spending/
```
````

````{attempt}
:id: wrong-name
:check: two-moved
:expect: The check cannot find the file report.py

```{execute}
:wait: prompt
mv report.py spending/reprot.py
```
````

````{attempt}
:id: moved-back
:check: two-moved
:expect: still in your work directory: storage.py and report.py

```{execute}
:wait: prompt
mv spending/storage.py storage.py
```

```{execute}
:wait: prompt
mv spending/reprot.py report.py
```
````

````{hint}
:title: Show me a solution
:unlock: "two-moved" in failed_checks or "two-moved" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The two actions below run the two commands. They work when the two
files are still in your work directory.

```{execute}
:id: move-storage-solution
:title: Move storage.py into the directory spending
:wait: prompt
mv storage.py spending/
```

```{execute}
:id: move-report-solution
:title: Move report.py into the directory spending
:wait: prompt
mv report.py spending/
```
````

```{verify}
:id: two-moved
:label: The files storage.py and report.py are in the directory spending
:trigger: after:move-report-solution; terminal-output "ls spending"
from pathlib import Path

names = ["storage.py", "report.py"]
here = [name for name in names if Path(name).exists()]
lost = [name for name in names if not Path(name).exists() and not Path("spending", name).exists()]
if lost:
    raise AssertionError(f"The check cannot find the file {lost[0]} in your work directory or in the directory spending. Perhaps the file has another name now. Type ls and then ls spending to look for it. Then give it the right name and place with mv, for example: mv spending/wrong-name.py spending/{lost[0]}")
if here:
    listed = " and ".join(here)
    raise AssertionError(f"Not every file has moved. These are still in your work directory: {listed}. Type one command for each file, for example: mv {here[0]} spending/")
print("The directory spending holds models.py, storage.py and report.py.")
```

## Move a file and change its name

One module is left: `main.py`. It holds the function `main`, which
reads the words of the command and shows the report. Programmers call
this part of a program the command line interface, and a common short
name for it is `cli`.

Inside a package with the name `spending`, the name `main.py` says
little about what the file holds. So this file gets the name `cli.py`
when it moves.

The command `mv` can do both things at one time. When the second part
of the command ends with a file name, `mv` moves the file and gives
it that name:

```
mv main.py spending/cli.py
```

Type this command in the terminal yourself, and press `Enter`. Then
type `ls spending` to see the result, and click `Check` below.

```{attempt}
:id: cli-not-moved
:check: cli-in-place
:expect: The file main.py is still in your work directory
```

````{attempt}
:id: cli-not-renamed
:check: cli-in-place
:expect: but it still has the name main.py

```{execute}
:wait: prompt
mv main.py spending/
```
````

````{attempt}
:id: cli-not-inside
:check: cli-in-place
:expect: but it is in your work directory

```{execute}
:wait: prompt
mv spending/main.py cli.py
```
````

````{attempt}
:id: cli-lost
:check: cli-in-place
:expect: The check cannot find main.py or cli.py

```{execute}
:wait: prompt
mv cli.py spending/mian.py
```
````

````{attempt}
:id: cli-back
:check: cli-in-place
:expect: The file main.py is still in your work directory

```{execute}
:wait: prompt
mv spending/mian.py main.py
```
````

````{hint}
:title: Show me a solution
:unlock: "cli-in-place" in failed_checks or "cli-in-place" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The action below runs the command. It works when the file `main.py`
is still in your work directory.

```{execute}
:id: move-cli-solution
:title: Move main.py into the directory spending, with the name cli.py
:wait: prompt
mv main.py spending/cli.py
```
````

```{verify}
:id: cli-in-place
:label: The file main.py is now spending/cli.py
:trigger: after:move-cli-solution; terminal-output "ls spending"
from pathlib import Path

if Path("spending/cli.py").exists():
    print("The directory spending holds the four modules: cli.py, models.py, report.py and storage.py.")
elif Path("spending/main.py").exists():
    raise AssertionError("The file is in the directory spending, but it still has the name main.py. Give it the new name with this command: mv spending/main.py spending/cli.py")
elif Path("cli.py").exists():
    raise AssertionError("The file has the name cli.py, but it is in your work directory. Move it into the package with this command: mv cli.py spending/")
elif Path("main.py").exists():
    raise AssertionError("The file main.py is still in your work directory. Type this command in the terminal and press Enter: mv main.py spending/cli.py")
else:
    raise AssertionError("The check cannot find main.py or cli.py in your work directory or in the directory spending. Type ls and then ls spending to look for the file, and move it to spending/cli.py with mv.")
```

## What happened

Your work directory now holds two names, `spending` and
`spending.csv`. The directory `spending` holds the four modules:

```
cli.py  models.py  report.py  storage.py
```

The data stays outside the package. The package is the program, and
`spending.csv` is the data that the program reads. The same program
can read another file of purchases.
