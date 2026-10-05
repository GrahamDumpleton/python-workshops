---
title: Welcome
requires: [quiz:recap-stop, quiz:recap-last-line, quiz:recap-name-error]
---

# Python in the terminal

Until now, you wrote all your Python in a notebook. The first workshop
of this course said that the notebook is a convenience for learning,
and that programmers mostly use Python from the command line. In this
workshop you start to do that. You use Python in the terminal, with no
notebook.

You will learn:

- which program runs your Python code, and how to ask for its version

- how to start Python in the terminal, and how to leave it

- how to type Python there, one line at a time

- how to type a loop there

- how to bring back a line that you typed before

- what Python forgets when you leave it, and why code that you want
  to keep belongs in a file

There is no new Python in this workshop. You use expressions, names
and one `for` loop, which you know from the workshops of **Python
first steps**. The only new thing is the tool.

The workshop takes about twenty minutes.

## The words that this workshop uses

The workshop **Files, editors and terminals** introduced four words.
This workshop uses all of them, so here they are again.

- A **terminal** is a window in which you type commands for the
  computer. The terminal of this workshop is open on the left of this
  page.

- A **command** is one line that you type in the terminal. The
  computer runs it when you press `Enter`.

- The **shell** is the program inside the terminal that reads each
  command and runs it.

- The **prompt** is the short text that shows that the shell is ready
  for a command. Look at the last line of the terminal now. The short
  text at its start is the prompt.

Before you type in the terminal, click in it one time. Then the keys
that you press go to the terminal.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Files, editors and
terminals**.

```{quiz}
:id: recap-stop
:title: A program that does not end
question: "A program runs in the terminal and does not end by itself. No text is selected. You click in the terminal, hold `Ctrl` and press `C`. What happens?"
options:
  - { text: "The terminal copies the selected text", explanation: "In many programs these keys copy text. In a terminal, when no text is selected, they do something different: they tell the running program to stop." }
  - { text: "The running program stops", correct: true }
  - { text: "The terminal closes", explanation: "The terminal stays open. Only the running program stops, and the shell shows its prompt again." }
explanation: "In a terminal, when no text is selected, `Ctrl` and `C` tell the running program to stop. Then the shell shows its prompt again, and it is ready for the next command. This is true on a Mac as well: the key is `Ctrl`, not `Cmd`."
```

The second question is about the workshop **Talking to Python**. A
cell of a notebook holds these two lines:

```python
2 + 3
4 * 5
```

```{quiz}
:id: recap-last-line
:title: A cell with two expressions
:type: text
question: "You run the cell. What does the notebook show under it?"
answer: "20"
wrong:
  - { text: "5", explanation: "`5` is the value of the first line. The notebook shows only the value of the last line of a cell." }
  - { pattern: "5\\s*,?\\s*(and)?\\s*20", explanation: "Python works out both values, but the notebook shows only one of them: the value of the last line." }
otherwise: "Work out the value of each line. Then remember which of the values a notebook shows."
explanation: "Python works out `2 + 3` and then `4 * 5`. The notebook shows only the value of the last line of a cell, so it shows `20`. This rule belongs to the notebook, not to Python. In this workshop you see a tool with another rule."
```

The third question is about the workshop **Naming things**. Read this
code:

```python
price = 12
print(prise)
```

```{quiz}
:id: recap-name-error
:title: A name that does not exist
question: "What happens when this code runs?"
options:
  - { text: "The code shows `12`", explanation: "The second line uses the name `prise`, with an `s`. No line made that name refer to a value." }
  - { text: "The code shows nothing", explanation: "Python does not continue in silence. It stops and shows an error message." }
  - { text: "Python stops with a `NameError`", correct: true }
explanation: "A name refers to a value only after an assignment such as `price = 12`. When code uses a name that does not refer to any value, Python stops with a `NameError`. Here the name `prise` was never given a value. You see a `NameError` again near the end of this workshop."
```

Click `Next` at the bottom of this panel to continue.
