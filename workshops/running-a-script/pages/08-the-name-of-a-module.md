---
title: The name __name__
requires: [quiz:predict-name]
---

# The name `__name__`

A page before said that one file can be a script and also a module.
When you type `python spending.py`, the file is a script. When other
code runs `import spending`, the file is a module. The code in the
file can ask Python which of the two is happening now. This page shows
how.

## A name that Python makes

When Python starts to run a file, it makes a few names for that file
before the first line runs. One of them is `__name__`. It has two
underscores before the word `name` and two underscores after it. Two
underscores on each side mark a name that Python itself makes or
uses, as with the method `__init__` of a class.

The name `__name__` refers to a string. Which string it is depends on
how the file was started:

- When the file is run as a script, the string is `"__main__"`.

- When the file is imported as a module, the string is the name of
  the module, which is the name of the file with no `.py`.

You can compare this with a person who has a name and also a role. At
home she is Amina. At the school where she works, on the day when she
leads the school, the list at the door says "head teacher". The
person is the same, and the word on the list depends on what she does
that day. The string `"__main__"` is such a role: it marks the one
file that the command `python` was asked to run.

## Run the file as a script

Click the action below. It makes a file that holds one line.

```{file-write}
:id: write-show-name
:title: Make the file show_name.py and open it
:path: show_name.py
:open: true
print(__name__)
```

Now click the next action. It runs the file as a script.

```{execute}
:id: run-show-name
:title: Run show_name.py as a script
:wait: prompt
python show_name.py
```

The terminal shows:

```
__main__
```

The file was the one that `python` was asked to run. So Python made
its `__name__` refer to the string `"__main__"`.

## Import the same file

The same file can be imported as a module. To import it, you need
some Python code that runs `import show_name`. You do not need a
notebook or a second file for that. The command `python` can also run
code that is written in the command itself:

```
python -c "import show_name"
```

The part `-c` tells `python` that the next part of the command is
code, and not the name of a file. The code is between the double
quotes. Here it is one line, `import show_name`.

When Python imports a module, it runs every line of the file of that
module, in the same way as for a script. So the line
`print(__name__)` runs again.

```{quiz}
:id: predict-name
:title: What does the import show?
:type: text
question: "You run the command `python -c \"import show_name\"`. What does the line `print(__name__)` show this time? Type exactly what you expect."
answer: "show_name"
wrong:
  - { text: "__main__", explanation: "`__main__` is the string for the file that `python` was asked to run. This time `python` was asked to run the code `import show_name`. The file `show_name.py` is only imported." }
  - { text: "show_name.py", explanation: "This is the name of the file. The name of a module is the name of its file with no `.py` at the end." }
  - { pattern: "[\"']show_name[\"']", explanation: "The string is correct. But `print()` shows a string with no quotes around it." }
otherwise: "The file is imported this time, and not run as a script. Read again what `__name__` refers to when a file is imported as a module."
explanation: "When a file is imported, its `__name__` refers to the name of the module. The file is `show_name.py`, so the module is `show_name`."
```

Click the action below to run the command.

```{execute}
:id: import-show-name
:title: Import show_name.py as a module
:wait: prompt
python -c "import show_name"
```

The terminal shows:

```
show_name
```

## What happened

The file `show_name.py` did not change between the two commands. Its
one line ran both times. The first time, the file was the script, and
`__name__` was `"__main__"`. The second time, the file was a module
that other code imported, and `__name__` was `"show_name"`.

So the code of a file can ask one question: "Am I the script that was
run, or was I imported?" On the next page, your program asks this
question.
