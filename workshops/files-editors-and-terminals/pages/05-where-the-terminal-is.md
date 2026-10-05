---
title: Where the terminal is
requires: [quiz:pwd-last-name, quiz:ls-python-file]
---

# Where the terminal is

The file browser shows one directory at a time. The terminal is the
same: at each moment, the terminal is "in" one directory. That
directory is the **current directory**: the directory that the
terminal is in now.

The current directory matters because a command looks for files there.
On the page before this one, the command `cat packing.txt` gave only
the name of the file. The shell looked for that name in the current
directory, and found it.

Think of a person who stands in one room of a house. "Bring me the
book from the table" means the table in that room. If the person
stands in another room, the same words mean another table, or there is
no table at all.

The terminal does not show a list of files all the time, as the file
browser does. You ask for what you want to know, with a command. This
page has two commands. Both run with a click.

## Which directory is this?

The command `pwd` shows the current directory. The three letters are
short for "print working directory". "Working directory" is another
name for the current directory.

```{execute}
:id: run-pwd
:title: Run the command in the terminal
:wait: prompt
pwd
```

The terminal shows one line under the command. The line is long, and
it is different on each computer. It has this form:

```
/.../work
```

The three dots stand for the part that is different on your computer.
When the line is longer than the terminal is wide, the terminal
continues it on the next row.

The line is a **path**. A path is the text that says where a file or a
directory is. This path is a row of names with the character `/`
between them. Each name is a directory, and each directory is inside
the directory before it. The last name is the current directory
itself.

```{quiz}
:id: pwd-last-name
:title: The current directory
:type: text
:case: false
question: "Look at the line that `pwd` showed. What is the last name in the path, after the last `/`?"
answer: "work"
wrong:
  - { text: "pwd", explanation: "That is the command. The path is on the line under the command." }
  - { pattern: ".*/.*", explanation: "That is more than the last name. Type only the name after the last `/`." }
otherwise: "The path ends with the name of the current directory. Type only the letters after the last `/`."
explanation: "The terminal is in the directory `work`. That is the directory of this workshop, the same directory that the file browser showed. The terminal of each workshop starts in the directory `work` of that workshop."
```

## What is in this directory?

The command `ls` shows the names of the files and directories that the
current directory holds. The two letters are short for "list".

```{execute}
:id: run-ls
:title: Run the command in the terminal
:wait: prompt
ls
```

The terminal shows four names, side by side:

```
count_up.py   packing.txt   recipes   trip
```

The spaces between the names can be different on your computer, and
some names can have a colour.

These are the same four names that the file browser showed for the
directory `work`. The file browser and `ls` look at the same
directory.

```{quiz}
:id: ls-python-file
:title: What ls showed
:type: text
:case: false
question: "One of the four names is a file of Python code. Its name ends in `.py`. Type that name."
answer: "count_up.py"
wrong:
  - { text: "count_up", explanation: "Type the whole name, with the dot and the letters `py` after it." }
  - { text: "packing.txt", explanation: "The name `packing.txt` ends in `.txt`, so it is a file of plain text." }
otherwise: "Look at the line under the command `ls`. Type the name that ends in `.py`, exactly as the terminal shows it."
explanation: "The file `count_up.py` holds a small Python program. You run it on a later page of this workshop."
```

The command `ls` shows names only. Here it does not say which names
are directories and which are files. You know from the file browser
that `recipes` and `trip` are directories. On the next page, you move
the terminal into one of them.
