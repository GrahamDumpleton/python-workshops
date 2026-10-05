---
title: A file organiser
when: track == "file-organiser"
requires: [verify:organise-plan, verify:organise-move, quiz:where-market-went]
---

# A file organiser

The directory `downloads` in your work directory holds nine made-up
files: photos, letters, lists and a song. They are all in one place,
so a file is hard to find. Your program sorts them into directories
by their type.

A program that moves files can do damage when it has a bug. So your
program first makes a **dry run**: it shows what it would do, and it
changes nothing. It moves the files only when you ask for it with an
option.

## What the program does

The program is a script named `organise.py`, in your work directory.
You run it with one **command line argument**, which is a word after
the name of the program in a command. The word is the name of the
directory to sort:

```
python organise.py downloads
```

The type of a file is in the **ending** of its name: the dot and the
letters after it, such as `.pdf` in `letter.pdf`. Python calls the
ending the **suffix**. These are the rules:

- The program looks at each file that is directly in the directory.
  It leaves alone any directory that is inside it.

- It takes the files in the order of their names.

- A file goes into a directory named after its ending, in small
  letters and without the dot. So `letter.pdf` goes into `pdf`, and
  `market.JPG` goes into `jpg`.

- A file with no ending in its name, such as `notes`, goes into a
  directory named `other`.

- For each file, the program shows one line: the name of the file,
  then `->`, then the directory, a `/` and the name of the file again.

- Without an option, the program moves nothing. Its last line is
  `Nothing was moved. Add --move to move the files.`

- With the **option** `--move` the program also moves each file. An
  option is a command line argument that begins with `--`. The
  program makes each directory that does not exist yet. Its last line
  is `Moved 9 files.`, with the number of files that it moved.

For the directory `downloads`, the command
`python organise.py downloads` shows:

```
bus-times.txt -> txt/bus-times.txt
lake.jpg -> jpg/lake.jpg
letter.pdf -> pdf/letter.pdf
march-spending.csv -> csv/march-spending.csv
market.JPG -> jpg/market.JPG
notes -> other/notes
shopping-list.txt -> txt/shopping-list.txt
song.mp3 -> mp3/song.mp3
train-ticket.pdf -> pdf/train-ticket.pdf
Nothing was moved. Add --move to move the files.
```

The command `python organise.py downloads --move` shows the same nine
lines, then `Moved 9 files.` After it, `downloads` holds six
directories: `csv`, `jpg`, `mp3`, `other`, `pdf` and `txt`.

## Tools that you may need

The module `pathlib` gives the class `Path`. A `Path` object holds a
path, the text that says where a file is, and it has methods that work
with the file. You import it with `from pathlib import Path`. The
examples below show what each tool gives for the files of
`downloads`:

| Code | What it gives |
|------|---------------|
| `Path("downloads").iterdir()` | a `Path` for each file and each directory in `downloads`, in no fixed order; use `sorted()` round it to have them in the order of their names |
| `path.is_file()` | `True` when the path is a file, and `False` when it is a directory |
| `path.name` | the name at the end of the path: `market.JPG` for `downloads/market.JPG` |
| `path.suffix` | the ending of the name: `.JPG` for `market.JPG`, and the empty string `""` for `notes` |
| `".JPG".lower()[1:]` | `jpg`: the text in small letters, without its first character |
| `Path("downloads") / "jpg"` | a new path, `downloads/jpg`: the `/` joins two parts of a path |
| `folder.mkdir(exist_ok=True)` | makes the directory `folder`, and does nothing if it exists already |
| `path.rename(target)` | moves the file `path` to the path `target` |

