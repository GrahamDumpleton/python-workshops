---
title: How the shell finds python
requires: [quiz:path-separator, quiz:path-order, quiz:predict-first]
---

# How the shell finds python

Your work directory now holds an interpreter of its own, at
`.venv/bin/python`. But when you type the word `python`, the shell
does not use it yet. To understand why, you need to know how the
shell finds a program. That is the idea of this page.

## A list of directories

When you type a command, the first word is the name of a program.
The shell must find the file of that program. It does not search the
whole computer, because that would take too long. It searches a
short list of directories.

`PATH` is the list of directories in which the shell looks for a
program. The shell keeps this list under the name `PATH`, in the same
way as a Python program keeps a value under a name.

Think of a person who looks for a pair of scissors at home. The
person does not search every room. The person looks in the kitchen
drawer first, then in the desk, and then in the toolbox, always in
the same order, and takes the first pair that is there.

## Look at the list

The command `echo` shows the text that you write after it. When that
text is a name with the character `$` before it, the shell puts the
value of the name in its place. So this command shows the value of
`PATH`:

```
echo $PATH
```

The command is new, so this time a click runs it.

```{execute}
:id: run-echo-path
:title: Run the command in the terminal
:wait: prompt
echo $PATH
```

The terminal shows one long line. When the line is longer than the
terminal is wide, the terminal continues it on the next row. The line
is different on each computer. It has this form, with `...` in place
of the parts that differ:

```
/.../bin:/.../bin:/usr/bin:/bin:...
```

The line holds several paths, one after the other. Each path is one
directory. Many of them end with the name `bin`, which is the usual
name for a directory of programs.

```{quiz}
:id: path-separator
:title: Between the directories
:type: text
question: "Look at the line that the terminal showed. One character stands between the end of one directory and the start of the next directory. Type that character."
answer: ":"
wrong:
  - { text: "/", explanation: "The character `/` stands between the names inside one path. Look for the character that comes directly before a new path begins, which is the character before a `/` that starts a path." }
  - { text: ";", explanation: "Look closely. The character has two dots, one above the other, and no comma." }
otherwise: "Each path in the line begins with `/`. Look at the character directly before the second path begins. Type that one character."
explanation: "The character `:` separates the directories of `PATH`. So you read the line as a list: the first directory is the text before the first `:`, the second directory is the text between the first `:` and the second `:`, and so on."
```

## The order matters

The shell searches the directories of `PATH` in order, from the first
to the last. In each directory, it looks for a file with the name of
the program. When it finds one, it runs that file and stops the
search.

```{quiz}
:id: path-order
:title: Two programs with the same name
question: "Two directories of `PATH` each hold a program with the name `python`. Which one does the shell run when you type `python`?"
options:
  - { text: "The one in the directory that comes last in `PATH`", explanation: "The shell does not continue to the end of the list. It stops at the first directory that holds a program with the right name." }
  - { text: "The one in the directory that comes first in `PATH`", correct: true }
  - { text: "The one with the newest version", explanation: "The shell does not compare versions. It knows only names, and it takes the first file with the right name." }
explanation: "The shell uses the first one that it finds. This is the same rule as Python uses for an import with the list `sys.path`. The shell never looks at the second program."
```

## Which python is first now?

The command `which` shows where the shell finds a program. It
searches `PATH` in the same way as the shell does, and shows the path
of the first file with the right name. Type this command, and press
`Enter`:

```
which python
```

````{hint}
:title: Type the command for me

```{execute}
:id: run-which-before
:wait: prompt
which python
```
````

The terminal shows one path. It is different on each computer. It is
the path of the Python that the terminal uses now. On these pages,
that Python is called the Python of the computer.

Read the path in your terminal. Its last name is `python`. The name
before that is `bin`, and that directory `bin` is one of the
directories of `PATH`. The path does not lead into your work
directory.

On some computers this path also holds the name `.venv`, because
JupyterLab itself runs in an environment with that name. It is a
different environment, outside your work directory. The path of your
own environment ends with `work/.venv/bin/python`, and the path that
you see now does not.

So the word `python` does not mean your new interpreter yet. Your
environment is on the disk, but its directory `.venv/bin` is not in
`PATH`, and the shell does not look there.

```{quiz}
:id: predict-first
:title: Predict the result
question: "Think of a change to `PATH`: the directory `.venv/bin` of your environment is put at the start of the list, before every other directory. What does `which python` show after that change?"
options:
  - { text: "The same path as now, because the Python of the computer is still in `PATH`", explanation: "The Python of the computer is still in `PATH`, but it is not first now. The shell stops at the first directory that holds a program with the name `python`." }
  - { text: "Two paths, one for each `python`", explanation: "The command `which` shows the first program that the shell finds, and the shell stops there." }
  - { text: "The path of the `python` in `.venv/bin`", correct: true }
explanation: "The directory `.venv/bin` holds a program with the name `python`. When that directory is first in `PATH`, the shell finds that program first, and never reaches the other one. On the next page you make this change with one command."
```
