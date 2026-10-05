---
title: Without activating
requires: [quiz:predict-deactivated, quiz:error-type, quiz:by-path-word, quiz:why-by-path]
---

# Without activating

Activating is a convenience, and it is not the environment itself. On
this page you leave the environment, you see what goes wrong without
it, and then you use the environment with no activation.

## Leave the environment

The command `deactivate` ends what `activate` started. It puts `PATH`
back as it was, and it puts the prompt back. The command is new, so
this time a click runs it.

```{execute}
:id: run-deactivate
:title: Run the command in the terminal
:wait: prompt
deactivate
```

Look at the prompt. The text `(.venv)` is gone. The word `python`
means the Python of the computer again.

The command `deactivate` exists only in a terminal in which an
environment is active. In another terminal, the shell says that it
does not know the command.

Nothing was deleted. The directory `.venv` is still in your work
directory, with the package `tabulate` inside it.

## Run the program again

```{quiz}
:id: predict-deactivated
:title: Predict the result
question: "The environment is not active now. What happens when you run `python prices.py`?"
options:
  - { text: "The program shows the table, because the package `tabulate` is installed on this computer now", explanation: "The package is in the `site-packages` of your environment. The Python of the computer has a `site-packages` of its own, and the package is not there." }
  - { text: "Python stops with an error message, because the Python of the computer does not have the package `tabulate`", correct: true }
  - { text: "The shell says that it does not know the command `python`", explanation: "The Python of the computer is in `PATH` again, so the shell finds a `python`. The question is which packages that Python has." }
explanation: "The word `python` now means the Python of the computer. It searches its own `site-packages`, and the package `tabulate` was never installed there. This is the purpose of an environment: the install changed one project, and nothing else."
```

Now try it. Type this command, and press `Enter`:

```
python prices.py
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-prices-bare
:wait: prompt
python prices.py
```

After the action, the panel says that the command exited with status
`1`. That is the sign that the program stopped with an error. On this
step, the error is what you expect to see.
````

The terminal shows an error message. The path in the second line is
different on each computer, so it is written with `...` here:

```
Traceback (most recent call last):
  File ".../work/prices.py", line 1, in <module>
    from tabulate import tabulate
ModuleNotFoundError: No module named 'tabulate'
```

```{quiz}
:id: error-type
:title: The type of the error
:type: text
:case: false
question: "Read the last line of the error message. It begins with the type of the error, before the `:`. Type that one word."
answer:
  - "ModuleNotFoundError"
  - { pattern: "ModuleNotFoundError:.*", example: "ModuleNotFoundError: No module named 'tabulate'" }
wrong:
  - { pattern: "traceback.*", explanation: "That is the first line. Read an error message from its last line." }
  - { pattern: "item.*|.*soup.*", explanation: "Your terminal showed the table, so the Python of your computer has the package `tabulate` already. That is unusual, and it is not a problem. On most computers the terminal shows an error here, and the type of the error is `ModuleNotFoundError`. Type that word." }
otherwise: "Look at the last line that the terminal shows before the new prompt. Type the first word of that line, without the `:`."
explanation: "A `ModuleNotFoundError` means that Python searched its directories and found no module with that name. The file `prices.py` did not change, and the package is still on the disk. But the Python that ran the program this time does not look in your environment."
```

When a program that worked before stops with a `ModuleNotFoundError`,
look at the prompt first. Very often, the environment is not active.

## The environment by its path

You do not need to activate an environment to use it. You can name
its interpreter by its path. Then the shell does not search `PATH` at
all, because you told it exactly which file to run.

Type this command, and press `Enter`. The first word is the path of
the interpreter of your environment:

```
.venv/bin/python prices.py
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-prices-by-path
:wait: prompt
.venv/bin/python prices.py
```
````

```{quiz}
:id: by-path-word
:title: What the terminal shows now
:type: text
:case: false
question: "Look at the lines under the command. The last line has the number `2`. What is the word before the number?"
answer: "bread"
wrong:
  - { pattern: "tea|soup|item", explanation: "That word is on another line. Find the line that has the number `2`." }
  - { pattern: ".*(ModuleNotFoundError|tabulate).*", explanation: "The terminal shows the error, so the program was run by the Python of the computer. Type the command with the path before the name of the program: `.venv/bin/python prices.py`." }
  - { pattern: ".*(no such file|not found).*", explanation: "The shell did not find the file. Read the command letter by letter: a dot, `venv`, `/bin/python`, a space, and `prices.py`." }
otherwise: "The terminal must show the table of prices. Find its last line, and type the word before the number `2`."
explanation: "The program shows the table, and the prompt has no `(.venv)`. The environment is not active, but its interpreter ran the program and found the package."
```

## How the interpreter knows

The interpreter at `.venv/bin/python` found the package, although
nothing in the terminal told it about the environment. It learned this
by itself.

When this interpreter starts, it looks for a file with the name
`pyvenv.cfg` in the directory above its own directory. You read that
file on an earlier page: it is `.venv/pyvenv.cfg`. When the file is
there, the interpreter knows that it is inside an environment, and it
uses the `site-packages` of that environment.

```{quiz}
:id: why-by-path
:title: What activation is for
question: "Which sentence is true?"
options:
  - { text: "The environment works only while it is active. The path `.venv/bin/python` worked because the terminal remembered the activation.", explanation: "The command `deactivate` put `PATH` back, and the terminal remembers nothing of the activation. The interpreter found its environment by itself, from the file `pyvenv.cfg`." }
  - { text: "Activating installs the packages of the environment into the Python of the computer for a short time.", explanation: "Activating copies nothing and installs nothing. It changes `PATH` and the prompt in one terminal." }
  - { text: "The environment is the directory `.venv`. Activating only makes the shell find its interpreter when you type the short word `python`.", correct: true }
explanation: "The environment is the directory, and it works at any time. Activating changes only what the word `python` means in one terminal, so that you can type less. Tools and other programs often use an environment by the path of its interpreter, with no activation."
```
