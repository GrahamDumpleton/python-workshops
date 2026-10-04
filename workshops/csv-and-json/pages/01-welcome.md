---
title: Welcome
requires: [quiz:recap-split, quiz:recap-lookup, quiz:recap-float, verify:notebook-created]
---

# CSV and JSON

Data in a file has a **format**: a set of rules that says how the
data is written in the file. A program that knows the rules can read
the file. Most data files that you will meet use one of two formats,
which have the names CSV and JSON. In this workshop you learn both.

This workshop is part of the set **Working with real data in Python**.
These workshops follow the spending of one person, Mariam, from
January to March 2026. Her purchases are in a CSV file, and her
budgets are in a JSON file.

You will learn:

- what a CSV file is, and why it is harder to read than it looks

- how to read a CSV file and write a CSV file with a part of Python
  that is made for this work

- what a JSON file is, and when a program uses JSON and when it uses
  CSV

- how to read a JSON file, change the data and save it in a new file

You write most of the code yourself. Each task says exactly what to
write. Each task also has hints, and a solution that you can open if
you need it.

The workshop takes about twenty-five minutes.

## Three questions before you start

These three questions are about earlier workshops. If you have not
done those workshops, you can still answer the questions. The
explanations tell you what you need to know.

The first question is about the workshop **Working with text**.

```{quiz}
:id: recap-split
:title: A string cut into parts
question: 'What is the value of `"Lima,Peru,2026".split(",")`?'
options:
  - { text: '`"Lima Peru 2026"`', explanation: "The method `split()` does not replace the commas with spaces. It cuts the string at each comma, and it gives a list of the parts." }
  - { text: '`["Lima", "Peru", "2026"]`', correct: true }
  - { text: '`["Lima", "Peru", 2026]`', explanation: 'Every part of a string is also a string. The last item is the string `"2026"`, with quotes, and not the number `2026`.' }
explanation: 'The method `split(",")` cuts a string at each comma. It gives a list that holds the parts, and each part is a string. You use `split()` at the start of this workshop.'
```

The second question is about the workshop **Looking things up**.

```{quiz}
:id: recap-lookup
:title: A value in a dictionary
question: 'The name `prices` refers to the dictionary `{"tea": 3, "bread": 2}`. What is the value of `prices["bread"]`?'
options:
  - { text: "`2`", correct: true }
  - { text: "`1`", explanation: "A dictionary does not look a value up by its position. It looks the value up by its key. The value of the key `\"bread\"` is `2`." }
  - { text: '`"bread"`', explanation: 'The string `"bread"` is the key. The square brackets give the value that belongs to the key, which is `2`.' }
explanation: "A dictionary holds pairs. Each pair has a key and a value. A dictionary and a key in square brackets give the value of that key. In this workshop, each row of a file becomes a dictionary."
```

The third question is about the workshop **Reading and writing
files**.

```{quiz}
:id: recap-float
:title: A number from a file
question: 'A program reads the text `6.40` from a file, and gives it the name `amount`. The value of `amount` is the string `"6.40"`. Which expression gives a number that the program can add to a total?'
options:
  - { text: "`amount + 0`", explanation: "Python cannot add a string and a number. This expression stops with a `TypeError`." }
  - { text: "`amount.strip()`", explanation: "The method `strip()` removes spaces from the two ends of a string. The result is still a string." }
  - { text: "`float(amount)`", correct: true }
explanation: 'Everything that a program reads from a file is a string, even when it looks like a number. The function `float()` takes a string such as `"6.40"` and gives the float `6.4`, which is a number.'
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
    # CSV and JSON

    This is your notebook for this workshop. The code that you run appears below.
```

```{verify}
:id: notebook-created
:label: Your notebook exists
:substrate: contents
:trigger: after:create-notebook
exists {{ notebook }}
```
