---
title: The terminal
requires: [quiz:cat-first-line]
---

# The terminal

Until now, you told the computer what to do with clicks: on an action,
on a button, on the name of a file. There is a second way to tell a
computer what to do. You type what you want, as a line of text.

A **terminal** is a window in which you type commands for the
computer. It is the area under the editor. A **command** is one
line that you type in the terminal. The computer runs the command when
you press `Enter`.

## Why programmers use a terminal

A click is convenient for a thing that somebody has prepared a button
for. But nobody can prepare a button for everything.

- A command is exact. It says in words what to do and which file to
  use.

- A command can be written down. You can keep it, give it to another
  person, and run it again next month. A page of a book can say "type
  this command". It is much harder to describe ten clicks.

- Most tools for programmers have no buttons at all. Python is one of
  them. You start these tools with a command.

Think of two ways to buy bread. In a shop, you point at the bread that
you see. That works only for the things on the shelf. Or you write an
order: "two loaves of dark bread, cut". The order is exact, you can
send it again next week, and it can ask for something that is not on
the shelf. A click is the first way. A command is the second way.

## The shell and the prompt

When you type a command, a program reads it. That program is the
**shell**. The shell is the program inside the terminal that reads
each command and runs it. Then it waits for the next command.

Look at the terminal. It shows a short text, and after the text a
cursor that waits. The short text is the **prompt**. The prompt shows
that the shell is ready for a command. In this terminal, the prompt
ends with the character `$`. You never type the prompt yourself.

## Your first command

The first command runs with a click, so that you can watch what
happens. The command is:

```
cat packing.txt
```

A command has parts, with a space between them. The first part is the
name of a program: here `cat`. The program `cat` shows on the screen
what a file holds. The second part says which file: `packing.txt`.

Click the action below. It types the command in the terminal and
presses `Enter` for you.

```{execute}
:id: run-cat
:title: Run the command in the terminal
:wait: prompt
cat packing.txt
```

Look at the terminal. Three things happened:

1. The command appeared after the prompt, as if you had typed it.

2. The shell ran the program `cat`. The program showed the lines of
   the file `packing.txt`, one under the other.

3. The shell showed a new prompt. It is ready for the next command.

```{quiz}
:id: cat-first-line
:title: What the terminal showed
:type: text
:case: false
question: "The terminal shows the lines of the file under the command. What is the first of those lines?"
answer: "passport"
wrong:
  - { text: "cat packing.txt", explanation: "That is the command. The lines of the file begin on the line under the command." }
  - { text: "umbrella", explanation: "That is the last line of the file. The question asks for the first line." }
otherwise: "Find the line `cat packing.txt` in the terminal. The answer is the line directly under it."
explanation: "The program `cat` showed the file from its first line, `passport`, to its last line."
```

## The same file, seen by another program

Look at the last line that `cat` showed. It is `umbrella`, the line
that you added in the editor. The program `cat` did not read the
editor. It read the file on the disk. The line is there because you
saved the file.

So the file browser, the editor and the terminal are three views of
the same files. This is true for Python too: when you run a program
from a file, Python reads what you saved.

````{hint}
:title: The terminal does not show umbrella
The file on the disk does not hold the line. Return to the page
before this one, add the line `umbrella` to the file and save it. Then
return to this page and click the action again.
````
