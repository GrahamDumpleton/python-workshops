---
title: Run the file
requires: [quiz:predict-nothing]
---

# Run the file

Until now, your code ran in a notebook, one cell at a time. A notebook
is convenient while you learn. But a finished program is not a
notebook. It is a file, and one command runs all of it.

## The interpreter and a script

The **interpreter** is the program named `python`, which runs Python
code. A notebook also uses the interpreter, but it hides it from you.
In the terminal you start the interpreter yourself.

A **script** is a file of Python code that you run as a program. You
run it with the command `python`, a space, and the name of the file:

```
python spending.py
```

The command has two words. The first word, `python`, starts the
interpreter. The second word, `spending.py`, is the file that the
interpreter must run. The interpreter reads the file, runs its lines
in order from the first to the last, and then ends.

You can compare a script with a recipe that you give to a cook. The
cook reads the whole recipe, does each step in order, and then the
work is done. The file is the recipe, and the interpreter is the cook.

## Predict what the command shows

Before you run the command, look at `spending.py` in the editor once
more.

```{quiz}
:id: predict-nothing
:title: What will the terminal show?
question: "The command `python spending.py` runs every line of the file. What will the terminal show?"
options:
  - { text: "The 37 purchases of the file `spending.csv`", explanation: "No line of `spending.py` reads the file `spending.csv`. The script defines the function `read_ledger`, but no line calls it." }
  - { text: "Nothing", correct: true }
  - { text: "An error message, because the code is not in a notebook", explanation: "Python does not need a notebook. The interpreter reads the file and runs it." }
explanation: "The file defines two classes and one function. To define a function is not the same as to call it. No line of the file calls a function, and no line calls `print()`. So the interpreter has nothing to show."
```

Now click the action below. It types the command in the terminal and
runs it for you.

```{execute}
:id: run-empty
:title: Run the script
:wait: prompt
python spending.py
```

## What happened

Look at the terminal. Under the command there is no output. The next
line is the prompt again, which shows that the command has ended.

The interpreter did run every line of the file:

1. It ran the three `import` lines at the top.

2. It ran the lines of `class Purchase`, which made the class.

3. It ran the lines of `class Ledger`, which made the second class.

4. It ran the lines of `def read_ledger`, which made the function.

Then the file ended, so the interpreter ended. It made two classes and
one function, and nothing used them. When the interpreter ends,
everything that it made is lost.

## One file, two uses

In the workshop **Code in a file** you learned that a **module** is a
file of Python code, and that other code can import it. Now you know
the word script for a file that you run. One file can be both. When a
notebook runs `import spending`, the file `spending.py` is used as a
module. When you type `python spending.py`, the same file is used as a
script. The last two pages of this workshop are about this.

## Each run reads the file again

A notebook reads a module one time, and keeps the old code after you
change the file. The command `python spending.py` does not have this
problem. Each time you run the command, a new interpreter starts, and
it reads the file as it is on the disk at that moment. After you
change a script, you only need to save it and to run the command
again.
