---
title: A password checker
when: track == "password-checker"
requires: [verify:checker-scores, verify:checker-tests]
---

# A password checker

A program of another person can guess a short password quickly, and
also a password that has only small letters. Many websites test a new password
against a few rules before they accept it. Your program does the
same: it gives a password a score, and it says which rules the
password breaks.

Then you write **tests** for it. A test is code that checks other
code. When you change your program later, you run the tests, and they
tell you at once if the change broke something.

## What the program does

The program is a script named `checker.py`, in your work directory.
You run it with one **command line argument**, which is a word after
the name of the program in a command. The word is the password to
check:

```
python checker.py Tea-time4
```

A good password follows five rules. For each rule that a password
breaks, the program shows one line, exactly as written here, in this
order:

| Rule | The line for a password that breaks it |
|------|----------------------------------------|
| It has 8 characters or more. | `It is shorter than 8 characters.` |
| It has at least one small letter, such as `a`. | `It has no small letter.` |
| It has at least one capital letter, such as `A`. | `It has no capital letter.` |
| It has at least one digit, such as `7`. | `It has no digit.` |
| It has at least one other character, which is not a letter and not a digit, such as `-` or `_`. | `It has no other character, such as - or _.` |

Before those lines, the program shows the score: the number of rules
that the password follows, of 5.

```
python checker.py Tea-time4
Score: 5 of 5
```

```
python checker.py tea
Score: 1 of 5
It is shorter than 8 characters.
It has no capital letter.
It has no digit.
It has no other character, such as - or _.
```

The program has these parts:

- A function `problems(password)`. It takes the password as a string,
  and it gives back a list of the lines for the rules that the
  password breaks, in the order of the table. For a password that
  follows every rule, it gives back the empty list `[]`. It shows
  nothing itself. For example, `problems("Tea-ti4")` gives back
  `["It is shorter than 8 characters."]`.

- A function `main()`, which reads the password from the command line,
  calls `problems()`, and shows the score and the lines.

- At the end, the two lines that call `main()` only when the file runs
  as a script: `if __name__ == "__main__":` and `main()` under it. The
  tests import `checker.py`, and these two lines stop `main()` from
  running when they do.

Use made-up passwords only. The shell keeps a list of the commands
that you type, so never type a real password in a command. Use only
letters, digits, `-` and `_` in the passwords that you type, because
the shell gives some other characters a meaning of their own.

## Tools that you may need

| Code | What it gives |
|------|---------------|
| `len(password)` | the number of characters in the string |
| `for character in password:` | a loop that gives each character of the string, one at a time |
| `character.islower()` | `True` when the character is a small letter |
| `character.isupper()` | `True` when the character is a capital letter |
| `character.isdigit()` | `True` when the character is a digit, `0` to `9` |

