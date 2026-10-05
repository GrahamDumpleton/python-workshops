---
title: Welcome
requires: [quiz:recap-name, quiz:recap-default, quiz:recap-index, verify:program-open]
---

# Taking arguments

Your program `spending.py` does one thing. Each time that you run it,
it reads the same file and shows the same report. To get another
report, you must change the code. In this workshop you learn how one
program can do different things, because the command that starts it
says what to do.

This workshop is part of the set **From a Python notebook to a
program**. You work in two places. The **editor** is the part of
JupyterLab in which you change a file. The **terminal** is a window
in which you type commands for the computer. A **command** is one
line that you type in the terminal, which the computer runs when you
press `Enter`.

You will learn:

- how a program receives the words that you type after its name in a
  command

- why each of those words is a string

- how the module `argparse` reads those words for you, and gives your
  program help text and clear messages

- how to make a method that selects some of the purchases

- how to make the spending tracker report on one month or on one
  category

In this workshop you write most of the code yourself, and you type
most of the commands yourself. Each task says exactly what to write.
Each task also has hints, and a solution that you can open if you
need it.

The example is the spending of one person, Mariam. Each thing that
she bought is a purchase. You do not need the earlier workshops about
her spending. Each page says again what it uses.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Running a script**. A file
with the name `spending.py` ends with these two lines:

```python
if __name__ == "__main__":
    main()
```

```{quiz}
:id: recap-name
:title: A file that is run, and a file that is imported
question: "Another file has the line `import spending`. What happens to the call `main()` when Python runs that `import` line?"
options:
  - { text: "Python calls `main()`, because an import runs every line of the file", explanation: "An import does run the file. But the `if` line tests the name `__name__` first, and in an imported file that name is not `\"__main__\"`." }
  - { text: "Python does not call `main()`, because `__name__` is `\"spending\"` in an imported file", correct: true }
  - { text: "Python stops with a `NameError`, because `__name__` has no value", explanation: "Python gives the name `__name__` a value in every file. You do not make this name yourself." }
explanation: "Python gives every file the name `__name__`. When you run the file as a program, with `python spending.py`, the value is `\"__main__\"`, so the `if` block calls `main()`. When another file imports it, the value is the name of the module, `\"spending\"`, so `main()` is not called. In this workshop you change the function `main()`, and those two lines stay as they are."
```

The second question is about the workshop **Functions with options**.
Read this code:

```python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}"

print(greet("Asha"))
```

```{quiz}
:id: recap-default
:title: A parameter with a default value
:type: text
question: "What does this code show? Type the text that appears."
answer: "Hello, Asha"
wrong:
  - { text: "Asha, Hello", explanation: "The f-string puts the value of `greeting` first, then a comma and a space, then the value of `name`." }
  - { text: "None, Asha", explanation: "The parameter `greeting` has the default value `\"Hello\"`. The call gives no second argument, so Python uses the default value." }
  - { pattern: "[\"'].*[\"']", explanation: "`print()` shows the characters of a string, with no quotation marks round them." }
otherwise: "The call gives one argument, `\"Asha\"`, which goes to the parameter `name`. The parameter `greeting` gets its default value."
explanation: "In the `def` line, `greeting=\"Hello\"` gives the parameter a **default value**: the value that the parameter gets when the call gives no argument for it. The call `greet(\"Asha\")` gives no second argument, so `greeting` is `\"Hello\"`. In this workshop you write a method with two default values."
```

The third question is about the workshop **Keeping a list**. Read this
code:

```python
words = ["tea", "soup", "rice"]
print(words[1])
```

```{quiz}
:id: recap-index
:title: An item of a list
:type: text
question: "What does this code show? Type the text that appears."
answer: "soup"
wrong:
  - { text: "tea", explanation: "Python counts the items of a list from 0. The item at index `0` is `\"tea\"`, and the item at index `1` is the second item." }
  - { pattern: "[\"']soup[\"']", explanation: "That is the right item. `print()` shows the characters of a string, with no quotation marks round them." }
otherwise: "The number in square brackets is an index. Python counts the items of a list from 0."
explanation: "A list holds items in order, and each item has a position with a number, its **index**. The first item has the index `0`, so `words[0]` is `\"tea\"` and `words[1]` is `\"soup\"`. In this workshop, Python gives your program a list, and you read items from it by index."
```

## Open the program

The file `spending.py` is in your work directory. It is the spending
tracker as the workshop **Running a script** left it. It holds the
class `Purchase`, the class `Ledger`, the function `read_ledger()`
that reads a file of purchases, the function `report_lines()` that
makes the lines of the report, and the function `main()`.

Click the action below to open the file in the editor. You do not
need to read all of it now.

```{file-open}
:id: open-program
:title: Open the file spending.py in the editor
:path: spending.py
```

```{verify}
:id: program-open
:label: The file spending.py is open
:substrate: ui
:trigger: after:open-program
:message: The file spending.py is not open yet. Click the action above to open it.
file-open spending.py
```

The editor is in the upper part of the window, and the terminal is
under it. You start to use the terminal on the next page.
