---
title: A module that reads the command line
requires: [verify:greet-made, quiz:no-name, quiz:usage-line]
---

# A module that reads the command line

The module `argparse` reads the command line arguments for your
program. To **parse** a text is to read it and find its parts, and
the name `argparse` is short for "argument parser". The module comes
with Python, as the module `sys` does.

## Why programs use it

You tell `argparse` which command line arguments your program takes.
In return, it does three things that you would otherwise write
yourself:

- It tests the command. When something is missing or wrong, it shows
  a short message for the person who typed the command, and stops
  the program.

- It writes help text, which says how to use the program.

- It gives each command line argument a name, so your code says
  `args.name` in place of `sys.argv[1]`.

A paper form is a good comparison. A form names each piece of
information, says which pieces you must give, and an office can
refuse a form that is not complete. With `argparse`, you describe
the form, and the command is the completed form.

## A script that uses it

The action below makes a small script with the name `greet.py`. It
takes the name of a person and shows a greeting.

```{attempt}
:id: greet-not-made
:check: greet-made
:expect: The file greet.py does not exist yet
```

```{file-write}
:id: write-greet
:title: Make the file greet.py and open it
:path: greet.py
:open: true
import argparse

parser = argparse.ArgumentParser(description="Show a greeting for one person.")
parser.add_argument("name", help="the name of the person")
args = parser.parse_args()

print(f"Hello, {args.name}")
```

```{verify}
:id: greet-made
:label: The file greet.py exists
:substrate: contents
:trigger: after:write-greet
:message: The file greet.py does not exist yet. Click the action above to make it.
exists greet.py
```

Run it with one name.

```{execute}
:id: run-greet
:wait: prompt
python greet.py Asha
```

The terminal shows:

```
Hello, Asha
```

## What happened

1. `import argparse` makes the module ready to use.

2. `argparse.ArgumentParser(...)` makes an object, and the name
   `parser` refers to it. This object is the **parser**: it knows
   which command line arguments the program takes. The text after
   `description=` says what the program does. The help text shows
   it.

3. `parser.add_argument("name", help="the name of the person")`
   tells the parser that the command must give one command line
   argument, and that its name in the code is `name`. The text
   after `help=` describes it for the help text.

4. `parser.parse_args()` reads the list `sys.argv` for you and tests
   it. It returns an object, and the name `args` refers to it. That
   object has one attribute for each command line argument. An
   **attribute** is a value that belongs to an object, and you read
   it after a dot.

5. `args.name` is the attribute with the name `name`. Its value is
   the string `"Asha"`.

## A command with no name

Now think about the command `python greet.py`, with no name after
it.

```{quiz}
:id: no-name
:title: Predict what the program does
question: "What will happen when you run `python greet.py`?"
options:
  - { text: "The program shows `Hello, None`", explanation: "The parser tests the command before the line with `print()` runs. The command must give a name, so the program stops." }
  - { text: "Python stops with an `IndexError` and shows a traceback", explanation: "That is what a script that reads `sys.argv[1]` does. The parser tests the command first, and shows a message of its own." }
  - { text: "The program shows a short message that says a name is needed, and stops", correct: true }
explanation: "The parser sees that the command line argument `name` is missing. It shows how to use the program and what is missing, and it stops the program. You did not write any code for this."
```

Run the command yourself. Click in the terminal, type the command,
and press `Enter`:

```
python greet.py
```

```{quiz}
:id: usage-line
:title: What the terminal showed
:type: text
:case: false
question: "The terminal shows two lines. Type the first line, exactly as the terminal shows it."
answer:
  - { pattern: "usage:\\s*greet\\.py\\s*\\[-h\\]\\s*name", example: "usage: greet.py [-h] name" }
wrong:
  - { pattern: ".*error.*", explanation: "That is the second line, which says what is wrong. The first line begins with the word `usage`." }
otherwise: "The first line begins with the word `usage`. Type the whole line, with its square brackets."
explanation: "The first line, `usage: greet.py [-h] name`, shows the form of a correct command. The second line, `greet.py: error: the following arguments are required: name`, says what is wrong with this command."
```

````{hint}
:title: Run the command for me
:unlock: "usage-line" in failed_checks or "usage-line" in passed_checks
:locked: Try it yourself first. This opens after you have answered the question above.
The action below types the command in the terminal and presses
`Enter`. Under the action, the panel then says that the command
exited with status 2. That is expected here. A program that stops
because the command is wrong reports a number that is not 0.

```{execute}
:id: run-greet-no-name
:wait: prompt
python greet.py
```
````

The terminal shows:

```
usage: greet.py [-h] name
greet.py: error: the following arguments are required: name
```

This message is for the person who uses the program. It has no
traceback, because the code has no mistake. The command was not
complete.

## The help text

Every program that uses `argparse` also understands `--help`. Click
the action below to ask `greet.py` for its help text.

```{execute}
:id: run-greet-help
:wait: prompt
python greet.py --help
```

The terminal shows:

```
usage: greet.py [-h] name

Show a greeting for one person.

positional arguments:
  name        the name of the person

options:
  -h, --help  show this help message and exit
```

You wrote two pieces of this text: the description of the program,
and the description of `name`. The parser wrote the rest.

- The line that begins with `usage` shows the form of a command.
  Square brackets mark a part that you may leave out. So `[-h]` is a
  part that you may leave out, and `name` is a part that you must
  give.

- Under `positional arguments` is each command line argument that
  the command must give. The parser knows which one it is from its
  position in the command, and this is where the word "positional"
  comes from.

- Under `options` is each part that you may leave out. `-h` is a
  short way to write `--help`. The next page is about options.

With `--help`, the program shows the help text and stops. It does
not show a greeting.
