---
title: Welcome
requires: [quiz:recap-ledger, quiz:recap-file, quiz:recap-while]
---

# Files, editors and terminals

A new set of workshops, **From a Python notebook to a program**,
begins here. Until now, you wrote all your code in a notebook. In this
set, you move your code into files, and you run it in the way that
programmers usually run a program: with a command that you type.

This first workshop has no new Python. It teaches you the three tools
that the other workshops of the set use. You need to know the tools
before you use them for Python.

You will learn:

- how to find your files in the file browser

- how to change a file in the editor, and how to save it

- what a terminal is, and how to give the computer a command

- how to see where the terminal is, and how to move to another place

- how to stop a program that does not end

- how to copy and paste in the terminal

The workshop takes about twenty-five minutes.

## What is different now

You may have done the earlier workshops on the site that runs in your
web browser. On that site, Python runs inside the web browser. Nothing
needs to be installed, and that is why the course starts there. But a
web browser keeps a page away from the rest of the computer. A page
cannot start other programs on the computer.

From this workshop on, you work on a real computer. It can be a
computer that Binder or GitHub lends to you for some time, or it can
be your own computer. JupyterLab runs on that computer, and your web
browser only shows it. Two things are possible now that were not
possible before:

- **A terminal.** A terminal is a window in which you type commands
  for the computer. A command can start Python, and it can start many
  other programs. Programmers use a terminal every day.

- **Real files.** A file that you save is a file on that computer. It
  stays where you put it. Every program on the computer can read it:
  the editor, the terminal and Python.

If you did the earlier workshops on Binder, in a codespace or on your
own computer, you are in the same place as before. Only the tools on
the screen are new.

## What you see on the screen

This workshop has no notebook. The window has four parts now:

- On the left is the **file browser**. It lists files.

- In the middle, at the top, is an empty area. Files open there.

- In the middle, at the bottom, is the terminal. Do not type in it
  yet. A later page explains it.

- On the right is this panel, as before.

Each of the next pages explains one of these parts.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Spending as objects**. In
that workshop, a class named `Ledger` keeps a list of purchases in its
attribute `purchases`, and its method `add` adds one purchase to that
list. Read this code:

```python
ledger = Ledger()
ledger.add(Purchase("2026-01-17", "Winter coat", Decimal("74.90"), "clothes"))
ledger.add(Purchase("2026-01-19", "Bus card", Decimal("30.00"), "transport"))
print(len(ledger.purchases))
```

```{quiz}
:id: recap-ledger
:title: An object that holds other objects
:type: text
question: "What does this code show?"
answer: "2"
wrong:
  - { text: "104.90", explanation: "That is the sum of the two amounts. The function `len()` does not add the amounts. It gives the number of items in the list." }
  - { text: "0", explanation: "A new ledger has an empty list. But the code calls `add` two times, and each call puts one purchase in the list." }
otherwise: "The function `len()` gives the number of items in a list. Count the calls of `add`."
explanation: "A `Ledger` object holds a list of `Purchase` objects. Each call of `add` puts one more purchase in the list, so the list has two items. In the next workshops, these classes move from a notebook into a file."
```

The second question is about the workshop **Reading and writing
files**.

```{quiz}
:id: recap-file
:title: Why a program uses a file
question: "A program writes its results to a file. What is the reason?"
options:
  - { text: "A file makes the program run faster", explanation: "A file does not make a program faster. Reading and writing a file takes more time than using a name." }
  - { text: "The data in a file stays when the program ends", correct: true }
  - { text: "Python cannot show a result on the screen", explanation: "Python can show a result on the screen with `print()`. But what is on the screen is not kept." }
explanation: "A file is a place where a computer keeps data under a name. The values that the names of a program refer to exist only while the program runs. The data in a file stays when the program ends. In this workshop you work with files directly, without Python."
```

The third question is about the workshop **Doing it again**. Read this
code:

```python
number = 1
while number < 4:
    print(number)
    number = number + 1
```

```{quiz}
:id: recap-while
:title: A loop with a condition
:type: text
question: "What is the last number that this code shows?"
answer: "3"
wrong:
  - { text: "4", explanation: "When `number` is `4`, the condition `number < 4` is `False`. The loop ends before `print()` runs again." }
  - { text: "1", explanation: "That is the first number. The loop runs its block again and again while the condition is `True`." }
otherwise: "Before each pass, Python calculates the condition `number < 4`. The block runs only when the condition is `True`."
explanation: "A `while` loop runs its block again and again while its condition is `True`. Here the block runs for the numbers `1`, `2` and `3`. Then `number` is `4`, the condition is `False`, and the loop ends. A loop whose condition is always `True` never ends. Later in this workshop you run a program that has such a loop, and you learn how to stop it."
```

Click `Next` at the bottom of this panel to continue.
