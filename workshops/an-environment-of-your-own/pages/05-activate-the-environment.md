---
title: Activate the environment
requires: [quiz:which-after, quiz:path-first]
---

# Activate the environment

To **activate** an environment means to make the terminal use it.
After that, the word `python` in this terminal means the interpreter
of the environment.

You know from the page before this one how that can work. The shell
runs the first `python` that it finds in `PATH`. So to activate an
environment, something must put the directory `.venv/bin` first in
`PATH`. One command does that.

Think of the person who looks for scissors again. The person looks in
the kitchen drawer first. If you put your own scissors in the kitchen
drawer, the person finds your scissors, and never reaches the desk.
The other scissors are still in the desk. Nothing was removed.

## The command

```
source .venv/bin/activate
```

The command has two parts:

- `source` tells the shell to read a file, and to run each line of
  the file as a command, in this terminal.

- `.venv/bin/activate` is the path of the file to read. You saw the
  name `activate` when you looked inside `.venv/bin`. It is a file of
  commands for the shell. It is not Python code.

The command is new, so this time a click runs it.

```{execute}
:id: run-activate
:title: Run the command in the terminal
:wait: prompt
source .venv/bin/activate
```

The command shows nothing. But look at the new prompt. It now begins
with `(.venv)`, the name of the environment in parentheses. The
prompt shows this for as long as the environment is active, so that
you can always see it.

## After: which python

On the page before this one, `which python` showed the Python of the
computer. Ask again. Type this command, and press `Enter`:

```
which python
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-which-after
:wait: prompt
which python
```
````

```{quiz}
:id: which-after
:title: The python that the shell finds now
:type: text
question: "Look at the path that `which python` shows now. Type the last four names of the path, with the character `/` between them."
answer:
  - "work/.venv/bin/python"
  - { pattern: "/?(.*/)?work/\\.venv/bin/python", example: "/home/asha/work/.venv/bin/python" }
wrong:
  - { pattern: "/?\\.venv/bin/python", explanation: "Type one more name: the name of the directory that holds `.venv`. That name tells you that this `.venv` is the one in your work directory." }
  - { pattern: "(.*/)?\\.venv/bin/python", explanation: "The name before `.venv` must be `work`, the name of your work directory. If your path has another name there, the environment is not active in this terminal. Click the action above that runs `source .venv/bin/activate`, and then run `which python` again." }
  - { pattern: "(.*/)?bin/python", explanation: "The name before `bin` must be `.venv`. If your path has another name there, the environment is not active in this terminal. Click the action above that runs `source .venv/bin/activate`, and then run `which python` again." }
  - { pattern: "(.*/)?work/venv/bin/python", explanation: "Type the name of the environment with the dot before it: `.venv`." }
  - { text: "python", explanation: "That is the last name only. Type the last four names, with `/` between them." }
otherwise: "The path ends with the name `python`. Type that name and the three names before it, with `/` between them and no spaces."
explanation: "The path now ends with `work/.venv/bin/python`. The shell finds the interpreter of your environment first. The command that you typed is the same as before, and the answer is different, because `PATH` is different."
```

## After: PATH

Now look at `PATH` itself. Type this command, and press `Enter`:

```
echo $PATH
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-echo-after
:wait: prompt
echo $PATH
```
````

```{quiz}
:id: path-first
:title: The first directory of PATH
:type: text
question: "Look at the start of the line, from its first character to the first `:`. That is the first directory of `PATH`. Type the last three names of that directory, with the character `/` between them."
answer:
  - "work/.venv/bin"
  - { pattern: "/?(.*/)?work/\\.venv/bin/?", example: "/home/asha/work/.venv/bin" }
wrong:
  - { pattern: "(.*/)?\\.venv/bin/python", explanation: "That is the path of the interpreter. `PATH` holds directories, not programs. Type the last three names of the first directory." }
  - { pattern: ".*:.*", explanation: "That is more than one directory. Stop before the first `:`, and type only the last three names of that directory." }
  - { pattern: "/?\\.venv/bin/?", explanation: "Type one more name: the name of the directory that holds `.venv`." }
  - { pattern: "(.*/)?\\.venv/bin/?", explanation: "The name before `.venv` must be `work`, the name of your work directory. If it is another name, the environment is not active in this terminal. Click the action above that runs `source .venv/bin/activate`, and then run `echo $PATH` again." }
  - { pattern: "(.*/)?venv/bin/?", explanation: "Type the name of the environment with the dot before it: `.venv`." }
otherwise: "Find the first `:` in the line. Read the three names directly before it. Type them with `/` between them."
explanation: "The first directory of `PATH` is now the directory `bin` of your environment. The other directories are the same as before, in the same order, after it. The directory that held the Python of the computer is still in the list. It is only not first now."
```

## What activating did, and what it did not do

The file `activate` changed two things in this terminal that you can
see:

- It put the directory `.venv/bin` first in `PATH`.

- It changed the prompt, so that you can see that the environment is
  active.

It also did some small things that you do not see. The two that
matter are these: it keeps the path of the environment under the name
`VIRTUAL_ENV`, for other tools to read, and it adds the command
`deactivate`, which a later page uses.

Activating did not start a program. It did not change any file. It
did not change Python, and it did not change the environment. The
change that matters is which directory the shell searches first.

The change is for this terminal only. Another terminal that you open
still has the old `PATH`, and you activate the environment there
again when you need it.

Now every command in this terminal that begins with `python` runs the
interpreter of your environment. The next page uses that.
