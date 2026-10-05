---
title: What you have learned
---

# What you have learned

You now know the three tools that programmers use every day. You found
files in the file browser. You changed a file in the editor and saved
it. You gave the computer commands in a terminal, moved from one
directory to another, stopped a program, and copied text between the
terminal and the editor.

## The ideas

- A **directory** is a place that holds files and other directories.
  Another word for it is "folder".

- The **file browser** shows what a directory holds. A double-click on
  a file opens it.

- The **editor** is the part of JupyterLab in which you change a file.
  The editor holds a copy of the text of the file.

- To **save** means to write what the editor shows to the file on the
  disk. A dot on the tab means that the file is not saved. Other
  programs see only what you saved.

- A **terminal** is a window in which you type commands for the
  computer.

- A **command** is one line that you type in the terminal. The
  computer runs it when you press `Enter`. The first part of a command
  is the name of a program.

- The **shell** is the program inside the terminal that reads each
  command and runs it.

- The **prompt** is the short text that shows that the shell is ready
  for a command. While a program runs, there is no prompt.

- The **current directory** is the directory that the terminal is in
  now. A command looks for files there.

- A **path** is the text that says where a file or a directory is. The
  character `/` stands between the names in a path.

- `Ctrl` and `C` stop the program that runs in the terminal. On a Mac
  it is also `Ctrl`, and not `Cmd`.

## The commands

| Command | What it does |
|---------|--------------|
| `pwd` | shows the path of the current directory |
| `ls` | shows the names of the files and directories in the current directory |
| `cd trip` | makes the directory `trip`, which is inside the current directory, the current directory |
| `cd ..` | moves to the directory that holds the current directory |
| `cat packing.txt` | shows what the file `packing.txt` holds |
| `cat trip/ticket.txt` | shows a file that is inside the directory `trip` |
| `python count_up.py` | runs the Python program in the file `count_up.py` |

## The keys

| Keys | What they do |
|------|--------------|
| `Ctrl` and `S` (on a Mac, `Cmd` and `S`) | in the editor: save the file |
| `Enter` | in the terminal: run the command that you typed |
| `Ctrl` and `C` | in the terminal: stop the program that runs |
| `Ctrl` and `V` (on a Mac, `Cmd` and `V`) | in the terminal: paste |
| `Ctrl` and `C` with selected text (on a Mac, `Cmd` and `C`) | in the terminal: copy the selected text |

## What comes next

You ran one Python program in this workshop, with the command
`python count_up.py`. You did not need a notebook for it.

The next workshop, **Python in the terminal**, looks at the command
`python` itself. You start Python in the terminal with no file, and
you type Python code there, one line at a time.

Click `Finish` at the bottom of this panel.
