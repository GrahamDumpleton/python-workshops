---
title: The file name on the command line
requires: [verify:filename-works]
---

# The file name on the command line

Now you change the spending tracker. On this page, the name of the
file that it reads moves from the code to the command. Then one
program can report on every file of purchases.

Your work directory holds a second file of purchases, `trip.csv`. It
has the five purchases of a short journey that Mariam made in April
2026. After this page, the program can report on it.

## The function to change

The function `main()` is near the end of the file `spending.py`. The
action below shows the file in the editor and marks the function.

```{file-open}
:id: show-program
:title: Show the file spending.py
:path: spending.py
```

```{editor-highlight}
:id: show-main
:title: Mark the function main in spending.py
:path: spending.py
:match: def main():
:duration: 5s
```

The function has three lines in its body now:

```python
def main():
    ledger = read_ledger("spending.csv")
    for line in report_lines(ledger):
        print(line)
```

## Your task

Change `spending.py` so that the command gives the name of the file.

- At the top of the file, with the other `import` lines, add the
  line `import argparse`.

- In `main()`, make a parser with `argparse.ArgumentParser(...)`.
  Give it a description of the program, in your own words.

- Add one command line argument to the parser. Its name is
  `filename`. Give it a help text, in your own words.

- Call `parser.parse_args()`, and give the value `args.filename` to
  `read_ledger()`, in place of the string `"spending.csv"`.

- Do not change the two lines of the `for` loop, and do not change
  the last two lines of the file.

When your program works, these are the results:

| The command | What the terminal shows |
|------|------|
| `python spending.py spending.csv` | the report that begins with `Purchases: 37` |
| `python spending.py trip.csv` | a report that begins with `Purchases: 5` |
| `python spending.py` | two lines: the first begins with `usage`, and the second says that `filename` is required |

Remember that every line in the body of `main()` begins with four
spaces. Save the file when you have changed it: hold `Ctrl` and
press `S`, or on a Mac hold `Cmd` and press `S`. Then run the
program. Click in the terminal, type the command, and press `Enter`:

```
python spending.py trip.csv
```

```{hint}
:title: Hint: what to look at
The script `greet.py` on the page before this one has the same three
steps: make a parser, add a command line argument, call
`parse_args()`. You can open `greet.py` from its tab in the editor.

In `greet.py` those lines begin at the left edge of the file. In
`spending.py` they are inside the function `main()`, so each of them
begins with four spaces.
```

```{hint}
:title: Hint: the lines, one by one
The body of `main()` needs these lines, in this order:

1. `parser = argparse.ArgumentParser(description="...")`, with your
   description between the quotation marks.

2. `parser.add_argument("filename", help="...")`, with your help
   text between the quotation marks.

3. `args = parser.parse_args()`.

4. `ledger = read_ledger(args.filename)`.

5. The two lines of the `for` loop, which do not change.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the message first.

A `NameError` that names `argparse` means that the line
`import argparse` is missing at the top of the file.

A message that begins with `usage` comes from the parser, and the
code has no mistake. The second line says what is wrong with the
command. If it says `unrecognized arguments`, check that the name in
`add_argument()` is `"filename"`, with no `--` before it.

An `IndentationError` means that the spaces at the start of a line
are wrong. Each line in the body of `main()` begins with four
spaces.
```

If the hints were not enough, the box below holds a solution. It
opens after you have saved the file, or after you have clicked
`Check`.

```{attempt}
:id: filename-not-started
:check: filename-works
:expect: So main() does not use the file name from the command line yet
```

````{attempt}
:id: filename-no-file
:check: filename-works
:expect: There is no file spending.py in your work directory

```{file-delete}
:path: spending.py
```
````

````{attempt}
:id: filename-unused
:check: filename-works
:expect: Your program showed the report of spending.csv, with 37 purchases

```{file-write}
:path: spending.py
:from: answers/filename-unused.py
```
````

````{attempt}
:id: filename-no-import
:check: filename-works
:expect: Python stopped with an error. The last line of the error is: NameError

```{file-write}
:path: spending.py
:from: answers/filename-no-import.py
```
````

````{attempt}
:id: filename-option
:check: filename-works
:expect: Your program did not accept this command

```{file-write}
:path: spending.py
:from: answers/filename-option.py
```
````

