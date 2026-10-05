---
title: A look inside
requires: [quiz:inside-file, quiz:inside-packages, quiz:inside-cfg]
---

# A look inside

An environment is a directory, so you can look at what it holds. On
this page you look at the three things that matter: its interpreter,
its `site-packages`, and one small file of settings.

You already know the command `ls`. When you write the **path** of a
directory after `ls`, the command shows what that directory holds. A
path is the text that says where a file or a directory is.

## The top of the environment

Type this command in the terminal, and press `Enter`:

```
ls .venv
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-ls-venv
:wait: prompt
ls .venv
```
````

The terminal shows these names. On some computers there is one more
name, `lib64`, which you can ignore.

```
bin   include   lib   pyvenv.cfg
```

```{quiz}
:id: inside-file
:title: The file among the names
:type: text
:case: false
question: "Three of the names are directories. One name is a file, and it has a dot inside the name. Type the name of the file."
answer: "pyvenv.cfg"
wrong:
  - { text: "pyvenv", explanation: "Type the whole name, with the dot and the three letters after it." }
  - { pattern: "bin|include|lib|lib64", explanation: "That name is a directory. Look for the name that has a dot inside it." }
  - { text: ".venv", explanation: "That is the name of the environment itself. Type the name inside it that has a dot in the middle." }
otherwise: "Look at the line under the command `ls .venv`. Type the name that has a dot inside it, exactly as the terminal shows it."
explanation: "The file `pyvenv.cfg` holds the settings of the environment. You read it at the end of this page. The directory `bin` holds programs, and the directory `lib` holds `site-packages`. You do not need the directory `include`."
```

## The interpreter

Now look inside the directory `bin`. Type this command, and press
`Enter`:

```
ls .venv/bin
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-ls-bin
:wait: prompt
ls .venv/bin
```
````

The terminal shows about ten names. Their order can be different on
your computer. These are the names that matter:

```
activate   pip   python   python3   python3.14
```

- `python` is the interpreter of the environment. The names `python3`
  and `python3.14` are two more names for the same program.

- `pip` is the tool that installs packages. The next workshop
  explains it.

- `activate` is a file of commands for the shell. You use it on a
  later page.

The other names that begin with `activate` or with `pip` are forms of
the same things for other shells and other habits. One name begins
with the Greek letter `𝜋`. It is one more name for the interpreter.
You can ignore all of them.

The interpreter in `bin` is not a full copy of Python. It is a small
file that leads to the Python that made the environment. So every
environment that you make uses the same Python, but each one has its
own `site-packages`.

## The packages

The directory `site-packages` of the environment is three steps
down, inside `lib` and then inside `python3.14`. The command is long,
so the page types it for you. Click the action below. It types the
command in the terminal, but it does not press `Enter`.

```{terminal-type}
:id: type-ls-packages
:title: Type the command in the terminal
ls .venv/lib/python3.14/site-packages
```

Click one time inside the terminal, and then press `Enter`.

````{hint}
:title: Press Enter for me

```{send-key}
:id: enter-ls-packages
:keys: enter
```
````

The terminal shows two names. The second name holds a version
number, which is written as `...` here:

```
pip   pip-....dist-info
```

```{quiz}
:id: inside-packages
:title: What the environment holds at the start
:type: text
:case: false
question: "Both names begin with the same three letters. Type the three letters."
answer: "pip"
wrong:
  - { pattern: "pip-.*", explanation: "That is the second name. Type only the three letters that both names begin with." }
  - { pattern: ".*site-packages.*", explanation: "That is the name of the directory. Type the first three letters of the names that the directory holds." }
otherwise: "Look at the line under the long command. It shows two names. Type the first three letters, which are the same in both names."
explanation: "A new environment holds one package: `pip`, the tool that installs packages. The second name is a directory in which `pip` keeps notes about itself. So the `site-packages` of your environment is empty, except for the tool that fills it. No project has put anything there."
```

## The settings

The last thing to look at is the file `pyvenv.cfg`. The command `cat`
shows the text inside a file. Type this command, and press `Enter`:

```
cat .venv/pyvenv.cfg
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-cat-cfg
:wait: prompt
cat .venv/pyvenv.cfg
```
````

The terminal shows five lines. The paths are different on each
computer, so they are written as `...` here:

```
home = ...
include-system-site-packages = false
version = 3.14...
executable = ...
command = ... -m venv .../work/.venv
```

```{quiz}
:id: inside-cfg
:title: One line of the settings
:type: text
:case: false
question: "Find the line that begins with `include-system-site-packages`. What is the word after the `=` sign?"
answer: "false"
wrong:
  - { text: "true", explanation: "Read the line again. A new environment that was made with `python -m venv .venv` has the word `false` here." }
  - { pattern: "include-system-site-packages.*", explanation: "That is the whole line, or its first part. Type only the word after the `=` sign." }
otherwise: "Look at the second line that `cat` showed. Type only the one word after the `=` sign."
explanation: "The word is `false`. It means that the environment does not use the `site-packages` of the Python that made it. The environment has only its own `site-packages`. This is what keeps one project apart from the others."
```

## What the lines mean

- **`home`** is the directory that holds the Python that made the
  environment. The interpreter in `.venv/bin` leads to that Python.

- **`include-system-site-packages = false`** says that the packages of
  that other Python are not used here.

- **`version`** is the version of Python.

- **`executable`** and **`command`** record which program made the
  environment, and with which command. You can ignore them.

Look at the paths in your terminal. They are full paths, which begin
with `/` and name every directory from the top of the computer. The
last line holds the full path of your directory `.venv`. So an
environment knows where it is on this computer. Remember this. A
later page of the workshop needs it.

You have now seen the whole environment. It is an interpreter, an
almost empty `site-packages`, and a small file of settings.
