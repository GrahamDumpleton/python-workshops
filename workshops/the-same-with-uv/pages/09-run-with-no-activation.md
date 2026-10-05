---
title: Run with no activation
requires: [quiz:predict-uv-run, quiz:all-total, quiz:february-food]
---

# Run with no activation

Until now, you activated the environment before you ran the program.
On this page you run the program with `uv`, and with no activation.

## Why

To **activate** an environment means to make the terminal use it.
Activation is one more step to remember. When you forget it, the word
`python` means another Python of the computer, which does not have
the packages of your project. And the activation is lost when you
close the terminal, so you must do it again in each new terminal.

The command `uv run` solves this. You write `uv run` before the
command that you want to run:

```
uv run python -m spending spending.csv --table
```

`uv run` does three things, in this order:

1. It finds the file `pyproject.toml` of the project, in the
   directory that the terminal is in.

2. It compares the environment `.venv` with the file `uv.lock`. If
   the environment is missing, or a package in it has another
   version, `uv` corrects the environment first.

3. It runs the command with the `python` of the environment `.venv`.

When the command ends, the terminal is as it was before. Nothing was
activated.

| What the step does | With pip | With `uv` |
|--------------------|----------|-----------|
| runs the program with the environment | `source .venv/bin/activate`, then `python -m spending spending.csv` | `uv run python -m spending spending.csv` |

`uv run` is a command for a project, as `uv add` is. It works on the
project of your work directory.

## Step 1: leave the environment

The command `deactivate` makes the terminal stop using the
environment. Type it in the terminal, and press `Enter`:

```
deactivate
```

The name `(work)` goes away from the start of the prompt. If the
terminal says that it does not know the command `deactivate`, then no
environment was active, and that is also correct for this page.

````{hint}
:title: Run the command for me
The action below runs the command in the terminal.

```{execute}
:id: leave-env
:title: Leave the environment
:wait: prompt
deactivate
```
````

## Step 2: run the program with `uv run`

```{quiz}
:id: predict-uv-run
:title: Predict: no environment is active
question: "No environment is active now. What happens when you type `uv run python -m spending spending.csv --table`?"
options:
  - { text: "Python stops with `ModuleNotFoundError`, because no environment is active", explanation: "That can happen with `python` alone. But `uv run` does not need an active environment. It uses the environment `.venv` of the project for this one command." }
  - { text: "`uv` asks you to activate the environment first", explanation: "`uv run` never asks for that. It finds the environment of the project itself." }
  - { text: "The table is shown, because `uv run` uses the environment `.venv` of the project", correct: true }
explanation: "`uv run` finds `pyproject.toml`, checks the environment against `uv.lock`, and runs `python` from `.venv`. That `python` finds `rich` in the `site-packages` of `.venv`. Type the command and see."
```

Type this command in the terminal, and press `Enter`:

```
uv run python -m spending spending.csv --table
```

```{hint}
:title: Hint: uv shows a line that begins with warning
The line begins with `warning: VIRTUAL_ENV=`, and it says that this
environment "will be ignored". It means that the terminal has another
environment active, not the environment `.venv` of this project. `uv
run` does not use that other environment. It uses the environment
`.venv` of your project, which is the right one. The warning does no
harm.
```

````{hint}
:title: Run the command for me
:unlock: "all-total" in failed_checks or "all-total" in passed_checks
:locked: Try the task first. This opens after you have answered the question below.
The action below runs the command in the terminal.

```{execute}
:id: uv-run-table
:title: Run the program with uv run
:wait: prompt
:timeout: 300s
uv run python -m spending spending.csv --table
```
````

```{quiz}
:id: all-total
:type: text
question: "What is the total in the last row of the table, the row `All`? Type the number."
answer: "2834.79"
wrong:
  - { text: "445.60", explanation: "That is the row `food`. Look at the last row, `All`." }
  - { pattern: ".*No module named.*", explanation: "Python did not find `rich`. Did you write `uv run` before `python`? Without it, the word `python` means another Python. Type the whole command again." }
otherwise: "Look at the table in the terminal. Type the number in the last row, `All`."
explanation: "Mariam spent 2834.79 in the three months. The table came from the environment `.venv`, and you did not activate it. Look at the prompt: it still has no name in parentheses. `uv run` used the environment for this one command only."
```

## Step 3: one month only

Now you build a command yourself. The program has the option
`--month`. An **option** is a command line argument that begins with
`--`. You write the month after it, in the form `2026-02`, and the
program reports on that month only. The options can come in any
order after the name of the file.

Your task: show the table for February 2026 only, with `uv run` and
no activation.

```{hint}
:title: Hint: where the option goes
Start from the command of step 2. Add the option `--month` and the
month `2026-02` after `spending.csv`, with a space between each word.
```

```{hint}
:title: Hint: the form of the command
The command has this form, with the month in the place of `MONTH`:
`uv run python -m spending spending.csv --month MONTH --table`
```

````{hint}
:title: Show me a solution
:unlock: "february-food" in failed_checks or "february-food" in passed_checks
:locked: Try the task first. This opens after you have answered the question below.
The action below runs the command in the terminal.

```{execute}
:id: uv-run-february
:title: Show the table for February 2026
:wait: prompt
:timeout: 300s
uv run python -m spending spending.csv --month 2026-02 --table
```
````

```{quiz}
:id: february-food
:type: text
question: "What is the total in the row `food` of the table for February 2026? Type the number."
answer: "199.85"
wrong:
  - { text: "445.60", explanation: "That is the total of food for all three months. The option `--month 2026-02` is missing from your command, or it has a mistake. Type the command again." }
  - { text: "942.34", explanation: "That is the row `All`, the total of every category in February. Look at the row `food`." }
  - { pattern: ".*error.*", explanation: "The program did not understand the command. Compare your command with the second hint. Each option begins with two dashes, `--`." }
otherwise: "Look at the table in the terminal. Each row has a category and a total. Type the number in the row `food`."
explanation: "In February 2026, Mariam spent 199.85 on food. You chose the options yourself, and `uv run` gave the program the environment that it needs."
```
