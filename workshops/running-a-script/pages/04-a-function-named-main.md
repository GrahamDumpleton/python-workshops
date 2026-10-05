---
title: A function named main
requires: [verify:main-runs]
---

# A function named `main`

A script runs its lines from the first to the last. So the lines that
do the work of the program can be anywhere in the file, between the
classes and the functions. In a long file, a reader then cannot find
where the program starts.

Python programmers solve this with a habit. They put the work of the
program in one function, and they give that function the name `main`.
The word "main" means "the most important". The last line of the file
calls the function. A reader who opens the file looks for `main`
first, and reads the program from there.

You can compare `main` with the front door of a building. A building
has many rooms, and a visitor enters through one door that everyone
can find.

The name `main` is only a habit. Python does not call a function with
this name for you. The function runs because the last line of the
file calls it.

## The code

For the file of Mariam, a first `main` reads the purchases and shows
how many there are:

```python
def main():
    ledger = read_ledger("spending.csv")
    print(f"Purchases: {len(ledger.purchases)}")


main()
```

Read it line by line:

- `def main():` begins a function with no parameters.

- `read_ledger("spending.csv")` reads the file of purchases, and
  returns a `Ledger`. The name `ledger` refers to it.

- `ledger.purchases` is the list of purchases, and `len()` gives the
  number of items in the list. The f-string puts that number after the
  text `Purchases: `.

- The last line, `main()`, has no spaces before it, so it is not part
  of the function. It is the line that calls the function when the
  script runs.

## Your task

Click the action below to show `spending.py` in the editor again.

```{file-open}
:id: show-spending-main
:title: Show spending.py in the editor
:path: spending.py
```

Now do these four steps:

1. Click after the last line of the file, `return ledger`. Press
   `Enter` three times, so that two empty lines come before your new
   function.

2. Type the six lines of the code above: the function `main`, two
   empty lines, and the call `main()`. The lines inside the function
   begin with four spaces. The line `def main():` and the line
   `main()` begin with no spaces.

3. Save the file. Hold `Ctrl` and press `S`. On a Mac, hold `Cmd` and
   press `S`.

4. Click in the terminal. Type the command below, and press `Enter`.

   ```
   python spending.py
   ```

When your code is correct, the terminal shows:

```
Purchases: 37
```

From now on, you type this command yourself each time. To get the
last command back with no typing, click in the terminal and press the
up arrow key. Then press `Enter`.

```{hint}
:title: "Hint: the terminal shows nothing"
There are two usual reasons.

The first reason is that the file is not saved. Look at the tab of
`spending.py`. If it shows a dot, the file has changes that are not on
the disk. The interpreter reads the file on the disk, so it runs the
old code. Save the file, and run the command again.

The second reason is that the last line, `main()`, is missing, or has
spaces before it. With spaces before it, the line is part of the
function, and nothing calls the function.
```

```{hint}
:title: "Hint: the terminal shows an error message"
Read the error message from its last line, as in a notebook. The last
line names the type of the error and says what is wrong. Some lines
above it, a line that begins with `File "..."` gives the number of the
line of your file where Python stopped.

An `IndentationError` means that the spaces at the start of a line are
wrong. A `NameError` means that a name is spelled in two different
ways. Compare your lines with the code on this page, letter by letter.
```

If the hints were not enough, the box below holds a solution. It opens
after the check below has run one time.

```{attempt}
:id: main-not-started
:check: main-runs
:expect: The command python spending.py showed nothing
```

````{attempt}
:id: main-not-called
:check: main-runs
:expect: the last line of the file must call it

```{file-write}
:path: spending.py
:from: answers/04-not-called.py
```
````

````{attempt}
:id: main-name-error
:check: main-runs
:expect: NameError

```{file-write}
:path: spending.py
:from: answers/04-name-error.py
```
````

````{attempt}
:id: main-number-typed
:check: main-runs
:expect: Do not type the number 37 in the code

```{file-write}
:path: spending.py
:from: answers/04-number-typed.py
```
````

````{attempt}
:id: main-number-only
:check: main-runs
:expect: showed "37" and it must show "Purchases: 37"

```{file-write}
:path: spending.py
:from: answers/04-number-only.py
```
````

