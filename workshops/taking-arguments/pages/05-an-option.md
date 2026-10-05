---
title: An option
requires: [verify:greeting-added, quiz:option-absent, quiz:option-given]
---

# An option

An **option** is a command line argument that begins with `--`. The
person who types the command may give it or leave it out. Most
options have a value, which is the next word of the command:

```
python greet.py Asha --greeting Salaam
```

Here `--greeting` is the option, and `Salaam` is its value.

## Why options exist

A program often has one thing that it always needs, and several
things that it needs only sometimes. The script `greet.py` always
needs a name. A different word for the greeting is an extra. If that
word were a second command line argument that the command must give,
every command would have to give it, also when `Hello` is good
enough.

An option also says what it is. In the command above, the word
`--greeting` tells the reader what `Salaam` is for. For this reason,
options can come in any order, before or after the name.

You know a similar idea from functions: a parameter with a default
value, and a call that names it, such as
`greet("Asha", greeting="Salaam")`.

## Add an option to the script

The action below writes the script again, with an option. Five lines
are new, and the last line has changed.

```{attempt}
:id: greeting-not-added
:check: greeting-added
:expect: The file greet.py does not have the option --greeting yet
```

```{file-write}
:id: write-greet-option
:title: Write greet.py again, with the option --greeting
:path: greet.py
:open: true
import argparse

parser = argparse.ArgumentParser(description="Show a greeting for one person.")
parser.add_argument("name", help="the name of the person")
parser.add_argument("--greeting", help="the word to greet with, for example Salaam")
args = parser.parse_args()

if args.greeting is None:
    greeting = "Hello"
else:
    greeting = args.greeting
print(f"{greeting}, {args.name}")
```

```{verify}
:id: greeting-added
:label: greet.py has the option --greeting
:substrate: contents
:trigger: after:write-greet-option
:message: The file greet.py does not have the option --greeting yet. Click the action above to write the file again.
contains greet.py --greeting
```

## What is new

- `parser.add_argument("--greeting", help="...")` adds the option.
  The two characters `--` at the start of the name make it an
  option. In the code, its value is the attribute `args.greeting`,
  which is the name with no `--`.

- When the command gives `--greeting Salaam`, the value of
  `args.greeting` is the string `"Salaam"`.

- When the command does not give the option, the value of
  `args.greeting` is `None`. `None` is the value that Python uses to
  say "there is no value here".

- The `if` line tests for that. `args.greeting is None` is `True`
  when the option was not given, and then the script uses the word
  `"Hello"`. The workshop **Two names, one list** showed the
  operator `is`. A test for `None` is always written with `is`.

## Predict, then run

```{quiz}
:id: option-absent
:title: A command with no option
:type: text
question: "What will `python greet.py Asha` show now? Type the text."
answer: "Hello, Asha"
wrong:
  - { text: "None, Asha", explanation: "The value of `args.greeting` is `None`. But the `if` block then makes `greeting` refer to `\"Hello\"`, and the last line shows `greeting`." }
  - { text: "Salaam, Asha", explanation: "`Salaam` is not in the code. It appears only when a command gives `--greeting Salaam`." }
otherwise: "The command gives no option, so `args.greeting` is `None`. Read the `if` block to find the word that the script uses then."
explanation: "The command does not give the option, so `args.greeting` is `None`, and the script uses `\"Hello\"`. The script works as it did before."
```

```{quiz}
:id: option-given
:title: A command with the option first
:type: text
question: "What will `python greet.py --greeting Salaam Asha` show? Here the option comes before the name. Type the text."
answer: "Salaam, Asha"
wrong:
  - { text: "Hello, Asha", explanation: "This command gives the option, so `args.greeting` is `\"Salaam\"` and the `else` block runs." }
  - { text: "Salaam, Salaam", explanation: "The word after `--greeting` is the value of the option. The word `Asha` is still the command line argument `name`." }
  - { text: "Asha, Salaam", explanation: "The parser knows that the word after `--greeting` is the value of the option, in every position. So `Salaam` is the greeting and `Asha` is the name." }
otherwise: "The word after `--greeting` is the value of the option. The other word is the name."
explanation: "The parser takes `--greeting` and the word after it as the option and its value. The word that is left, `Asha`, is the name. An option can come before or after the other command line arguments."
```

Now try both commands, and compare with your answers. Click in the
terminal, type each command, and press `Enter` after each:

```
python greet.py Asha
```

```
python greet.py --greeting Salaam Asha
```

````{hint}
:title: Run the commands for me
:unlock: "option-given" in failed_checks or "option-given" in passed_checks
:locked: Try it yourself first. This opens after you have answered the two questions above.
The two actions below type the commands in the terminal and press
`Enter`.

```{execute}
:id: run-option-absent
:wait: prompt
python greet.py Asha
```

```{execute}
:id: run-option-given
:wait: prompt
python greet.py --greeting Salaam Asha
```
````

## The help text knows the option

The parser also puts the option in the help text. If you run
`python greet.py --help` now, the terminal shows:

```
usage: greet.py [-h] [--greeting GREETING] name

Show a greeting for one person.

positional arguments:
  name                 the name of the person

options:
  -h, --help           show this help message and exit
  --greeting GREETING  the word to greet with, for example Salaam
```

In the line that begins with `usage`, the option is in square
brackets, because you may leave it out. The word `GREETING` in
capital letters stands for the value that you type after the option.

The parser also finds a mistake in the name of an option. For the
command `python greet.py Asha --greting Hei`, in which one letter of
the option is missing, the program stops and shows:

```
usage: greet.py [-h] [--greeting GREETING] name
greet.py: error: unrecognized arguments: --greting Hei
```

You now know everything that the spending tracker needs. On the next
three pages you write the code yourself.