````{attempt}
:id: filename-silent
:check: filename-works
:expect: your program showed nothing

```{file-write}
:path: spending.py
:from: answers/filename-silent.py
```
````

````{attempt}
:id: filename-argv
:check: filename-works
:expect: A program that uses argparse then shows a short message that begins with usage

```{file-write}
:path: spending.py
:from: answers/filename-argv.py
```
````

````{attempt}
:id: filename-extra
:check: filename-works
:expect: The first line that your program showed is _check_two_purchases.csv and it must be Purchases: 2

```{file-write}
:path: spending.py
:from: answers/filename-extra.py
```
````

````{hint}
:title: Show me a solution
:unlock: "filename-works" in failed_checks or "filename-works" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes the whole file `spending.py` again,
with a working function `main()`. It replaces what the file holds
now. The second action runs the program. Compare the function with
your own.

The new line at the top of the file is `import argparse`. The new
function is:

```python
def main():
    parser = argparse.ArgumentParser(description="Report on the purchases in a CSV file.")
    parser.add_argument("filename", help="the CSV file that holds the purchases")
    args = parser.parse_args()

    ledger = read_ledger(args.filename)
    for line in report_lines(ledger):
        print(line)
```

```{file-write}
:id: filename-solution
:title: Write a solution to spending.py
:path: spending.py
:from: answers/filename-solution.py
:open: true
```

```{execute}
:id: filename-run
:wait: prompt
python spending.py trip.csv
```
````

```{verify}
:id: filename-works
:label: spending.py reads the file that the command names
:trigger: file-saved spending.py; after:filename-run
import os, subprocess, sys
from pathlib import Path

assert Path("spending.py").exists(), "There is no file spending.py in your work directory. Open the box with the title Show me a solution on this page. Its first action writes the file again."

def run_program(*words):
    command = " ".join(["python", "spending.py", *words])
    try:
        run = subprocess.run(
            [sys.executable, "spending.py", *words],
            capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The check ran {command} and your program did not end after 5 seconds. Look for a loop that never ends.") from None
    last = (run.stderr.strip().splitlines() or ["no message"])[-1]
    first = (run.stdout.strip().splitlines() or [""])[0]
    return command, run.returncode, first, last

small = Path("_check_two_purchases.csv")
small.write_text("date,description,amount,category\n2026-04-02,Tea,3.10,food\n2026-04-03,Bus ticket,2.80,transport\n")
try:
    command, code, first, last = run_program(small.name)
finally:
    small.unlink()
note = "The file _check_two_purchases.csv is a file of 2 purchases that the check made."
assert code != 2, f"The check ran {command}. Your program did not accept this command. Add the file name with parser.add_argument(\"filename\"). A name with no -- before it is a command line argument that the command must always give. Your program said: {last}"
assert code == 0, f"The check ran {command} and Python stopped with an error. The last line of the error is: {last}"
assert first, f"The check ran {command} and your program showed nothing. Did you save the file? Check that the last two lines of the file are still the test of __name__ and the call main()."
assert first != "Purchases: 37", f"The check ran {command}. {note} Your program showed the report of spending.csv, with 37 purchases. So main() does not use the file name from the command line yet. Make a parser, add the command line argument filename, and give args.filename to read_ledger(). Save the file after you change it."
assert first == "Purchases: 2", f"The check ran {command}. {note} The first line that your program showed is {first} and it must be Purchases: 2. Keep the loop that prints the lines of report_lines() as it was. Save the file after you change it."
command, code, first, last = run_program()
assert code == 2, f"The check ran {command}, with no file name. A program that uses argparse then shows a short message that begins with usage. Your program stopped in another way. Read the command line with argparse, not with sys.argv. The last line that your program showed is: {last}"
print("Correct. Your program reported the 2 purchases of a file that the check made. With no file name, it showed how to use it.")
```

## What changed

The name `spending.csv` is no longer in the code. The person who
runs the program chooses the file, in the command. If you have not
done it yet, run the program on the other file too:

```
python spending.py spending.csv
```

The command `python spending.py`, with no file name, does not show
a report any more. The parser shows how to use the program:

```
usage: spending.py [-h] filename
spending.py: error: the following arguments are required: filename
```