````{attempt}
:id: main-no-function
:check: main-runs
:expect: the file has no function with the name main

```{file-write}
:path: spending.py
:from: answers/04-no-function.py
```
````

````{hint}
:title: Show me a solution
:unlock: "main-runs" in failed_checks or "main-runs" in passed_checks
:locked: Try the task first. This opens after the check below has run.
A working answer has these lines at the end of the file, after the
function `read_ledger`:

```python
def main():
    ledger = read_ledger("spending.csv")
    print(f"Purchases: {len(ledger.purchases)}")


main()
```

The first action below replaces your file `spending.py` with a file
that holds a working answer. What you typed in the file is lost, so
compare your lines with the lines above first. The second action runs
the script.

```{file-write}
:id: main-solution
:title: Replace my spending.py with a working answer
:path: spending.py
:from: answers/04-solution.py
:open: true
```

```{execute}
:id: main-solution-run
:title: Run the script
:wait: prompt
python spending.py
```
````

```{verify}
:id: main-runs
:label: The script calls main, and main shows the number of purchases
:trigger: terminal-output "Purchases:"; file-saved spending.py; after:main-solution-run
import json, os, shutil, subprocess, sys
from pathlib import Path

def run_python(arguments, where="."):
    try:
        run = subprocess.run([sys.executable, *arguments], cwd=where, capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL, env={**os.environ, "PYTHON_COLORS": "0", "PYTHONDONTWRITEBYTECODE": "1"})
    except subprocess.TimeoutExpired:
        raise AssertionError("Your program did not end after 5 seconds, so the check stopped it. Look for a loop that never ends. Correct the file spending.py, and save it.") from None
    if run.returncode != 0:
        errors = run.stderr.strip().splitlines()
        last = errors[-1] if errors else "(Python gave no message)"
        raise AssertionError(f"Python stopped with an error when the check ran your file spending.py. Type python spending.py in the terminal to see the whole error message. Correct the file, and save it. The last line of the error is: {last}") from None
    return run

shown = run_python(["spending.py"]).stdout.strip()
assert shown, "The command python spending.py showed nothing. The file must define the function main, and the last line of the file must call it: main(). If you wrote both, save the file: hold Ctrl and press S, or hold Cmd and press S on a Mac."
small = Path("_check_small")
try:
    small.mkdir(exist_ok=True)
    (small / "spending.csv").write_text("date,description,amount,category\n2026-04-02,Tea,3.50,food\n2026-04-09,Train ticket,12.00,transport\n2026-05-01,Soup,4.25,food\n")
    other = run_python([os.path.abspath("spending.py")], where=small).stdout.strip()
finally:
    shutil.rmtree(small, ignore_errors=True)
if shown == "Purchases: 37" and other != "Purchases: 3":
    raise AssertionError(f"Your program shows Purchases: 37 for the file of Mariam. Then the check ran your program with another file, which holds 3 purchases. Your program showed \"{other}\" and it must show \"Purchases: 3\". Do not type the number 37 in the code. Let Python count the purchases, with len(ledger.purchases). After you change the file, save it, and run the script again.")
assert shown == "Purchases: 37", f"The command python spending.py showed \"{shown.splitlines()[0]}\" and it must show \"Purchases: 37\". Check the text inside print(), change the file, and save it."
has_main = run_python(["-c", "import contextlib, io\nwith contextlib.redirect_stdout(io.StringIO()):\n    import spending\nprint(callable(getattr(spending, 'main', None)))"]).stdout.strip()
assert has_main == "True", "Your program shows the correct line. But the file has no function with the name main. Put your two lines inside a function that begins with def main(): and call the function on the last line of the file, with main(). After you change the file, save it, and run the script again."
print("Correct. The command python spending.py runs the function main, and main shows Purchases: 37.")
```

The check runs your script in the same way as you do, with the command
`python`. It also runs your script with a second file of purchases, to
see that the number comes from the file.

## What happened

The interpreter ran the file from the first line to the last, as on
the page before. It made the two classes and the two functions. This
time the last line was a call, `main()`. So the function ran: it read
the 37 purchases from `spending.csv`, and it printed one line.
