---
title: What a program receives
requires: [quiz:argv-count, quiz:argv-last]
---

# What a program receives

A **script** is a file of Python code that you run as a program. You
run it with the command `python`, followed by the name of the file.
Click the action below. It types the command in the terminal and
presses `Enter` for you.

```{execute}
:id: run-report
:wait: prompt
python spending.py
```

The terminal shows the report of all 37 purchases in the file
`spending.csv`. The first two lines are:

```
Purchases: 37
Total: 2834.79
```

## The problem

The program always reads the file `spending.csv`, because that name
is written in the code. It always reports on every purchase. Mariam
wants to ask for more: "report on February only", or "report on
another file". Today, each of those needs a change to the code.

## Words after the name of the program

Look at the command again: `python spending.py`. It has two words.
The first word, `python`, is the program that the computer starts.
The second word, `spending.py`, tells that program which file to
run. So you already know a command in which a word after the name of
the program says what to do.

A **command line argument** is a word after the name of the program
in a command. A command can have many of them, with spaces between
them. In this command, two more words follow the name of the script:

```
python spending.py spending.csv food
```

You know this idea from functions. In the call `greet("Asha")`, the
argument `"Asha"` gives the function a value to work with. A command
line argument does the same for a whole program. These workshops
always say "command line argument" for a word in a command, and
"argument" for a value in a call of a function.

## Where Python puts the words

Python gives the command line arguments to your script in a list.
The list has the name `argv`, and it is in the module `sys`. A
**module** is a file of Python code, and the module `sys` comes with
Python. The line `import sys` makes it ready to use, and then
`sys.argv` is the list.

The action below makes a script of two lines, which shows the list.

```{file-write}
:id: write-show
:title: Make the file show_arguments.py and open it
:path: show_arguments.py
:open: true
import sys

print(sys.argv)
```

Now run the script with no command line arguments.

```{execute}
:id: run-show
:wait: prompt
python show_arguments.py
```

The terminal shows:

```
['show_arguments.py']
```

## What happened

The square brackets show that `sys.argv` is a list. It has one item,
and you did not give any command line argument. The first item of
`sys.argv` is always the name of the script, as you typed it in the
command. The command line arguments come after it.

## Predict, then type the command yourself

Read this command, but do not run it yet:

```
python show_arguments.py food 2026-02
```

```{quiz}
:id: argv-count
:title: Predict the number of items
:type: text
question: "How many items will the list `sys.argv` have when you run this command? Type the number."
answer: "3"
wrong:
  - { text: "2", explanation: "The command has two command line arguments. But the first item of the list is the name of the script, so the list has one more item." }
  - { text: "4", explanation: "The word `python` is not in the list. The list begins with the name of the script." }
otherwise: "Count the name of the script, and then each word after it."
explanation: "The list has three items: the name of the script, then `food`, then `2026-02`."
```

Now run the command. Click in the terminal, type the command, and
press `Enter`:

```
python show_arguments.py food 2026-02
```

```{quiz}
:id: argv-last
:title: What the terminal showed
:type: text
question: "Look at the list in the terminal. Type its last item, exactly as the terminal shows it."
answer:
  - { pattern: "['\"]2026-02['\"]\\]?", example: "'2026-02'" }
wrong:
  - { text: "2026-02", explanation: "Look at the terminal again. The item has a quotation mark before it and after it. Type the quotation marks too." }
  - { pattern: "['\"]?food['\"]?,?", explanation: "That is the second item. The last item is the one before the closing square bracket." }
otherwise: "The last item is the text between the last comma and the closing square bracket."
explanation: "The terminal shows `['show_arguments.py', 'food', '2026-02']`. The quotation marks show that each item is a string. The next page is about that."
```

````{hint}
:title: Run the command for me
:unlock: "argv-last" in failed_checks or "argv-last" in passed_checks
:locked: Try it yourself first. This opens after you have answered the question above.
The action below types the command in the terminal and presses
`Enter`.

```{execute}
:id: run-show-two
:wait: prompt
python show_arguments.py food 2026-02
```
````

The shell divides the command into words at the spaces. The
**shell** is the program inside the terminal that reads each command
and runs it. So `food` and `2026-02` are two items of the list.
