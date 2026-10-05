---
title: Every one is a string
requires: [quiz:argv-numbers, verify:add-works]
---

# Every one is a string

A command is a line of text. The shell divides it into words, and
Python puts each word in the list `sys.argv` as it is. Python does
not look at what a word means. So every item of `sys.argv`
is a string, including a word that looks like a number.

This matters as soon as a program needs a number. Read this command:

```
python show_arguments.py 3 4
```

```{quiz}
:id: argv-numbers
:title: Predict the list
question: "What will the terminal show for this command?"
options:
  - { text: "`['show_arguments.py', 3, 4]`", explanation: "With no quotation marks, `3` and `4` are integers. Python does not turn a command line argument into a number for you." }
  - { text: "`['show_arguments.py', '3', '4']`", correct: true }
  - { text: "`['show_arguments.py', '3 4']`", explanation: "The shell divides the command at each space, so `3` and `4` are two items." }
  - { text: "`['show_arguments.py', 7]`", explanation: "Python does not add the command line arguments. It gives them to the script as they are." }
explanation: "Each command line argument is a string, so the list holds the strings `'3'` and `'4'`."
```

Click the action below to run the command and compare.

```{execute}
:id: run-show-numbers
:wait: prompt
python show_arguments.py 3 4
```

The terminal shows:

```
['show_arguments.py', '3', '4']
```

## Reading one item

`sys.argv` is a list, so you read one item with an index. The item
at index `0` is the name of the script. So the first command line
argument is `sys.argv[1]`, and the second is `sys.argv[2]`.

To get a number from one of these strings, use `int()`. The function
`int()` makes an integer from a string: `int("3")` gives the integer
`3`. The workshop **Reading and writing files** used it for the same
reason, because everything that a program reads from a file is a
string too.

## Your task

Write a script with the name `add.py`. It adds two whole numbers
that the command gives, and shows the sum.

- It reads the two numbers from `sys.argv[1]` and `sys.argv[2]`.

- It shows the sum with `print()`, and it shows nothing more.

Two examples:

| The command | What the terminal shows |
|------|------|
| `python add.py 3 4` | `7` |
| `python add.py 10 25` | `35` |

```{attempt}
:id: add-missing
:check: add-works
:expect: There is no file add.py in your work directory
```

The action below makes the file and opens it in the editor. The file
holds one comment.

```{file-write}
:id: make-add
:title: Make the file add.py and open it
:path: add.py
:open: true
# Write your program below this line.

```

Type your program under the comment. Then save the file: hold `Ctrl`
and press `S`. On a Mac, hold `Cmd` and press `S`. While a file has
changes that are not saved, its tab shows a dot. Python reads the
file from the disk, so it runs only what you have saved.

Then run your script. Click in the terminal, type the command, and
press `Enter`:

```
python add.py 3 4
```

```{hint}
:title: Hint: how to begin
The first line of the script is `import sys`. Without it, Python does
not know the name `sys`.

Then read the two command line arguments into two names of your own,
such as `first` and `second`.
```

```{hint}
:title: Hint: the sum is wrong
If your script shows `34` for `python add.py 3 4`, it has joined two
strings. For strings, `+` puts one after the other.

Turn each string into an integer before you add:
`first = int(sys.argv[1])`.
```

```{hint}
:title: Hint: I see an error message
Read the last line of the error message first.

A `NameError` that names `sys` means that the line `import sys` is
missing.

An `IndexError` means that the list has no item at that index. Check
that your command gives two numbers after `add.py`.
```

If the hints were not enough, the box below holds a solution. It
opens after you have saved your file, or after you have clicked
`Check`.

```{attempt}
:id: add-empty
:check: add-works
:expect: your program showed nothing
```

````{attempt}
:id: add-joined
:check: add-works
:expect: your program showed 34

```{file-write}
:path: add.py
import sys

print(sys.argv[1] + sys.argv[2])
```
````

````{attempt}
:id: add-error
:check: add-works
:expect: Python stopped with an error. The last line of the error is: NameError

```{file-write}
:path: add.py
first = int(sys.argv[1])
second = int(sys.argv[2])
print(first + second)
```
````

````{attempt}
:id: add-words
:check: add-works
:expect: Your program showed The sum is 7 and it must show 7

```{file-write}
:path: add.py
import sys

print("The sum is", int(sys.argv[1]) + int(sys.argv[2]))
```
````

````{attempt}
:id: add-fixed
:check: add-works
:expect: Your program showed 7 and it must show 35

```{file-write}
:path: add.py
print(3 + 4)
```
````

````{attempt}
:id: add-loop
:check: add-works
:expect: your program did not end after 5 seconds

```{file-write}
:path: add.py
import sys

while True:
    pass
```
````

````{hint}
:title: Show me a solution
:unlock: "add-works" in failed_checks or "add-works" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes a working program to the file `add.py`.
It replaces what the file holds now. The second action runs the
program. Compare the program with your own.

```{file-write}
:id: add-solution
:title: Write a solution to add.py
:path: add.py
:open: true
import sys

first = int(sys.argv[1])
second = int(sys.argv[2])
print(first + second)
```

```{execute}
:id: add-run
:wait: prompt
python add.py 3 4
```
````

```{verify}
:id: add-works
:label: add.py adds the two numbers of the command
:trigger: file-saved add.py; after:add-run
import os, subprocess, sys
from pathlib import Path

assert Path("add.py").exists(), "There is no file add.py in your work directory. Click the action above that makes the file."

def run_add(first, second):
    try:
        run = subprocess.run(
            [sys.executable, "add.py", first, second],
            capture_output=True, text=True, timeout=5, stdin=subprocess.DEVNULL,
            env={**os.environ, "PYTHON_COLORS": "0"},
        )
    except subprocess.TimeoutExpired:
        raise AssertionError(f"The check ran python add.py {first} {second} and your program did not end after 5 seconds. Look for a loop that never ends.") from None
    if run.returncode != 0:
        last = (run.stderr.strip().splitlines() or ["no message"])[-1]
        raise AssertionError(f"The check ran python add.py {first} {second} and Python stopped with an error. The last line of the error is: {last}")
    return run.stdout.strip()

shown = run_add("3", "4")
assert shown, "The check ran python add.py 3 4 and your program showed nothing. Did you save the file? Use print() to show the sum."
assert shown != "34", "The check ran python add.py 3 4 and your program showed 34. Every item of sys.argv is a string, and + joins two strings. Turn each one into a number with int() before you add them. Save the file after you change it."
assert shown == "7", f"The check ran python add.py 3 4. Your program showed {shown} and it must show 7. Add the two numbers, and show only the sum. Save the file after you change it."
shown = run_add("10", "25")
assert shown == "35", f"The check ran python add.py 10 25. Your program showed {shown} and it must show 35. Read the two numbers from sys.argv[1] and sys.argv[2], so that the program works with every pair of numbers. Save the file after you change it."
print("Correct. Your program showed 7 for python add.py 3 4, and 35 for python add.py 10 25.")
```

## What `sys.argv` does not do

Your script works when the command gives two numbers. Now think
about a person who types `python add.py 3`, with one number. The
list has no item at index `2`, so Python stops with an `IndexError`
and shows a traceback. That message is about the code. It does not
tell the person what the program needs.

A program that reads `sys.argv` itself must also test the number of
items, write its own messages, and explain itself to the person who
uses it. Python has a module that does all of this for you. The next
page shows it.
