---
title: Welcome
requires: [quiz:recap-strip, quiz:recap-get, quiz:recap-try, verify:notebook-created]
---

# Cleaning messy text

Data that people type is almost never tidy. One person writes `Food`,
another person writes `food`, and a third person presses the space bar
before the word. A person reads all three as the same word. For
Python, they are three different strings.

In this workshop you take a file of spending that is untidy, and you
write the code that makes it clean. **Clean** data is data in which
the same thing is always written in the same way.

You will learn:

- why real data is untidy, and why a program cannot use it as it is

- how to remove the spaces around every field with `strip()`

- how to give every category one spelling, with `lower()` and a
  dictionary of other spellings

- why amounts of money are not added as floats, and how `Decimal`
  keeps them exact

- how to build one function, `clean_row`, from small functions

- how to skip the rows that cannot be read, and how to write the clean
  rows to a new file

This workshop uses ideas from four earlier workshops: reading a file
with `with open(...)`, `try` and `except`, `import`, and the module
`csv`. Each page says again what an idea does before it uses the
idea, so you can do this workshop without the earlier ones.

In this workshop you write most of the code. Each task is small, and
each task has hints and a solution that you can open.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Working with text**. Read
this code. The string in the first line has two spaces before `tea`
and one space after it.

```python
word = "  tea "
word.strip()
print(len(word))
```

```{quiz}
:id: recap-strip
:title: A string does not change
question: "What does this code show?"
options:
  - { text: "`3`", explanation: "`word.strip()` gives a new string that has 3 characters, but the code does not give that new string a name. The name `word` still refers to the string with the spaces." }
  - { text: "`6`", correct: true }
  - { text: "`5`", explanation: "Count the characters between the quotes: two spaces, three letters and one space. The method `strip()` does not change this string." }
explanation: "The method `strip()` gives back a new string without the spaces at the start and at the end. A string never changes, so `word` still refers to the string with two spaces, three letters and one space: 6 characters. To keep the result, give it a name: `word = word.strip()`."
```

The second question is about the workshop **Looking things up**. Read
this code:

```python
colours = {"sky": "blue"}
print(colours.get("sky", "unknown"))
print(colours.get("sea", "unknown"))
```

```{quiz}
:id: recap-get
:title: The method get with a default
question: "What does this code show?"
options:
  - { text: "`blue` and then an error message", explanation: "Square brackets stop with a `KeyError` for a key that does not exist. The method `get()` never stops with an error." }
  - { text: "`blue` and then `None`", explanation: "`get()` gives `None` for a missing key only when it has no second argument. Here the second argument is `\"unknown\"`." }
  - { text: "`blue` and then `unknown`", correct: true }
explanation: "A dictionary holds pairs of a key and a value. `get()` looks up a key. When the key exists, `get()` gives its value: `blue` for the key `\"sky\"`. When the key does not exist, `get()` gives its second argument, which is called the default: `unknown` for the key `\"sea\"`."
```

The third question is about the workshop **When the data is wrong**.
Read this code:

```python
try:
    number = float("ten")
    print("A")
except ValueError:
    print("B")
```

```{quiz}
:id: recap-try
:title: What try and except do
question: "What does this code show?"
options:
  - { text: "`B`", correct: true }
  - { text: "`A` and then `B`", explanation: "`float(\"ten\")` fails, and Python leaves the `try` block at once. It never reaches the line `print(\"A\")`." }
  - { text: "An error message, and the program stops", explanation: "That happens when there is no `try`. Here the `except ValueError:` line catches the error, and the program continues." }
explanation: "`float()` turns a string into a number. The string `\"ten\"` is a word and not a number, so `float()` fails with a `ValueError`. Because the line is inside a `try` block, Python does not stop the program. It leaves the `try` block at once, and runs the block under `except ValueError:`. So the code shows `B` only."
```

## Create your notebook

You do the work of this workshop in a notebook. Click the action below
to create the notebook and open it. You start to use it on the next
page.

```{notebook-create}
:id: create-notebook
:title: Create my notebook and open it
:path: {{ notebook }}
:open: true
- markdown: |
    # Cleaning messy text

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
