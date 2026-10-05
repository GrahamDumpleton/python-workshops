---
title: An import is a search
requires: [quiz:order-result, quiz:pick-result]
---

# An import is a search

A **module** is a file of Python code. The line `import menu` asks
Python for the module with the name `menu`. On this page you see that
this line makes Python search for a file.

## Two files

Your work directory holds a module and a script that uses it. A
**script** is a file of Python code that you run as a program, with
the command `python` and the name of the file.

Click the two actions below to open both files in the editor.

```{file-open}
:id: open-menu
:title: Open the module menu.py
:path: menu.py
```

```{file-open}
:id: open-order
:title: Open the script order.py
:path: order.py
```

The module `menu.py` holds a dictionary of prices, and a function
that gives the price of one item:

```python
prices = {"tea": 3, "soup": 4, "bread": 2}


def price_of(item):
    return prices[item]
```

The script `order.py` imports the module and calls the function:

```python
import menu

print("Soup costs", menu.price_of("soup"))
```

## Only a name

Look at the line `import menu`. It gives Python a name, and nothing
more. It does not say `menu.py`. It does not say which directory the
file is in. So Python must find the file itself. It searches for a
file with the name `menu.py`.

Think of a library. You ask for a book and you give only its title.
The person who helps you looks at a few shelves, always the same
shelves and always in the same order. That person gives you the first
book that has the title. An import works in the same way: Python
looks in a few directories, always in the same order, and uses the
first file that has the right name.

This matters for two reasons. When Python cannot find a file, you
must know where it looked. And when Python finds a file that you did
not expect, you must know why it found that one first.

## Run the script

Click in the terminal. Type this command, and then press `Enter`:

```
python order.py
```

````{hint}
:title: Run the command for me

```{execute}
:id: run-order
:wait: prompt
python order.py
```
````

```{quiz}
:id: order-result
:type: text
:title: What the terminal shows
question: "What does the terminal show under the command? Type the whole line."
answer: "Soup costs 4"
wrong:
  - { text: "4", explanation: "That is the price. Type the whole line that the terminal shows, with the words." }
  - { pattern: ".*[Ee]rror.*", explanation: "Read the command again, letter by letter. It is `python order.py`, with a space after `python`. The current directory of the terminal must be your work directory." }
otherwise: "Click in the terminal, type `python order.py` and press `Enter`. Then type the line that appears under the command."
explanation: "Python read `import menu`, searched for a file with the name `menu.py`, and found it in your work directory. Then the script called the function `price_of` of that module."
```

## A file that is not here

Now look at a second script. Click the action below to open it.

```{file-open}
:id: open-pick
:title: Open the script pick.py
:path: pick.py
```

```python
import random

random.seed(7)
meals = ["soup", "rice", "noodles", "salad"]
print("Today:", random.choice(meals))
```

The module `random` is part of the **standard library**, which is
the set of modules that come with Python. The function
`random.choice()` chooses one item of a list. The line
`random.seed(7)` makes it choose the same item each time, so that
your output is the same as the output on this page.

Look at the file browser on the left. Your work directory has no
file with the name `random.py`.

Type this command in the terminal, and press `Enter`:

```
python pick.py
```

````{hint}
:title: Run the command for me

```{execute}
:id: run-pick
:wait: prompt
python pick.py
```
````

```{quiz}
:id: pick-result
:type: text
:title: What the terminal shows
question: "What does the terminal show under the command? Type the whole line."
answer: "Today: noodles"
wrong:
  - { text: "noodles", explanation: "That is the meal. Type the whole line that the terminal shows, with the word `Today:` before it." }
  - { pattern: ".*[Ee]rror.*", explanation: "Read the command again, letter by letter. It is `python pick.py`, with a space after `python`." }
otherwise: "Click in the terminal, type `python pick.py` and press `Enter`. Then type the line that appears under the command."
explanation: "The script worked, so Python found a file for the module `random`. That file is not in your work directory. Python found it in another directory."
```

## What happened

For `import menu`, Python found the file `menu.py` beside the script.
For `import random`, your work directory has no such file, and the
import worked anyway. So Python looks in more than one directory.

The next page shows the list of directories that Python searches.