The library reference describes every method of
[`pathlib`](https://docs.python.org/3/library/pathlib.html).

## Part 1: show the plan

In this part the program makes only the dry run. It has no option
`--move` yet, and it moves nothing.

First make the file. Click the action below, so that the file browser
shows your work directory.

```{file-browser-reveal}
:id: organise-show-files
:title: Show your work directory in the file browser
:path: access.log
```

In the file browser, click the empty space under the names of the
files with the right button of the mouse. On a Mac with one button,
hold `Ctrl` and click. Click `New File`, type the name `organise.py`,
and press `Enter`. Then double-click `organise.py` to open it in the
editor.

Write the program in the editor. It reads the name of the directory
from the command line with the module `argparse`, and shows the lines
of the plan. Save the file, and run it in the terminal:

```
python organise.py downloads
```

Compare what it shows with the example above. When the lines are the
same, click `Check`. The check runs your program on a directory of its
own, `_check_plan`, with other files in it, and removes that
directory afterwards. It never runs your program on `downloads`.

````{hint}
:title: "Hint: what to look at"
The workshop **Taking arguments** used `argparse` to read a command
line argument. These three lines give the name of the directory in
`args.directory`:

```python
parser = argparse.ArgumentParser(description="Sort the files of a directory by type.")
parser.add_argument("directory", help="the directory that holds the files")
args = parser.parse_args()
```

Make a `Path` from that text with `Path(args.directory)`. A `for` loop
over `sorted(directory.iterdir())` gives the paths in the order of
their names. Inside the loop, an `if` with `path.is_file()` keeps the
files only.
````

```{hint}
:title: "Hint: the shape of the code"
1. At the top of the file, import `argparse`, and import `Path` from
   `pathlib`.

2. Write a function `folder_for(path)` that gives back the name of the
   directory for one file. Give the name `suffix` to
   `path.suffix.lower()`. If `suffix` is `""`, return `"other"`.
   Otherwise return `suffix[1:]`, which is the ending without its dot.

3. Write a function `main()`. In it, read the command line argument
   with the three lines of `argparse`, and give the name `directory`
   to `Path(args.directory)`.

4. In `main()`, loop over `sorted(directory.iterdir())`. For each path
   that is a file, give the name `folder` to `folder_for(path)` and
   show the line with
   `print(f"{path.name} -> {folder}/{path.name}")`.

5. After the loop, show the last line,
   `Nothing was moved. Add --move to move the files.`

6. At the end of the file, at the left side, write the two lines that
   call `main()` when the file runs as a script:
   `if __name__ == "__main__":` and, under it with four spaces,
   `main()`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check` one time.

```{attempt}
:id: plan-no-file
:check: organise-plan
:expect: There is no file organise.py in your work directory
```

````{attempt}
:id: plan-empty
:check: organise-plan
:expect: Your program showed nothing

```{file-write}
:path: organise.py
```
````

````{attempt}
:id: plan-error
:check: organise-plan
:expect: Its last line is: NameError

```{file-write}
:path: organise.py
print(directory)
```
````

````{attempt}
:id: plan-fixed-directory
:check: organise-plan
:expect: shows the files of downloads

```{file-write}
:path: organise.py
from pathlib import Path

for path in sorted(Path("downloads").iterdir()):
    print(f"{path.name} -> {path.suffix.lower()[1:]}/{path.name}")
print("Nothing was moved. Add --move to move the files.")
```
````

````{attempt}
:id: plan-moves
:check: organise-plan
:expect: without the option --move it must only show the plan

```{file-write}
:path: organise.py
import sys
from pathlib import Path

directory = Path(sys.argv[1])
for path in sorted(directory.iterdir()):
    if path.is_file():
        print(f"{path.name} -> other/{path.name}")
        (directory / "other").mkdir(exist_ok=True)
        path.rename(directory / "other" / path.name)
```
````

````{attempt}
:id: plan-directory-too
:check: organise-plan
:expect: which is a directory and not a file

```{file-write}
:path: organise.py
import sys
from pathlib import Path

for path in sorted(Path(sys.argv[1]).iterdir()):
    folder = path.suffix.lower()[1:] or "other"
    print(f"{path.name} -> {folder}/{path.name}")
print("Nothing was moved. Add --move to move the files.")
```
````

````{attempt}
:id: plan-capitals
:check: organise-plan
:expect: in small letters

```{file-write}
:path: organise.py
import sys
from pathlib import Path

for path in sorted(Path(sys.argv[1]).iterdir()):
    if path.is_file():
        folder = path.suffix[1:] or "other"
        print(f"{path.name} -> {folder}/{path.name}")
print("Nothing was moved. Add --move to move the files.")
```
````

````{attempt}
:id: plan-dot
:check: organise-plan
:expect: must not begin with a dot

```{file-write}
:path: organise.py
import sys
from pathlib import Path

for path in sorted(Path(sys.argv[1]).iterdir()):
    if path.is_file():
        folder = path.suffix.lower() or "other"
        print(f"{path.name} -> {folder}/{path.name}")
print("Nothing was moved. Add --move to move the files.")
```
````

````{attempt}
:id: plan-no-ending
:check: organise-plan
:expect: goes into the directory other

```{file-write}
:path: organise.py
import sys
from pathlib import Path

for path in sorted(Path(sys.argv[1]).iterdir()):
    if path.is_file():
        folder = path.suffix.lower()[1:]
        print(f"{path.name} -> {folder}/{path.name}")
print("Nothing was moved. Add --move to move the files.")
```
````

````{attempt}
:id: plan-order
:check: organise-plan
:expect: in the order of their names

```{file-write}
:path: organise.py
import sys
from pathlib import Path

for path in sorted(Path(sys.argv[1]).iterdir(), reverse=True):
    if path.is_file():
        folder = path.suffix.lower()[1:] or "other"
        print(f"{path.name} -> {folder}/{path.name}")
print("Nothing was moved. Add --move to move the files.")
```
````

````{attempt}
:id: plan-no-last-line
:check: organise-plan
:expect: The first missing line is: Nothing was moved

```{file-write}
:path: organise.py
import sys
from pathlib import Path

for path in sorted(Path(sys.argv[1]).iterdir()):
    if path.is_file():
        folder = path.suffix.lower()[1:] or "other"
        print(f"{path.name} -> {folder}/{path.name}")
```
````

````{attempt}
:id: plan-wrong-line
:check: organise-plan
:expect: Line 1 that your program showed is: bread.JPG => jpg/bread.JPG

```{file-write}
:path: organise.py
import sys
from pathlib import Path

for path in sorted(Path(sys.argv[1]).iterdir()):
    if path.is_file():
        folder = path.suffix.lower()[1:] or "other"
        print(f"{path.name} => {folder}/{path.name}")
print("Nothing was moved. Add --move to move the files.")
```
````

````{hint}
:title: Show me a solution
:unlock: "organise-plan" in failed_checks or "organise-plan" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes a working program into `organise.py`
and opens it. Read it, and compare it with your own. The second action
runs it in the terminal.

```{file-write}
:id: plan-solution
:title: Write a solution into organise.py
:path: organise.py
:open: true
import argparse
from pathlib import Path


def folder_for(path):
    suffix = path.suffix.lower()
    if suffix == "":
        return "other"
    return suffix[1:]


def main():
    parser = argparse.ArgumentParser(description="Sort the files of a directory by type.")
    parser.add_argument("directory", help="the directory that holds the files")
    args = parser.parse_args()

    directory = Path(args.directory)
    files = []
    for path in sorted(directory.iterdir()):
        if path.is_file():
            files.append(path)

    for path in files:
        folder = folder_for(path)
        print(f"{path.name} -> {folder}/{path.name}")
    print("Nothing was moved. Add --move to move the files.")


if __name__ == "__main__":
    main()
```

```{execute}
:id: plan-run
:title: Run the program on the directory downloads
:wait: prompt
python organise.py downloads
```
````

```{verify}
:id: organise-plan
:label: organise.py shows the plan, and moves nothing
:trigger: terminal-output "Nothing was moved"; file-saved organise.py; after:plan-run
import os, shutil, subprocess, sys
from pathlib import Path

assert Path("organise.py").exists(), "There is no file organise.py in your work directory. Make it in the file browser, in the same list as access.log, and save it."
place = Path("_check_plan")
names = ["bread.JPG", "diary", "map.pdf", "photo.jpg", "plan.txt"]
wanted = ["bread.JPG -> jpg/bread.JPG", "diary -> other/diary", "map.pdf -> pdf/map.pdf", "photo.jpg -> jpg/photo.jpg", "plan.txt -> txt/plan.txt", "Nothing was moved. Add --move to move the files."]
about = "The check made a directory _check_plan with the files bread.JPG, diary, map.pdf, photo.jpg and plan.txt, and a directory old. Then it ran python organise.py _check_plan."
shutil.rmtree(place, ignore_errors=True)
try:
    (place / "old").mkdir(parents=True)
    for name in names:
        (place / name).write_text("A file made by the check.\n")
    try:
        run = subprocess.run(
            [sys.executable, "organise.py", str(place)],
            capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"{about} Your program did not end after 10 seconds. Look for a loop that never ends.") from None
    left = sorted(path.name for path in place.iterdir())
finally:
    shutil.rmtree(place, ignore_errors=True)
if run.returncode != 0:
    errors = run.stderr.strip().splitlines()
    last = errors[-1] if errors else "(Python showed no message)"
    raise AssertionError(f"{about} Python stopped with an error. Run python organise.py downloads in the terminal, and read the whole error there. Its last line is: {last}")
assert left == sorted(names + ["old"]), f"{about} Your program moved files, but without the option --move it must only show the plan. In this part, the program has no code that moves a file."
shown = run.stdout.strip().splitlines()
assert shown, f"{about} Your program showed nothing. Did you save the file? Use print() to show each line of the plan."
if any(line.startswith("bus-times.txt") for line in shown):
    raise AssertionError(f"{about} Your program shows the files of downloads, and not the files of the directory that is named in the command. Read the name of the directory from the command line, with argparse, and use it in place of the word downloads.")
if any(line.startswith("old ") for line in shown):
    raise AssertionError(f"{about} Your program showed a line for old, which is a directory and not a file. Use an if with path.is_file() inside the loop, so that the program keeps the files only.")
if any("-> JPG/" in line for line in shown):
    raise AssertionError(f"{about} Your program puts bread.JPG into the directory JPG. The name of the directory must be in small letters, jpg, so that bread.JPG and photo.jpg go into the same directory. Use .lower() on the ending.")
if any("-> ." in line for line in shown):
    raise AssertionError(f"{about} The name of a directory in your plan begins with a dot, such as .jpg. It must not begin with a dot: photo.jpg goes into jpg. The ending .jpg begins with a dot, and [1:] gives the ending without its first character.")
if any(line.startswith("diary -> ") for line in shown) and "diary -> other/diary" not in shown:
    raise AssertionError(f"{about} Your program shows the line {[line for line in shown if line.startswith('diary ')][0]} for the file diary. A file with no ending in its name goes into the directory other: diary -> other/diary. The ending of diary is the empty string, so test for it with an if.")
if sorted(shown) == sorted(wanted) and shown != wanted:
    raise AssertionError(f"{about} Your program shows the right lines, but not in the order of their names. The first line must be for bread.JPG. Use sorted() round the paths of the directory.")
for number, (found, expected) in enumerate(zip(shown, wanted), start=1):
    if found != expected:
        raise AssertionError(f"{about} Line {number} that your program showed is: {found}  It must be: {expected}  Change the program, save it, and click Check again.")
if len(shown) < len(wanted):
    raise AssertionError(f"{about} Your program must show {len(wanted)} lines, and it showed {len(shown)}. The first missing line is: {wanted[len(shown)]}")
if len(shown) > len(wanted):
    raise AssertionError(f"{about} Your program showed more than the {len(wanted)} lines that it must show. The first line too many is: {shown[len(wanted)]}")
print(f"Correct. {about} Your program showed the plan for the five files, and it moved nothing.")
```

Your program now shows what it would do, and changes nothing. In the
second part it learns to move the files.

## Part 2: move the files

Add the option `--move` to your program. Without the option, the
program does exactly what it does now. With the option, it also moves
each file into its directory, and its last line is `Moved 9 files.`,
with the number of files that it moved.

Save the file. Run the dry run one more time, and read the plan. Then
run the program with the option:

```
python organise.py downloads --move
```

Look at `downloads` in the file browser, or with `ls downloads` in the
terminal. It now holds six directories. Click `Check`. The check makes
a directory `_check_move` of its own, runs your program on it with
and without `--move`, and looks at where each file went.

````{hint}
:title: "Hint: what to look at"
This line adds an option that takes no value. It is `True` when the
command has `--move`, and `False` when it does not:

```python
parser.add_argument("--move", action="store_true", help="move the files")
```

The value is in `args.move`. Inside the loop, after the line that
shows the plan, an `if args.move:` holds the two lines that move the
file. The first makes the directory with `mkdir(exist_ok=True)`, and
the second moves the file into it with `rename`.
````

```{hint}
:title: "Hint: the shape of the code"
1. Under the line that adds the argument `directory`, add the line
   that adds the option `--move`.

2. Inside the loop over the files, after `print()`, write
   `if args.move:`.

3. Under it, with four more spaces, make the directory:
   `(directory / folder).mkdir(exist_ok=True)`.

4. Under that, move the file:
   `path.rename(directory / folder / path.name)`.

5. After the loop, show the last line with an `if` and an `else`. If
   `args.move` is true, show `f"Moved {len(files)} files."`. Otherwise
   show the line of the dry run. The name `files` is the list of the
   files, which the program made before the loop.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check` one time.

```{attempt}
:id: move-not-started
:check: organise-move
:expect: when the check ran python organise.py _check_move --move
```

````{attempt}
:id: move-nothing-moved
:check: organise-move
:expect: but it did not move any file

```{file-write}
:path: organise.py
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument("directory")
parser.add_argument("--move", action="store_true")
args = parser.parse_args()
for path in sorted(Path(args.directory).iterdir()):
    if path.is_file():
        folder = path.suffix.lower()[1:] or "other"
        print(f"{path.name} -> {folder}/{path.name}")
print("Moved 5 files.")
```
````

````{attempt}
:id: move-always
:check: organise-move
:expect: Without the option --move, your program moved files

```{file-write}
:path: organise.py
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument("directory")
parser.add_argument("--move", action="store_true")
args = parser.parse_args()
directory = Path(args.directory)
for path in sorted(directory.iterdir()):
    if path.is_file():
        folder = path.suffix.lower()[1:] or "other"
        print(f"{path.name} -> {folder}/{path.name}")
        (directory / folder).mkdir(exist_ok=True)
        path.rename(directory / folder / path.name)
print("Moved 5 files.")
```
````

````{attempt}
:id: move-wrong-place
:check: organise-move
:expect: the directory _check_move holds

```{file-write}
:path: organise.py
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument("directory")
parser.add_argument("--move", action="store_true")
args = parser.parse_args()
directory = Path(args.directory)
count = 0
for path in sorted(directory.iterdir()):
    if path.is_file():
        folder = path.suffix.lower()[1:] or "other"
        print(f"{path.name} -> {folder}/{path.name}")
        if args.move:
            (directory / "other").mkdir(exist_ok=True)
            path.rename(directory / "other" / path.name)
            count = count + 1
if args.move:
    print(f"Moved {count} files.")
else:
    print("Nothing was moved. Add --move to move the files.")
```
````

````{attempt}
:id: move-last-line
:check: organise-move
:expect: the last line must be Moved 5 files

```{file-write}
:path: organise.py
import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument("directory")
parser.add_argument("--move", action="store_true")
args = parser.parse_args()
directory = Path(args.directory)
for path in sorted(directory.iterdir()):
    if path.is_file():
        folder = path.suffix.lower()[1:] or "other"
        print(f"{path.name} -> {folder}/{path.name}")
        if args.move:
            (directory / folder).mkdir(exist_ok=True)
            path.rename(directory / folder / path.name)
print("Nothing was moved. Add --move to move the files.")
```
````

````{hint}
:title: Show me a solution
:unlock: "organise-move" in failed_checks or "organise-move" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes a working program into `organise.py`
and opens it. Compare it with your own. The second action runs the
dry run, and the third moves the files of `downloads`.

```{file-write}
:id: move-solution
:title: Write a solution into organise.py
:path: organise.py
:open: true
import argparse
from pathlib import Path


def folder_for(path):
    suffix = path.suffix.lower()
    if suffix == "":
        return "other"
    return suffix[1:]


def main():
    parser = argparse.ArgumentParser(description="Sort the files of a directory by type.")
    parser.add_argument("directory", help="the directory that holds the files")
    parser.add_argument("--move", action="store_true", help="move the files")
    args = parser.parse_args()

    directory = Path(args.directory)
    files = []
    for path in sorted(directory.iterdir()):
        if path.is_file():
            files.append(path)

    for path in files:
        folder = folder_for(path)
        print(f"{path.name} -> {folder}/{path.name}")
        if args.move:
            (directory / folder).mkdir(exist_ok=True)
            path.rename(directory / folder / path.name)

    if args.move:
        print(f"Moved {len(files)} files.")
    else:
        print("Nothing was moved. Add --move to move the files.")


if __name__ == "__main__":
    main()
```

```{execute}
:id: move-dry-run
:title: Show the plan for downloads
:wait: prompt
python organise.py downloads
```

```{execute}
:id: move-run
:title: Move the files of downloads
:wait: prompt
python organise.py downloads --move
```
````

```{verify}
:id: organise-move
:label: organise.py moves the files with the option --move
:trigger: terminal-output /Moved \d+ files/; after:move-run
import os, shutil, subprocess, sys
from pathlib import Path

assert Path("organise.py").exists(), "There is no file organise.py in your work directory. Make it in the file browser, in the same list as access.log, and save it."
place = Path("_check_move")
names = ["bread.JPG", "diary", "map.pdf", "photo.jpg", "plan.txt"]
plan = ["bread.JPG -> jpg/bread.JPG", "diary -> other/diary", "map.pdf -> pdf/map.pdf", "photo.jpg -> jpg/photo.jpg", "plan.txt -> txt/plan.txt"]
before = sorted(names + ["old/keep.txt"])
after = ["jpg/bread.JPG", "jpg/photo.jpg", "old/keep.txt", "other/diary", "pdf/map.pdf", "txt/plan.txt"]
about = "The check made a directory _check_move with the files bread.JPG, diary, map.pdf, photo.jpg and plan.txt, and a directory old that holds keep.txt."


def make():
    shutil.rmtree(place, ignore_errors=True)
    (place / "old").mkdir(parents=True)
    (place / "old" / "keep.txt").write_text("A file made by the check.\n")
    for name in names:
        (place / name).write_text("A file made by the check.\n")


def run(*extra):
    command = " ".join(["python organise.py _check_move", *extra])
    try:
        done = subprocess.run(
            [sys.executable, "organise.py", str(place), *extra],
            capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"{about} When the check ran {command}, your program did not end after 10 seconds. Look for a loop that never ends.") from None
    if done.returncode != 0:
        errors = done.stderr.strip().splitlines()
        last = errors[-1] if errors else "(Python showed no message)"
        raise AssertionError(f"{about} Python stopped with an error when the check ran {command}. If your program does not have the option --move yet, add it with parser.add_argument. The last line of the error is: {last}")
    files = sorted(path.relative_to(place).as_posix() for path in place.rglob("*") if path.is_file())
    return done.stdout.strip().splitlines(), files


try:
    make()
    dry_shown, dry_files = run()
    make()
    move_shown, move_files = run("--move")
finally:
    shutil.rmtree(place, ignore_errors=True)
assert dry_files == before, f"{about} Without the option --move, your program moved files. It must move them only when the command has --move. Put the lines that move a file inside if args.move:"
assert move_files != before, f"{about} The check ran python organise.py _check_move --move, but it did not move any file. Inside if args.move: make the directory with mkdir(exist_ok=True), and move the file with path.rename(...). Save the file, and click Check again."
assert move_files == after, f"{about} After the command python organise.py _check_move --move, the directory _check_move holds {', '.join(move_files)}. It must hold {', '.join(after)}. Each file must go into the directory of its own ending, inside the directory that is named in the command."
assert dry_shown[-1:] == ["Nothing was moved. Add --move to move the files."], f"{about} Without the option --move, the last line must still be the line of the dry run. The last line that your program showed is: {dry_shown[-1] if dry_shown else 'nothing'}"
assert move_shown[:-1] == plan, f"{about} With the option --move, your program must show the same lines of the plan as without it. Your program showed {len(move_shown)} lines."
assert move_shown[-1:] == ["Moved 5 files."], f"{about} With the option --move, the last line must be Moved 5 files, with the number of files that the program moved. Show it after the loop, only when the command has --move. The last line that your program showed is: {move_shown[-1] if move_shown else 'nothing'}"
print(f"Correct. {about} Without --move your program moved nothing. With --move it put each of the five files into the right directory, and it left old/keep.txt where it was.")
```

Look at the directory `downloads` in the file browser. Double-click it
to open it, and then double-click the directory `jpg`. To return to
`downloads`, click its name above the list of files.

```{quiz}
:id: where-market-went
:title: Where one file went
:type: text
:case: false
question: "Which directory inside `downloads` holds the file `market.JPG` now? Type its name."
answer:
  - { pattern: "(downloads/)?jpg/?", example: "jpg" }
wrong:
  - { pattern: "(downloads/)?\\.jpg/?", explanation: "The ending `.jpg` begins with a dot. The program removes the dot, so the name of the directory has no dot." }
otherwise: "If `downloads` still holds the files and no directories, run `python organise.py downloads --move` in the terminal first. Then look inside `downloads` in the file browser."
explanation: "The program made the directory `jpg` and moved `lake.jpg` and `market.JPG` into it. If you run the program on `downloads` again, it finds no files there, only directories, so it moves nothing."
```

## What you have now

Your program sorts any directory that you name in the command, and it
shows the plan before it changes anything. The dry run is a habit
that is worth keeping: a program that changes or deletes files should
show what it will do before it does it.

If you want to do more, give the program a second option,
`--by-month`, which sorts the files into directories by the month in
which each file was last changed, such as `2026-03`. The value
`path.stat().st_mtime` is the time when the file was last changed, as
a number of seconds. `datetime.fromtimestamp()` of the module
`datetime` turns that number into a date and time, and its method
`.strftime("%Y-%m")` gives the year and the month as text.
