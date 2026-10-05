---
title: The program and what it needs
requires: [quiz:what-it-needs, quiz:why-it-stops]
---

# The program and what it needs

Before you use a new tool, look at what you have. On this page you
look at the files of the project, and you see why the program cannot
run yet.

## The terminal

The lower part of the window is the **terminal**: a window in which
you type commands for the computer. A **command** is one line that
you type in the terminal. The computer runs it when you press
`Enter`. The short text at the start of the line, which ends with
`$`, is the **prompt**. It shows that the terminal is ready for a
command.

The terminal is always in one **directory**, which is a place that
holds files and other directories. Here it is in your work directory,
which holds the files of this workshop.

## The files of the project

The command `ls` shows what the directory holds. Click in the
terminal, type this command, and press `Enter`:

```
ls
```

The terminal shows four names:

```
pyproject.toml  requirements.txt  spending  spending.csv
```

- `spending` is a directory. It holds the code of the spending
  tracker, in six files of Python code. A directory that holds
  modules is a **package**, and you run this one by its name.

- `spending.csv` is the data: the 37 purchases of Mariam.

- `requirements.txt` is the **requirements file**: a text file that
  lists the packages that the program needs.

- `pyproject.toml` describes the project. A later page of this
  workshop explains it, so you can leave it for now.

The command `cat` shows what a file holds. Type this command, and
press `Enter`:

```
cat requirements.txt
```

```{quiz}
:id: what-it-needs
:type: text
:case: false
question: "What does the terminal show for the command `cat requirements.txt`? Type the word."
answer: "rich"
wrong:
  - { pattern: ".*requirements.*", explanation: "That is the name of the file, or part of the command. The answer is the one word that the terminal shows on the line under the command." }
  - { pattern: ".*No such file.*", explanation: "The terminal did not find the file. Check the spelling of `requirements.txt`, and type the command again." }
otherwise: "Look at the line under the command in the terminal. It holds one short word."
explanation: "The program needs one package, with the name `rich`. The package `rich` shows text in the terminal in a better form. The spending tracker uses it to show a table. `rich` is not part of Python. Someone has published it on **PyPI**, the Python Package Index, which is the website that packages are installed from."
```

## The program cannot run yet

Try to run the program. Type this command, and press `Enter`:

```
python -m spending spending.csv
```

Python stops with an error message. An error message is read from its
last line, and the last line is:

```
ModuleNotFoundError: No module named 'rich'
```

```{hint}
:title: I see a report, and no error
Then the Python of your terminal already has the package `rich`. This
can happen on your own computer, if you installed `rich` there
before. It changes nothing in this workshop. Read the explanation
below, and continue.
```

```{quiz}
:id: why-it-stops
:title: Why Python stops
question: "The file `requirements.txt` names the package `rich`. Why does Python stop with this error?"
options:
  - { text: "The file `requirements.txt` has a mistake in it", explanation: "The file is correct. It names the package that the program needs." }
  - { text: "The file only records the name. No command has installed the package yet", correct: true }
  - { text: "The file `spending.csv` holds no purchase with that name", explanation: "The error is not about the data. `rich` is the name of a module that the code imports, and Python did not find that module." }
explanation: "A requirements file is a record, like a shopping list. A list of things to buy does not put food in the kitchen. Someone must install the package. And you do not install it into the Python that the terminal uses now, because other projects may share that Python. You install it into a **virtual environment**: a directory that holds its own `python` and its own `site-packages`, for one project. The directory `site-packages` is the directory in which installed packages are kept."
```

## What comes next

In the workshop **Installing packages**, three commands solved this
problem:

```
python -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

The first command makes the environment. The second command makes the
terminal use it. The third command installs the packages that the
file names. On the next pages you do each of these three steps with
`uv`.
