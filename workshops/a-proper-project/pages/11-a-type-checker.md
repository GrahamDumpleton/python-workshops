---
title: A type checker
requires: [quiz:predict-checker, verify:checker-clean]
---

# A type checker

Python does not check type hints. Another program can. On this page
you watch one at work.

## What a type checker is

A **type checker** is a program that reads your code and its type
hints, and looks for places where the two do not agree. Like the
linter, it does not run the program. For example, it reports a
function whose hint says that it returns a string, when the body
returns a number. And it reports a call that gives a function a value
of the wrong type.

Why use one? A mistake of type is often found only when a program
runs, and perhaps only with some data. A type checker finds it before
the program runs, in every function that has hints.

`mypy` is a type checker. You installed it two pages ago. The command
`python -m mypy src` checks every module in the directory `src`.

## Run it

This command is new, so the action below runs it for you.

```{execute}
:id: first-mypy
:title: Run the type checker
:wait: prompt
python -m mypy src
```

It says `Success: no issues found in 6 source files`. The six files
are the six modules of the package. The hints and the code agree.

## A hint that is wrong

Now the hint of `month` is changed on purpose, so that it says that
`month` returns an `int`. The body still returns the first seven
characters of the date, which are a string.

```{quiz}
:id: predict-checker
:title: Predict
question: "The line is now `def month(self) -> int:`, and the body has not changed. What does `python -m mypy src` do?"
options:
  - { text: "It says `Success`, because the program still runs", explanation: "`mypy` does not run the program. It compares the hint with what the body returns, and they do not agree." }
  - { text: "It reports one problem, in the file `models.py`: the method returns a `str`, and the hint says `int`", correct: true }
  - { text: "It changes the hint back to `str` for you", explanation: "A type checker only reports. It changes no file. You decide what is wrong: the hint, or the code." }
explanation: "`mypy` knows that `self.date` is a `str`, from the type hint of the field `date`. So `self.date[:7]` is a `str` too, and that does not agree with `-> int`. Click the two actions below to see it."
```

```{editor-replace}
:id: make-hint-wrong
:title: Change the hint of month to int
:path: src/spending/models.py
:match: def month\(self\)\s*->\s*\w+\s*:
:regex: true
def month(self) -> int:
```

```{execute}
:id: mypy-wrong
:title: Run the type checker again
:wait: prompt
python -m mypy src
```

`mypy` shows this, and a note under the action may say that the
command ended with status 1:

```
src/spending/models.py:15: error: Incompatible return value type (got "str", expected "int")  [return-value]
Found 1 error in 1 file (checked 6 source files)
```

The line number may be different if your file has another number of
lines. The message says: on line 15, the value that is returned is a
`str`, and the hint expected an `int`.

```{attempt}
:id: checker-finds-problem
:check: checker-clean
:expect: mypy finds a problem
```

Python itself still runs the program with the wrong hint, and the
report is the same. Only the type checker sees the problem.

## Correct the hint

The code is right and the hint is wrong, so the hint changes back.
Click the two actions below.

```{editor-replace}
:id: make-hint-right
:title: Change the hint of month back to str
:path: src/spending/models.py
:match: def month(self) -> int:
def month(self) -> str:
```

```{execute}
:id: mypy-right
:title: Run the type checker once more
:wait: prompt
python -m mypy src
```

```{verify}
:id: checker-clean
:label: mypy finds no problem in src
:trigger: after:mypy-right; terminal-output "Success: no issues"
import os, subprocess

plain = {name: value for name, value in os.environ.items() if name not in ("FORCE_COLOR", "CLICOLOR_FORCE")}
plain["NO_COLOR"] = "1"
plain["MYPY_FORCE_COLOR"] = "0"
run = subprocess.run(
    [".venv/bin/mypy", "src"],
    capture_output=True, text=True, timeout=120, stdin=subprocess.DEVNULL, env=plain,
)
if run.returncode != 0:
    first = (run.stdout.strip().splitlines() or ["(nothing)"])[0]
    raise AssertionError(f"mypy finds a problem. The first line that it shows is: {first}. Read the line: it names the file and the line number. Change the hint or the code so that they agree, save the file, and run python -m mypy src again.")
print("mypy finds no problem: the type hints and the code agree.")
```

Many projects run the linter, the formatter, the type checker and the
tests each time before a change is kept. Then a mistake is found
within seconds of the change that made it.