A character that gives `False` for all three methods is an "other
character". The library reference describes
[these methods of a string](https://docs.python.org/3/library/stdtypes.html#str.islower).

## Part 1: the checker

First make the file. Click the action below, so that the file browser
shows your work directory.

```{file-browser-reveal}
:id: checker-show-files
:title: Show your work directory in the file browser
:path: access.log
```

In the file browser, click the empty space under the names of the
files with the right button of the mouse. On a Mac with one button,
hold `Ctrl` and click. Click `New File`, type the name `checker.py`,
and press `Enter`. Then double-click `checker.py` to open it in the
editor.

Write the program in the editor. Save the file, and run it in the
terminal with a few passwords of your own, such as:

```
python checker.py tea
```

When the program shows the right score and the right lines, click
`Check`. The check runs your program with five passwords, imports it,
and calls your function `problems()`.

````{hint}
:title: "Hint: what to look at"
In `problems()`, test the length first, with `len(password) < 8`.

For the other four rules, the function must know whether the password
has at least one character of each kind. Before the loop, make four
names with the value `False`, such as `small = False`. In the loop
over the characters, set the right name to `True`: an `if` with
`character.islower()`, then `elif` for the capital letter and for the
digit, and `else` for any other character.

After the loop, test each name with `if not small:`, and append the
line of that rule to the list.

The workshop **Taking arguments** used `argparse` to read a command
line argument. The same three lines, with
`parser.add_argument("password")`, give the password in
`args.password`.
````

```{hint}
:title: "Hint: the shape of the code"
1. At the top of the file, import `argparse`.

2. Write `def problems(password):`. In it, make an empty list `found`.
   If `len(password) < 8`, append `"It is shorter than 8 characters."`.

3. Make the four names `small`, `capital`, `digit` and `other`, each
   `False`. Loop over the characters of `password`, and set one of the
   four to `True` for each character.

4. After the loop, for each of the four names that is still `False`,
   append its line to `found`, in the order of the table. Then
   `return found`.

5. Write `def main():`. Read the password with `argparse`. Give the
   name `found` to `problems(args.password)`. Show
   `f"Score: {5 - len(found)} of 5"`, and then each line of `found`
   with a `for` loop.

6. At the end of the file, at the left side, write
   `if __name__ == "__main__":` and, under it with four spaces,
   `main()`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check` one time.

```{attempt}
:id: scores-no-file
:check: checker-scores
:expect: There is no file checker.py in your work directory
```

````{attempt}
:id: scores-empty
:check: checker-scores
:expect: your program showed nothing

```{file-write}
:path: checker.py
```
````

````{attempt}
:id: scores-error
:check: checker-scores
:expect: Its last line is: NameError

```{file-write}
:path: checker.py
print(password)
```
````

````{attempt}
:id: scores-counts-problems
:check: checker-scores
:expect: Your score counts the rules that the password breaks

```{file-write}
:path: checker.py
import sys

password = sys.argv[1]
found = []
if len(password) < 8:
    found.append("It is shorter than 8 characters.")
if not any(c.islower() for c in password):
    found.append("It has no small letter.")
if not any(c.isupper() for c in password):
    found.append("It has no capital letter.")
if not any(c.isdigit() for c in password):
    found.append("It has no digit.")
if all(c.isalnum() for c in password):
    found.append("It has no other character, such as - or _.")
print(f"Score: {len(found)} of 5")
for line in found:
    print(line)
```
````

````{attempt}
:id: scores-order
:check: checker-scores
:expect: not in the order of the rules

```{file-write}
:path: checker.py
import sys

password = sys.argv[1]
found = []
if not any(c.islower() for c in password):
    found.append("It has no small letter.")
if not any(c.isupper() for c in password):
    found.append("It has no capital letter.")
if not any(c.isdigit() for c in password):
    found.append("It has no digit.")
if all(c.isalnum() for c in password):
    found.append("It has no other character, such as - or _.")
if len(password) < 8:
    found.append("It is shorter than 8 characters.")
print(f"Score: {5 - len(found)} of 5")
for line in found:
    print(line)
```
````

````{attempt}
:id: scores-wording
:check: checker-scores
:expect: line 3 that your program showed is: It has no capital.

```{file-write}
:path: checker.py
import sys

password = sys.argv[1]
found = []
if len(password) < 8:
    found.append("It is shorter than 8 characters.")
if not any(c.islower() for c in password):
    found.append("It has no small letter.")
if not any(c.isupper() for c in password):
    found.append("It has no capital.")
if not any(c.isdigit() for c in password):
    found.append("It has no digit.")
if all(c.isalnum() for c in password):
    found.append("It has no other character, such as - or _.")
print(f"Score: {5 - len(found)} of 5")
for line in found:
    print(line)
```
````

````{attempt}
:id: scores-no-guard
:check: checker-scores
:expect: when another file imports checker.py

```{file-write}
:path: checker.py
import sys


def problems(password):
    found = []
    if len(password) < 8:
        found.append("It is shorter than 8 characters.")
    if not any(c.islower() for c in password):
        found.append("It has no small letter.")
    if not any(c.isupper() for c in password):
        found.append("It has no capital letter.")
    if not any(c.isdigit() for c in password):
        found.append("It has no digit.")
    if all(c.isalnum() for c in password):
        found.append("It has no other character, such as - or _.")
    return found


found = problems(sys.argv[1])
print(f"Score: {5 - len(found)} of 5")
for line in found:
    print(line)
```
````

````{attempt}
:id: scores-no-function
:check: checker-scores
:expect: has no function named problems

```{file-write}
:path: checker.py
import sys


def rules(password):
    found = []
    if len(password) < 8:
        found.append("It is shorter than 8 characters.")
    if not any(c.islower() for c in password):
        found.append("It has no small letter.")
    if not any(c.isupper() for c in password):
        found.append("It has no capital letter.")
    if not any(c.isdigit() for c in password):
        found.append("It has no digit.")
    if all(c.isalnum() for c in password):
        found.append("It has no other character, such as - or _.")
    return found


if __name__ == "__main__":
    found = rules(sys.argv[1])
    print(f"Score: {5 - len(found)} of 5")
    for line in found:
        print(line)
```
````

````{attempt}
:id: scores-function-prints
:check: checker-scores
:expect: gives None and it must give the list

```{file-write}
:path: checker.py
import sys


def rules(password):
    found = []
    if len(password) < 8:
        found.append("It is shorter than 8 characters.")
    if not any(c.islower() for c in password):
        found.append("It has no small letter.")
    if not any(c.isupper() for c in password):
        found.append("It has no capital letter.")
    if not any(c.isdigit() for c in password):
        found.append("It has no digit.")
    if all(c.isalnum() for c in password):
        found.append("It has no other character, such as - or _.")
    return found


def problems(password):
    for line in rules(password):
        print(line)


if __name__ == "__main__":
    found = rules(sys.argv[1])
    print(f"Score: {5 - len(found)} of 5")
    for line in found:
        print(line)
```
````

````{hint}
:title: Show me a solution
:unlock: "checker-scores" in failed_checks or "checker-scores" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes a working program into `checker.py` and
opens it. Read it, and compare it with your own. The second action
runs it in the terminal.

```{file-write}
:id: scores-solution
:title: Write a solution into checker.py
:path: checker.py
:open: true
import argparse


def problems(password):
    found = []
    if len(password) < 8:
        found.append("It is shorter than 8 characters.")

    small = False
    capital = False
    digit = False
    other = False
    for character in password:
        if character.islower():
            small = True
        elif character.isupper():
            capital = True
        elif character.isdigit():
            digit = True
        else:
            other = True

    if not small:
        found.append("It has no small letter.")
    if not capital:
        found.append("It has no capital letter.")
    if not digit:
        found.append("It has no digit.")
    if not other:
        found.append("It has no other character, such as - or _.")
    return found


def main():
    parser = argparse.ArgumentParser(description="Check a password against five rules.")
    parser.add_argument("password", help="the password to check")
    args = parser.parse_args()

    found = problems(args.password)
    print(f"Score: {5 - len(found)} of 5")
    for line in found:
        print(line)


if __name__ == "__main__":
    main()
```

```{execute}
:id: scores-run
:title: Check the password tea
:wait: prompt
python checker.py tea
```
````

```{verify}
:id: checker-scores
:label: checker.py gives the right score and the right lines
:trigger: terminal-output /Score: \d of 5/; file-saved checker.py; after:scores-run
import json, os, subprocess, sys
from pathlib import Path

assert Path("checker.py").exists(), "There is no file checker.py in your work directory. Make it in the file browser, in the same list as access.log, and save it."
plain = {**os.environ, "PYTHON_COLORS": "0"}


def rules(password):
    found = []
    if len(password) < 8:
        found.append("It is shorter than 8 characters.")
    if not any(character.islower() for character in password):
        found.append("It has no small letter.")
    if not any(character.isupper() for character in password):
        found.append("It has no capital letter.")
    if not any(character.isdigit() for character in password):
        found.append("It has no digit.")
    if all(character.islower() or character.isupper() or character.isdigit() for character in password):
        found.append("It has no other character, such as - or _.")
    return found


def run(arguments, what):
    try:
        done = subprocess.run([sys.executable, *arguments], capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL, env=plain)
    except subprocess.TimeoutExpired:
        raise AssertionError(f"When the check ran {what}, your program did not end after 10 seconds. Look for a loop that never ends.") from None
    return done


passwords = ["Tea-time4", "tea", "ROAD-12", "abcdefgh", "Lima_2026"]
for password in passwords:
    what = f"python checker.py {password}"
    done = run(["checker.py", password], what)
    if done.returncode != 0:
        errors = done.stderr.strip().splitlines()
        last = errors[-1] if errors else "(Python showed no message)"
        raise AssertionError(f"Python stopped with an error when the check ran {what}. Run the same command in the terminal, and read the whole error there. Its last line is: {last}")
    shown = done.stdout.strip().splitlines()
    assert shown, f"The check ran {what}, and your program showed nothing. Did you save the file? Use print() to show the score and the lines."
    found = rules(password)
    wanted = [f"Score: {5 - len(found)} of 5", *found]
    if shown[0] != wanted[0] and shown[0] == f"Score: {len(found)} of 5":
        raise AssertionError(f"The check ran {what}, and your program showed {shown[0]}. Your score counts the rules that the password breaks. The score must count the rules that the password follows: 5 minus the number of lines. For {password} the first line must be {wanted[0]}")
    if shown != wanted and sorted(shown[1:]) == sorted(wanted[1:]) and shown[0] == wanted[0]:
        raise AssertionError(f"The check ran {what}. Your program shows the right lines, but not in the order of the rules. The order must be the order of the table: the length first, then the small letter, the capital letter, the digit and the other character.")
    for number, (line, expected) in enumerate(zip(shown, wanted), start=1):
        if line != expected:
            raise AssertionError(f"The check ran {what}, and line {number} that your program showed is: {line}  It must be: {expected}  The lines must be exactly as they are written in the table. Change the program, save it, and click Check again.")
    if len(shown) != len(wanted):
        raise AssertionError(f"The check ran {what}. Your program must show {len(wanted)} lines, and it showed {len(shown)}. The lines must be: {' / '.join(wanted)}")
done = run(["-c", "import checker"], "python -c \"import checker\"")
if done.returncode != 0 or done.stdout.strip():
    raise AssertionError("Your program runs by itself when another file imports checker.py, and the tests of part 2 import it. Put the code that reads the command line inside a function main(), and call it at the end of the file only under if __name__ == \"__main__\":")
probe = "import contextlib, io, json, sys\nimport checker\nfunction = getattr(checker, 'problems', None)\nresults = None\nif callable(function):\n    results = []\n    for password in sys.argv[1:]:\n        with contextlib.redirect_stdout(io.StringIO()):\n            result = function(password)\n        results.append(result if isinstance(result, list) else repr(result))\nprint(json.dumps(results))"
done = run(["-c", probe, *passwords], "the function problems()")
if done.returncode != 0:
    errors = done.stderr.strip().splitlines()
    last = errors[-1] if errors else "(Python showed no message)"
    raise AssertionError(f"Python stopped with an error when the check called your function problems(). The last line of the error is: {last}")
results = json.loads(done.stdout.strip().splitlines()[-1])
if results is None:
    raise AssertionError("Your program shows the right lines, but checker.py has no function named problems. The tests of part 2 call it. Write the function def problems(password): which gives back the list of lines, and use it in main().")
for password, result in zip(passwords, results):
    expected = rules(password)
    if result != expected:
        extra = " A function that shows the lines with print() and has no return line gives back None. Give the list back with return." if result == "None" else ""
        raise AssertionError(f"problems(\"{password}\") gives {result} and it must give the list {expected}.{extra}")
print("Correct. The check ran your program with the passwords " + ", ".join(passwords) + ". Each score and each line is right, and the function problems() gives back the right list for each one.")
```

Your checker works. In the second part you write the tests that keep
it working.

## Part 2: the tests

A test calls the function with a value that you choose, and compares
what it gives back with the answer that you know is right. The
workshop **Testing your code** used `assert` for this:

```python
assert problems("Tea-time4") == []
```

When the comparison is true, `assert` does nothing, and Python
continues with the next line. When it is false, Python stops with an
`AssertionError`, and the traceback shows the line of the test that
failed.

Make a second file, `test_checker.py`, beside `checker.py`, in the
same way as the first. It holds:

- the line `from checker import problems`

- tests with `assert`, at least one for each of these:
  a password that follows every rule, a password that is too short, a
  password with no digit, and a password with no capital letter

- as its last line, `print("All the tests passed.")`, which runs only
  when every `assert` above it was true

Save the file, and run it in the terminal:

```
python test_checker.py
```

When it shows `All the tests passed.`, click `Check`. The check runs
your tests. Then it runs them again four times, each time with a copy
of `checker.py` that has a bug that the check planted, in a directory
of its own, `_check_tests`. Good tests fail when the code has a bug.

````{hint}
:title: "Hint: what to look at"
Each test is one line: `assert`, a call of `problems()`, `==`, and
the list that the call must give back. For a short password that
follows the other rules, such as `Tea-ti4`, the list holds one line:

```python
assert problems("Tea-ti4") == ["It is shorter than 8 characters."]
```

Choose each password so that it breaks one rule only. Then the list
has one line, and the test says clearly which rule it tests.
````

```{hint}
:title: "Hint: the shape of the code"
1. The first line is `from checker import problems`.

2. Test a password that follows every rule: `Tea-time4` must give `[]`.

3. Test a password that is too short: `Tea-ti4`.

4. Test a password with no digit: `Tea-time`.

5. Test a password with no capital letter: `tea-time4`.

6. The last line is `print("All the tests passed.")`.
```

If the hints were not enough, the box below holds a solution. It opens
after you have clicked `Check` one time.

```{attempt}
:id: tests-no-file
:check: checker-tests
:expect: There is no file test_checker.py in your work directory
```

````{attempt}
:id: tests-fail
:check: checker-tests
:expect: One of your tests failed

```{file-write}
:path: test_checker.py
from checker import problems

assert problems("Tea-time4") == ["It is shorter than 8 characters."]
print("All the tests passed.")
```
````

````{attempt}
:id: tests-no-print
:check: checker-tests
:expect: The last line that python test_checker.py shows must be: All the tests passed.

```{file-write}
:path: test_checker.py
from checker import problems

assert problems("Tea-time4") == []
```
````

````{attempt}
:id: tests-only-good
:check: checker-tests
:expect: never finds a problem

```{file-write}
:path: test_checker.py
from checker import problems

assert problems("Tea-time4") == []
print("All the tests passed.")
```
````

````{attempt}
:id: tests-no-digit-test
:check: checker-tests
:expect: forgets the rule of the digit

```{file-write}
:path: test_checker.py
from checker import problems

assert problems("Tea-time4") == []
assert problems("Tea-ti4") == ["It is shorter than 8 characters."]
print("All the tests passed.")
```
````

````{attempt}
:id: tests-no-capital-test
:check: checker-tests
:expect: forgets the rule of the capital letter

```{file-write}
:path: test_checker.py
from checker import problems

assert problems("Tea-time4") == []
assert problems("Tea-ti4") == ["It is shorter than 8 characters."]
assert problems("Tea-time") == ["It has no digit."]
print("All the tests passed.")
```
````

````{hint}
:title: Show me a solution
:unlock: "checker-tests" in failed_checks or "checker-tests" in passed_checks
:locked: Try the task first. This opens after the check below has run.
The first action below writes working tests into `test_checker.py`
and opens the file. Compare it with your own. The second action runs
the tests in the terminal.

```{file-write}
:id: tests-solution
:title: Write a solution into test_checker.py
:path: test_checker.py
:open: true
from checker import problems

assert problems("Tea-time4") == []
assert problems("Tea-ti4") == ["It is shorter than 8 characters."]
assert problems("Tea-time") == ["It has no digit."]
assert problems("tea-time4") == ["It has no capital letter."]
assert len(problems("tea")) == 4

print("All the tests passed.")
```

```{execute}
:id: tests-run
:title: Run the tests
:wait: prompt
python test_checker.py
```
````

```{verify}
:id: checker-tests
:label: test_checker.py passes, and it finds four planted bugs
:trigger: terminal-output "All the tests passed"; after:tests-run
import os, shutil, subprocess, sys
from pathlib import Path

assert Path("test_checker.py").exists(), "There is no file test_checker.py in your work directory. Make it in the file browser, beside checker.py, and save it."
assert Path("checker.py").exists(), "There is no file checker.py in your work directory. The tests import it, so complete part 1 first."
plain = {**os.environ, "PYTHON_COLORS": "0"}


def run(where):
    try:
        return subprocess.run([sys.executable, "test_checker.py"], cwd=where, capture_output=True, text=True, timeout=10, stdin=subprocess.DEVNULL, env=plain)
    except subprocess.TimeoutExpired:
        raise AssertionError("Your tests did not end after 10 seconds. Look for a loop that never ends.") from None


done = run(".")
if done.returncode != 0:
    errors = done.stderr.strip().splitlines()
    last = errors[-1] if errors else "(Python showed no message)"
    if last.startswith("AssertionError"):
        raise AssertionError("One of your tests failed with your own checker.py. Run python test_checker.py in the terminal: the traceback shows the line of the test that failed. Either the test expects a wrong list, or checker.py has a bug. Compare the list in the test with the table of the rules.")
    raise AssertionError(f"Python stopped with an error when the check ran python test_checker.py. Run the same command in the terminal, and read the whole error there. Its last line is: {last}")
shown = done.stdout.strip().splitlines()
assert shown[-1:] == ["All the tests passed."], f"The last line that python test_checker.py shows must be: All the tests passed. Add print(\"All the tests passed.\") as the last line of test_checker.py. The last line that your tests showed is: {shown[-1] if shown else 'nothing'}"
template = '''def problems(password):
    found = []
    if len(password) < 8 and "length" not in SKIP:
        found.append("It is shorter than 8 characters.")
    if not any(c.islower() for c in password):
        found.append("It has no small letter.")
    if not any(c.isupper() for c in password) and "capital" not in SKIP:
        found.append("It has no capital letter.")
    if not any(c.isdigit() for c in password) and "digit" not in SKIP:
        found.append("It has no digit.")
    if all(c.islower() or c.isupper() or c.isdigit() for c in password):
        found.append("It has no other character, such as - or _.")
    if "all" in SKIP:
        return []
    return found
'''
bugs = [
    ("all", "a checker.py whose function problems never finds a problem, and always gives back []. Add a test with a password that breaks a rule."),
    ("length", "a checker.py that forgets the rule of the length. Add a test with a password that is too short, such as Tea-ti4."),
    ("digit", "a checker.py that forgets the rule of the digit. Add a test with a password that has no digit, such as Tea-time."),
    ("capital", "a checker.py that forgets the rule of the capital letter. Add a test with a password that has no capital letter, such as tea-time4."),
]
place = Path("_check_tests")
try:
    for skip, story in bugs:
        shutil.rmtree(place, ignore_errors=True)
        place.mkdir()
        shutil.copy("test_checker.py", place / "test_checker.py")
        (place / "checker.py").write_text(f"SKIP = {skip!r}\n\n\n" + template)
        planted = run(place)
        if planted.returncode == 0:
            raise AssertionError(f"Your tests pass with your own checker.py. But they also passed with {story}")
finally:
    shutil.rmtree(place, ignore_errors=True)
print("Correct. Your tests pass with your checker.py, and they fail with each of the four copies of checker.py that have a planted bug.")
```

## What you have now

You have a program and the tests that prove that it works. If you
change `checker.py` later, for example to add a sixth rule, run
`python test_checker.py` after the change. If a test fails, you know
at once that the change broke a rule that worked before.

If you want to do more, add a sixth rule: the password must not be
one of a short list of common passwords, such as `Password1!`. Add a
test for it first, see it fail, and then change `checker.py` until
the test passes.
