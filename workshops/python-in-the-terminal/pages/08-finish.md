---
title: What you have learned
---

# What you have learned

You used Python without a notebook. You asked the terminal which
Python it runs, started the interactive interpreter, and typed
expressions, names and a loop at its prompt. You brought a line back
with the up arrow, and you saw what the interpreter forgets when it
ends.

## The ideas

- The **interpreter** is the program named `python`, which runs
  Python code. A notebook starts one for you. In the terminal, you
  start it yourself.

- The terminal runs one particular Python. `python --version` shows
  its version, and `which python` shows the path of its file.

- The **interactive interpreter** is the interpreter started with no
  file, which shows the `>>>` prompt and runs each line as you enter
  it. Programmers also call it the REPL.

- While the terminal shows `>>>`, Python reads what you type, and the
  shell waits. Type Python code there, and no commands.

- Each line runs when you press `Enter`. The interpreter shows the
  value of every expression at once. A notebook shows only the value
  of the last line of a cell.

- After a line that ends with a colon, the interpreter shows the `...`
  prompt and waits for the block. An empty line ends the block.

- The up arrow brings back a line that you entered before. `Enter`
  runs it again.

- `exit()` ends the interpreter. Every name that you made in it is
  gone. An error at the prompt stops only one line, and does not end
  the interpreter.

- The interactive interpreter is a tool to try a line of code. It
  keeps no document, so code that you want to keep belongs in a file.

## What you typed

| You type | Where | What it does |
|----------|-------|--------------|
| `python --version` | at the prompt of the shell | shows the version of the interpreter |
| `which python` | at the prompt of the shell | shows the path of the program that the shell runs for `python` |
| `python` | at the prompt of the shell | starts the interactive interpreter |
| `2 + 3` | at the `>>>` prompt | shows the value of the expression |
| `price = 4` | at the `>>>` prompt | makes a name refer to a value, and shows nothing |
| `for number in range(3):` | at the `>>>` prompt | begins a block, so the `...` prompt shows |
| an empty line | at the `...` prompt | ends the block, and runs it |
| the up arrow | at the `>>>` prompt | brings back the line before |
| `exit()` | at the `>>>` prompt | ends the interpreter |

## If the terminal does not do what you expect

Look at the start of the last line of the terminal. It tells you
which program reads what you type.

- `>>>` means that Python is ready for a line of code.

- `...` means that Python waits for more lines of a block. Press
  `Enter` on an empty line to end the block.

- The prompt of the shell means that the shell is ready for a
  command. If the shell shows something else and takes no commands,
  hold `Ctrl` and press `C`.

## What comes next

The interactive interpreter forgets, and a program must not. A
program is code that stays: you run it today, change it tomorrow, and
give it to another person.

The next workshop, **Code in a file**, puts your code in a file. You
move the code of a notebook into a file with a name that ends in
`.py`, and you use that file from the notebook.

Click `Finish` at the bottom of this panel.
