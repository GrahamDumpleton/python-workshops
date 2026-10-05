---
title: What uv is
requires: [quiz:uv-version]
---

# What `uv` is

`uv` is a program for the terminal that manages Python environments
and packages. One program does the work of `python -m venv` and the
work of pip.

## Why it exists

`python -m venv` and pip work well, and they come with Python. You
can do all of your work with them. But they have two limits.

- They are slow when a project needs many packages. With a large
  project, you can wait for minutes.

- They are separate tools, and each one does one step. You must
  remember the steps, and their order: make the environment, activate
  it, install, write the requirements file.

`uv` was made to remove both limits. It does the same work in much
less time, and it can do several steps with one command. It is not
part of Python. A company with the name Astral makes it, and gives it
to everyone at no cost. Many Python programmers now use it for their
daily work.

An everyday comparison: you can wash the dishes by hand, or with a
machine. The machine is faster. But the dishes, the water and the
soap are the same, and a person who has washed dishes by hand
understands what the machine does. That is why these workshops taught
`python -m venv` and pip first.

## The command `uv`

Every command of this tool begins with the word `uv`. After it comes
a second word that says what to do, such as `uv venv` or `uv add`.

The first command is new, so the action below runs it for you. It
asks `uv` for its version.

```{execute}
:id: show-uv-version
:title: Ask uv for its version
:wait: prompt
uv --version
```

```{quiz}
:id: uv-version
:type: text
:case: false
question: "What is the first word of the line that the terminal shows under the command?"
answer: "uv"
wrong:
  - { pattern: "uv .+", explanation: "That is the whole line. Type the first word only." }
  - { pattern: "\\d+(\\.\\d+)*", explanation: "That is the number of the version. The first word of the line comes before the number." }
  - { pattern: ".*not found.*", explanation: "The terminal did not find the program `uv`. The first page of this workshop says what to do when `uv` is not installed." }
otherwise: "Look at the line under the command `uv --version` in the terminal. Type its first word."
explanation: "The line begins with the name of the program, `uv`, and then shows the number of its version. The number on your computer can be different from the number on another computer. The rest of the line says when and for which type of computer this `uv` was built."
```

## Each step beside the step that you know

This table is the plan of the next two pages. The left column holds
the commands that you know. The right column holds the commands of
`uv` that do the same work.

| What the step does | With `venv` and pip | With `uv` |
|--------------------|---------------------|-----------|
| makes the environment `.venv` | `python -m venv .venv` | `uv venv` |
| makes the terminal use it | `source .venv/bin/activate` | `source .venv/bin/activate` |
| installs what the requirements file names | `python -m pip install -r requirements.txt` | `uv pip install -r requirements.txt` |
| shows the packages of the environment | `python -m pip list` | `uv pip list` |

The second row is the same in both columns. An environment that `uv`
makes is a normal virtual environment, and you activate it in the
normal way.

After these two pages, the workshop shows a second way of working
with `uv`, in which the tool does most of these steps for you.
