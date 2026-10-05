---
title: Welcome
requires: [quiz:recap-interpreter, quiz:recap-import, quiz:recap-dataclass, verify:notebook-created]
---

# Code in a file

Until now, all the code that you wrote lived in the cells of a
notebook. In this workshop you move code out of a notebook and into a
file, and then you use that file from the notebook.

This is the third workshop of **From a Python notebook to a program**.
In this workshop you work in a notebook again, as you did for most of
the course. One thing is new: under the notebook there is an editor.
An **editor** is the part of JupyterLab in which you change a file.
This workshop does not use the terminal.

You will learn:

- why programmers keep code in a file, and not only in a notebook

- how to copy code from a cell of a notebook into a file

- how to use the code of your file from a notebook

- why a file of code needs `import` lines of its own

- why a notebook sometimes keeps the old code of a file after you
  change the file, and what to do about it

The example is the spending tracker of Mariam. She wrote down
everything that she bought from January to March 2026. The code that
reads her purchases and adds them up was written in the workshop
**Spending as objects**. You do not need to have done that workshop.
This workshop gives you the code, and says what each piece does.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Python in the terminal**.
In that workshop you typed `python` in the terminal and worked at the
`>>>` prompt. At the `>>>` prompt you typed `price = 12`. Then you
left Python with `exit()`, and started it again with `python`.

```{quiz}
:id: recap-interpreter
:title: After you leave and start again
question: "At the new `>>>` prompt you type `price` and press `Enter`. What does Python show?"
options:
  - { text: "`12`", explanation: "Python does not keep names after it ends. The name `price` belonged to the Python that you left with `exit()`." }
  - { text: "A `NameError`", correct: true }
  - { text: "`None`", explanation: "Python does not give `None` for a name that it does not know. It stops with an error message." }
explanation: "When Python ends, every name that you made is gone. The new Python does not know the name `price`, so it stops with a `NameError`. This is the reason that code which you want to keep belongs in a file. This workshop shows how to put code in a file."
```

The second question is about the workshop **The batteries included**.
Python comes with many modules. In that workshop, a module was a file
of Python code that someone has already written. The module `math`
holds a function `sqrt`, which gives the square root of a number.

```{quiz}
:id: recap-import
:title: A function from a module
question: "A cell runs `import math`. Which line then shows the square root of 16?"
options:
  - { text: "`print(sqrt(16))`", explanation: "After `import math`, the notebook knows the name `math`, but it does not know the name `sqrt`. Python stops with a `NameError`." }
  - { text: "`print(math(16))`", explanation: "`math` is the module. The function is inside the module, and its name is `sqrt`." }
  - { text: "`print(math.sqrt(16))`", correct: true }
explanation: "The line `import math` makes the module ready to use, under the name `math`. To use something from the module, you write the name of the module, a dot, and the name of the thing: `math.sqrt(16)`. The other form, `from math import sqrt`, gives you the name `sqrt` itself. In this workshop you use both forms with a module that you make yourself."
```

The third question is about the workshop **Objects that explain
themselves**. Read this code:

```python
from dataclasses import dataclass

@dataclass
class Stop:
    town: str
    distance: int
```

```{quiz}
:id: recap-dataclass
:title: The line above the class
question: "What does the line `@dataclass` do?"
options:
  - { text: "It makes Python write some methods of the class for you, such as `__init__`", correct: true }
  - { text: "It makes one object of the class", explanation: "The line makes no object. You make an object later, with a call such as `Stop(\"Kisumu\", 340)`." }
  - { text: "It is a comment, and Python ignores it", explanation: "A comment begins with `#`. A line that begins with `@`, above a class, changes the class." }
explanation: "A class is a description of a new type of value, and an object is a value made from a class. The line `@dataclass` makes Python write the method `__init__` for the class, from the names `town` and `distance` that are listed in it. So `Stop(\"Kisumu\", 340)` makes an object that holds those two values. The code of this workshop has a class of this kind."
```

## Create your notebook

You do the work of this workshop in a notebook, and later also in a
file. Click the action below to create the notebook and open it. You
start to use it on the next page.

```{notebook-create}
:id: create-notebook
:title: Create my notebook and open it
:path: {{ notebook }}
:open: true
- markdown: |
    # Code in a file

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
